extends Node

#region FadeEffect
func Fade(panel ,state : float = 1.0 , time : float = 1.0) -> void:
	var tween = create_tween()
	tween.tween_property(panel, "modulate:a", state, time)
#endregion
