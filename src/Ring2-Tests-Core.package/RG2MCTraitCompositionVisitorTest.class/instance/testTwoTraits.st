tests
testTwoTraits

	| composition result |

	composition := RG2TraitCompositionDefinition unnamed.
	result := RG2TraitCompositionVisitor new parse: 'Trait1 + Trait2' for: composition.
	
	self assert: result isCollection.
	self assert: (result allSatisfy: #isTrait).
	self assert: (result allSatisfy: #isRing2Object).
	self assert: (result collect: #name) equals: #(Trait1 Trait2) asOrderedCollection.