<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="3.0">
	<!-- Purpose: Test the "required" attribute with values "1" and "0", using xsl:call-template instruction to set the parameter. -->

	<t:template match="doc">
		<out>
			<t:call-template name="foo">
				<t:with-param name="par1" select="'required'"/>
				<t:with-param name="par2" select="'notRequired'"/>
			</t:call-template>
		</out>
	</t:template>

	<t:template name="foo">
		<t:param name="par1" required=" 1 "/>
		<t:param name="par2" required=" 0 "/>
		<t:if test="$par1 = 'required'">
			<t:text>Required parameter;</t:text>
		</t:if>
		<t:if test="$par2 = 'notRequired'">
			<t:text>Not required parameter</t:text>
		</t:if>
	</t:template>
</t:transform>
