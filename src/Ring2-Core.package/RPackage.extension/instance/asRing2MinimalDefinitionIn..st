*Ring2-Core
asRing2MinimalDefinitionIn: aRG2Environment

	^ aRG2Environment backend definitionFor: self ifAbsentRegister: [
		RG2PackageDefinition named: self name asSymbol parent: aRG2Environment ]