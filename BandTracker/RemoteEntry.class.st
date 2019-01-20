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
	#name : #RemoteEntry,
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
RemoteEntry class >> bandEntries [
	^ bandEntries ifNil: [ self bandEntries: OrderedCollection new ]
]

{ #category : #accessing }
RemoteEntry class >> bandEntries: anObject [
	bandEntries := anObject
]

{ #category : #'as yet unclassified' }
RemoteEntry class >> bandsNotTracked [
	^ self uniqueBandNames asArray
		copyWithoutAll: ((TrackedArtist artists collect: [ :e | e artistName asLowercase  ]) asArray)
]

{ #category : #'as yet unclassified' }
RemoteEntry class >> uniqueBandNames [
	^ (bandEntries collect: [ :e | e bandName asLowercase  ]) asSet
]

{ #category : #'as yet unclassified' }
RemoteEntry class >> updateTrackedArtists [
	| api entries |
	Transcript
		show: 'Starting update artist';
		cr.
	api := BandsInTownAPI new.
	entries := self bandsNotTracked collect: [ :e | api getBandInfo: e ].
	entries
		do: [ :e | 
			(e class = 'Dictionary' and: [e includesKey: 'name'])
				ifTrue: [ TrackedArtist
						addArtist: (TrackedArtist withName: (e at: 'name') id: (e at: 'id') jsonData: e) ] ].
	Transcript
		show: 'Done update artist';
		cr
]

{ #category : #'as yet unclassified' }
RemoteEntry class >> withRawData: rawText [
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
RemoteEntry >> bandName [
	^ bandName
]

{ #category : #accessing }
RemoteEntry >> bandName: anObject [
	bandName := anObject
]

{ #category : #accessing }
RemoteEntry >> dateAdded [
	^ dateAdded
]

{ #category : #accessing }
RemoteEntry >> dateAdded: anObject [
	dateAdded := anObject
]

{ #category : #accessing }
RemoteEntry >> playCount [
	^ playCount
]

{ #category : #accessing }
RemoteEntry >> playCount: anObject [
	playCount := anObject
]
