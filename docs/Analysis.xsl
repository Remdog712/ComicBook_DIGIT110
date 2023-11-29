<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:cbml="http://www.cbml.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">

    <xsl:output method="text"/>
    
    <!-- Template to count <cbml:balloon> elements -->
    <xsl:template match="/">
        <xsl:for-each select="collection('file://XML/=*.xml')">
            <xsl:variable name="filename" select="tokenize(document-uri(.), '/')[last()]"/>
            <xsl:value-of select="$filename"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="count(//cbml:balloon)"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
