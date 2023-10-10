extends Node2D

@export var myList: ItemList

func _ready():
	print(Global.resultList)
	generateList()
	
func generateList():
	myList.clear()
	
	for i in Global.resultList.list:
		myList.add_item(str( i.price, " U$D - Helado de ", i.name))

func _on_button_pressed():
	var items = myList.get_selected_items()
	
	OS.shell_open("https://wa.me/555345953845983?text=" + str(items))
	
	for i in items:
		print(i)
