extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	self.position = get_viewport().get_mouse_position()
	$CollisionShape2D.disabled = !mouse
	$Gray.visible = !mouse
	$Green.visible = mouse
	if Input.is_action_pressed("mouse"):
		mouse = true
	else:
		mouse = false
