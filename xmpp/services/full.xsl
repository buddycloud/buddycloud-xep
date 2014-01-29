<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for basic XMPP services listing -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>

<xsl:output method='xml' indent='yes' xmlns='http://jabber.org/protocol/disco#info'/>

  <xsl:template match='/'>
    <query>
      <xsl:apply-templates select='/services/service'/>
    </query>
  </xsl:template>

  <xsl:template match='service'>
    <item>
      <xsl:attribute name='jid'><xsl:value-of select='domain'/></xsl:attribute>
      <server-software><xsl:value-of select='server'/></server-software>
      <domain><xsl:value-of select='domain'/></domain>
      <homepage><xsl:value-of select='website'/></homepage>
      <primary-admin><xsl:value-of select='admin/@uri'/></primary-admin>
      <longitude><xsl:value-of select='lon'/></longitude>
      <latitude><xsl:value-of select='lat'/></latitude>
      <description><xsl:value-of select='desc'/></description>
    </item>
  </xsl:template>

</xsl:stylesheet>
