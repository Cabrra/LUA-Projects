--[[
	Author: Jagoba Marcos
	Date: 01/08/2014
	Description: Simple Games
]]

function main ()
	-- Guess the number	
	math.randomseed( os.time() );
	math.random();
	
	local number = math.random ( 100 );
	local count = 0;
	local guess;
	
	io.write( "Guess my number (1-100): " );
	guess = io.read( "*n" );
	count = count + 1
	
	while guess ~= number do
		if guess > number then
			io.write( guess , " is too high." );
		elseif guess < number then
			io.write( guess , " is too low." );
		end
		
		io.write( "Guess again: " );
		guess = io.read( "*n" );
		count = count + 1
	end
	
	io.write( "You got it right after ", count, " tries!\n\n" );
	
	-- Guess the number v2
	
	local guess1 = math.random ( 100 );
	local guess2;
	local count = 0;
	local number;
	
	io.write( "Enter a number for me to guess (1-100): " );
	number = io.read( "*n" );
	io.write( "I guess ", guess1 , "\n");
	count = count + 1
	
	while guess1 ~= number do
		if guess1 < number then
			io.write( "That's not right. " );
			guess2 = math.random ( guess1, 100 );
			while guess2 <= guess1 do
				guess2 = math.random ( guess2, 100 );
			end
			io.write( "I guess ", guess2 , "\n");
			count = count + 1
		elseif guess1 > number then
			io.write( "That's not right. " );
			guess2 = math.random ( guess1 );
			while guess2 >= guess1 do
				guess2 = math.random ( guess2 );
			end
			io.write( "I guess ", guess2 , "\n");
			count = count + 1
		end
		
		guess1 = guess2;
	end
	
	io.write( "You got it right after ", count, " tries!\n\n" );
	
	-- Rock-Paper-Scissors
	local computer = math.random( 1, 3);
	local player;
	local move = {}
	
	move[1] = "Rock";
	move[2] = "Paper";
	move[3] = "Scissors";
	
	io.write( "Rock Paper Scissors Time! \n" );
	io.write( "1)	Rock\n" );
	io.write( "2)	Paper\n" );
	io.write( "3)	Scissors\n\n" );
 
	io.write( "Enter your choice: " );
	player = io.read( "*n" );
	
	io.write( "Player chose ", move[player], "\n" );
	io.write( "Computer chose ", move[computer], "\n\n" );
	
	if player == computer then
		io.write( "It's a draw.\n\n" );
	elseif (player == 1 and computer == 2) or (player == 2 and computer == 3) or (player == 3 and computer == 1) then
		io.write( "Computer wins!\n\n" );
	elseif (player == 2 and computer == 1) or (player == 3 and computer == 2) or (player == 1 and computer == 3) then
		io.write( "Player wins!\n\n" );
	end
	
end