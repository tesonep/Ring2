tests
testClassesWithTraits
	
	"classes without special slots"
	
	Smalltalk allClasses
		select: [ :each | each traits notEmpty or: [ each class traits notEmpty ] ] 
		thenDo: [ :each | self testClass: each ]
	