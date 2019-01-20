Class {
	#name : #BTSearchFormComponent,
	#superclass : #WAComponent,
	#instVars : [
		'stationList',
		'distanceList'
	],
	#category : #'BandTracker-web'
}

{ #category : #initialization }
BTSearchFormComponent >> initialize [
	| distances |
	super initialize.
	stationList := Station stations collect: [ :e | e stationName ].
	distances := #(25 50 75 100).
	distanceList := distances collect: [ :e | e asString, ' Miles' ]
]

{ #category : #rendering }
BTSearchFormComponent >> renderContentOn: html [
	html tbsForm
		beInline;
		with: [ self renderStationSelect: html.
			self renderZipCodeEntry: html.
			self renderDistanceSelect: html.
			self renderSubmitButtonOn: html. ]
]

{ #category : #rendering }
BTSearchFormComponent >> renderDistanceSelect: html [
	^ html
		tbsFormGroup: [ html label
				for: 'selectDistance';
				class: 'sr-only';
				with: 'Select Channel'.
			html
				tbsFormGroup: [ html select
						list: distanceList;
						id: 'selectDistance';
						class: 'form-control' ].
			html space ]
]

{ #category : #rendering }
BTSearchFormComponent >> renderStationSelect: html [
	^ html
		tbsFormGroup: [ html label
				for: 'selectStation';
				class: 'sr-only';
				with: 'Select Channel'.
			html
				tbsFormGroup: [ html select
						list: stationList ;
						id: 'selectStation';
						class: 'form-control' ].
			html space ]
]

{ #category : #rendering }
BTSearchFormComponent >> renderSubmitButtonOn: html [
	html tbsSubmitButton with: [ html submitButton class: 'btn btn-primary' ]
]

{ #category : #rendering }
BTSearchFormComponent >> renderZipCodeEntry: html [
	^ html
		tbsFormGroup: [ html label
				for: 'enterZipCode';
				class: 'sr-only';
				with: 'Enter Zip Code'.
			html
				tbsFormGroup: [ html textInput
						id: 'enterZipCOde';
						class: 'form-control';
						placeholder: 'Zip Code' ].
			html space ]
]
