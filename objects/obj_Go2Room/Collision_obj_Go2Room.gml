// In the off-chance two are layered on top of each other, delete the older

if id > other.id {
instance_destroy(other);
} else {
	instance_destroy(self);
}