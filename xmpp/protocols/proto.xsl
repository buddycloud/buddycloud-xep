
<!-- Author: stpeter -->

<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>

  <xsl:output method='html'/>

  <xsl:template match='/'>
    <html>
      <head>
        <title><xsl:value-of select='/manifest/title'/></title>
        <link rel='stylesheet' type='text/css' href='/xmpp.css' />
        <link rel='shortcut icon' type='image/x-icon' href='/favicon.ico' />
        <link>
          <xsl:attribute name='rel'><xsl:text>alternate</xsl:text></xsl:attribute>
          <xsl:attribute name='href'><xsl:value-of select='/manifest/specurl'/></xsl:attribute>
        </link>
        <meta>
          <xsl:attribute name='name'><xsl:text>description</xsl:text></xsl:attribute>
          <xsl:attribute name='content'>Information about <xsl:value-of select='/manifest/specnum'/>: <xsl:value-of select='/manifest/title'/>, a <xsl:value-of select='/manifest/status'/> Standard of the <xsl:value-of select='/manifest/publisher'/>. <xsl:value-of select='/manifest/abstract'/></xsl:attribute>
        </meta>
        <xsl:variable name='ns.count' select='count(/manifest/namespaces/name)'/>
        <meta>
          <xsl:attribute name='name'><xsl:text>keywords</xsl:text></xsl:attribute>
          <xsl:choose>
            <xsl:when test="$ns.count &gt; 0">
              <xsl:attribute name='content'><xsl:apply-templates select='/manifest/namespaces/name' mode='keywords'/> <xsl:value-of select='/manifest/title'/><xsl:text>, Extensible Messaging and Presence Protocol, XMPP, Jabber</xsl:text></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name='content'><xsl:value-of select='/manifest/title'/><xsl:text>, Extensible Messaging and Presence Protocol, XMPP, Jabber</xsl:text></xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </meta>
        <meta>
          <xsl:attribute name='name'><xsl:text>DC.Title</xsl:text></xsl:attribute>
          <xsl:attribute name='content'><xsl:value-of select='/manifest/title'/></xsl:attribute>
        </meta>
      </head>
      <body>
        <h1><xsl:value-of select='/manifest/title'/></h1>
        <p>The <xsl:value-of select='/manifest/title'/> protocol is specified in 
        <a>
          <xsl:attribute name='href'>
            <xsl:value-of select='/manifest/specurl'/>
          </xsl:attribute>
          <xsl:value-of select='/manifest/specnum'/> 
        </a>
        (a <xsl:value-of select='/manifest/status'/> Standard of the <xsl:value-of select='/manifest/publisher'/>). <xsl:value-of select='/manifest/abstract'/></p>
        <xsl:variable name='name.count' select='count(/manifest/namespaces/name)'/>
        <xsl:if test='$name.count &gt; 0'>
        <p>The following XML namespaces are used in the context of the <xsl:value-of select='/manifest/title'/> protocol:</p>
          <ul>
            <xsl:apply-templates select='/manifest/namespaces/name' mode='names'/>
          </ul>
        </xsl:if>
        <xsl:variable name='schema.count' select='count(/manifest/schemas/schema)'/>
        <xsl:if test='$schema.count &gt; 0'>
          <p>The following XML schemas are available for the <xsl:value-of select='/manifest/title'/> protocol:</p>
          <ul>
            <xsl:apply-templates select='/manifest/schemas/schema'/>
          </ul>
        </xsl:if>
        <p>Information about this <a href='http://www.xmpp.org/protocols/'>XMPP protocol</a> is maintained by the <a href='http://www.xmpp.org/registrar/'>XMPP Registrar</a>.</p>
      </body>
    </html>
  </xsl:template>

  <xsl:template match='name' mode='keywords'>
    <xsl:value-of select='.'/><xsl:text>, </xsl:text>
  </xsl:template>

  <xsl:template match='name' mode='names'>
    <li><xsl:value-of select='.'/></li>
  </xsl:template>

  <xsl:template match='schema'>
    <xsl:variable name='this.url' select='.'/>
    <li><a href='{$this.url}'><xsl:value-of select='.'/></a></li>
  </xsl:template>

</xsl:stylesheet>
