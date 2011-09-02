<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"
                version="2.0">

    <xsl:output byte-order-mark="no" method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
                
                <getAirportInformationByAirportCode xmlns="http://www.webserviceX.NET">
                            <airportCode><xsl:value-of select="./airport"/></airportCode>
                </getAirportInformationByAirportCode>
            
    </xsl:template>

</xsl:stylesheet>