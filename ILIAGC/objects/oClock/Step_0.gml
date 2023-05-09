// Shiny particles
var _x = x + random_range(-4, 4), _y = y + random_range(-4, 4);
with (oParticles)
{
	part_particles_create(partSystem, _x, _y, partTypeDust, 1);
}

// Inherit the parent event
event_inherited();