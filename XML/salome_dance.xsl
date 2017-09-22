<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>
                    <xsl:value-of select="//head"/>
                </title>
                <meta charset="utf-8"/>
                <link rel="stylesheet" type="text/css" href="salome_dance.css"/>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="analysis/piece/composer/firstName"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="analysis/piece/composer/lastName"/>
                    <xsl:text>: </xsl:text>
                    <em>
                        <xsl:value-of select="analysis/piece/title/mainTitle"/>
                    </em>
                    <xsl:text>, op. </xsl:text>
                    <xsl:value-of select="analysis/piece/title/opus"/>
                </h1>
                <h2>Vergleichsanalyse des Ausschnittes <br/><em><xsl:value-of
                            select="substring(analysis/piece/title/excerpt, 1, 24)"/></em>
                    <xsl:text>: </xsl:text><xsl:value-of
                        select="substring(analysis/piece/title/excerpt, 27, 87)"/></h2>
                <h3>
                    <xsl:text>Aufnahmen: </xsl:text>
                </h3>
                <ul>
                    <xsl:apply-templates select="analysis/piece/recording"/>
                </ul>
                <div id="explanation">
                    <p>
                        <xsl:apply-templates select="analysis/method"/>
                    </p>
                    <p>
                        <xsl:apply-templates select="analysis/results"/>
                    </p>
                </div>
                <figure><xsl:apply-templates select="analysis/img"></xsl:apply-templates></figure>                
            </body>
        </html>
    </xsl:template>

    <xsl:template match="recording">
        <xsl:for-each select=".">
            <li>
                <xsl:apply-templates select="orchestra"/>
                <xsl:apply-templates select="conductor"/>
                <xsl:apply-templates select="recordingDate"/>
                <xsl:apply-templates select="label"/>
            </li>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="orchestra">
        <em>
            <xsl:value-of select="./orchestraName"/>
        </em>
        <xsl:text>, </xsl:text>
    </xsl:template>

    <xsl:template match="conductor">
        <xsl:text>Dirigent: </xsl:text>
        <xsl:value-of select="firstName"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="middleName"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="lastName"/>
        <xsl:text>, </xsl:text>
    </xsl:template>

    <xsl:template match="recordingDate">
        <xsl:value-of select="day"/>
        <xsl:text>. </xsl:text>
        <xsl:value-of select="month"/>
        <xsl:text>. </xsl:text>
        <xsl:value-of select="year"/>
        <xsl:text>, </xsl:text>
    </xsl:template>

    <xsl:template match="label">
        <xsl:value-of select="labelName"/>
        <xsl:text>.</xsl:text>
    </xsl:template>

    <xsl:template match="method">
        <strong>
            <xsl:text>Die Methode: </xsl:text>
        </strong>
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="results">
        <strong>
            <xsl:text>Das Ergebnis: </xsl:text>
        </strong>
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="img">       
            <a href="{./@src}">
                <img src="{./@src}" width="400" alt="Tempo Graph"/>
            </a>     
    </xsl:template>

</xsl:stylesheet>
