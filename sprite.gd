extends CanvasLayer

var is_timer = true

var minutes = 0
var seconds = 0
var decimals = 0

var mode_label = 'TIMER'

func update_label():
	$Clabel.text = str(decimals)
	$TimeLabel.text = '%02d:%02d'%[minutes,seconds]
	

func _on_botonstar_pressed():
	if $MainTimer.is_stopped():
		minutes = 0
		seconds = 0
		decimals = 0
		is_timer = !is_timer
		if is_timer == true: 
			mode_label = 'Timer'
		else:
			mode_label = 'STOPWATCH'
		update_label()
		$ModeLabel.text = mode_label
				
				
func _on_botonstop_pressed():
	if $MainTimer.is_stopped():
		$MainTimer.star()
		$StatusLabel.text = 'RUNNING'
	else:
		$MainTimer.stop()
		$StatusLabel.text = 'STOPPED'
		

		

