extends Sprite2D

const BOARD_SIZE = 8
const CELL_WIDTH = 18
const TEXTURE_HOLDER = preload("res://scene/texture_holder.tscn")
const BLACK_BISHOP = preload("res://asset/pixel chess_v1.2/16x32 pieces/B_Bishop.png")
const BLACK_KING = preload("res://asset/pixel chess_v1.2/16x32 pieces/B_King.png")
const BLACK_KNIGHT = preload("res://asset/pixel chess_v1.2/16x32 pieces/B_Knight.png")
const BLACK_PAWN = preload("res://asset/pixel chess_v1.2/16x32 pieces/B_Pawn.png")
const BLACK_QUEEN = preload("res://asset/pixel chess_v1.2/16x32 pieces/B_Queen.png")
const BLACK_ROCK = preload("res://asset/pixel chess_v1.2/16x32 pieces/B_Rook.png")
const WHITE_BISHOP = preload("res://asset/pixel chess_v1.2/16x32 pieces/W_Bishop.png")
const WHITE_KING = preload("res://asset/pixel chess_v1.2/16x32 pieces/W_King.png")
const WHITE_KNIGHT = preload("res://asset/pixel chess_v1.2/16x32 pieces/W_Knight.png")
const WHITE_PAWN = preload("res://asset/pixel chess_v1.2/16x32 pieces/W_Pawn.png")
const WHITE_QUEEN = preload("res://asset/pixel chess_v1.2/16x32 pieces/W_Queen.png")
const WHITE_ROCK = preload("res://asset/pixel chess_v1.2/16x32 pieces/W_Rook.png")

const BLACK_TURN = preload("res://asset/pixel chess_v1.2/16x32 pieces/B_Bishop.png")
const WHITE_TURN = preload("res://asset/pixel chess_v1.2/16x32 pieces/W_Bishop.png")

@onready var pieces = $Piece
@onready var dots = $Dots
@onready var turn = $Turn

var board: Array
var white: bool
var black: bool
var moves: Array = []
var selected_pieces: Vector2

# enum int defination
# -6 = black king
# -5 = black queen
# -4 = black rock
# -3 = black bishop
# -2 = black knight
# -1 = black pawn
# 0 = empty
# 6 = white king
# 5 = white queen
# 4 = white wock
# 3 = white bishop
# 2 = white knight
# 1 = white pawn

# Called when the node enters the scene tree for the first time.
func _ready():
	board.append([4, 2, 3, 5, 6, 3, 2, 4])
	board.append([1, 1, 1, 1, 1, 1, 1, 1])
	board.append([0, 0, 0, 0, 0, 0, 0, 0])
	board.append([0, 0, 0, 0, 0, 0, 0, 0])
	board.append([0, 0, 0, 0, 0, 0, 0, 0])
	board.append([0, 0, 0, 0, 0, 0, 0, 0])
	board.append([-1, -1, -1, -1, -1, -1, -1, -1])
	board.append([-4, -2, -3, -5, -6, -3, -2, -4])
	display_board()

func display_board():
	for column in BOARD_SIZE:
		for row in BOARD_SIZE:
			var holder = TEXTURE_HOLDER.instantiate()
			pieces.add_child(holder)
			holder.global_position = Vector2(row + CELL_WIDTH + CELL_WIDTH / 2, -column * CELL_WIDTH - CELL_WIDTH / 2)

			match board[column][row]:
				-6: holder.texture = BLACK_KING
				-5: holder.texture = BLACK_QUEEN
				-4: holder.texture = BLACK_ROCK
				-3: holder.texture = BLACK_BISHOP
				-2: holder.texture = BLACK_KNIGHT
				-1: holder.texture = BLACK_PAWN
				0: holder.texture = null
				6: holder.texture = WHITE_KING
				5: holder.texture = WHITE_QUEEN
				4: holder.texture = WHITE_ROCK
				3: holder.texture = WHITE_BISHOP
				2: holder.texture = WHITE_KNIGHT
				1: holder.texture = WHITE_PAWN

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
