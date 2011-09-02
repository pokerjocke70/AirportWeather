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
import org.apache.camel.CamelExecutionException;
import org.apache.camel.ProducerTemplate;
import org.apache.camel.RollbackExchangeException;
import org.apache.camel.builder.AdviceWithRouteBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;


public class AirportWeatherTest {
    private CamelContext context;

    @Before
    public void before() throws Exception {
        context = AirportWeather.makeCamelContext();
        context.addRoutes(AirportWeather.createRouteBuilder());
    }

    @After
    public void after() throws Exception {
        if (context != null) {
            context.stop();
        }
    }

    @Test
    public void testAirportNotFound() throws Exception {
        context.getRouteDefinitions().get(0).adviceWith(context, new AdviceWithRouteBuilder() {
            @Override
            public void configure() throws Exception {
                interceptSendToEndpoint(AirportWeather.INVOKE_GET_AIRPORT_INFORMATION_BY_AIRPORT_CODE).skipSendToOriginalEndpoint().to("velocity:empty.xml");
            }
        });
        context.start();
        expectRollback("No Airport found");
    }

    @Test
    public void testTemperatureNotFound() throws Exception {
        context.getRouteDefinitions().get(0).adviceWith(context, new AdviceWithRouteBuilder() {
            @Override
            public void configure() throws Exception {
                interceptSendToEndpoint(AirportWeather.INVOKE_GET_AIRPORT_INFORMATION_BY_AIRPORT_CODE).skipSendToOriginalEndpoint().to("velocity:AirportResult.xml");
                interceptSendToEndpoint(AirportWeather.INVOKE_NDFD_GEN).skipSendToOriginalEndpoint().to("velocity:empty.xml");
            }
        });
        context.start();
        expectRollback("No temperature found");
    }

    private void expectRollback(String message) {
        ProducerTemplate template = context.createProducerTemplate();
        String body = "EWR";
        try {
            template.requestBody(AirportWeather.GET_MAXIMUM_TEMPERATUR_AT_AIRPORT, body);
            fail("Expected exception");
        } catch (CamelExecutionException e) {
            Throwable cause = e.getCause();
            assertEquals(RollbackExchangeException.class, cause.getClass());
            assertTrue(cause.getMessage().contains(message));
        }
    }

}
