extends Control


@onready var coins_counter: Label = $Coins/coins_counter

@onready var timer_counter: Label = $container/Timer/timer_counter

@onready var life_counter: Label = $Life/life_counter

@onready var score_counter: Label = $container/Score/score_counter

@onready var clock_timer: Timer = $ClockTimer as Timer

var minutes = 0
var seconds = 0

@export_range(0,5) var default_minutes := 1
@export_range(0,59) var default_seconds := 0 

func _ready():
	coins_counter.text = str("%04d" % Globals.coins)
	score_counter.text = str("%06d" % Globals.score)
	life_counter.text =  str("%01d"  % Globals.life)
	timer_counter.text = str("%02d" % default_minutes) + ":" + ("%02d" % default_seconds)
	reset_clock_timer()
	
	
func _process(_delta):
	coins_counter.text = str("%04d" % Globals.coins)
	score_counter.text = str("%06d" % Globals.score)
	life_counter.text = str("%01d"  % Globals.life)
	
	if minutes == 0 and seconds == 0:
	
		Globals.life -= 1
		Globals.score = 0
		Globals.coins = 0
		get_tree().reload_current_scene()

func _on_clock_timer_timeout():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	seconds -= 1
	
	timer_counter.text = str("%02d" % minutes) + ":" + ("%02d" % seconds)

func reset_clock_timer():
	minutes = default_minutes
	seconds = default_seconds
