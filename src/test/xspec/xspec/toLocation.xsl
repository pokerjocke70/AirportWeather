<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:o="http://www.w3.org/1999/XSL/TransformAliasAlias"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns:functx="http://www.functx.com"
                xmlns:f="http://xspec-demo/functions"
                version="2.0">
   <xsl:import href="file:/Users/jocke/Documents/AirportWeather_xspec/src/main/resources/xslt/toLocation.xsl"/>
   <xsl:import href="file:/apps/xspec-v0.2/generate-tests-utils.xsl"/>
   <xsl:namespace-alias stylesheet-prefix="o" result-prefix="xsl"/>
   <xsl:variable name="x:stylesheet-uri" as="xs:string"
                 select="'file:/Users/jocke/Documents/AirportWeather_xspec/src/main/resources/xslt/toLocation.xsl'"/>
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
            <xsl:call-template name="x:d4e24"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d4e2">
      <xsl:message>test create toLocation</xsl:message>
      <x:scenario>
         <x:label>test create toLocation</x:label>
         <xsl:call-template name="x:d4e3"/>
         <xsl:call-template name="x:d4e10"/>
         <xsl:call-template name="x:d4e17"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d4e3">
      <xsl:message>..testing createCoordinate function</xsl:message>
      <x:scenario>
         <x:label>testing createCoordinate function</x:label>
         <x:call function="f:createCoordinate">
            <x:param name="degree" select="xs:double(1)"/>
            <x:param name="minute" select="xs:double(12)"/>
            <x:param name="seconds" select="xs:double(45)"/>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="degree" select="xs:double(1)"/>
            <xsl:variable name="minute" select="xs:double(12)"/>
            <xsl:variable name="seconds" select="xs:double(45)"/>
            <xsl:variable name="minute" select="xs:double(12)"/>
            <xsl:variable name="seconds" select="xs:double(45)"/>
            <xsl:variable name="seconds" select="xs:double(45)"/>
            <xsl:sequence select="f:createCoordinate($degree, $minute, $seconds)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d4e8">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d4e8">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>validating output</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>1.2125</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
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
   <xsl:template name="x:d4e10">
      <xsl:message>..testing createCoordinate function with zeros</xsl:message>
      <x:scenario>
         <x:label>testing createCoordinate function with zeros</x:label>
         <x:call function="f:createCoordinate">
            <x:param name="degree" select="xs:double(0)"/>
            <x:param name="minute" select="xs:double(0)"/>
            <x:param name="seconds" select="xs:double(0)"/>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="degree" select="xs:double(0)"/>
            <xsl:variable name="minute" select="xs:double(0)"/>
            <xsl:variable name="seconds" select="xs:double(0)"/>
            <xsl:variable name="minute" select="xs:double(0)"/>
            <xsl:variable name="seconds" select="xs:double(0)"/>
            <xsl:variable name="seconds" select="xs:double(0)"/>
            <xsl:sequence select="f:createCoordinate($degree, $minute, $seconds)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d4e15">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d4e15">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>validating output</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>0</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
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
   <xsl:template name="x:d4e17">
      <xsl:message>..testing createCoordinate function with one zero</xsl:message>
      <x:scenario>
         <x:label>testing createCoordinate function with one zero</x:label>
         <x:call function="f:createCoordinate">
            <x:param name="degree" select="xs:double(0)"/>
            <x:param name="minute" select="xs:double(1)"/>
            <x:param name="seconds" select="xs:double(1)"/>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="degree" select="xs:double(0)"/>
            <xsl:variable name="minute" select="xs:double(1)"/>
            <xsl:variable name="seconds" select="xs:double(1)"/>
            <xsl:variable name="minute" select="xs:double(1)"/>
            <xsl:variable name="seconds" select="xs:double(1)"/>
            <xsl:variable name="seconds" select="xs:double(1)"/>
            <xsl:sequence select="f:createCoordinate($degree, $minute, $seconds)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d4e22">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d4e22">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>validating output</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <xsl:text>0.016944444444444443</xsl:text>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
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
   <xsl:template name="x:d4e24">
      <xsl:message>testing output</xsl:message>
      <x:scenario>
         <x:label>testing output</x:label>
         <x:context href="file:/Users/jocke/Documents/AirportWeather_xspec/src/test/resources/AirportResult.xml"/>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="context-doc" as="document-node()"
                          select="doc('file:/Users/jocke/Documents/AirportWeather_xspec/src/test/resources/AirportResult.xml')"/>
            <xsl:variable name="context" select="$context-doc"/>
            <xsl:apply-templates select="$context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d4e26">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d4e26">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>Validating output structure</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <Location>
               <Latitude>
                  <xsl:text>40.68333333333333</xsl:text>
               </Latitude>
               <Longitude>
                  <xsl:text>-74.16666666666667</xsl:text>
               </Longitude>
            </Location>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful" as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>Validating output structure</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>