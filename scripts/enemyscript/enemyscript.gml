function colisaoInimigo() {

	if place_meeting(x + Hspd, y, HitBoxBlocos) {
	
		while !place_meeting(x + sign(Hspd), y, HitBoxBlocos) {
		
			x += sign(Hspd);
			
		}
			
		Hspd = 0;
	
	}
	
	if place_meeting(x + Hspd, y, Slime) {
	
		while !place_meeting(x + sign(Hspd), y, Slime) {
		
			x += sign(Hspd);
			
		}
			
		Hspd = 0;
	
	}
	
	x += Hspd;
	
	if place_meeting(x, y + Vspd, HitBoxBlocos) {
	
		while !place_meeting(x, y + sign(Vspd), HitBoxBlocos) {
		
			y += sign(Vspd);
			
		}
		
		Vspd = 0;
	
	}
	
	if place_meeting(x, y + Vspd, Slime) {
	
		while !place_meeting(x, y + sign(Vspd), Slime) {
		
			y += sign(Vspd);
			
		}
		
		Vspd = 0;
	
	}
	
	y += Vspd;

}

function checkPersonagem(){
	if distance_to_object(Player) <= distAgroo{
		estado = persPlayer;
	}
}

function EstadoDoInimigo(){
	checkPersonagem();
	proxEstado = choose(InimigoAndando, InimigoParado);

	if proxEstado == InimigoAndando{
		estado = InimigoAndando;
		DistX = irandom_range(1, 340);
		DistY = irandom_range(1, 240);
	}else{
		estado = InimigoParado;	
	}

}

function InimigoAndando(){
	checkPersonagem();
	image_speed = 1;
	
	var _dir = point_direction(x, y, DistX, DistY);
	Hspd = lengthdir_x(spd, _dir);
	Vspd = lengthdir_y(spd, _dir);
	
	colisaoInimigo();
	
}

function InimigoParado(){
	checkPersonagem();
	image_speed = 0.5;	
}

function persPlayer(){
	image_speed = 1.5;
	
	DistX = Player.x;
	DistY = Player.y;
	
	var _dir = point_direction(x, y, DistX, DistY);
	
	Hspd = lengthdir_x(spedPerseg, _dir);
	Vspd = lengthdir_y(spedPerseg, _dir);
	
	colisaoInimigo();
	
	if distance_to_object(Player) >= distDesagroo {
	
		estado = EstadoDoInimigo;
		
		alarm[0] = irandom_range(120, 240);
		
	}
}