<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for application-specific error conditions -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='errors'>
      <xsl:apply-templates select='/registry/condition'/>
    </registry>
  </xsl:template>

  <xsl:template match='condition'>
    <condition>
      <ns><xsl:value-of select='ns'/></ns>
      <element><xsl:value-of select='element'/></element>
      <desc><xsl:value-of select='desc'/></desc>
      <doc><xsl:value-of select='doc'/></doc>
    </condition>
  </xsl:template>

</xsl:stylesheet>
