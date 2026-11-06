class_name Enemy
extends CharacterBody2D

var health: int
var damage: int
var speed: int


func _init(health: int, damage: int, speed: int, ):
	self.health = health
	self.damage = damage
	self.speed = speed
