Class {
	#name : #GtCoderUnionFilter,
	#superclass : #GtCoderBinaryFilter,
	#category : #'GToolkit-Coder-Filters'
}

{ #category : #testing }
GtCoderUnionFilter >> includeMethod: aCompiledMethod [
	^ (left includeMethod: aCompiledMethod) or: [ right includeMethod: aCompiledMethod ]
]
