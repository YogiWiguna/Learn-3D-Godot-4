class_name State
extends Node2D

var change_state
var animation
var persistent_state

func setup(change_state, animation, persistent_state):
	self.change_state = change_state
	self.animation = animation
	self.persistent_state = persistent_state
