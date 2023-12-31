extends Area2D


@export var speed = 400

var velocity

func _process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	
@onready var bgmusic = $"../bgmusic"
@onready var enemyhit = $"../enemyhit"


func _on_body_entered(body):
	hide()
	enemyhit.play()
	bgmusic.stop()
