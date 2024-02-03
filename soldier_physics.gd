extends RigidBody2D
class_name SoldierPhysics

var kingCode = 0; var armyCode = 0;
var color = Color(1,1,1,1)

signal bodies_collided(my_body, other_body)

func _ready():
	$Sprite2D.modulate = color
	pass

func move(direction):
	apply_central_impulse(direction*100);


func _on_body_entered(body):
	emit_signal("bodies_collided", self, body)
	pass
