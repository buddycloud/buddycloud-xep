<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for AMP conditions -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='amp-conditions'>
      <xsl:apply-templates select='/registry/condition'/>
    </registry>
  </xsl:template>

  <xsl:template match='condition'>
    <condition>
      <name><xsl:value-of select='name'/></name>
      <ns><xsl:value-of select='ns'/></ns>
      <per-hop><xsl:value-of select='per-hop'/></per-hop>
      <value><xsl:value-of select='value'/></value>
      <processing><xsl:value-of select='processing'/></processing>
      <doc><xsl:value-of select='doc'/></doc>
    </condition>
  </xsl:template>

</xsl:stylesheet>
