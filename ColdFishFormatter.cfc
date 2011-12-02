/**
* A Widget to use that uses the ColdFish project to format your code
* ColdFish URL: http://coldfish.riaforge.org/
Usage:

	Call the widget and pass it the text you want to format

	#cb.widget('ColdFishFormatter',{content=prc.entry.getContent()})#

	Within the text you want to format, wrap your code block with [code]...[/code]

	[code]
	<cfset message = "This plugin is really cool!!!" />
	<cfoutput>#message#</cfoutput>
	[/code]
*/
component extends="contentbox.model.ui.BaseWidget" singleton{

	ColdFishFormatter function init(controller){
		// super init
		super.init(controller);

		// Widget Properties
		setPluginName("ColdFishFormatter");
		setPluginVersion("1.0");
		setPluginDescription("A Widget to use that uses the ColdFish project to format your code");
		setPluginAuthor("Computer Know How");
		setPluginAuthorURL("www.compknowhow.com");
		setForgeBoxSlug("cbwidget-coldfishformatter");

		variables.coldfish = createObject("component","coldfish.coldfish").init();

		return this;
	}

	/**
	* returns the coldfish formatted string
	* @content The string of HTML to format
	*/
	any function renderIt(string content){
		var rString = arguments.content;
		//check for code block
		if (findNoCase('[code]',rString) and findNoCase("[/code]",rString)) {

			var counter = findNoCase('[code]',rString);
			while (counter gte 1) {
				var codeblock = reFindNoCase('(.*)(\[code\])(.*)(\[/code\])(.*)',rString,1,1);
				if(arrayLen(codeblock.len) gte 6) {
					var codeportion = mid(rString, codeblock.pos[4], codeblock.len[4]);
					if (len(trim(codeportion))) {
						var result = variables.coldfish.formatString(trim(codeportion));
						result = "<div class='code'>" & result &  "</div>";
					} else {
						var result = "";
					}
					rString = mid(rString, 1, codeblock.len[2]) & result & mid(rString,codeblock.pos[6],codeblock.len[6]);
					counter = findNoCase('[code]',rString,counter);
				} else {
					counter = 0;
				}
			}
		}
		return rString;
	}
}
