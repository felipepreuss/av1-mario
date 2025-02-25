extends CharacterBody3D
@onready var player = $"../maroo"
const SPEED = 1.25
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta 
	var direction= (player.global_position - global_transform.origin).normalized()
	rotate_x(0)
	rotate_z(0)
	velocity = direction * SPEED
	look_at(player.global_position, Vector3.UP)
	#rotation.y = lerp_angle(rotation.y,deg_to_rad(90),10 * delta)

	move_and_slide()


func _on_foot_area_entered(area):
	queue_free() # Replace with function body.
