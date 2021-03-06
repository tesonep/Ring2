tests
compareTraitComposition: aTraitComposition with: aRG2TraitCompositionDefinition
	
	self assert: aTraitComposition transformations size equals: aRG2TraitCompositionDefinition transformations size.
	
	aTraitComposition transformations with: aRG2TraitCompositionDefinition transformations do: [ :real :model |
		self assert: real isTrait equals: model isTrait.
		self assert: (real isKindOf: TraitAlias) equals: model isTraitAlias.
		self assert: (real isKindOf: TraitExclusion) equals: model isTraitExclusion.
		(real isKindOf: TraitExclusion) ifTrue: [ 
			self assert: real subject name equals: model subject name.
			real exclusions with: model exclusions do: [:realExclusion :modelExclusion |
				self assert: realExclusion equals: modelExclusion	]].
		(real isKindOf: TraitAlias) ifTrue: [ 
			self assert: real subject name equals: model subject name.
			real aliases with: model aliases do: [:realAlias :modelAlias |
				self assert: realAlias equals: modelAlias ]].
	  ].
	