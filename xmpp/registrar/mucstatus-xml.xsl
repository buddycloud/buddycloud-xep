<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for MUC status codes -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='mucstatus'>
      <xsl:apply-templates select='/registry/statuscode'/>
    </registry>
  </xsl:template>

  <xsl:template match='statuscode'>
    <statuscode>
      <number><xsl:value-of select='number'/></number>
      <stanza><xsl:value-of select='stanza'/></stanza>
      <context><xsl:value-of select='context'/></context>
      <purpose><xsl:value-of select='purpose'/></purpose>
    </statuscode>
  </xsl:template>

</xsl:stylesheet>
