if (active)
{
	// Damage
	with (other)
	{
		takeDamage(other.damage);
	}
}

// Inherit parent
event_inherited();