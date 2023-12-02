extends Node2D


var back_card = preload("res://Assets/Sprites/back_card.png")
var deck_path = "res://Assets/Sprites/Decks"
var card_scene = preload("res://Scenes/card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func init_deck(deck_name):
	var cards_name = []
	
	var dir_deck_path = deck_path.path_join(deck_name)
	var dir = DirAccess.open(dir_deck_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			cards_name.push_back(file_name)
			file_name = dir.get_next()
	
	cards_name.shuffle()
	
	for card_name in cards_name:
		create_card(load(dir_deck_path.path_join(card_name)))


func create_card(asset):
	var card = card_scene.instantiate()
	add_child(card)
	card.find_child("CardSprite").texture = back_card
	card.texture_card_path = asset
	card.apply_scale(Vector2(0.35, 0.35))
