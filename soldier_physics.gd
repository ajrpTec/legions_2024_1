extends RigidBody2D
class_name SoldierPhysics

signal hit_body

func _ready():
	pass

func move(direction):
	apply_central_impulse(direction*100);
