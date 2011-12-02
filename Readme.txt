A Widget to use that uses the ColdFish project to format your code
ColdFish URL: http://coldfish.riaforge.org/
Usage:

	Call the widget and pass it the text you want to format

	#cb.widget('ColdFishFormatter',{content=prc.entry.getContent()})#

	Within the text you want to format, wrap your code block with [code]...[/code]

	[code]
	<cfset message = "This plugin is really cool!!!" />
	<cfoutput>#message#</cfoutput>
	[/code]
