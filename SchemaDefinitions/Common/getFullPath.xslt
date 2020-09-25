<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="text()"/>

    <xsl:template match="*">
        <xsl:for-each select="ancestor-or-self::*">
            <xsl:value-of select="concat(text(),'/',local-name())"/>
            <!--Predicate is only output when needed.-->
            <xsl:if test="(preceding-sibling::*|following-sibling::*)[local-name()=local-name(current())]">
                <xsl:value-of select="concat('[',count(preceding-sibling::*[local-name()=local-name(current())])+1,']')"/>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="node()"/>
    </xsl:template>

</xsl:stylesheet>