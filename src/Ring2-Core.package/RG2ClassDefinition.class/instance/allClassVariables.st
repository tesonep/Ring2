queries - variables
allClassVariables
	"Answer a collection of the receiver's classVariables, including those defined its superclasses"

	^ ((self superclass == nil) or: [ self superclass == self ]) 
		ifTrue: [ self classVariables ]
		ifFalse: [ self superclass allClassVariables, classVariables ]