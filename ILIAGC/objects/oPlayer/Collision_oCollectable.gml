// Change scope to collectable
with (other)
{
	// Call collect function
	onCollect();
	
	// Destroy collectable
	instance_destroy();
}