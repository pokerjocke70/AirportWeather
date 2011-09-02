<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:x="http://www.webserviceX.NET"
                xmlns:ns1="http://www.weather.gov/forecasts/xml/DWMLgen/wsdl/ndfdXML.wsdl"
                exclude-result-prefixes="xs ns1 x"
                version="2.0">

    <xsl:output byte-order-mark="no" method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>

    <xsl:template match="/x:getAirportInformationByAirportCodeResponse/x:getAirportInformationByAirportCodeResult | /ns1:NDFDgenResponse/dwmlOut">

                <xsl:value-of disable-output-escaping="yes" select="."/>

    </xsl:template>

</xsl:stylesheet>