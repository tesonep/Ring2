tests
testNewMetaclassTrait

	| trait baseTrait | 
	trait  := RG2MetaclassTraitDefinition unnamed.
	self assert: (trait isRing2Resolved).
	self assert: (trait hasUnresolved: #baseTrait).
	self assert: (trait isTrait).
	
	baseTrait  := RG2TraitDefinition parent: trait environment.
	trait baseTrait: baseTrait.
	self assert: (trait hasResolved: #baseTrait).
	self assert: (trait baseTrait == baseTrait).
