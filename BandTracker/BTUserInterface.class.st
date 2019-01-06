"
This class is the user interface to all of the inrterior functionality

"
Class {
	#name : #BTUserInterface,
	#superclass : #Object,
	#instVars : [
		'zipCode'
	],
	#category : #'BandTracker-core'
}

{ #category : #'as yet unclassified' }
BTUserInterface class >> retrieveResultsByZipCode: aZipCode andDistance: distance [
	"get all zipcode and distance"

	| zipGeo nearEvents |
	zipGeo := ZipCodeGeo findByZipCode: aZipCode.
	nearEvents := TrackedEvent events select: [ :e | ((e distanceToGeoPoint: zipGeo geoPoint) < distance) & 
		 (e date > (DateAndTime today - 7 days))].
	(nearEvents asSortedCollection: [ :a :b | a date < b date ])
		do: [ :e | 
			Transcript
				show: e asText;
				cr ]
]

{ #category : #'as yet unclassified' }
BTUserInterface class >> updateAllData [
	"udpate all data on website"

	| startTime endTime |
	
	[ 
	startTime := DateAndTime now.RawListing updateBandEntries.
	RemoteEntry updateTrackedArtists.
	TrackedEvent updateEvents.
	endTime := DateAndTime now.
	Transcript show: 'Time to run: ' , (endTime - startTime) asString. ] fork.
	
	
]

{ #category : #accessing }
BTUserInterface >> zipCode [
	^ zipCode
]

{ #category : #accessing }
BTUserInterface >> zipCode: anObject [
	zipCode := anObject
]
