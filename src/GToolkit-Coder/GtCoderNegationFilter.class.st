Class {
	#name : #GtCoderNegationFilter,
	#superclass : #GtCoderMethodsFilter,
	#instVars : [
		'originalFilter'
	],
	#category : #'GToolkit-Coder-Filters'
}

{ #category : #testing }
GtCoderNegationFilter >> includeMethod: aCompiledMethod [
	^ (self originalFilter includeMethod: aCompiledMethod) not
]

{ #category : #accessing }
GtCoderNegationFilter >> originalFilter [
	^ originalFilter
]

{ #category : #accessing }
GtCoderNegationFilter >> originalFilter: anObject [
	originalFilter := anObject
]