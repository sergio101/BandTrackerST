Class {
	#name : #BTApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'BandTracker-web'
}

{ #category : #testing }
BTApplicationRootComponent class >> canBeRoot [
^  true
]

{ #category : #initialization }
BTApplicationRootComponent class >> initialize [
	"self initialize"

	| app |
	app := WAAdmin register: self asApplicationAt: 'BandTracker'.
	app preferenceAt: #sessionClass put: BTSession.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary
]

{ #category : #hooks }
BTApplicationRootComponent >> children [
^ { main }
]

{ #category : #initialization }
BTApplicationRootComponent >> initialize [
	super initialize.
	main := BTPublicComponent  new
]

{ #category : #accessing }
BTApplicationRootComponent >> main: anObject [
	main := anObject
]

{ #category : #rendering }
BTApplicationRootComponent >> renderContentOn: html [
	html render: main.
]

{ #category : #rendering }
BTApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot .
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Band Tracker'
]
