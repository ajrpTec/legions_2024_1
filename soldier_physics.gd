extends RigidBody2D
class_name SoldierPhysics

var kingCode = 0; var armyCode = 0;

func _ready():
	pass

func move(direction):
	apply_central_impulse(direction*100);
