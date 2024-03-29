extends State
class_name IdleState

var player

func _ready():
	player = get_parent()
	animation.travel("Idle")
	
func _physics_process(delta):
	if Input.is_action_just_pressed("walk_left") or Input.is_action_just_pressed("walk_right") or Input.is_action_just_pressed("walk_down") or Input.is_action_just_pressed("walk_up"):
		player.change_state("move")
	player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	player.velocity.z = move_toward(player.velocity.z, 0, player.SPEED)
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.change_state("jump")
	
	if Input.is_action_just_pressed("attack") and player.is_on_floor():
		player.change_state("attack")
func exit():
	print('Exit Idle State')
