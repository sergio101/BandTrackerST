Class {
	#name : #BTHeaderComponent,
	#superclass : #WAComponent,
	#category : #'BandTracker-web'
}

{ #category : #rendering }
BTHeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [ html tbsNavbarBrand url: self application url;  with: 'Band Tracker' ]
]

{ #category : #rendering }
BTHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault ; with: [ 
		html tbsContainer: 
		[ self renderBrandOn: html
		 ] ]
]
