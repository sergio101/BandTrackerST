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
	artistName:		<Object>
	id:		<Object>


    Implementation Points
"
Class {
	#name : #TrackedArtist,
	#superclass : #Object,
	#instVars : [
		'id',
		'artistName',
		'jsonData',
		'dateAdded'
	],
	#classVars : [
		'artists'
	],
	#category : #'BandTracker-core'
}

{ #category : #adding }
TrackedArtist class >> addArtist: artist [
	artist dateAdded: DateAndTime today.
	(self artists select: [ :a | a id = artist id ]) ifEmpty: [ self artists add: artist ]
]

{ #category : #accessing }
TrackedArtist class >> artists [
	^ artists ifNil: [ self artists: OrderedCollection new ]
]

{ #category : #accessing }
TrackedArtist class >> artists: anObject [
	artists := anObject
]

{ #category : #'as yet unclassified' }
TrackedArtist class >> withName: artistName id: id [
	^ self new
		artistName: artistName ;
		id: id;
		yourself
]

{ #category : #'as yet unclassified' }
TrackedArtist class >> withName: artistName id: id jsonData: jsonData [
	 ^ self new
		artistName: artistName;
		id: id;
		jsonData: jsonData;
		yourself
]

{ #category : #accessing }
TrackedArtist >> artistName [
	^ artistName
]

{ #category : #accessing }
TrackedArtist >> artistName: anObject [
	artistName := anObject
]

{ #category : #accessing }
TrackedArtist >> dateAdded [
	^ dateAdded
]

{ #category : #accessing }
TrackedArtist >> dateAdded: anObject [
	dateAdded := anObject
]

{ #category : #accessing }
TrackedArtist >> id [
	^ id
]

{ #category : #accessing }
TrackedArtist >> id: anObject [
	id := anObject
]

{ #category : #accessing }
TrackedArtist >> jsonData [
	^ jsonData
]

{ #category : #accessing }
TrackedArtist >> jsonData: anObject [
	jsonData := anObject
]
