extends Area2D
@onready var coin = $"."
@onready var animation = $animation


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	animation.play("collected")



func _on_animation_animation_finished(animation_name):
	if animation.animation == "collected":
		queue_free()
