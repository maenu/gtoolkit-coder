Class {
	#name : #GtClassCoder,
	#superclass : #Announcer,
	#instVars : [
		'classDefinitionCoder',
		'methodsCoder'
	],
	#category : #'GToolkit-Coder'
}

{ #category : #'instance creation' }
GtClassCoder class >> forClass: aBehavior [
	^ self new
		forClass: aBehavior;
		yourself
]

{ #category : #'instance creation' }
GtClassCoder class >> forObject: anObject [
	^ self new
		forObject: anObject;
		yourself
]

{ #category : #elements }
GtClassCoder >> asElement [
	| element |
	element := BlElement new.
	element layout: BlLinearLayout vertical.
	element padding: (BlInsets all: 10).
	element
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	element addChild: classDefinitionCoder asElement.
	element addChild: methodsCoder asElement.
	^ element
]

{ #category : #'initialize-release' }
GtClassCoder >> forClass: aBehavior [
	classDefinitionCoder := GtClassDefinitionCoder forClass: aBehavior.
	methodsCoder := GtClassMethodsCoder forClass: aBehavior
]

{ #category : #'initialize-release' }
GtClassCoder >> forObject: anObject [
	classDefinitionCoder := GtClassDefinitionCoder forObject: anObject.
	methodsCoder := GtClassMethodsCoder forObject: anObject
]

{ #category : #ui }
GtClassCoder >> gtLiveFor: aView [
	<gtView>
	^ aView explicit 
		title: 'Live';
		priority: 10;
		stencil: [ self ]
]
