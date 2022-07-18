function PersMoviment(){
//movimentação personagem
	cima = keyboard_check(ord("W"));
	baixo = keyboard_check(ord("S"));
	direita = keyboard_check(ord("D"));
	esquerda = keyboard_check(ord("A"));

	Hspeed = (direita - esquerda);
	Vspeed = (baixo - cima);

	spdDir = point_direction(x, y, x + Hspeed, y + Vspeed);
	
	if Hspeed != 0 || Vspeed != 0{
		spd = 2;	
	}else{
		spd = 0;	
	}
	
	Hspeed = lengthdir_x(spd, spdDir);
	Vspeed = lengthdir_y(spd, spdDir);

	if place_meeting(x + Hspeed, y, obj_Wall){
			while !place_meeting(x + sign(Hspeed), y, obj_Wall){
				x += sign(Hspeed);	
			}
		
		Hspeed = 0;
	}

	x += Hspeed;

	if place_meeting(x, y + Vspeed, obj_Wall){
			while !place_meeting(x, y + sign(Vspeed), obj_Wall){
				y += sign(Vspeed);	
			}
		
		Vspeed = 0;
	}

	y += Vspeed;

	//Direcional sprite

	if (cima || baixo || esquerda || direita) {

		dir = floor(point_direction(0, 0, (direita - esquerda), (baixo - cima)) / 90);
	
	}

	switch dir {

		case 0:
			sprite_index = ParadoOlhandoDireita;
			if Hspeed > 0{
				sprite_index = SprCorrendoDireita;	
			}
		break;
	
		case 1:
			sprite_index = ParadoOlhandoCima;
			if Vspeed < 0{
				sprite_index = SprCorrendoCima;	
			}
		break;
	
		case 2:
			sprite_index = ParadoOlhandoEsquerda;
			if Hspeed < 0{
				sprite_index = SprCorrendoEsquerda;	
			}
		break;
	
		case 3: 
			sprite_index = ParadoOlhandoBaixo;
			if Vspeed > 0{
				sprite_index = SprCorrendoBaixo;	
			}
		break;
	
	}
	
	if estamina >= 10{
		if keyboard_check_pressed(vk_space){		
			if (cima || baixo || esquerda || direita) {
				estamina -= 10;
				alarm[1] = 60;
				alarm[0] = 8;
				dashdir = point_direction(0, 0, (direita - esquerda), (baixo - cima));
				estado = PersDash;
			}
		}
	}
}

function PersDash(){
	Hspeed = lengthdir_x(dashVeloc, dashdir);
	Vspeed = lengthdir_y(dashVeloc, dashdir);
	
	if place_meeting(x + Hspeed, y, obj_Wall) {
	
		while !place_meeting(x + sign(Hspeed), y, obj_Wall) {
		
			x += sign(Hspeed);
			
		}
	
		Hspeed = 0;
	
	}
	
	x += Hspeed;
	
	if place_meeting(x, y + Vspeed, obj_Wall) {
	
		while !place_meeting(x, y + sign(Vspeed), obj_Wall) {
		
			y += sign(Vspeed);
			
		}
	
		Vspeed = 0;
	
	}
	
	y += Vspeed;
	
	var _instDash = instance_create_layer(x,y, "Instances_1", Obj_Dash);
	_instDash.sprite_index = sprite_index;
}
