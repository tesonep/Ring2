*Ring2-Bootstrap
bootstrap

	| fetcher |
	
	fetcher := PBRing2GitFetcher new.
	fetcher commitHash: 'UNKNOWN'.
	fetcher buildNumber: '1'.
	
	self bootstrapWith: fetcher architecture: '32' to: 'bootstrap.image' asFileReference.