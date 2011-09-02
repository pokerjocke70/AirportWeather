<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:o="http://www.w3.org/1999/XSL/TransformAliasAlias"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns:functx="http://www.functx.com"
                version="2.0">
   <xsl:import href="file:/Users/jocke/Documents/AirportWeather_xspec/src/main/resources/xslt/extractCData.xsl"/>
   <xsl:import href="file:/apps/xspec-v0.2/generate-tests-utils.xsl"/>
   <xsl:namespace-alias stylesheet-prefix="o" result-prefix="xsl"/>
   <xsl:variable name="x:stylesheet-uri" as="xs:string"
                 select="'file:/Users/jocke/Documents/AirportWeather_xspec/src/main/resources/xslt/extractCData.xsl'"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="file:/apps/xspec-v0.2/format-xspec-report.xsl"</xsl:processing-instruction>
         <x:report stylesheet="{$x:stylesheet-uri}" date="{current-dateTime()}">
            <xsl:call-template name="x:d4e2"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d4e2">
      <xsl:message>test create airportRequest</xsl:message>
      <x:scenario>
         <x:label>test create airportRequest</x:label>
         <x:context select="/">
            <getAirportInformationByAirportCodeResponse xmlns="http://www.webserviceX.NET">
               <getAirportInformationByAirportCodeResult>
                  <xsl:text>&lt;NewDataSet&gt;
  &lt;Table&gt;
    &lt;AirportCode&gt;JFK&lt;/AirportCode&gt;
    &lt;CityOrAirportName&gt;NEW YORK NY/NEWARK KENNEDY&lt;/CityOrAirportName&gt;
    &lt;Country&gt;United States&lt;/Country&gt;
    &lt;CountryAbbrviation&gt;US&lt;/CountryAbbrviation&gt;
    &lt;CountryCode&gt;22&lt;/CountryCode&gt;
    &lt;GMTOffset&gt;5&lt;/GMTOffset&gt;
    &lt;RunwayLengthFeet&gt;14572&lt;/RunwayLengthFeet&gt;
    &lt;RunwayElevationFeet&gt;13&lt;/RunwayElevationFeet&gt;
    &lt;LatitudeDegree&gt;40&lt;/LatitudeDegree&gt;
    &lt;LatitudeMinute&gt;38&lt;/LatitudeMinute&gt;
    &lt;LatitudeSecond&gt;0&lt;/LatitudeSecond&gt;
    &lt;LatitudeNpeerS&gt;N&lt;/LatitudeNpeerS&gt;
    &lt;LongitudeDegree&gt;73&lt;/LongitudeDegree&gt;
    &lt;LongitudeMinute&gt;47&lt;/LongitudeMinute&gt;
    &lt;LongitudeSeconds&gt;0&lt;/LongitudeSeconds&gt;
    &lt;LongitudeEperW&gt;W&lt;/LongitudeEperW&gt;
  &lt;/Table&gt;
  &lt;Table&gt;
    &lt;AirportCode&gt;JFK&lt;/AirportCode&gt;
    &lt;CityOrAirportName&gt;NEW YORK NY/NEWARK KENNEDY&lt;/CityOrAirportName&gt;
    &lt;Country&gt;United States&lt;/Country&gt;
    &lt;CountryAbbrviation&gt;US&lt;/CountryAbbrviation&gt;
    &lt;CountryCode&gt;22&lt;/CountryCode&gt;
    &lt;GMTOffset&gt;5&lt;/GMTOffset&gt;
    &lt;RunwayLengthFeet&gt;14572&lt;/RunwayLengthFeet&gt;
    &lt;RunwayElevationFeet&gt;13&lt;/RunwayElevationFeet&gt;
    &lt;LatitudeDegree&gt;40&lt;/LatitudeDegree&gt;
    &lt;LatitudeMinute&gt;38&lt;/LatitudeMinute&gt;
    &lt;LatitudeSecond&gt;0&lt;/LatitudeSecond&gt;
    &lt;LatitudeNpeerS&gt;N&lt;/LatitudeNpeerS&gt;
    &lt;LongitudeDegree&gt;73&lt;/LongitudeDegree&gt;
    &lt;LongitudeMinute&gt;47&lt;/LongitudeMinute&gt;
    &lt;LongitudeSeconds&gt;0&lt;/LongitudeSeconds&gt;
    &lt;LongitudeEperW&gt;W&lt;/LongitudeEperW&gt;
  &lt;/Table&gt;
&lt;/NewDataSet&gt;</xsl:text>
               </getAirportInformationByAirportCodeResult>
            </getAirportInformationByAirportCodeResponse>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="context-doc" as="document-node()">
               <xsl:document>
                  <getAirportInformationByAirportCodeResponse xmlns="http://www.webserviceX.NET">
                     <getAirportInformationByAirportCodeResult>
                        <xsl:text>&lt;NewDataSet&gt;
  &lt;Table&gt;
    &lt;AirportCode&gt;JFK&lt;/AirportCode&gt;
    &lt;CityOrAirportName&gt;NEW YORK NY/NEWARK KENNEDY&lt;/CityOrAirportName&gt;
    &lt;Country&gt;United States&lt;/Country&gt;
    &lt;CountryAbbrviation&gt;US&lt;/CountryAbbrviation&gt;
    &lt;CountryCode&gt;22&lt;/CountryCode&gt;
    &lt;GMTOffset&gt;5&lt;/GMTOffset&gt;
    &lt;RunwayLengthFeet&gt;14572&lt;/RunwayLengthFeet&gt;
    &lt;RunwayElevationFeet&gt;13&lt;/RunwayElevationFeet&gt;
    &lt;LatitudeDegree&gt;40&lt;/LatitudeDegree&gt;
    &lt;LatitudeMinute&gt;38&lt;/LatitudeMinute&gt;
    &lt;LatitudeSecond&gt;0&lt;/LatitudeSecond&gt;
    &lt;LatitudeNpeerS&gt;N&lt;/LatitudeNpeerS&gt;
    &lt;LongitudeDegree&gt;73&lt;/LongitudeDegree&gt;
    &lt;LongitudeMinute&gt;47&lt;/LongitudeMinute&gt;
    &lt;LongitudeSeconds&gt;0&lt;/LongitudeSeconds&gt;
    &lt;LongitudeEperW&gt;W&lt;/LongitudeEperW&gt;
  &lt;/Table&gt;
  &lt;Table&gt;
    &lt;AirportCode&gt;JFK&lt;/AirportCode&gt;
    &lt;CityOrAirportName&gt;NEW YORK NY/NEWARK KENNEDY&lt;/CityOrAirportName&gt;
    &lt;Country&gt;United States&lt;/Country&gt;
    &lt;CountryAbbrviation&gt;US&lt;/CountryAbbrviation&gt;
    &lt;CountryCode&gt;22&lt;/CountryCode&gt;
    &lt;GMTOffset&gt;5&lt;/GMTOffset&gt;
    &lt;RunwayLengthFeet&gt;14572&lt;/RunwayLengthFeet&gt;
    &lt;RunwayElevationFeet&gt;13&lt;/RunwayElevationFeet&gt;
    &lt;LatitudeDegree&gt;40&lt;/LatitudeDegree&gt;
    &lt;LatitudeMinute&gt;38&lt;/LatitudeMinute&gt;
    &lt;LatitudeSecond&gt;0&lt;/LatitudeSecond&gt;
    &lt;LatitudeNpeerS&gt;N&lt;/LatitudeNpeerS&gt;
    &lt;LongitudeDegree&gt;73&lt;/LongitudeDegree&gt;
    &lt;LongitudeMinute&gt;47&lt;/LongitudeMinute&gt;
    &lt;LongitudeSeconds&gt;0&lt;/LongitudeSeconds&gt;
    &lt;LongitudeEperW&gt;W&lt;/LongitudeEperW&gt;
  &lt;/Table&gt;
&lt;/NewDataSet&gt;</xsl:text>
                     </getAirportInformationByAirportCodeResult>
                  </getAirportInformationByAirportCodeResponse>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="context" select="$context-doc/(/)"/>
            <xsl:apply-templates select="$context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d4e7">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d4e7">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>validating output</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>x</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/(//Table)"/>
      <xsl:variable name="impl:successful" as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>validating output</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>