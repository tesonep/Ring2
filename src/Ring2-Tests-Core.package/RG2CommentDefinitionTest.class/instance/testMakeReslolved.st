tests
testMakeReslolved

	| comment |

	comment := RG2CommentDefinition unnamed.
	comment makeResolved.
	self assert: comment unresolvedProperties isEmpty.
	self assert: comment content equals: ''.
	self assert: comment author equals: ''.
	self assert: (comment time isKindOf: DateAndTime).
	