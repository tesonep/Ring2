tests
testStandardMethodInExistingClass

	| importer class method code | 
	
	importer := Ring2ChunkImporter new.
	class := importer environment ensureClassNamed: #SomeClass.
	
	code := '!SomeClass methodsFor: ''some protocol'' stamp: ''GuillermoPolito 5/2/2012 13:35''!someMethod
	^true'.
	
	importer fileInFrom: code readStream.

	method := class methodNamed: #someMethod.
	
	self assert: class isClass.
	self assert: method notNil.
	self assert: method isRing2Resolved.
	self assert: (method hasResolvedAll: #(name protocol sourceCode author time)).
	
	self assert: method name equals: #someMethod.
	self assert: method protocol equals: 'some protocol'.
	self assert: method author equals: 'GuillermoPolito'.
	self assert: method time equals: ('5/2/2012 13:35' asDateAndTime).
	self assert: method sourceCode equals: 'someMethod
	^true'.