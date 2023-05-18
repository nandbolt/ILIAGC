// Particle systems
partSystem = part_system_create();
lowPartSystem = part_system_create();

// Dust
partTypeDust = part_type_create();
part_type_sprite(partTypeDust, sDust, false, false, false);
part_type_speed(partTypeDust, 0.2, 0.2, -0.005, 0);
part_type_direction(partTypeDust, 0, 359, 0, 0);
part_type_alpha2(partTypeDust, 1, 0);
part_type_life(partTypeDust, 45, 45);

// Pulse
partTypePulse = part_type_create();
part_type_sprite(partTypePulse, sPulse, false, false, false);
part_type_size(partTypePulse, 0, 0, 0.02, 0);
part_type_alpha2(partTypePulse, 1, 0);
part_type_life(partTypePulse, 60, 60);