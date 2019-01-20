Class {
	#name : #BTSearchFormComponent,
	#superclass : #WAComponent,
	#category : #'BandTracker-web'
}

{ #category : #rendering }
BTSearchFormComponent >> renderContentOn: html [
	html tbsForm
		beInline;
		with: [ html
				tbsFormGroup: [ html label
						for: 'selectStation';
						class: 'sr-only';
						with: 'Select Channel'.
					html
						tbsFormGroup: [ html select
								id: 'selectStation';
								class: 'form-control' ].
					html space ] ]
]
