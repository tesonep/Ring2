private - backend interface
pvtUntagFrom: aSymbol
	
	(tags value includes: aSymbol)
		ifTrue: [ tags remove: aSymbol ].
	
	"TODO:Announce"
	
	