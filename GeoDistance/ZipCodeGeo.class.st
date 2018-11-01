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

    Instance Variables
	geoPoint:		<Object>
	zipcode:		<Object>


    Implementation Points
"
Class {
	#name : #ZipCodeGeo,
	#superclass : #Object,
	#instVars : [
		'zipCode',
		'geoPoint'
	],
	#classVars : [
		'apiUrl',
		'zipCodes'
	],
	#category : #GeoDistance
}

{ #category : #adding }
ZipCodeGeo class >> addNewZip: aZipCode [
	| geo newZipCodeGeo |
	geo := self getZipCoords: aZipCode.
	newZipCodeGeo := ZipCodeGeo withZipCode: aZipCode geoPoint: geo.
	ZipCodeGeo zipCodes add: newZipCodeGeo.
	^ newZipCodeGeo 
]

{ #category : #accessing }
ZipCodeGeo class >> apiUrl [
	^ apiUrl
]

{ #category : #accessing }
ZipCodeGeo class >> apiUrl: anObject [
	apiUrl := anObject
]

{ #category : #'as yet unclassified' }
ZipCodeGeo class >> findByZipCode: aZipCode [
	^ (self zipCodes) detect: [ :e | e zipCode = aZipCode ] ifNone: [ self addNewZip: aZipCode  ]
]

{ #category : #'as yet unclassified' }
ZipCodeGeo class >> getZipCoords: zipCode [
	| path response re coords |
	path := self apiUrl , '?n=' , zipCode.
	response := ZnClient new get: path.
	re := '.+{(.*)}.+' asRegexIgnoringCase.
	re matchesPrefix: response.
	coords := (re subexpression: 2) splitOn: ','.
	^ GeoPoint withLatitude: ((coords at: 1) trimBoth asNumber) andLongitude: ((coords at: 2) trimBoth) asNumber
]

{ #category : #'as yet unclassified' }
ZipCodeGeo class >> withZipCode: aZipCode geoPoint: aGeoPoint [
	^ self new zipCode: aZipCode; geoPoint: aGeoPoint 
	
]

{ #category : #accessing }
ZipCodeGeo class >> zipCodes [
	^ zipCodes ifNil: [ self zipCodes: OrderedCollection new ]
]

{ #category : #accessing }
ZipCodeGeo class >> zipCodes: anObject [
	zipCodes := anObject
]

{ #category : #accessing }
ZipCodeGeo >> geoPoint [
	^ geoPoint
]

{ #category : #accessing }
ZipCodeGeo >> geoPoint: anObject [
	geoPoint := anObject
]

{ #category : #accessing }
ZipCodeGeo >> zipCode [
	^ zipCode
]

{ #category : #accessing }
ZipCodeGeo >> zipCode: anObject [
	zipCode := anObject
]
