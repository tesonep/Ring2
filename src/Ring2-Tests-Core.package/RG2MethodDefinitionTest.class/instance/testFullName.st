tests
testFullName
	
	| method |

	method := RG2MethodDefinition named: #someMethod.
	method parent: (method environment ensureClassNamed: #SomeClass).
	self assert: method fullName equals: 'SomeClass>>#someMethod'.

	method parent metaclass makeResolved.
	method parent: method parent metaclass.
	self assert: method fullName equals: 'SomeClass class>>#someMethod'.	