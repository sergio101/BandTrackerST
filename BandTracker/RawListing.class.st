Class {
	#name : #RawListing,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'dateFetched',
		'md5'
	],
	#classVars : [
		'dataEntries'
	],
	#category : #BandTracker
}

{ #category : #'as yet unclassified' }
RawListing class >> dataEntries [
	^ dataEntries ifNil: [ dataEntries := OrderedCollection new ].
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
		md5:  (MD5 new hashMessage: rawData ) hex;
		yourself
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

{ #category : #accessing }
RawListing >> rawData [
	^ rawData
]

{ #category : #accessing }
RawListing >> rawData: anObject [
	rawData := anObject
]
