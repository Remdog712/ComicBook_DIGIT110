<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:cbml="http://www.cbml.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="XSLT_to_HTML.css"/>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <!-- rorange - TEI header stuff. It makes a nice little storage area for the metadata --> 
    
    <xsl:template match="teiHeader">
        <div class="tei-header">
            <div class="file-desc">
                <div class="title-stmt">
                    <h1>
                        <xsl:value-of select="fileDesc/titleStmt/title"/>
                    </h1>
                    <p>
                        Author: <xsl:value-of select="fileDesc/titleStmt/author"/>
                    </p>
                    <p>
                        Illustrator: <xsl:value-of select="fileDesc/titleStmt/author[@role='illustrator']"/>
                    </p>
                    <p>
                        Editors:
                        <xsl:for-each select="fileDesc/titleStmt/editor">
                            <xsl:value-of select="."/>
                            <xsl:if test="position() &lt; last()">, </xsl:if>
                        </xsl:for-each>
                    </p>
                </div>
                <div class="publication-stmt">
                    <p>
                        Date: <xsl:value-of select="fileDesc/publicationStmt/date"/>
                    </p>
                    <div class="availability">
                        <p>
                            <xsl:value-of select="fileDesc/publicationStmt/availability/p"/>
                        </p>
                    </div>
                </div>
                <div class="notes-stmt">
                    <p>
                        Note: <xsl:value-of select="fileDesc/notesStmt/note"/>
                    </p>
                </div>
                <div class="source-desc">
                    <p>
                        <a href="{fileDesc/sourceDesc/ref[@target='https://archive.org/details/dennis-the-menace-issue-58']}">Online Archive</a>
                    </p>
                    <p>
                        <a href="{fileDesc/sourceDesc/ref[@target='https://github.com/Remdog712/ComicBook_DIGIT110']}">Github Repo</a>
                    </p>
                    <p>
                        <xsl:value-of select="fileDesc/sourceDesc/p"/>
                    </p>
                    <p>
                        <xsl:value-of select="fileDesc/sourceDesc/p[last()]"/>
                    </p>
                </div>
            </div>
            <div class="encoding-desc">
                <div class="tags-decl">
                    <p>
                        Namespace: <xsl:value-of select="encodingDesc/tagsDecl/namespace/@name"/>
                    </p>
                    <p>
                        Tag Usage:
                        <xsl:for-each select="encodingDesc/tagsDecl/namespace/tagUsage">
                            <xsl:value-of select="@gi"/>
                            <xsl:if test="position() &lt; last()">, </xsl:if>
                        </xsl:for-each>
                    </p>
                </div>
            </div>
        </div>
        
       
        
    </xsl:template>
    
    <!-- rorange - Title Section (felt necessary) --> 
    
    <xsl:template match="milestone[@unit='start'][@n][1]">
        <h1 class="story-title">
            <xsl:value-of select="@n"/>
        </h1>
    </xsl:template>
    

    
   
    <xsl:template match="TEI">
        <div class="comic">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    <!-- rorange - Adds the little page symbol on the left as visual help  --> 
    
    <xsl:template match="div[@type='page']">
        <div class="page">
           
            <div class="figure-head-box">
                <h2 class="figure-title">
                    <xsl:value-of select="figure/head"/>
                </h2>
            </div>
            
            
            
            
            <div class="page-image">
                <img src="{figure/graphic/@url}" alt="{figure/head}" class="comic-image" width="500" height="auto"/>
            </div>
            
            <div class="panel-container">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="div[@type='panelGrp']">
        <div class="panel-group">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    
    
    <xsl:template match="cbml:panel">
        <div class="panel">
            <div class="panel-content">
                <xsl:apply-templates select="cbml:caption"/>
                <xsl:apply-templates select="cbml:balloon"/>
                <xsl:apply-templates select="move"/>
                <xsl:apply-templates select="note"/>
            </div>

        </div>
    </xsl:template>
   
    <!-- rorange - Way too long of a list for making an icon for each person when they do a move action; Overall not good in the long term but more cool than just words --> 
   
    <xsl:template match="move">
        <div class="move">
         
            <xsl:choose>
                <xsl:when test="@who='#dennis'">
                    
                    <span class="character-icon dennis-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#father'">
                    
                    <span class="character-icon father-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#mother'">
                    
                    <span class="character-icon mother-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#tommy'">
                    
                    <span class="character-icon tommy-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#wilson'">
                    
                    <span class="character-icon wilson-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#anonMan'">
                    
                    <span class="character-icon anonMan-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#anonWoman'">
                    
                    <span class="character-icon anonWoman-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#clerk'">
                   
                    <span class="character-icon clerk-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#joey'">
                    
                    <span class="character-icon joey-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#mailman'">
                    
                    <span class="character-icon mailman-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#fisherman'">

                    <span class="character-icon fisherman-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#grandpa'">
                    
                    <span class="character-icon grandpa-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#granma'">
                   
                    <span class="character-icon granma-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#child1'">
                    
                    <span class="character-icon child1-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#child2'">
                    
                    <span class="character-icon child2-icon"></span>
                </xsl:when>
                <xsl:when test="@who='#martha'">
                    
                    <span class="character-icon martha-icon"></span>
                </xsl:when>
                
                
            </xsl:choose>
            
           
            <!-- rorange - Handling the Actions as little icons not good for longterm but cool  --> 
           
            <xsl:choose>
                <xsl:when test="@rendition='#excite'">
                  
                    <span class="action-icon excite-icon"></span>
                </xsl:when>
                <xsl:when test="@rendition='#spin'">
                  
                    <span class="action-icon spin-icon"></span>
                </xsl:when>
                
                <xsl:when test="@rendition='#small'">
                    
                    <span class="action-icon small-icon"></span>
                </xsl:when>
                
                <xsl:when test="@rendition='#fast'">
                    
                    <span class="action-icon fast-icon"></span>
                </xsl:when>
                
                <xsl:when test="@rendition='#bump'">
                    
                    <span class="action-icon bump-icon"></span>
                </xsl:when>
                
            </xsl:choose>
        </div>
    </xsl:template>
    
    
    
    <!-- rorange - All the renditions and types of balloons -->
    
    <xsl:template match="cbml:balloon[contains(@type, 'speech')]">
        <div class="speech-balloon">
            <div class="speaker">
                <xsl:value-of select="substring(@who, 2)"/> >
            </div>
            <div class="move">
                <xsl:value-of select="ancestor::cbml:panel/move"/>
            </div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="cbml:balloon[contains(@type, 'thought')]">
        <div class="thought-balloon">
            <div class="speaker">
                <xsl:value-of select="substring(@who, 2)"/> 
            </div>
            <div class="move">
                <xsl:value-of select="ancestor::cbml:panel/move"/>
            </div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="cbml:balloon[contains(@type, 'singing')]">
        <div class="singing-balloon">
            <div class="speaker">
                <xsl:value-of select="substring(@who, 2)"/> 
            </div>
            <div class="move">
                <xsl:value-of select="ancestor::cbml:panel/move"/>
            </div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    

    
    <xsl:template match="cbml:balloon[contains(@rendition, '#jaggies')]">
        <div class="jaggies-balloon">
            <div class="speaker">
                <xsl:value-of select="substring(@who, 2)"/> 
            </div>
            <div class="move">
                <xsl:value-of select="ancestor::cbml:panel/move"/>
            </div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="cbml:balloon[contains(@rendition, '#bubble')]">
        <div class="jaggies-balloon">
            <div class="speaker">
                <xsl:value-of select="substring(@who, 2)"/> 
            </div>
            <div class="move">
                <xsl:value-of select="ancestor::cbml:panel/move"/>
            </div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    
    
    
    
   <!-- rorange Floating Text Handling but didn't use as it may become confusing with panels --> 
    <xsl:template match="floatingText">
        <div class="floating-text">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    
    
    
    
    
    <!-- rorange All Renditions of bubbles -->
    
 
    <xsl:template match="emph[@rendition='#b']">
        <span class="emph-bold">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="emph[contains(@rendition, '#color:red')]">
        <span class="emph-red">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="emph[contains(@rendition, 'red')]">
        <span class="emph-red">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="emph[@rendition='#uc']">
        <span class="emph-uppercase">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="emph[@rendition='#large']">
        <span class="emph-large">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="emph[@rendition='#jaggies']">
        <span class="emph-jaggies">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="emph[contains(@rendition, '#color:blue')]">
        <span class="emph-blue">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="emph[contains(@rendition, '#color:orange')]">
        <span class="emph-orange">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    

    
    
    <!-- rorange: note handling -->
    <xsl:template match="note">
        <div class="note">
            <em>
                <xsl:apply-templates/>
            </em>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
