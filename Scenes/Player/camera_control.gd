extends Node3D

@export var sensitifity = 5

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED



func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseMotion:
		var xRot = clamp(rotation.x - event.relative.y / 1000 * sensitifity, -0.25, 0.25)
		var yRot = rotation.y - event.relative.x / 1000 * sensitifity
		rotation = Vector3(xRot, yRot, 0)
	
	if event is InputEventMouseButton:
		if event is InputEventMouseButton:
			print(event)
			# Zoom out
			if event.button_index == 5:
				if get_node("SpringArm3D").spring_length < 10:
					get_node("SpringArm3D").spring_length += 0.1
			
			# Zoom in
			if event.button_index == 4:
				if get_node("SpringArm3D").spring_length > 2 :
					get_node("SpringArm3D").spring_length -= 0.1
