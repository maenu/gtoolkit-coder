Class {
	#name : #GtExampleGroupCoder,
	#superclass : #GtMethodsCoder,
	#instVars : [
		'session',
		'lists'
	],
	#category : #'GToolkit-Coder'
}

{ #category : #'instance creation' }
GtExampleGroupCoder class >> forExampleGroup: anExampleGroup [

	^ self new forExampleGroup: anExampleGroup

]

{ #category : #'instance creation' }
GtExampleGroupCoder >> forExampleGroup: anExampleGroup [
	methodCoders := anExampleGroup collect: [ :each | GtMethodExampleCoder forMethod: each ].
	methodCoders do: [ :each | each object: object ]
]