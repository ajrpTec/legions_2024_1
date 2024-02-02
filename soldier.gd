extends Node2D
class_name Soldier

@export var soldier_physics : PackedScene; 
@export var soldier_visual : PackedScene; 
var soldierBody : Node2D;

func _ready():
	makePhysics()
	
func makePhysics():
	var pos : Vector2
	if soldierBody != null:
		pos = soldierBody.position 
		soldierBody.queue_free();
	soldierBody = soldier_physics.instantiate();
	soldierBody.position = pos
	add_child(soldierBody)

func makeVisual():
	var pos : Vector2
	if soldierBody != null:
		pos = soldierBody.position 
		soldierBody.queue_free();
	soldierBody = soldier_visual.instantiate();
	soldierBody.position = pos	
	add_child(soldierBody)

func move(direction):
	soldierBody.move(direction)
