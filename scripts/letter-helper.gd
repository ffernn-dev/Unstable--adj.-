extends Node2D

var charis = preload("res://CharisSIL-Regular.ttf")
var robotomono = preload("res://letterfont.tres")
var level

const CONST_HEADING = 54
const CONST_IPA = 38
const CONST_PARA = 25

func _ready() -> void:
	spawn_level(1)


func spawn_line(line:String, size:int, colour:Color, ipa:bool = false):
	for i in line:
		if i != " ":
			var letter = load("res://scenes/letter.tscn")
			var inst = letter.instance()
			var label = inst.get_node("Label")
			var collision = inst.get_node("CollisionShape2D")
			var button = inst.get_node("CollisionShape2D/Button")
			label.text = i
			label.get("custom_fonts/font").size  = size
			if ipa:
				label.get("custom_fonts/font").font_data  = charis
			label.add_color_override("font_color", colour)
			var charsize = Vector2(label.get("custom_fonts/font").get_string_size(i).x/2, size/2)
			collision.get("shape").radius = charsize.x
			collision.get("shape").height = charsize.y
			button.set_size(charsize * 2)
			button.set_position(-charsize)
			label.set_anchors_and_margins_preset(8)
			$LetterSpawner.position.x += label.get("custom_fonts/font").get_char_size(ord(i)).x
			inst.position = $LetterSpawner.position
			add_child(inst)
		else:
			$LetterSpawner.position.x += robotomono.get_char_size(ord(i)).x
	$LetterSpawner.position.y += size + 10
	$LetterSpawner.position.x = 0

func spawn_level(number:int):
	$LetterSpawner.position = Vector2(0, 40)
	if number == 1:
		level = 1
		spawn_line("Unstable (adj.)", CONST_HEADING, Color(0, 0, 0, 1))
		spawn_line("/ʌnˈsteɪb(ə)l/", CONST_IPA, Color(0.28, 0.52, 0.9, 1), true)
		spawn_line("  A. Likely to give way; not stable.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"The unstable cliff tops\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("  B. Likely to change or fail; not firmly established.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("  C. Prone to psychiatric problems or sudden changes of mood.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"they were mentally unstable\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
	if number == 2:
		level = 2
		spawn_line("Volatile (adj.)", CONST_HEADING, Color(0, 0, 0, 1))
		spawn_line("/ˈvɒlətʌɪl/", CONST_IPA, Color(0.28, 0.52, 0.9, 1), true)
		spawn_line("  A. (of a substance) Easily evaporated at normal temperatures.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"volatile solvents such as petroleum ether, hexane, and benzene\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("  B. Liable to change rapidly and unpredictably, especially for the", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("  worse.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"the political situation was becoming more volatile\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("  C. (of a computer's memory) Retaining data only as long as there", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("  is a power supply connected.", CONST_PARA, Color(0, 0, 0, 1))
	if number == 3:
		level = 3
		spawn_line("Fragile (adj.)", CONST_HEADING, Color(0, 0, 0, 1))
		spawn_line("/ˈfradʒʌɪl/", CONST_IPA, Color(0.28, 0.52, 0.9, 1), true)
		spawn_line("  A. (of an object) Easily broken or damaged.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"fragile items such as glass and china\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("  B. Easily destroyed or threatened.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"you have a fragile grip on reality\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("  C. Easily destroyed or threatened.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"a small, fragile old lady\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
	if number == 4:
		level = 4
		spawn_line("Erratic (adj.)", CONST_HEADING, Color(0, 0, 0, 1))
		spawn_line("/ɪˈratɪk/", CONST_IPA, Color(0.28, 0.52, 0.9, 1), true)
		spawn_line("  A. not even or regular in pattern or movement; unpredictable.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"her breathing was erratic\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
	if number == 5:
		level = 5
		spawn_line("Unpredictable (adj.)", CONST_HEADING, Color(0, 0, 0, 1))
		spawn_line("/ʌnprɪˈdɪktəb(ə)l/", CONST_IPA, Color(0.28, 0.52, 0.9, 1), true)
		spawn_line("  A. Not able to be predicted; changeable.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"the unpredictable weather of the Scottish islands\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("  B. This game.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"oh jeez that amazing game by ffernn was so unpredictable\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
	if number == 6:
		level = 6
		spawn_line("Stable (adj.)", CONST_HEADING, Color(0, 0, 0, 1))
		spawn_line("/ˈsteɪb(ə)l/", CONST_IPA, Color(0.28, 0.52, 0.9, 1), true)
		spawn_line("  A. (of an object or structure) Not likely to give way or overturn;", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("     firmly fixed.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"specially designed dinghies that are very stable\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("  B. (of a patient or their medical condition) Not deteriorating in", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("     health after an injury or operation.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"he is now in a stable condition in hospital\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("  C. Sane and sensible; not easily upset or disturbed.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"the officer concerned is mentally and emotionally stable\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("  D. Not likely to change or fail; firmly established.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"a stable relationship\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("  E. not liable to undergo chemical decomposition, radioactive", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("     decay, or other physical change.", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"isocyanic acid reacts with amino groups to form a stable compound\"", 24, Color(0.39, 0.39, 0.39, 1))
		get_parent().get_node("StableFall").start()
	if number == 7:
		level == 7
		spawn_line("A game by", CONST_IPA, Color(0.28, 0.52, 0.9, 1))
		spawn_line("ffernn (n.)", CONST_HEADING, Color(0, 0, 0, 1))
		spawn_line("  A. Made for the Ludem Dare 49 game jam", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("  B. Special thanks to the oxford dictionary", CONST_PARA, Color(0, 0, 0, 1))
		spawn_line("    \"thanks for playing!\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))
		spawn_line("    \"press esc to quit\"", CONST_PARA, Color(0.39, 0.39, 0.39, 1))


func _physics_process(delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	if get_child_count() == 1:
		if level == 7:
			return
		else:
			spawn_level(level + 1)
		


func _on_StableFall_timeout():
	get_parent().get_node("RigidBody2D").set_mode(0)
