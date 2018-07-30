--[[
	Author: Jagoba Marcos "Jake"
	Date: 01/22/2014
	Description: Arena fight
]]

function main ()
	math.randomseed( os.time() );
	math.random();

	local player = {};
	
	-- load a save game
	local check = LoadGame ( player );
	
	if not check then
		GenerateStats( player );
	end
	
	VisitArena( player );
	
	-- save the game
	
	SaveGame( player );
	
end

function Battle ( player, enemy )

	local round = 0;
	local maxhp = player.hp
	
	while player.hp>0 and enemy.hp > 0 do
		round = round + 1;
		io.write ("\n))) Round ", round, "!! (((\n");
		Attack (player, enemy );
		Attack (enemy , player);
		
		ShowStats (player);
		ShowStats (enemy);
		
		io.write( "Press <Enter> to continue...\n" );
		io.read();
	end
	
	if player.hp > 0 then
		player.hp = maxhp;
		return player;
	else
		return enemy;
	end	

end

function LevelUp ( player )

	io.write( "You Leveled!!\n");
	player.hp = player.hp + 10;
	player.atk = player.atk + 0.5;
	player.def = player.def +0.5;
	player.level = player.level + 1;
	
	io.write("1) Hit Points\n");
	io.write("2) Attack\n");
	io.write("3) Defense\n");
	
	local choice = Ask("What stat would you like to increase? ", 3);
	if choice == 1 then
		player.hp = player.hp + 10;
	elseif choice == 2 then
		player.atk = player.atk + 1;
	else
		player.def = player.def + 1;
	end
end

function Ask (prompt, maxval )

	local input;
	while true do
		io.write(prompt);
		input = io.read("*n");
		io.read("*l");
		
		if input ~= nil and input >= 1 and input <= maxval then
			return input;
		end
		io.write("Invalid!! ");
	end
end

function GenerateStats ( person )

	io.write( "Welcome to the Arena!\n" );
	io.write( "What is your name? " );
	io.write("\n");
	
	person.name = io.read( "*l" );
	person.hp = 100;
	person.atk = 2;
	person.def = 10;
	person.level = 1;
	person.gold = 5;

end

function RandomEnemy ( level )

	local names = {"Minotaur", "Olog-Hai" , "Chuck Norris", "The Blog", "Sepiroth", "THE Balrog"}
	
	local enemy = {};
	
	enemy.name = names[math.random(#names)];
	enemy.hp = 50 + level * math.random (7, 14);
	enemy.atk = 2 + math.floor ( 100 * level * (math.random()+0.5) ) /100; -- round down
	enemy.def = 10 + math.ceil ( level * (math.random()+0.5) ); -- round up
	enemy.level = level;
	enemy.gold = 5* level;
	
	return enemy;

end

function VisitArena ( player )

	local enemy = RandomEnemy( player.level );
	
	while true do
		ShowStats ( player );
		io.write( "\n" );
		ShowStats ( enemy );
		io.write("An enemy has entered the arena!\n");
		io.write("1) Battle\n");
		io.write("2) Run Away\n");
		io.write("3) Fight a tougher enemy\n");
		io.write("4) Exit the arena\n");
		local choice = Ask("What would you like to do? ", 4);
		
		if choice == 1 then
			--Battle
			local winner = Battle(player, enemy)
			
			if player.name == winner.name then
				LevelUp(player)
				player.gold = player.gold + enemy.gold;
			else
				io.write("\nGame Over...\n");
				GenerateStats(player);
			end
			enemy = RandomEnemy(player.level);
		elseif choice == 2 then
			-- Run Away
			if enemy.level > 1 then
				enemy = RandomEnemy( enemy.level - 1 );
			else
				io.write("That enemy can't get easier\n");
			end
		elseif choice == 3 then	
			-- Tougher enemy
			enemy = RandomEnemy( enemy.level + 1 );
		else
			-- Exit
			io.write("\n\nYou brought shame to this mighty place!!!\n\n");
			break;
		end
	end	
end

function LoadGame( player )
	
	local fileIn = io.open( "arena.txt", "r" );
	
	if fileIn ~= nil then 

		player.name = fileIn:read( "*l" );
		player.hp = fileIn:read( "*n" );
		player.atk = fileIn:read( "*n" );
		player.def = fileIn:read( "*n" );
		player.level = fileIn:read( "*n" );
		player.gold = fileIn:read( "*n" );
		io.close( fileIn );
		return true;
		
	else
		io.close( fileIn );
		return false;
	end
	
end

function SaveGame ( player )
	
	local fileArena = io.open ("arena.txt", "w" );
	
	fileArena:write ( player.name, "\n" );
	fileArena:write ( player.hp, "\n" );
	fileArena:write ( player.atk, "\n" );
	fileArena:write ( player.def, "\n" );
	fileArena:write ( player.level, "\n" );
	fileArena:write ( player.gold, "\n" );
	
	io.close ( fileArena );
end

function ShowStats ( structure )
	io.write( "\nName: ", structure.name ,"\n" );
	if structure.level ~= nil then
		io.write( "Level: ", structure.level ,"\n" );
	end
	io.write( "HP: ", structure.hp ,"\n" );
	io.write( "Attack: ", structure.atk ,"\n" );
	io.write( "Defense: ", structure.def ,"\n" );
	if structure.gold ~= nil then
		io.write( "Gold: ", structure.gold ,"\n" );
	end
	io.write( "\n" );
end