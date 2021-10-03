extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const GIBBS: Array = [
	'|',
	'°',
	',',
	'-'
]

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label").set_text(GIBBS[randi() % len(GIBBS)])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_RigidBody2D_body_entered(body):
#s	pass # Replace with function body.
