tests
testUsedTraits

	| traitExclusion trait usedTraits | 
	
	traitExclusion := RG2TraitExclusionDefinition unnamed.
	trait := traitExclusion environment ensureTraitNamed: #SomeTrait.
	traitExclusion subject: trait.
	usedTraits := traitExclusion usedTraits.
	
	self assert: usedTraits size equals: 1.
	self assert: usedTraits anyOne equals: trait.