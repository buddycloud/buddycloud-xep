<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for XMPP URI/IRI querytypes -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='querytypes'>
      <xsl:apply-templates select='/registry/querytype'/>
    </registry>
  </xsl:template>

  <xsl:template match='querytype'>
    <xsl:variable name='keys.count' select='count(keys)'/>
    <querytype>
      <name><xsl:value-of select='name'/></name>
      <proto><xsl:value-of select='proto'/></proto>
      <desc><xsl:value-of select='desc'/></desc>
      <doc><xsl:value-of select='doc'/></doc>
      <xsl:if test='$keys.count &gt; 0'>
        <xsl:apply-templates select='keys'/>
      </xsl:if>
    </querytype>
  </xsl:template>

  <xsl:template match='keys'>
    <keys>
      <xsl:apply-templates select='key'/>
    </keys>
  </xsl:template>

  <xsl:template match='key'>
    <key>
      <xsl:variable name='values.count' select='count(values)'/>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <xsl:if test='$values.count &gt; 0'>
        <xsl:apply-templates select='values'/>
      </xsl:if>
    </key>
  </xsl:template>

  <xsl:template match='values'>
    <values>
      <xsl:apply-templates select='value'/>
    </values>
  </xsl:template>

  <xsl:template match='value'>
    <value>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
    </value>
  </xsl:template>

</xsl:stylesheet>
