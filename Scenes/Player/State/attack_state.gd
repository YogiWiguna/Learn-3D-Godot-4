class_name AttackState
extends State

var player

func _ready():
	player = get_parent()
	animation.travel("Attack(1h)")
	player.velocity.x = 0
	player.velocity.z = 0

func _physics_process(delta):
	pass

func exit():
	print("EXIT ATTACK")
