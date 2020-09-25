<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

  <!-- extract just the first child of the body -->
  <xsl:template match="/">
    <xsl:apply-templates select="/soap:Envelope/soap:Body/*[1]" />
  </xsl:template>

  <!-- identity template, but dropping namespace declarations not used
       directly by this element -->
  <xsl:template match="@*|node()">
    <xsl:copy copy-namespaces="no">
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <!-- drop xsi:schemaLocation attributes -->
  <xsl:template match="@xsi:schemaLocation" />
</xsl:stylesheet>
