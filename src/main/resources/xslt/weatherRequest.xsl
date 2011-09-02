<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:ndf="http://www.weather.gov/forecasts/xml/DWMLgen/wsdl/ndfdXML.wsdl"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xs xsi ndf" version="2.0">


    <xsl:output byte-order-mark="no" method="xml" indent="yes" encoding="UTF-8"/>


    <xsl:param name="startDate" as="xs:dateTime"/>

    <xsl:param name="endDate"  as="xs:dateTime"/>

    <xsl:template match="/">

        <ndf:NDFDgen>
            <latitude>
                <xsl:value-of select="//Latitude"/>
            </latitude>
            <longitude>
                <xsl:value-of select="//Longitude"/>
            </longitude>
            <product>time-series</product>
            <startTime>
                <xsl:value-of select="$startDate"></xsl:value-of>
            </startTime>
            <endTime>
                <xsl:value-of select="$endDate"/>
            </endTime>
            <weatherParameters>
                <maxt>true</maxt>
                <mint>true</mint>

            </weatherParameters>
        </ndf:NDFDgen>

    </xsl:template>


</xsl:stylesheet>
