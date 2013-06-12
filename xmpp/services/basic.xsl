<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for basic XMPP services listing -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>

<xsl:output method='xml' indent='yes' xmlns='http://jabber.org/protocol/disco#info'/>

  <xsl:template match='/'>
    <xsl:comment>
  This file lists the open XMPP servers registered with the XSF. 
  The format of this file is defined by the Service Discovery 
  protocol: http://xmpp.org/extensions/xep-0030.html 
  To add your server to the list, follow the instructions at
  http://xmpp.org/services/register.shtml
    </xsl:comment>

    <query>
      <xsl:apply-templates select='/services/service'/>
    </query>
  </xsl:template>

  <xsl:template match='service'>
    <item>
      <xsl:attribute name='jid'><xsl:value-of select='domain'/></xsl:attribute>
    </item>
  </xsl:template>

</xsl:stylesheet>
