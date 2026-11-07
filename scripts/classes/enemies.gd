class_name Enemy
extends CharacterBody2D

var health: int
var damage: int
var speed: int
var sprite: Texture2D

func _init(health: int, damage: int, speed: int, sprite: Texture2D):
	self.health = health
	self.damage = damage
	self.speed = speed
	self.sprite = sprite
