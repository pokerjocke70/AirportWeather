<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:f="http://xspec-demo/functions"
                exclude-result-prefixes="xs f"
                version="2.0">

    <xsl:output byte-order-mark="no" method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:apply-templates select="NewDataSet/Table[1]"/>
    </xsl:template>

    <xsl:template match="/NewDataSet/Table">

        <xsl:variable name="latMultiplier" as="xs:double" select="if(./LatitudeNpeerS = 'N') then 1 else -1"/>

        <xsl:variable name="longMultiplier" as="xs:double" select="if(./LongitudeEperW = 'E') then 1 else -1"/>

        <Location>
            <Latitude>
                <xsl:value-of
                        select="$latMultiplier * f:createCoordinate(xs:double(./LatitudeDegree), xs:double(./LatitudeMinute), xs:double(./LatitudeSecond))"/>
            </Latitude>
            <Longitude>
                <xsl:value-of
                        select="$longMultiplier * f:createCoordinate(xs:double(./LongitudeDegree), xs:double(./LongitudeMinute), xs:double(./LongitudeSeconds))"/>
            </Longitude>
        </Location>

    </xsl:template>

    <xsl:function name="f:createCoordinate">
        <xsl:param name="degree" as="xs:double"/>
        <xsl:param name="minute" as="xs:double"/>
        <xsl:param name="seconds" as="xs:double"/>

        <xsl:value-of
                select="sum((xs:double($degree), xs:double($minute) div xs:double(60.0), xs:double($seconds) div xs:double(3600.0)))"/>
    </xsl:function>

</xsl:stylesheet>