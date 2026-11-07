extends Node2D

var pages := [
	"One stormy night, whilst the great spellcaster was sleeping after countless restless nights, malevolent goblins raided his tower. Once he arose during the night the goblins were already far gone. The storm thickened throughout the night, lightning was striking without any signs of stopping. He had quickly noticed his most prized possession, along with countless other artifacts stolen. The spellcaster’s wand, forged with perfection & infused with a tremendous amount of mana, the wand that ruled the land and locked the goblin king away, was stolen.",
	"The great spellcaster luckily had a spare wand, although nothing compared to his almighty and absolute wand. Although wanting to go back to sleep from having only slept for a miniscule amount the previous weeks, he took off after the goblins to take back what is his. Stepping onto the soaked gravel pathway outside his tower, the great spellcaster was met with several stuck trees blocking the path; luckily it was so soaked that the mischievous goblins footprints were imprinted into the muddy terrain. The monotone spellcaster that never let his image shake, could no longer contain how infuriated he was. The daunting, foggy, and monster infested forest awaited him.",
	"His legs were numb and bleeding, most likely broken after the treacherous walk to an extremely shady and quiet hole in a mountain. Nothing to be seen past the entrance of the cavern, he couldn’t have prepared for what was about to transpire…"
]

var current_page := 0

func _ready() -> void:
	$NextButton.pressed.connect(_on_next_pressed)
	show_page()

func show_page() -> void:
	$StoryLabel.text = pages[current_page]

func _on_next_pressed() -> void:
	if current_page < pages.size() - 1:
		current_page += 1
		show_page()
	else:
		GameSettings.finish_story()
