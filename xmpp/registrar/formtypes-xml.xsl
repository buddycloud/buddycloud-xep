<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for FORM_TYPE registration -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='formtypes'>
      <xsl:apply-templates select='/registry/form_type'/>
    </registry>
  </xsl:template>

  <xsl:template match='form_type'>
    <form_type>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <doc><xsl:value-of select='doc'/></doc>
      <xsl:apply-templates select='/registry/formtype/field'/>
    </form_type>
  </xsl:template>

  <xsl:template match='field'>
    <xsl:variable name='option.count' select='count(option)'/>
    <field>
      <xsl:attribute name='var'><xsl:value-of select='@var'/></xsl:attribute>
      <xsl:attribute name='type'><xsl:value-of select='@type'/></xsl:attribute>
      <xsl:attribute name='label'><xsl:value-of select='@label'/></xsl:attribute>
      <xsl:if test='$option.count &gt; 0'>
        <xsl:apply-templates select='/registry/formtype/field/option'/>
      </xsl:if>
    </field>
  </xsl:template>

  <xsl:template match='option'>
    <field>
      <xsl:attribute name='label'><xsl:value-of select='@label'/></xsl:attribute>
      <value><xsl:value-of select='value'/></value>
    </field>
  </xsl:template>

</xsl:stylesheet>
