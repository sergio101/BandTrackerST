Class {
	#name : #BTPublicComponent,
	#superclass : #BTScreenComponent,
	#instVars : [
		'searchForm'
	],
	#category : #'BandTracker-web'
}

{ #category : #initialization }
BTPublicComponent >> children [
	^ { searchForm }
]

{ #category : #initialization }
BTPublicComponent >> initialize [
	super initialize .
	searchForm := BTSearchFormComponent new
]

{ #category : #rendering }
BTPublicComponent >> renderContentOn: html [
	super renderContentOn: html.
	html
		tbsContainer: [ html tbsRow
				showGrid;
				with: [ html render: searchForm ] ]
]
