*Calypso-Ring2
definitionString
	"non special globals are defined by the symbol"
	^self isSpecial
		ifTrue: [super definitionString]
		ifFalse: [self name printString]
