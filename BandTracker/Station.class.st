Class {
	#name : #Station,
	#superclass : #Object,
	#instVars : [
		'stationName',
		'url'
	],
	#classVars : [
		'stations'
	],
	#category : #'BandTracker-core'
}

{ #category : #'as yet unclassified' }
Station class >> stations [
	^ stations ifNil: [ self stations: OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
Station class >> stations: anObject [
	stations := anObject 
]

{ #category : #accessing }
Station >> stationName [
	^ stationName
]

{ #category : #accessing }
Station >> stationName: anObject [
	stationName := anObject
]

{ #category : #accessing }
Station >> url [
	^ url
]

{ #category : #accessing }
Station >> url: anObject [
	url := anObject
]
