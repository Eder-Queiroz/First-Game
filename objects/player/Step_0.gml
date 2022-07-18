//movimentação personagem

script_execute(estado);

if alarm[1] <= 0{
	estamina += 0.2;	
}

estamina = clamp(estamina, 0, maxEstamina);