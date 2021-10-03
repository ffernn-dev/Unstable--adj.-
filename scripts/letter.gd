extends RigidBody2D

var loopcount = 0
var level
var explosion = preload("res://scenes/Explode.tscn")

func _ready():
	level = get_parent().level
	set_max_contacts_reported(5)
	if level == 1:
		$AnimationPlayer.play("1")


func _on_pressed():
		set_mode(0)
		$AnimationPlayer.stop()
		$Label.set_rotation_degrees(0)
	

func _process(delta):
	loopcount += 1
	randomize()
	if (randi() % 1000) == 0 && loopcount > 200 && level != 6:
		set_mode(0)
		$AnimationPlayer.stop()
		$Label.set_rotation_degrees(0)
	if level == 4:
		randomize()
		self.add_force(Vector2(0, 0), Vector2(randi() % 50, randi() % 50))


func _on_RigidBody2D_body_entered(body):
	level = get_parent().level
	if body is RigidBody2D && level == 1:
		randomize()
		if randi() % 2 == 1:
			body.set_deferred("mode", 0)
			body.get_node("AnimationPlayer").stop()
			body.get_node("Label").set_rotation_degrees(0)
	if level == 2:
		if randi() % 3 == 0:
			var expinst = explosion.instance()
			add_child(expinst)
			expinst.get_node("Particles2D").emitting = true
			expinst.get_node("Timer").connect("timeout", self, "kill")
	if level == 3:
		self.visible = false
		for i in 2:
			var gib = load("res://scenes/gib.tscn").instance()
			get_parent().add_child(gib)
			gib.position = self.position
		queue_free()
	if level == 4:
		var bouncyone = PhysicsMaterial.new()
		bouncyone.set_bounce(1)
		bouncyone.set_friction(0)
		bouncyone.set_rough(true)
		self.set_physics_material_override(bouncyone)
	if level == 5:
		randomize()
		var number = randi() % 2
		if number == 0:
			if randi() % 3 == 0:
				var expinst = explosion.instance()
				add_child(expinst)
				expinst.get_node("Particles2D").emitting = true
				expinst.get_node("Timer").connect("timeout", self, "kill")
		if number == 1:
			self.visible = false
			for i in 2:
				var gib = load("res://scenes/gib.tscn").instance()
				get_parent().add_child(gib)
				gib.position = self.position
			queue_free()
		if number == 2:
			var bouncyone = PhysicsMaterial.new()
			bouncyone.set_bounce(1)
			bouncyone.set_friction(0)
			bouncyone.set_rough(true)
			self.set_physics_material_override(bouncyone)
		
func kill():
	self.queue_free()
