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
	bandName:		<Object>
	dateAdded:		<Object>
	playCount:		<Object>


    Implementation Points
"
Class {
	#name : #BandEntry,
	#superclass : #Object,
	#instVars : [
		'bandName',
		'playCount',
		'dateAdded'
	],
	#classVars : [
		'bandEntries'
	],
	#category : #'BandTracker-core'
}

{ #category : #accessing }
BandEntry class >> bandEntries [
	^ bandEntries ifNil: [ self bandEntries: OrderedCollection new ]
]

{ #category : #accessing }
BandEntry class >> bandEntries: anObject [
	bandEntries := anObject
]

{ #category : #'as yet unclassified' }
BandEntry class >> uniqueBandNames [
	^ (bandEntries collect: [ :e | e bandName ]) asSet
]

{ #category : #'as yet unclassified' }
BandEntry class >> withRawData: rawText [
	"createas a new entry with by deconstructing raw data"

	"in the form of: 'band name (13)' where 13 is the play count"

	| re |
	re := '(.+)\(([0-9]*)\)' asRegexIgnoringCase.
	(re matchesPrefix: rawText)
		ifTrue: [ ^ self new
				bandName: ((re subexpression: 2) trimBoth);
				playCount: ((re subexpression: 3) asNumber);
				dateAdded: DateAndTime now;
				yourself ]
]

{ #category : #accessing }
BandEntry >> bandName [
	^ bandName
]

{ #category : #accessing }
BandEntry >> bandName: anObject [
	bandName := anObject
]

{ #category : #accessing }
BandEntry >> dateAdded [
	^ dateAdded
]

{ #category : #accessing }
BandEntry >> dateAdded: anObject [
	dateAdded := anObject
]

{ #category : #accessing }
BandEntry >> playCount [
	^ playCount
]

{ #category : #accessing }
BandEntry >> playCount: anObject [
	playCount := anObject
]
