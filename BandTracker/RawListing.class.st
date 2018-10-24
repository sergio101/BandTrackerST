"
I represent a listing pulled from the soma fm site

I keep track of the listings pulled.
If they are different, I update all listings

You want to use:

getRawListing: to get the currents listings.
addListingIfNew: to add taht listing if there is no curent match.
"
Class {
	#name : #RawListing,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'dateFetched',
		'md5',
		'processedDate'
	],
	#classVars : [
		'dataEntries'
	],
	#category : #'BandTracker-core'
}

{ #category : #adding }
RawListing class >> addListingIfNew: aRawListing [
	"Adds a listing to the entries if it doesn't exist"
	
	(self dataEntries select: [ :e | e md5 = aRawListing md5 ]) isEmpty
		ifTrue: [ self dataEntries add: aRawListing ]
]

{ #category : #'as yet unclassified' }
RawListing class >> dataEntries [
	^ dataEntries ifNil: [ dataEntries := OrderedCollection new ].
]

{ #category : #accessing }
RawListing class >> dataEntries: anObject [
	dataEntries := anObject
]

{ #category : #'as yet unclassified' }
RawListing class >> getRawListing [
	"retrives the latest listing"
	^ (ZnClient new get: self url) asString.
]

{ #category : #accessing }
RawListing class >> rawData: rawData [
	^ self new
		rawData: rawData;
		md5: (MD5 new hashMessage: rawData) hex;
		dateFetched: DateAndTime now;
		yourself
]

{ #category : #removing }
RawListing class >> removeListing: aRawListing [
	dataEntries remove: aRawListing .
]

{ #category : #'as yet unclassified' }
RawListing class >> resetDataEntries [
	"resets the dataEntries list"
	self dataEntries: nil.
]

{ #category : #'as yet unclassified' }
RawListing class >> updateListings [
	"get listing. add it to the list, if necessary"

	| listing |
	listing := self rawData: (self getRawListing).
	self addListingIfNew: listing
]

{ #category : #accessing }
RawListing class >> url [
	"the url to retrieve listing from"
	^ 'http://somafm.com/bagel/allartists.inc'
]

{ #category : #accessing }
RawListing >> dateFetched [
	^ dateFetched
]

{ #category : #accessing }
RawListing >> dateFetched: anObject [
	dateFetched := anObject
]

{ #category : #accessing }
RawListing >> md5 [
	^ md5
]

{ #category : #accessing }
RawListing >> md5: anObject [
	md5 := anObject
]

{ #category : #parsing }
RawListing >> parseRawData [
	| soup |
	soup := Soup fromString: self rawData.
	^ ((soup findTag: 'ol') findAllChildTags: 'li') collect: [ :e | e text ]
]

{ #category : #accessing }
RawListing >> processedDate [
	^ processedDate
]

{ #category : #accessing }
RawListing >> processedDate: anObject [
	processedDate := anObject
]

{ #category : #accessing }
RawListing >> rawData [
	^ rawData
]

{ #category : #accessing }
RawListing >> rawData: anObject [
	rawData := anObject
]
