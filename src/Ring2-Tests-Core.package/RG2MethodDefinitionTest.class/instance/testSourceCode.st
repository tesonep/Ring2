tests
testSourceCode
	
	| method source |

	method := RG2MethodDefinition named: #someMethod.
	self assert: method hasSourceCode.
	source := 'someMethod ^ self'.
	method sourceCode: source.
	self assert: method hasSourceCode.
	self assert: method sourceCode equals: source.
	self assert: method selector equals: #someMethod.
	self assert: method numArgs equals: 0.
	
	method := RG2MethodDefinition named: #+.
	self assert: method numArgs equals: 1.
	method := RG2MethodDefinition named: #someMethod:.
	self assert: method numArgs equals: 1.
	method := RG2MethodDefinition named: #someMethod:arg:.
	self assert: method numArgs equals: 2.

	
	