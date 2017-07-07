tests
testBehavior
	| newBehavior method |
	newBehavior := self behaviorClass named: #SomeClass.
	self deny: (newBehavior includesSelector: #method).
	method := RG2MethodDefinition named: #method parent: newBehavior.
	newBehavior addLocalMethod: method.
	self assert: newBehavior isBehavior.	
	self deny: method isBehavior.
	self assert: (newBehavior includesSelector: #method).
	self assert: (newBehavior allInstVarNames isEmpty).
	self assert: (newBehavior allSlots isEmpty).
	self assert: (newBehavior bindingOf: #someVariable) isNil.
	self assert: (newBehavior classVariablesBindings isEmpty).
	
	self deny: (newBehavior isRing2FullyUnresolved).

	self assert: newBehavior hasTraitComposition.	
	