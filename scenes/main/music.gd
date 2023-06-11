extends AudioStreamPlayer3D


var sample_hz = 22050.0 # Keep the number of samples to mix low, GDScript is not super fast.
var pulse_hz = 440.0
var phase = 0.0

var playback: AudioStreamPlayback = null # Actual playback stream, assigned in _ready().


func _process(_delta):
	_fill_buffer()


func _fill_buffer():
	var increment = (1.0 / (hz / pulse_hz))
	var to_fill = playback.get_frames_available()
	while (to_fill > 0):
		playback.push_frame( Vector2(1.0,1.0) * sin(phase * (PI * 2.0))
		phase = fmod((phase + increment), 1.0)
		to_fill-=1;



func _ready():
	$Player.stream.mix_rate = sample_hz # Setting mix rate is only possible before play().
	playback = $Player.get_stream_playback()
	_fill_buffer() # Prefill, do before play() to avoid delay.
	$Player.play()
