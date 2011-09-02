/*
 * Copyright 2011 Jan Kronquist.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.jayway.airportweather;

import org.apache.camel.CamelContext;
import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.impl.DefaultCamelContext;
import org.apache.camel.impl.SimpleRegistry;
import org.apache.commons.lang.time.DateUtils;

import java.util.Date;

public class AirportWeather {
    public static final String GET_MAXIMUM_TEMPERATUR_AT_AIRPORT = "direct:getMaximumTemperaturAtAirport";
    public static final String FROM_NDFD_TO_TEMP_IN_CELCIUS = "direct:fromNDFDToTempInCelcius";
    public static final String FROM_LOCATION_TO_NDFD = "direct:fromLocationToNDFD";
    public static final String FROM_AIRPORT_INFORMATION_TO_LOCATION = "direct:fromAirportInformationToLocation";
    public static final String INVOKE_NDFD_GEN = "direct:invokeNDFDgen";
    public static final String GET_AIRPORT_INFORMATION_BY_AIRPORT_CODE = "direct:getAirportInformationByAirportCode";
    public static final String INVOKE_GET_AIRPORT_INFORMATION_BY_AIRPORT_CODE = "direct:invokeGetAirportInformationByAirportCode";

    public static CamelContext makeCamelContext() throws Exception {
        SimpleRegistry registry = new SimpleRegistry();
        registry.put("temperatureTransformer", new TemperatureTransformer());

        return new DefaultCamelContext(registry);
    }

    public static RouteBuilder createRouteBuilder() throws Exception {
        return new RouteBuilder() {
            public void configure() throws Exception {

                from(GET_AIRPORT_INFORMATION_BY_AIRPORT_CODE)
                        .to(INVOKE_GET_AIRPORT_INFORMATION_BY_AIRPORT_CODE)
                        .choice().when().xpath("count(/NewDataSet/Table)=0").rollback("No Airport found");

                from(INVOKE_GET_AIRPORT_INFORMATION_BY_AIRPORT_CODE)
                        .to("xslt:xslt/airportRequest.xsl?transformerFactoryClass=net.sf.saxon.TransformerFactoryImpl")
                        .to("spring-ws:http://www.webservicex.net/airport.asmx?soapAction=http://www.webserviceX.NET/getAirportInformationByAirportCode")
                        .convertBodyTo(String.class)
                        .to("xslt:xslt/extractCData.xsl?transformerFactoryClass=net.sf.saxon.TransformerFactoryImpl");

                from(FROM_AIRPORT_INFORMATION_TO_LOCATION)
                        .to("xslt:xslt/toLocation.xsl?transformerFactoryClass=net.sf.saxon.TransformerFactoryImpl");

                from(FROM_LOCATION_TO_NDFD)
                        // set propertys that will be used as xsl params
                        .process(new Processor() {
                            public void process(Exchange exchange) throws Exception {
                                final Date toDay = new Date();
                                exchange.setProperty("startDate", toDay);
                                exchange.setProperty("endDate", DateUtils.addDays(toDay, 7));
                            }
                        })
                        .to("xslt:xslt/weatherRequest.xsl?transformerFactoryClass=net.sf.saxon.TransformerFactoryImpl")
                        .to(INVOKE_NDFD_GEN);


                from(INVOKE_NDFD_GEN)
                        .to("spring-ws:http://www.weather.gov/forecasts/xml/SOAP_server/ndfdXMLserver.php?soapAction=http://www.weather.gov/forecasts/xml/DWMLgen/wsdl/ndfdXML.wsdl#NDFDgen")
                        .convertBodyTo(String.class)
                        .to("xslt:xslt/extractCData.xsl?transformerFactoryClass=net.sf.saxon.TransformerFactoryImpl");


                from(FROM_NDFD_TO_TEMP_IN_CELCIUS)
                        .choice()
                            .when().xpath("count(/dwml/data/parameters/temperature[@type='maximum']/value) = 0").rollback("No temperature found")
                        .otherwise()
                            .transform().xpath("/dwml/data/parameters/temperature[@type='maximum']/value[1]/text()")
                            .convertBodyTo(Integer.class)
                            .transform().method("temperatureTransformer", "fromFahrenheitToCelsius");

                // Full route
                from(GET_MAXIMUM_TEMPERATUR_AT_AIRPORT)
                        .to(GET_AIRPORT_INFORMATION_BY_AIRPORT_CODE)
                        .to(FROM_AIRPORT_INFORMATION_TO_LOCATION)
                        .to(FROM_LOCATION_TO_NDFD)
                        .to(FROM_NDFD_TO_TEMP_IN_CELCIUS);
            }
        };
    }


}
