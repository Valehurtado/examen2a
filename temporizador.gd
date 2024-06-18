extends CanvasLayer

var is_timer = true

var minutes = 0
var seconds = 0
var decimal = 0

var  mode_label = 'Timer'

func update_label():
	$Clabel.text = str(decimals)
	$TimeLabel.text = '%02d:%'%[minutes,seconds]
	
	
	


