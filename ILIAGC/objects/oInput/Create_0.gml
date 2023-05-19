// Info
maxPlayers = 2;
inputStates = 0;
inputKeyboardKeys = 0;
inputGamepadKeys = 0;
gamepadCount = 0;

// Control methods
playerGamepadIds = ds_list_create();
ds_list_add(playerGamepadIds, -1);

// Create initial inputs
inputCreate(InputAction.LEFT, ord("A"), gp_padl);
inputCreate(InputAction.RIGHT, ord("D"), gp_padr);
inputCreate(InputAction.UP, ord("W"), gp_padu);
inputCreate(InputAction.DOWN, ord("S"), gp_padd);
inputCreate(InputAction.JUMP, vk_space, gp_face1);
inputCreate(InputAction.INTERACT, vk_enter, gp_face3);
inputCreate(InputAction.START, vk_escape, gp_start);
inputCreate(InputAction.SELECT, vk_tab, gp_select);