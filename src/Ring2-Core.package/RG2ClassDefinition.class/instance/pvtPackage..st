private - backend access
pvtPackage: aRG2PackageDefinition

	self environment verifyOwnership: aRG2PackageDefinition.

	^ package := aRG2PackageDefinition