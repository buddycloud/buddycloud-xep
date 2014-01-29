<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for Jingle transport methods -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='jingle-transports'>
      <xsl:apply-templates select='/registry/transport'/>
    </registry>
  </xsl:template>

  <xsl:template match='transport'>
    <transport>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <type><xsl:value-of select='type'/></type>
      <doc><xsl:value-of select='doc'/></doc>
    </transport>
  </xsl:template>

</xsl:stylesheet>
