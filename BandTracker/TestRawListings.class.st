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


    Implementation Points
"
Class {
	#name : #TestRawListings,
	#superclass : #TestCase,
	#category : #'BandTracker-tests'
}

{ #category : #tests }
TestRawListings >> testAddingListing [
	| listing listingCount |
	listing := RawListing rawData: 'this is a test'.
	listingCount := RawListing dataEntries size.
	RawListing addListingIfNew: listing.
	self assert: RawListing dataEntries size = (listingCount + 1).
	RawListing addListingIfNew: listing.
	self assert: RawListing dataEntries size = (listingCount + 1).
	RawListing dataEntries remove: listing.
]

{ #category : #tests }
TestRawListings >> testCreateWithRawText [
	| string entry |
	string := 'Van Halen (5150)'.
	entry := RemoteEntry withRawData: string.
	self assert: entry bandName equals: 'Van Halen'.
	self assert: entry playCount equals: 5150
]
