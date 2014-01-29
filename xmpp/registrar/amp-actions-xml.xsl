<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for AMP actions -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='amp-actions'>
      <xsl:apply-templates select='/registry/action'/>
    </registry>
  </xsl:template>

  <xsl:template match='action'>
    <action>
      <name><xsl:value-of select='name'/></name>
      <ns><xsl:value-of select='ns'/></ns>
      <behavior><xsl:value-of select='behavior'/></behavior>
      <doc><xsl:value-of select='doc'/></doc>
    </action>
  </xsl:template>

</xsl:stylesheet>
