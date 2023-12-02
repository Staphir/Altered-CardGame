extends Area2D

@onready var texture_card_path

var selected = false
var zoomed = false
var hide = true
var back_card_texture = preload("res://Assets/Sprites/back_card.png")
var mouse_hover = false

func _on_input_event(_viewport, _event, _shape_idx):
	selected = Input.is_action_pressed("left_click")
	
	if Input.is_action_pressed("right_click"):
		set_scale(Vector2(0.65, 0.65))
	else:
		set_scale(Vector2(0.35, 0.35))


func _on_mouse_entered():
	mouse_hover = true


func _on_mouse_exited():
	mouse_hover = false


func _process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), delta * 25)
	
	if Input.is_action_just_pressed("display") and mouse_hover:
		if hide:
			hide = false
			$CardSprite.texture = texture_card_path
		else:
			hide = true
			$CardSprite.texture = back_card_texture


