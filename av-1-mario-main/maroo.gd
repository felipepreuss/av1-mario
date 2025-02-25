extends CharacterBody3D
@onready var opponent = $"../enemy"
@export var velocidade = 5.0
@export var aceleracao = 4.0
@export var forca_pulo = 4.5
@onready var marlo = $"."
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta # aplicando a gravidade ao jogador
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = forca_pulo # pulo
		#Vector2(x,y)
	var input = Input.get_vector("Esquerda", "Direita", "Frente", "Trás") #guardando os inputs
			#mantendo a rotação * direção do input .normalizando o vetor 3
	var dir = ( transform.basis * Vector3(input.x, 0, input.y)).normalized()
	velocity.x = lerp(velocity.x, dir.x * velocidade, aceleracao * delta)#movendo no x
	velocity.z = lerp(velocity.z, dir.z * velocidade, aceleracao * delta)#movendo no z
	move_and_slide() #aplicando a velocidade 


func _on_hurtbox_area_entered(area):
	opponent.queue_free() # Replace with function body.


func _on_killbox_area_entered(area: Area3D) -> void:
	get_tree().reload_current_scene() # Replace with function body.
