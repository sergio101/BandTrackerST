"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #BandsInTownAPI,
	#superclass : #Object,
	#classVars : [
		'apiKey'
	],
	#category : #BandsInTownAPI
}

{ #category : #accessing }
BandsInTownAPI class >> apiKey [
	^ apiKey
]

{ #category : #accessing }
BandsInTownAPI class >> apiKey: anObject [
	apiKey := anObject
]

{ #category : #accessing }
BandsInTownAPI class >> url [
	^ 'https://rest.bandsintown.com/'

]

{ #category : #'as yet unclassified' }
BandsInTownAPI >> getBandEvents: bandName [
	| result url |
	url := ZnUrl new
		scheme: #http;
		host: 'rest.bandsintown.com';
		queryAt: 'app_id' put: BandsInTownAPI apiKey;
		addPathSegment: 'artists';
		addPathSegment: bandName;
		addPathSegment: 'events';
		yourself.
	result := ZnClient new get: url.
	(result includesSubstring: 'error')
		ifTrue: [ ^ NeoJSONReader fromString: '[]' ]
		ifFalse: [ ^ NeoJSONReader fromString: result].
]

{ #category : #'as yet unclassified' }
BandsInTownAPI >> getBandInfo: bandName [
	| path result |
	path := BandsInTownAPI url , '/artists/' , bandName , '?app_id=' , BandsInTownAPI apiKey.
	Transcript
		show: 'About to call for: ' , bandName;
		cr.
	result := NeoJSONReader fromString: (ZnClient new get: path).
	^ result
]
