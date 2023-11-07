<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Dennis the Menace</title>
            </head>
            <body>
                <h1>Dennis the Menace: Volume 58 - Page 3</h1>
                <xsl:apply-templates select="//*[local-name()='panel']"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="//*[local-name()='panel']">
        <div>
            <h2>Panel <xsl:value-of select="@n"/></h2>
            <p>Characters: <xsl:value-of select="@characters"/></p>
            <p>Description: <xsl:value-of select="normalize-space(*[local-name()='note'][@type='panelDesc'])"/></p>
        </div>
    </xsl:template>
    
</xsl:stylesheet>