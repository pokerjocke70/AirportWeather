package com.jayway.airportweather;

import org.apache.camel.CamelContext;
import org.apache.camel.ProducerTemplate;
import org.apache.commons.lang.time.StopWatch;
import org.springframework.xml.transform.StringSource;

public class Main {
	public static void main(String[] args) throws Exception {
		if (args.length != 1) {
			System.out.println("Syntax: com.jayway.airportweather.Main <AirtportCode>");
		} else {
			CamelContext context = AirportWeather.makeCamelContext();
			context.addRoutes(AirportWeather.createRouteBuilder());
			context.start();
			try {
                StopWatch stopWatch = new StopWatch();
                stopWatch.start();
                for (int x = 0; x < 100; x++) {
				    ProducerTemplate template = context.createProducerTemplate();
                    final Object o = template.requestBody(AirportWeather.GET_MAXIMUM_TEMPERATUR_AT_AIRPORT, "<airport>" + args[0] + "</airport>");
                    System.out.println(o);
                }
                stopWatch.stop();
                System.out.println(stopWatch.getTime() + " ms");

			} finally {
				context.stop();
			}
		}
	}
}
