as yet unclassified
testProperties

	| def | 
	
	def := RG2Definition new.
	
	self assert: def hasProperties not.
	self assert: (def hasPropertyNamed: #note) not.
	self assert: def propertyNames isEmpty.
	self assert: (def propertyNamed: #note ifAbsent: [#someNote]) equals: #someNote.
	self assert: (def hasPropertyNamed: #note) not.
	self assert: (def propertyNamed: #note ifAbsentPut: [#someNote]) equals: #someNote.
	self assert: (def hasPropertyNamed: #note).
	self assert: (def propertyNamed: #note) equals: #someNote.
	self assert: def hasProperties.
	self assert: def propertyNames asArray equals: {#note}.
	def propertyNamed: #note2 put: #someNote2.
	self assert: (def propertyNames asArray includesAll: {#note. #note2}).
	def removePropertyNamed: #note.
	self assert: def propertyNames asArray equals: {#note2}.
	def removePropertyNamed: #note2.
	self assert: def hasProperties not.
	self assert: (def hasPropertyNamed: #note) not.
	self assert: def propertyNames isEmpty.
	
