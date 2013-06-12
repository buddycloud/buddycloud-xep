<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for Jingle application formats -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='jingle-apps'>
      <xsl:apply-templates select='/registry/application'/>
    </registry>
  </xsl:template>

  <xsl:template match='application'>
    <application>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <transport><xsl:value-of select='transport'/></transport>
      <doc><xsl:value-of select='doc'/></doc>
    </application>
  </xsl:template>

</xsl:stylesheet>
