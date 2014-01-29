<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for basic XMPP services listing -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>

<xsl:output method='html' indent='yes'/>

  <xsl:template match='/'>
    <xsl:apply-templates select='/services/service'/>
  </xsl:template>

  <xsl:template match='service'>
    <tr>
      <td>
        <a>
          <xsl:attribute name='href'><xsl:value-of select='website'/></xsl:attribute>
          <xsl:attribute name='title'><xsl:value-of select='desc'/></xsl:attribute>
          <xsl:value-of select='domain'/>
        </a>
      </td>
      <td><xsl:value-of select='year'/></td>
      <td><xsl:value-of select='country'/></td>
      <td><xsl:value-of select='lat'/></td>
      <td><xsl:value-of select='lon'/></td>
      <td>
        <a>
          <xsl:attribute name='href'><xsl:value-of select='ca/@uri'/></xsl:attribute>
          <xsl:value-of select='ca'/>
        </a>
      </td>
      <td>
        <a>
          <xsl:attribute name='href'><xsl:value-of select='server/@uri'/></xsl:attribute>
          <xsl:value-of select='server'/>
        </a>
      </td>
      <td>
        <a>
          <xsl:attribute name='href'><xsl:value-of select='admin/@uri'/></xsl:attribute>
          <xsl:value-of select='admin'/>
        </a>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
