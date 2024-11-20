extends Node


@onready var coins_counter: Label = $Coins/coins_counter
@onready var life_counter: Label = $Life/life_counter
@onready var score_counter: Label = $Score/score_counter




func _ready():
	coins_counter.text = str("%04d" % Globals.coins)
	score_counter.text = str("%06d" % Globals.score)
	life_counter.text = str("%01d"  % Globals.life)
	
	
	
	
func _process(_delta):
	coins_counter.text = str("%04d" % Globals.coins)
	score_counter.text = str("%06d" % Globals.score)
	life_counter.text = str("%01d"  % Globals.life)
	
	pass
	
