extends Camera

onready var line = get_node("../../LineRenderer")
onready var orbit = get_node("../../Orbit")
var mouseDown = false
var orbitSpeed = 0.5
var orbitDir = 0

func _ready():
	pass

func _process(delta):
	if orbitDir == 0:
		orbit.rotate(Vector3(0,1,0), delta * orbitSpeed)
	elif orbitDir == 1:
		orbit.rotate(Vector3(0,1,0), -delta * orbitSpeed)
	if orbitDir == 2:
		orbit.rotate(Vector3(1,0,0), delta * orbitSpeed)
	if orbitDir == 3:
		orbit.rotate(Vector3(1,0,0), -delta * orbitSpeed)
	
	if Input.is_action_just_pressed("ui_up"):
		orbitDir = 3
	if Input.is_action_just_pressed("ui_down"):
		orbitDir = 2
	if Input.is_action_just_pressed("ui_left"):
		orbitDir = 1
	if Input.is_action_just_pressed("ui_right"):
		orbitDir = 0
	
func _input(event):   
	if event is InputEventMouseButton:
		if !event.pressed:
			var pickLength = 1
			var mousePos = event.position
			var from = project_ray_origin(mousePos)
			var to = from + project_ray_normal(mousePos) * pickLength
			
			line.points.append(to)