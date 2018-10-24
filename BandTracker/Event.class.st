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
	#name : #Event,
	#superclass : #Object,
	#instVars : [
		'venue',
		'date',
		'band'
	],
	#category : #'BandTracker-core'
}

{ #category : #'as yet unclassified' }
Event class >> getBandsWithEvents [
	| api info |
	api := BandsInTownAPI new.
	info := BandEntry uniqueBandNames collect: [ :bandName | api getBandInfo: bandName ].
	^ info select: [ :e | (e at: 'upcoming_event_count' ifAbsentPut: 0) > 0 ].
]

{ #category : #accessing }
Event >> band [
	^ band
]

{ #category : #accessing }
Event >> band: anObject [
	band := anObject
]

{ #category : #accessing }
Event >> date [
	^ date
]

{ #category : #accessing }
Event >> date: anObject [
	date := anObject
]

{ #category : #accessing }
Event >> venue [
	^ venue
]

{ #category : #accessing }
Event >> venue: anObject [
	venue := anObject
]
