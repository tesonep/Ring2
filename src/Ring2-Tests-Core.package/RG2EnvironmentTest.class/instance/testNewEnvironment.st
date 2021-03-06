tests
testNewEnvironment
	| newEnvironment |
	
	newEnvironment := RG2Environment named: 'Testing environment'.
	
	self assert: (newEnvironment isRing2Resolved).
	
	self assert: (newEnvironment isEnvironment).
	self assert: (newEnvironment name = 'Testing environment').
	self assert: (newEnvironment ask behaviors isEmpty).
	self assert: (newEnvironment hasResolved: #name).
	self assert: (newEnvironment hasUnresolved: #behaviors).
	self assert: (newEnvironment hasUnresolved: #globalVariables).
	
	newEnvironment cleanPackages.
	newEnvironment cleanBehaviors.
	newEnvironment cleanGlobalVariables.
	
	self assert: (newEnvironment unresolvedProperties isEmpty).
	self assert: (newEnvironment ask packages isEmpty).

		
