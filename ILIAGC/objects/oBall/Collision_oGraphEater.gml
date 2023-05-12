// Boost in direction
var _r = new Vector2(velocity.x, velocity.y);
_r.normalize();
_r.multiplyByScalar(0.1);
velocity.addVector(_r);
delete _r;

// Particles
with (oParticles)
{
	part_particles_create(partSystem, other.x, other.y, partTypeDust, 1);
}