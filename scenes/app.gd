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
	
	var items_text: String = "Hola VengaHeladeria, quisiera ordenar"
	
	for i in items:
		items_text += str(", ", Global.resultList.list[i].name, " por ", Global.resultList.list[i].price, "U$D")
		print(i)
	
	OS.shell_open(str("https://wa.me/", Global.phone, "?text=" + items_text))
