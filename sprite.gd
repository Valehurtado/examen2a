extends CanvasLayer

var is_timer = true

var minutes = 0
var seconds = 0
var decimals = 0

var mode_label = "TIMER"

func update_label():
	$Decimas.text = str(decimals)
	$Tiempo.text = "%02d:%02d"%[minutes,seconds]
	

func update_stopwatch():
	decimals +=1
	if decimals >=10:
		decimals = 0
		seconds +=1
	if seconds >= 60:
		seconds = 0
		minutes +=1
	if minutes >= 59:
		seconds = 59
		minutes = 59
		decimals = 9
		$Estado.text = "STOPPED"
		$MainTimer.stop()
		$finish.play()
	update_label()
func update_timer():
	decimals -= 1
	if decimals <0:
		decimals = 9
		seconds -= 1
	if seconds < 0:
		seconds = 59
		minutes -= 1
	if minutes <0:
		minutes = 0
		seconds = 0
		decimals = 0
		$Estado.text = "STOPPED"
		$MainTimer.stop()
		# $finish.play()
	update_label()
				



func _on_botonmodo_pressed():
	if $MainTimer.is_stopped():
		minutes = 0
		seconds = 0
		decimals = 0
		is_timer = !is_timer
		if is_timer == true:
			mode_label = "TIMER"
		else:
			mode_label = "STOPWATCH"
	update_label()
	$Modo.text = mode_label



func _on_botoninicio_pressed():
	if $MainTimer.is_stopped():
		$MainTimer.start()
		$Estado.text = "RUNNING"
	else:
		$MainTimer.stop()
		$Estado.text = "STOPPED"
		

func _on_botonmin_pressed():
	if $MainTimer.is_stopped() and is_timer == true:
		minutes += 1
	if minutes > 59:
		minutes = 0
		decimals = 0
	update_label()

func _on_botonsec_pressed():
	if $MainTimer.is_stopped() and is_timer == true:
		seconds += 1
		if seconds > 59:
			seconds = 0
		decimals = 0
		update_label()

func _on_clean_pressed():
	if $MainTimer.is_stopped():
		minutes = 0
		seconds = 0
		decimals = 0
		update_label()

func _on_main_timer_timeout():
	if is_timer == false:
		update_stopwatch()
	else:
		update_timer()
