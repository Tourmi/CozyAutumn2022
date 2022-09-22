class_name Plant_Data
extends Resource

#Base value of this plant
export var value : int = 10
#How many days of watering required before the plant goes to the next stage
export var days_per_cycle : int = 1
#How many cycles this plant has, including the first and the last
export var cycle_count : int = 3
#This plant's texture file
export var texture : Texture
#The amount of rows in the texture file
export var texture_rows : int = 1
#The row to use in the texture for this plant
export var texture_row : int = 0
#Amount of columns in the texture file
export var texture_columns : int = 3
