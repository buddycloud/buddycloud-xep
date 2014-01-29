<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for Jingle application formats registry -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>

  <xsl:output doctype-public='-//W3C//DTD XHTML 1.0 Transitional//EN' doctype-system='http://www.w3.org/TR/xhtml1/DTD/xhtml1-loose.dtd' method='xml'/>

  <xsl:template match='/'>
    <html>
      <head>
        <title><xsl:value-of select='/registry/meta/title'/></title>
        <link rel='stylesheet' type='text/css' href='/xmpp.css' />
        <link rel='shortcut icon' type='image/x-icon' href='/favicon.ico' />
      </head>
      <body bgcolor='#FFFFFF'>
        <h2><xsl:value-of select='/registry/meta/title'/></h2>
        <xsl:apply-templates select='/registry/meta/overview'/>
        <!--<p><xsl:value-of select='/registry/meta/legal'/></p>-->
        <p>Last Updated: <xsl:value-of select='/registry/meta/revision/date'/></p>
        <p>XML: <a href='http://xmpp.org/registrar/jingle-apps.xml'>http://xmpp.org/registrar/jingle-apps.xml</a></p>
        <hr />
        <table border='1' cellpadding='3' cellspacing='0'>
          <tr class='body'>
            <th>Application</th>
            <th>Description</th>
            <th>Preferred Transport (Datagram or Streaming)</th>
            <th>Document</th>
          </tr>
          <xsl:apply-templates select='/registry/application'/>
        </table>
        <hr />
        <h2>Revision History</h2>
          <blockquote>
            <xsl:apply-templates select='/registry/meta/revision'/>
          </blockquote>
        <hr />
      </body>
    </html>
  </xsl:template>

  <xsl:template match='application'>
    <tr class='body'>
      <td><xsl:value-of select='name'/></td>
      <td><xsl:value-of select='desc'/></td>
      <td><xsl:value-of select='transport'/></td>
      <td><xsl:value-of select='doc'/></td>
    </tr>
  </xsl:template>

  <xsl:template match='overview'>
      <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match='doc'>
      <td><xsl:apply-templates/></td>
  </xsl:template>

  <xsl:template match='link'>
    <a href='{@url}'>
    <xsl:apply-templates/>
    </a>
  </xsl:template>

  <xsl:template match='revision'>
    <p><strong><xsl:value-of select='date'/></strong><xsl:text> </xsl:text><xsl:value-of select='remark'/><xsl:text> </xsl:text>(<xsl:value-of select='initials'/>)</p>
  </xsl:template>

</xsl:stylesheet>
