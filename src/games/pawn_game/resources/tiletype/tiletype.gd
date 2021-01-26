extends Resource

class_name TileType

export (String) var name
export (bool) var walkable
export (Texture) var texture
export (Color) var modulate = Color(1,1,1,1)
export (Vector2) var texture_scale = Vector2(1,1)

var walkable_path: String = "res://games/pawn_game/map_components/tiles/tile_bases/walkable/walkable.tscn"
var unwalkable_path: String = "res://games/pawn_game/map_components/tiles/tile_bases/unwalkable/unwalkable.tscn"

# store loaded scene
var scene: PackedScene = load_scene()

func gen_tile():
	var tile: Node = scene.instance()
	var sprite: Sprite = tile.get_node("Sprite")
	sprite.texture = texture
	sprite.modulate = modulate
	sprite.scale = texture_scale
	return tile

func load_scene():
	if walkable:
		return load(walkable_path)
	if not walkable:
		return load(unwalkable_path)