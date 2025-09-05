<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
		<table style="">
			<thead>
				<th>
					Nimi
				</th>
				<th>
					Aasta
				</th>
				<th>
					Laps
				</th>
				<th>
					Lapsevanema vanus
				</th>
				<th>
					Vanus
				</th>
				<th>
					Lapsed kogus
				</th>
				<th>
					Lapse elukoht
				</th>
				<th>
					Oli sündinud
				</th>
			</thead>
			<tbody>
				<xsl:for-each select="//inimene">
					<tr>
						<td>
							<xsl:value-of select="../../nimi"/>
						</td>
						<td>
							<xsl:value-of select="@saasta"/>
						</td>
						<xsl:if test="count(lapsed/inimene) &gt; 1">
							<td style="background-color:yellow;">
								<xsl:value-of select="nimi"/>
							</td>
						</xsl:if>
						<xsl:if test="count(lapsed/inimene) &lt;= 1">
							<td style="background-color:aqua;">
								<xsl:value-of select="nimi"/>
							</td>
						</xsl:if>
						<td>
							<xsl:if test="../..">
								<xsl:value-of select="@saasta - ../../@saasta"/>
							</xsl:if>
						</td>
						<td>
							<xsl:value-of select="2025-@saasta"/>
						</td>
						<td>
							<xsl:value-of select="count(lapsed/inimene)"/>
						</td>
						<td>
							<xsl:value-of select="elukoht"/>
						</td>
						<td>
							<xsl:value-of select="sundinud"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<string>Mitu inimest elavad igas elukohas</string>
		<ol>
			<li>
				<strong>
					Thailand:
				</strong>
				
				<xsl:value-of select="count(//elukoht[text() = 'Thailand'])"/>
			</li>
			<li>
				<strong>
					Estonia:
				</strong> 
				<xsl:value-of select="count(//elukoht[text() = 'Estonia'])"/>
			</li>
		</ol>
		
		

	</xsl:template>
</xsl:stylesheet>
