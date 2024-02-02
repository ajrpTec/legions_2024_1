extends Node2D
class_name Army

@export var SoldatScene : PackedScene;
@export var row = 5;
@export var col = 5;
@export var user_control = true;

var soldiers = []

func _ready():
	for c in row:
		for r in col:
			var s : Node2D = SoldatScene.instantiate();
			s.position = Vector2( c*15 - row/2*15, r*15 - col/2*15); 
			add_child(s);
			soldiers.append(s);
			pass
	pass

func _process(delta):
	pass


func _input(event):
	if not user_control : return
	if Input.is_action_just_pressed("p"):	for s : Soldier in soldiers: s.makePhysics()
	if Input.is_action_just_pressed("v"):	for s : Soldier in soldiers: s.makeVisual()
	if Input.is_action_pressed("ui_left"):	for s : Soldier in soldiers: s.move(Vector2.LEFT)
	if Input.is_action_pressed("ui_right"): for s : Soldier in soldiers: s.move(Vector2.RIGHT)
	if Input.is_action_pressed("ui_up"): 	for s : Soldier in soldiers: s.move(Vector2.UP)
	if Input.is_action_pressed("ui_down"): 	for s : Soldier in soldiers: s.move(Vector2.DOWN)
	pass
