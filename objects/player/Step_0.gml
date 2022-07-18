//movimentação personagem

script_execute(estado);

/*
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));

Hspeed = (direita - esquerda) * spd;


if place_meeting(x + Hspeed, y, obj_Wall){
		while !place_meeting(x + sign(Hspeed), y, obj_Wall){
			x += sign(Hspeed);	
		}
		
	Hspeed = 0;
}

x += Hspeed;

Vspeed = (baixo - cima) * spd

if place_meeting(x, y + Vspeed, obj_Wall){
		while !place_meeting(x, y + sign(Vspeed), obj_Wall){
			y += sign(Vspeed);	
		}
		
	Vspeed = 0;
}

y += Vspeed;

#region Direcional sprite

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

#endregion

show_debug_message(string(dir));

if keyboard_check_pressed(ord("Q")){
	
		if dir = 0 || dir = 2{
			dashVeloc *= -1;
		}
		
		Hspeed = lengthdir_x(dashVeloc, dir);
		Vspeed = lengthdir_y(dashVeloc, dir);
	
		x += Hspeed;
		y += Vspeed;
}
