class_name JumpState
extends State


var player

func _ready():
	player = get_parent()
	animation.travel("Jump")
	print("JUMP STATE START")


func _physics_process(delta):
	await get_tree().create_timer(0.4).timeout
	player.velocity.y += move_toward(player.velocity.y, player.JUMP_VELOCITY, player.JUMP_VELOCITY/50)
	
	if Input.is_action_pressed("walk_left") or Input.is_action_pressed("walk_right") or Input.is_action_pressed("walk_down") or Input.is_action_pressed("walk_up"):
		player.change_state("move")
	player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	player.velocity.z = move_toward(player.velocity.z, 0, player.SPEED)
	
	if player.is_on_floor():
		player.change_state("idle")
	
func exit():
	pass
