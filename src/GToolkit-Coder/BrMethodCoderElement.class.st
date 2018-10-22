Class {
	#name : #BrMethodCoderElement,
	#superclass : #BlElement,
	#instVars : [
		'coder',
		'accordion'
	],
	#category : #'GToolkit-Coder-UI'
}

{ #category : #accessing }
BrMethodCoderElement >> coder [
	^ coder
]

{ #category : #initialization }
BrMethodCoderElement >> initialize [
	super initialize.
	
	"self look: BrGlamorousAccordionLook new.
	self margin: (BlInsets all: 5).
	self stencil: [ self bodyElement ]."
	
	"header := self patternButtonElement.
	header
		action: [
			self toggle.
			self expanded: self isExpanded ].
	self addChildFirst: header.
	expanded
		ifTrue: [ self toggle ].
	self userData at: #coder put: self."
]

{ #category : #initialization }
BrMethodCoderElement >> initializeWith: aGtMethodCoder [

	coder := aGtMethodCoder.
	
	accordion := BrAccordion new.
	accordion look: BrGlamorousAccordionLook new.
	accordion margin: (BlInsets all: 5).
	accordion stencil: [ GtMethodBodyElement new initializeWith: coder ].

	"super initialize.
	
	self look: BrGlamorousAccordionLook new.
	self margin: (BlInsets all: 5).
	self stencil: [ self bodyElement ]."
	
	"header := self patternButtonElement.
	header
		action: [
			self toggle.
			self expanded: self isExpanded ].
	self addChildFirst: header.
	expanded
		ifTrue: [ self toggle ].
	self userData at: #coder put: self."
]