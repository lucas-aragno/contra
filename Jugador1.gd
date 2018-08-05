extends Position2D

var Velocity = Vector2()
export (float) var gravity = 100
export (float) var movement_velocity = 2200

func _ready():
	pass

func _physics_process(delta):
  Velocity.y += gravity * delta
  var movement = Velocity * delta
  if (Input.is_action_pressed("ui_right")):
    Velocity.x = movement_velocity
    if (!get_node("animation_1").is_playing()):
      get_node("animation_1").play("running")
      get_node("cuerpo_j1/spr_1").flip_h = true
  elif (Input.is_action_pressed("ui_left")):
    Velocity.x = -movement_velocity
    if (!get_node("animation_1").is_playing()):
      get_node("animation_1").play("running")
      get_node("cuerpo_j1/spr_1").flip_h = false
  else:
    Velocity.x = 0
    get_node("animation_1").play("idle")
  get_node("cuerpo_j1").move_and_slide(movement)
