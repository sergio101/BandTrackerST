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
		'band',
		'jsonData'
	],
	#classVars : [
		'events'
	],
	#category : #'BandTracker-core'
}

{ #category : #accessing }
TrackedEvent class >> events [
	^ events ifNil: (self events: OrderedCollection new).
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
TrackedEvent class >> fromRawData: data andName: bandName [
	^ self new
		id: (data at: 'id');
		band: bandName;
		date: (data at: 'datetime');
		venue: (data at: 'venue');
		jsonData: (data);
		yourself
]

{ #category : #'as yet unclassified' }
TrackedEvent class >> updateEvents [
	| api eventList |
	api := BandsInTownAPI new.
	eventList := TrackedArtist artists collect: [ :e | api getBandEvents: e artistName ].
	^ eventList 
]

{ #category : #accessing }
TrackedEvent >> band [
	^ band
]

{ #category : #accessing }
TrackedEvent >> band: anObject [
	band := anObject
]

{ #category : #accessing }
TrackedEvent >> date [
	^ date
]

{ #category : #accessing }
TrackedEvent >> date: anObject [
	date := anObject
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
