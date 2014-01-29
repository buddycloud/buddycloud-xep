<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for XMPP URI/IRI querytypes -->
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
        <p>XML: <a href='http://xmpp.org/registrar/querytypes.xml'>http://xmpp.org/registrar/querytypes.xml</a></p>
        <hr />
        <xsl:call-template name='processTOC' />
        <hr />
        <xsl:apply-templates select='/registry/querytype'/>
        <hr />
        <h2>Revision History</h2>
          <blockquote>
            <xsl:apply-templates select='/registry/meta/revision'/>
          </blockquote>
        <hr />
      </body>
    </html>
  </xsl:template>

  <xsl:template name='processTOC'>
    <h4>Table of Contents</h4>
    <p>
      <xsl:apply-templates select='//querytype' mode='toc'/>
    </p>
  </xsl:template>
      
  <xsl:template match='querytype' mode='toc'>
    <xsl:variable name='thisname'>
      <xsl:value-of select='name'/>
    </xsl:variable>
    <xsl:variable name='num'>
      <xsl:number level='multiple' count='querytype'/><xsl:text>. </xsl:text>
    </xsl:variable>
    <br /><xsl:value-of select='$num'/> <a href='#{$thisname}'><xsl:value-of select='name' /></a>
  </xsl:template>

  <xsl:template match='querytype'>
    <a>
      <xsl:attribute name='name'>
        <xsl:value-of select='name'/>
      </xsl:attribute>
    </a>
    <xsl:variable name='num'>
      <xsl:number level='multiple' count='querytype'/><xsl:text>. </xsl:text>
    </xsl:variable>
    <h3><xsl:value-of select='$num'/><xsl:value-of select='name'/></h3>
    <blockquote>
      <p>Protocol: <xsl:value-of select='proto'/></p>
      <p>Description: <xsl:value-of select='desc'/></p>
      <p>Documentation: <xsl:value-of select='doc'/></p>
      <xsl:variable name='keys.count' select='count(keys)'/>
      <xsl:choose>
        <xsl:when test='$keys.count &gt; 0'>
          <xsl:apply-templates select='keys'/>
        </xsl:when>
        <xsl:otherwise><p>Keys: None Defined</p></xsl:otherwise>
      </xsl:choose>
    </blockquote>
  </xsl:template>

  <xsl:template match='keys'>
    <table border='1' cellpadding='3' cellspacing='0'>
      <tr class='body'>
        <th>Key</th>
        <th>Description</th>
        <th>Values</th>
      </tr>
      <xsl:apply-templates select='key'/>
    </table>
  </xsl:template>

  <xsl:template match='key'>
    <xsl:variable name='values.count' select='count(values)'/>
    <tr class='body'>
      <td><xsl:value-of select='name'/></td>
      <td><xsl:value-of select='desc'/></td>
      <xsl:choose>
        <xsl:when test='$values.count &gt; 0'>
          <xsl:apply-templates select='values'/>
        </xsl:when>
        <xsl:otherwise><td>None Defined</td></xsl:otherwise>
      </xsl:choose>
    </tr>
  </xsl:template>

  <xsl:template match='values'>
    <td>
      <xsl:apply-templates select='value'/>
    </td>
  </xsl:template>

  <xsl:template match='value'>
    <p><xsl:value-of select='name'/> -- <xsl:value-of select='desc'/></p>
  </xsl:template>

  <xsl:template match='overview'>
      <p><xsl:apply-templates/></p>
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
