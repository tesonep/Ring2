as yet unclassified
ensureTraitNamed: aSymbol

	| found newTrait newMetaclassTrait siblingName sibling originalMetaclass |
	
	self assert: (aSymbol endsWith: ' class') not.

	"process classTraits"
	(aSymbol endsWith: ' classTrait') ifTrue: [ 
		^ self ensureMetaclassTraitNamed: aSymbol ].
	
	"a trait with the same name already exists"
	found := self ask behaviorNamedExactlyAs: aSymbol.
	(found notNil and: [ found isTrait ]) ifTrue: [ ^ found ].
	
	^ found 
		ifNil: [ 
			"trait not found, check if the environment contains already a correspoinding metaclass trait"
			siblingName := (aSymbol, ' classTrait') asSymbol.
			sibling := self ask behaviorNamedExactlyAs: siblingName.
			sibling 
				ifNotNil: [ 
					"resolve and return existing corresponding trait"
					| existing |
					existing := sibling baseTrait.
					existing name: aSymbol.
					existing propertyNamed: #resolved put: true.
					existing ]
				ifNil: [ 
					"we need to create new behavior"
					| newBehavior |
					newBehavior := RG2TraitDefinition named: aSymbol parent: self.
					self addBehavior: newBehavior.
					newBehavior ] ]
		ifNotNil: [
			"some non-trait behavior found. We created this trait before as a class because correct behavior type was not known."
			newTrait := found pvtAsTrait.
			originalMetaclass := found metaclass.
			newMetaclassTrait := originalMetaclass pvtAsMetaclassTrait.
			self ask replaceName: originalMetaclass name with: newMetaclassTrait name.
			found becomeForward: newTrait.
			found classTrait becomeForward: newMetaclassTrait.
			originalMetaclass becomeForward: newMetaclassTrait.
			found ].
	
	