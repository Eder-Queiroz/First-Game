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

if place_meeting(x, y + sign(Vspeed), obj_Wall){
		while !place_meeting(x, y + sign(Vspeed), obj_Wall){
			x += sign(Vspeed);	
		}
		
	Vspeed = 0;
}

y += Vspeed;

// Direcional

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

/*
if direita{
	while Hspeed > 0{
		sprite_index = SprCorrendoDireita;
	}
	dir = 1;
}

if esquerda{
	while Hspeed < 0{
		sprite_index = SprCorrendoEsquerda;
	}
	dir = -1;
}

if dir == -1{
	sprite_index = ParadoOlhandoEsquerda;
}
if dir == 1{
	sprite_index = ParadoOlhandoDireita;
}
*/