accessing
parent
	"The parent of a class definition element: method, comment and variable is the class definition. This method retrieves the class that defines such element"
	
	parent ifNil: [ 
		self parent: self defaultParentStub.
		self addoptToParentStub ].
	
	^ parent.