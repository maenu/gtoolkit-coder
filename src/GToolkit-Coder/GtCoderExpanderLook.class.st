Class {
	#name : #GtCoderExpanderLook,
	#superclass : #BrExpanderLook,
	#instVars : [
		'sidebar',
		'toggle',
		'container',
		'borderWidth'
	],
	#category : #'GToolkit-Coder-Looks'
}

{ #category : #accessing }
GtCoderExpanderLook >> borderWidth [
	^ borderWidth
]

{ #category : #accessing }
GtCoderExpanderLook >> borderWidth: anInteger [
	borderWidth := anInteger
]

{ #category : #initialization }
GtCoderExpanderLook >> initialize [
	| shadowLook focusedShadowLook expanded aTriangle |
	super initialize.
	borderWidth := 1.
	aTriangle := BlElement new
		size: 8 @ 8;
		background: (Color white alpha: 0.9);
		constraintsDo: [ :c | c linear vertical alignCenter ].
	toggle := BlElement new
		layout: BlLinearLayout horizontal;
		padding: (BlInsets all: 4);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		background: Color veryVeryLightGray;
		addChild: aTriangle;
		when: BlClickEvent do: [ self dispatchEvent: BrExpansionToggleWish new ].
	sidebar := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical matchParent ];
		background: Color veryVeryLightGray;
		addChild: toggle.
	container := BlElement new
		padding: (BlInsets all: 10);
		layout: BlLinearLayout vertical.
	shadowLook := BrShadowLook new.
	focusedShadowLook := BrShadowLook new color: (BrGlamorousColors primaryBorderColor alpha: 0.4).
	expanded := false.
	self
		add:
			(BrInteractiveLook new
				style: [ :aStyler | 
					aStyler default: [ sidebar background: Color veryVeryLightGray ].
					aStyler
						collapsed: [ :aWidget | 
							aTriangle
								geometry:
									(BlPolygon
										vertices:
											{(0 @ 0).
											(8 @ 4).
											(0 @ 8)}).
							aWidget background: Color transparent.
							aWidget border: (BlBorder paint: Color veryVeryLightGray width: self borderWidth).
							shadowLook isAttachedToWidget
								ifTrue: [ self remove: shadowLook ].
							focusedShadowLook isAttachedToWidget
								ifTrue: [ self remove: focusedShadowLook ].
							expanded := false ].
					aStyler
						expanded: [ :aWidget | 
							aTriangle
								geometry:
									(BlPolygon
										vertices:
											{(0 @ 0).
											(8 @ 0).
											(4 @ 8)}).
							aWidget background: Color white.
							aWidget border: BlBorder empty.
							shadowLook isAttachedToWidget
								ifTrue: [ self remove: shadowLook ].
							focusedShadowLook isAttachedToWidget
								ifTrue: [ self remove: focusedShadowLook ].
							widget hasFocus
								ifTrue: [ self add: focusedShadowLook ]
								ifFalse: [ self add: shadowLook ].
							expanded := true ].
					aStyler
						unfocused: [ sidebar background: Color veryVeryLightGray.
							shadowLook isAttachedToWidget
								ifTrue: [ self remove: shadowLook ].
							focusedShadowLook isAttachedToWidget
								ifTrue: [ self remove: focusedShadowLook ].
							expanded
								ifTrue: [ self add: shadowLook ] ].
					aStyler
						focused: [ sidebar background: (BrGlamorousColors primaryBorderColor alpha: 0.4).
							shadowLook isAttachedToWidget
								ifTrue: [ self remove: shadowLook ].
							focusedShadowLook isAttachedToWidget
								ifTrue: [ self remove: focusedShadowLook ].
							expanded
								ifTrue: [ self add: focusedShadowLook ] ] ]).
	toggle
		background: Color transparent;
		constraintsDo: [ :c | c vertical matchParent ].
	toggle children first constraintsDo: [ :c | c linear vertical alignTop ]
]

{ #category : #initialization }
GtCoderExpanderLook >> initializeLook [
	super initializeLook.
	self widget
		layout: BlLinearLayout horizontal;
		geometry: (BlRectangle cornerRadius: 3);
		addChild: sidebar;
		addChild: container as: #content
]

{ #category : #accessing }
GtCoderExpanderLook >> padding: anInsets [
	container padding: anInsets
]

{ #category : #accessing }
GtCoderExpanderLook >> resizableElementsDo: aBlock [
	super resizableElementsDo: aBlock.
	aBlock value: container
]