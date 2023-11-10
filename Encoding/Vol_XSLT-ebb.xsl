<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:cbml="http://www.cbml.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:variable name="dennisColl" as="document-node()+" select="collection('.?select=*.xml;recurse=yes')"/>
    <!--2023-11-09 ebb: COLLECTION VARIABLE WORKS! 
        Found the solution on Stack Overflow: 
    https://stackoverflow.com/questions/23741786/apply-one-xslt-stylesheet-recursively-to-sub-folders
    
    Also, I added the xpath-default-namespace (TEI) and cbml namespaces to the
    XSLT stylesheet root, so you don't have to use local-name() when reaching for those elements.
    
    -->
  
    <xsl:template match="/">
        <html>
            <head>
                <title>Dennis the Menace</title>
            </head>
            <body>
                <h1>Dennis the Menace: Volume 58 - Page 3</h1>
                
                <xsl:apply-templates select="$dennisColl//*[cbml:panel]"/>
           
              
            </body>
        </html>
    </xsl:template>
    
   <xsl:template match="//*[local-name()='panel']">
        <div>
            <h2>Panel <xsl:value-of select="@n"/></h2>
            <p>Characters: <xsl:value-of select="@characters"/></p>
            <p>Description: <xsl:value-of select="normalize-space(*[note][@type='panelDesc'])"/></p>
        </div>
    </xsl:template>
</xsl:stylesheet>