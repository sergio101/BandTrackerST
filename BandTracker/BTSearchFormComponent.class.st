Class {
	#name : #BTSearchFormComponent,
	#superclass : #WAComponent,
	#instVars : [
		'stationList',
		'distanceList',
		'searchData'
	],
	#category : #'BandTracker-web'
}

{ #category : #'as yet unclassified' }
BTSearchFormComponent >> getResults [
	self session searchData: searchData.
	self session inspect
]

{ #category : #initialization }
BTSearchFormComponent >> initialize [
	| distances |
	super initialize.
	searchData := Dictionary new.
	stationList := Station stations collect: [ :e | e stationName ].
	distances := #(25 50 75 100).
	distanceList := distances collect: [ :e | e asString , ' Miles' ].
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
						class: 'form-control';
						callback: [ :value | searchData at: 'distance' put: value ] ].
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
						list: stationList;
						id: 'selectStation';
						class: 'form-control';
callback: [ :value | searchData at: 'station' put: value ] ].
			html space ]
]

{ #category : #rendering }
BTSearchFormComponent >> renderSubmitButtonOn: html [
	html tbsSubmitButton with: [ html submitButton class: 'btn btn-primary';
		callback: [ self getResults ] ]
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
						placeholder: 'Zip Code';
						callback: [ :value | searchData at: 'zipcode' put: value ] ].
			html space ]
]

{ #category : #accessing }
BTSearchFormComponent >> searchData [
	^ searchData
]

{ #category : #accessing }
BTSearchFormComponent >> searchData: anObject [
	searchData := anObject
]
