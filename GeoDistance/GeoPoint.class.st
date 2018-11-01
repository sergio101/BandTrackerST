"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	latitiude:		<Object>
	longitiude:		<Object>


    Implementation Points
"
Class {
	#name : #GeoPoint,
	#superclass : #Object,
	#instVars : [
		'latitude',
		'longitude'
	],
	#category : #GeoDistance
}

{ #category : #'as yet unclassified' }
GeoPoint class >> withLatitude: latitude andLongitude: longitude [
	^ self new latitude: latitude;
	longitude: longitude;
	yourself.
]

{ #category : #calculating }
GeoPoint >> distanceToPoint: aGeoPoint [
	| lat1Rad lon1Rad lat2Rad lon2Rad earthRadius dLat dLon dLatSinSqrd dLonSinSqrd cosLatLat a c distance |
	lat1Rad := self latitude  * Float pi / 180.
lon1Rad := self longitude  * Float pi / 180.
lat2Rad := aGeoPoint latitude   * Float pi / 180.
lon2Rad := aGeoPoint longitude  * Float pi / 180.
earthRadius := 3959.00.
			
"Haversines"	
dLat := lat2Rad - lat1Rad.
dLon := lon2Rad - lon1Rad.
dLatSinSqrd := (dLat / 2) sin squared.
dLonSinSqrd := (dLon / 2) sin squared.
cosLatLat := lat2Rad cos * lat1Rad cos.
a := dLatSinSqrd + (cosLatLat * dLonSinSqrd).
c := 2 * a sqrt arcSin.
distance := earthRadius * c.

^distance
]

{ #category : #accessing }
GeoPoint >> latitude [
	^ latitude
]

{ #category : #accessing }
GeoPoint >> latitude: anObject [
	latitude := anObject
]

{ #category : #accessing }
GeoPoint >> longitude [
	^ longitude
]

{ #category : #accessing }
GeoPoint >> longitude: anObject [
	longitude := anObject
]
