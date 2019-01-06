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
	band:		<Object>
	date:		<Object>
	venue:		<Object>


    Implementation Points
"
Class {
	#name : #TrackedEvent,
	#superclass : #Object,
	#instVars : [
		'id',
		'venue',
		'date',
		'jsonData'
	],
	#classVars : [
		'events'
	],
	#category : #'BandTracker-core'
}

{ #category : #adding }
TrackedEvent class >> addEvents: event [
	(self findEventById: (event at: 'id'))
		ifNil: [ self events add: (self fromRawData: event) ]
]

{ #category : #accessing }
TrackedEvent class >> events [
	^ events ifNil: [self events: OrderedCollection new]
]

{ #category : #accessing }
TrackedEvent class >> events: anObject [
	events := anObject
]

{ #category : #'as yet unclassified' }
TrackedEvent class >> findEventById: id [
	^ self events detect: [ :e | e id = id ] ifNone: nil.
]

{ #category : #'instance creation' }
TrackedEvent class >> fromRawData: data [
	^ self new
		id: (data at: 'id');
		date: (data at: 'datetime');
		venue: (data at: 'venue');
		jsonData: data;
		yourself
]

{ #category : #'as yet unclassified' }
TrackedEvent class >> processEvents: eventArray [
	eventArray do: [ :e |  self addEvents: e ] 
]

{ #category : #'as yet unclassified' }
TrackedEvent class >> updateEvents [
	| api eventList |
Transcript show: 'Starting update events'; cr .	
	api := BandsInTownAPI new.
	eventList := TrackedArtist artists collect: [ :e | api getBandEvents: e artistName ].
	eventList do: [ :e | self processEvents: e ].
	Transcript show: 'Done update events'; cr .
]

{ #category : #'as yet unclassified' }
TrackedEvent >> artist [
	^ TrackedArtist artists detect: [ :e | e id = (jsonData at: 'artist_id') ]
]

{ #category : #converting }
TrackedEvent >> asText [
	^ date asString , ' - ' , self artist artistName , ' - ' , (self venue at: 'name') , ' - ',
	 (self venue at: 'city') , ', ' , (self venue at: 'region')
]

{ #category : #accessing }
TrackedEvent >> date [
	^ date
]

{ #category : #accessing }
TrackedEvent >> date: anObject [
	date := anObject asDateAndTime
]

{ #category : #'as yet unclassified' }
TrackedEvent >> distanceToGeoPoint: aGeoPoint [

	^ self venueGeoPoint distanceToPoint: aGeoPoint
]

{ #category : #accessing }
TrackedEvent >> id [
	^ id
]

{ #category : #accessing }
TrackedEvent >> id: anObject [
	id := anObject
]

{ #category : #accessing }
TrackedEvent >> jsonData [
	^ jsonData
]

{ #category : #accessing }
TrackedEvent >> jsonData: anObject [
	jsonData := anObject
]

{ #category : #accessing }
TrackedEvent >> venue [
	^ venue
]

{ #category : #accessing }
TrackedEvent >> venue: anObject [
	venue := anObject
]

{ #category : #'as yet unclassified' }
TrackedEvent >> venueGeoPoint [
	(self venue includesKey: 'latitude') ifTrue: [  ^ GeoPoint withLatitude: ((self venue at: 'latitude') asNumber ) andLongitude: ((self venue at: 'longitude') asNumber ) ]
	ifFalse: [ ^ GeoPoint withLatitude: 0 andLongitude: 0 ]
	
]
