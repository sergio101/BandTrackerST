Class {
	#name : #BTScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'BandTracker-web'
}

{ #category : #'as yet unclassified' }
BTScreenComponent >> children [ 
^ { header }
]

{ #category : #'as yet unclassified' }
BTScreenComponent >> createHeaderComponent [
	^ BTHeaderComponent new.
]

{ #category : #initialization }
BTScreenComponent >> initialize [
	super initialize.
	header := self createHeaderComponent.
]

{ #category : #rendering }
BTScreenComponent >> renderContentOn: html [
	html render: header.
]
