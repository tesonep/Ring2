tests
testEnsureTraitNamed

	| env definition existing | 
	
	env := RG2Environment new.
	definition := env ensureTraitNamed: 'SomeTrait'.
	self assert: definition isClass not. 
	self assert: definition isMetaclass not. 	
	self assert: definition isTrait. 	
	self assert: definition isMetaclassTrait not. 	

	env := RG2Environment new.
	definition := env ensureTraitNamed: 'SomeTrait classTrait'.
	self assert: definition isClass not. 
	self assert: definition isMetaclass not. 	
	self assert: definition isTrait. 	
	self assert: definition isMetaclassTrait. 	

	env := RG2Environment new.
	existing := (env ensureTraitNamed: 'SomeTrait classTrait') baseTrait.
	self assert: (existing isTrait).
	self assert: (existing isRing2Resolved not).
	definition := env ensureTraitNamed: 'SomeTrait'.
	self assert: (definition == existing).
	self assert: definition isClass not. 
	self assert: definition isMetaclass not. 	
	self assert: definition isTrait. 	
	self assert: definition isMetaclassTrait not. 	

	env := RG2Environment new.
	existing := (env ensureClassNamed: 'SomeTrait').
	self assert: (existing isClass).
	self assert: (existing isRing2Resolved).
	definition := env ensureTraitNamed: 'SomeTrait'.
	self assert: (definition == existing).
	self assert: definition isClass not. 
	self assert: definition isMetaclass not. 	
	self assert: definition isTrait. 	
	self assert: definition isMetaclassTrait not. 	

	env := RG2Environment new.
	existing := (env ensureTraitNamed: 'SomeTrait') classTrait.
	self assert: (existing isMetaclassTrait).
	self assert: (existing isRing2Resolved not).
	definition := env ensureTraitNamed: 'SomeTrait classTrait'.
	self assert: (definition == existing).
	self assert: definition isClass not. 
	self assert: definition isMetaclass not. 	
	self assert: definition isTrait. 	
	self assert: definition isMetaclassTrait. 	
	self assert: definition baseTrait name equals: #SomeTrait.

	env := RG2Environment new.
	existing := (env ensureClassNamed: 'SomeTrait') metaclass.
	self assert: (existing isMetaclass).
	self assert: (existing isRing2Resolved not).
	definition := env ensureTraitNamed: 'SomeTrait classTrait'.
	self assert: (definition == existing).
	self assert: definition isClass not. 
	self assert: definition isMetaclass not. 	
	self assert: definition isTrait. 	
	self assert: definition isMetaclassTrait. 	
	self assert: definition baseTrait name equals: #SomeTrait.

	env := RG2Environment new.
	existing := (env ensureClassNamed: 'SomeTrait class') baseClass .
	self assert: (existing isClass).
	self assert: (existing isRing2Resolved not).
	definition := env ensureTraitNamed: 'SomeTrait classTrait'.
	self assert: (definition baseTrait == existing).
	self assert: definition baseTrait isClass not. 
	self assert: definition baseTrait isMetaclass not. 	
	self assert: definition baseTrait isTrait. 	
	self assert: definition baseTrait isMetaclassTrait not. 	
	self assert: definition baseTrait name equals: #SomeTrait.
