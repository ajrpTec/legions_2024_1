extends Node2D

class_name SoldierVisual

var kingCode = 0; var armyCode = 0;
var color = Color(1,1,1,1)

func _ready():
	$Sprite2D.modulate = color
	pass
	
func move(direction):
	pass
