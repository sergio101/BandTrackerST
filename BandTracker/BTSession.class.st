Class {
	#name : #BTSession,
	#superclass : #WASession,
	#instVars : [
		'searchData'
	],
	#category : #'BandTracker-web'
}

{ #category : #accessing }
BTSession >> searchData [
	^ searchData
]

{ #category : #accessing }
BTSession >> searchData: anObject [
	searchData := anObject
]
