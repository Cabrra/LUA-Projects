--[[
	Author: Jagoba Marcos
	Date: 01/13/2014
	Description: Basics
]]

function main ()
	
	-- Dice rolls

	local sum = 0
	local aux;
	math.randomseed( os.time() );
	math.random ();
	
	io.write( "Rolling 5 dice ...\n" );
	
	for i = 1, 5 do
		aux = math.random ( 6 );
		io.write ( aux );
		sum = sum + aux;
	end
	
	io.write( "\n" );
	
	io.write( "The sum of the dice is ", sum, "\n") ;
	
	-- Function calling
	
	io.write( "Lightning Bolt from a level 10 wizard dealt ", LightningBolt (10), " damage. \n" );
	io.write( "Lightning Bolt from a level 20 wizard dealt ", LightningBolt (20), " damage. \n\n" );
	
	-- XP calculator
	
	local total = 0;
	io.write( "My total XP is ", total,  "\n" );
	
	local enemy = Experience ( "Evil wookie", 50 );
	total = total + enemy
	io.write( "My total XP is ", total ,"\n\n");
	enemy = Experience ( "Sepia maligna", 35 );
	total = total + enemy
	io.write( "My total XP is ", total ,"\n\n");
	enemy = Experience ( "Fakex", 2 );
	total = total + enemy
	io.write( "My total XP is ", total ,"\n\n");
	
	io.write( "Enter the name of the enemy: " );
	local userName = io.read( "*l");
	io.write( "Enter the ", userName, "'s level: " );
	local userLevel = io.read( "*n");
	enemy = enemy + Experience ( userName, userLevel );
	total = total + enemy
	io.write( "My total XP is ", total ,"\n\n");

end

function LightningBolt ( level )
	local suma = 0;
	for i = 1, level do
		aux = math.random ( 6 );
		suma = suma + aux;
	end
	
	return suma;

end

function Experience ( name, level)

	local xp = level * 50;
	io.write( "A level ", level, " ", name, " would reward ", xp, " experience points!\n" );
	return xp;
	
end