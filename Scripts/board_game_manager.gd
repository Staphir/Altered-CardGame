extends Node2D


var hero_card = preload("res://Assets/Sprites/BoardGame/hero_card.png")
var companion_card = preload("res://Assets/Sprites/BoardGame/companion_card.png")
var adventure_cards = [
	preload("res://Assets/Sprites/BoardGame/adventure_card_1.png"),
	preload("res://Assets/Sprites/BoardGame/adventure_card_2.png"),
	preload("res://Assets/Sprites/BoardGame/adventure_card_3.png")
]


# Called when the node enters the scene tree for the first time.
func _ready():
	$hero_card/CardSprite.texture = hero_card
	$companion_card/CardSprite.texture = companion_card
	
	adventure_cards.shuffle()
	
	$adventure_card_1/CardSprite.texture = adventure_cards[0]
	if randf() > 0.5:
		$adventure_card_1.rotate(PI) 
		
	$adventure_card_2/CardSprite.texture = adventure_cards[1]
	if randf() > 0.5:
		$adventure_card_2.rotate(PI)
		
	$adventure_card_3/CardSprite.texture = adventure_cards[2]
	if randf() > 0.5:
		$adventure_card_3.rotate(PI)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
