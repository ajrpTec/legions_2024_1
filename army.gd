extends Node2D
class_name Army

@export var SoldatScene : PackedScene;
@export var row = 5;
@export var col = 5;
@export var user_control = true;
@export var color : Color = Color(1,1,1,1);

@export var kingCode = 0; @export var armyCode = 0;

var soldiers = []

func _ready():
	for c in row:
		for r in col:
			var s : Soldier = SoldatScene.instantiate();
			s.kingCode = kingCode ; s.armyCode = armyCode; 
			s.connect("hit_enemy",hitEnemy)
			s.position = Vector2( c*15 - row/2*15, r*15 - col/2*15);
			s.color = color;
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

	# beregn vektor fra soldats position til musens position
	# hvis man trykker på musen, så skal soldaten gå i den retning
	if Input.is_action_just_pressed("a"):
		for s : Soldier in soldiers:
			var dir =get_global_mouse_position() - s.soldierBody.global_position;
			dir = dir.normalized();
			s.move(dir);
		pass
	pass

func hitEnemy(colliding_soldier : Soldier, velocity : Vector2):
	
	print("Army detected collision with enemy ", " King ", kingCode , " velocity ", velocity.length());
	
	if randf() < 0.5 and kingCode == 0:
		soldiers.erase(colliding_soldier);
		colliding_soldier.queue_free();
	
	for s in soldiers:
		s.soldierBody.linear_damp = 2;
	pass
