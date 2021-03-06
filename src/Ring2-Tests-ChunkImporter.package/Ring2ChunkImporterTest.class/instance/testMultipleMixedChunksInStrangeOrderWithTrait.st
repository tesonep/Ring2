tests
testMultipleMixedChunksInStrangeOrderWithTrait

	| importer trait method | 
	
	importer := Ring2ChunkImporter new.
	
	importer fileInFrom: '!TBehavior methodsFor: ''some protocol'' stamp: ''GuillermoPolito 5/2/2012 13:35''!
someMethod
	^true! !
Trait named: #TBehavior
	uses: {}
	category: ''Traits-Kernel-Traits''!' readStream.

	trait := importer environment ask behaviorNamed: #TBehavior.
	self assert: trait notNil.
	self assert: (trait isTrait and: [ trait isMetaclassTrait not ]).
	method := trait methodNamed: #someMethod.
	self assert: method notNil.
	self assert: (method sourceCode endsWith: '^true')

	