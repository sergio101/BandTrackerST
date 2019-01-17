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
	super initialize .
	main := BTScreenComponent new.
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
