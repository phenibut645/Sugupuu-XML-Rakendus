<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
		<strong>Näitame kõik nimed </strong>
		<ul>
			<xsl:for-each select="//inimene">
				<xsl:sort select="@saasta" order="descending"/>
				<!-- Descending - suuremast väiksemani -->
				<li>
					<xsl:value-of select="nimi"/>, <xsl:value-of select="@saasta"/>. Vanus: <xsl:value-of select="2025-@saasta"/>
				</li>
			</xsl:for-each>
		</ul>
		<table>
			<thead>
				<th>
					Nimi
				</th>
				<th>
					Aasta
				</th>
				<th>
					Vanus
				</th>
			</thead>
			<tbody>
				<xsl:for-each select="//inimene">
					<tr>
						<td>
							<xsl:value-of select="nimi"/>
						</td>
						<td>
							<xsl:value-of select="@saasta"/>
						</td>
						<td>
							<xsl:value-of select="2025-@saasta"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<table>
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
					Lapevanema vanus
				</th>
				<th>
					Vanus
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
						<td>
							<xsl:value-of select="nimi"/>
						</td>
						<td>
							<xsl:if test="../..">
								<xsl:value-of select="@saasta - ../../@saasta"/>
							</xsl:if>
						</td>
						<td>
							<xsl:value-of select="2025-@saasta"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<strong>Iga inimese kohta näita mitmendal oma vanema sünniaastal ta sündis</strong>
		<ul>
			<xsl:for-each select="//inimene">
				<li>
					<xsl:value-of select="nimi"/>
					<xsl:if test="../..">
						-lapsevanema vanus oli
						<xsl:value-of select="../../@saasta - @saasta"/>aastat vana
					</xsl:if>
				</li>
			</xsl:for-each>
		</ul>
		<strong>
			<ol>
				<li>
					Count() - kogus - üldkogus - kõik nimed xmal jadas:
					<xsl:value-of select="count(//nimi)"/>
				</li>
				<li>
					substring() - eralda kolm esimest tähte nimest:
					<xsl:for-each select="//inimene">
						<xsl:value-of select="substring(nimi, string-length(nimi) - 3, string-length(nimi))"/> | 
					</xsl:for-each>
					
				</li>
				<li>
					Starts with
					<xsl:for-each select="//inimene[starts-with(nimi, 'A')]">
						<xsl:value-of select="nimi"/>
					</xsl:for-each>
				</li>
				
			</ol>
		</strong>
    </xsl:template>
</xsl:stylesheet>
