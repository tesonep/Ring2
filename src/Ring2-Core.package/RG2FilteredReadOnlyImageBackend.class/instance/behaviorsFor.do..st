environment
behaviorsFor: aRG2Environment do: aBlock

	self allowedClasses do: [:each |
		| def | 
		def := self definitionFor: each ifAbsentRegister: [each asRing2MinimalDefinitionIn: aRG2Environment].
		aBlock value: def.].