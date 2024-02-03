extends Node2D
class_name Soldier

@export var soldier_physics : PackedScene; 
@export var soldier_visual : PackedScene; 
var soldierBody : Node2D;

var kingCode = 0; var armyCode = 0;

signal hit_enemy(body);

func _ready():
	makePhysics()
	
func makePhysics():
	var pos : Vector2
	if soldierBody != null:
		pos = soldierBody.position 
		soldierBody.queue_free();
	soldierBody = soldier_physics.instantiate();
	soldierBody.kingCode = kingCode; soldierBody.armyCode = armyCode;
	soldierBody.position = pos
	soldierBody.connect("body_entered",hit);
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

func hit(other_body):
	if other_body is SoldierPhysics and other_body.armyCode != armyCode:
		hit_enemy.emit(soldierBody);
	pass
