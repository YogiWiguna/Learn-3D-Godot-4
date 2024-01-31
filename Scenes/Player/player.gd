extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 300

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction 
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var player_mesh = $"KayKit Animated Character2"

## STATE VARIABLES
var state
var state_factory


func _ready():
	state_factory = StateFactory.new()
	change_state("idle")
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var h_rot = $CameraControl.transform.basis.get_euler().y
	direction = Vector3(Input.get_action_strength("walk_left") - Input.get_action_strength("walk_right"),0,Input.get_action_strength("walk_up") - Input.get_action_strength("walk_down"))
	direction = direction.rotated(Vector3.UP, h_rot).normalized()
	move_and_slide()

func change_state(new_state_name):
	if state != null:
		state.exit()
		state.queue_free()
	# Add new State
	state = state_factory.get_state(new_state_name).new()
	state.setup("change_state", playback, self)
	state.name = new_state_name
	add_child(state)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "Attack(1h)":
		change_state("idle")
