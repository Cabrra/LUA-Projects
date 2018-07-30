--[[
	Author: Jagoba Marcos "Jake"
	Date: 01/06/2014
	Description: Hangman game v1.0
]]

function main ()

	local phrase, lives, aux;
	local ending = false;
	local fin = false;
	local auxPhrase; -- Uppercase original word
	local said = ""; -- Store said letters
	io.write ( "Enter a word or phrase to begin (this game is not key sensitive): ");
	phrase = io.read( "*l" );
	auxPhrase = phrase:upper();
	io.write ( "Enter maximum lives: ");
	lives = io.read( "*n" );
	io.read( "*l" );
	
	aux =phrase:len();
	
	local k; -- delete blank spaces from the game
	for k=1, phrase:len() do
		local x = phrase:sub(k,k)
		if x == " " or x == "'" then
			aux = aux - 1;
		end
	end
	
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	io.write( "\n" );
	
	
	io.write ( "This is hangman game. You have to figure out the word by typing letters.\n" );
	io.write ( "You have a maximum of ", lives , " lives to solve the word and winning te game.\n" );
	io.write ( "Let's get started!!\n\n" );
		
	io.write ( "the word has ", aux ," letters.\n\n" );
		
	local letter; -- variable for player's letter
	local i, j; -- variable for loops
	
	local build = {phrase:len()}; -- initialize array with the proper length
	
	--io.write ( "show this initial\n" );
		
	for i=1, phrase:len() do -- fill initial array
		local x = phrase:sub(i,i)
		--io.write ( "show this for ", i , "\n" );
		if x == " " then
			build[i] = " ";
		elseif x == "'" then
			build[i] = "'";
		else
			build[i] = "_";
		end
	end
	--io.write ( "show this I completed the for\n" );
	
	while not ending do
		fin = false;
		io.write ( "Enter a letter, please: " );
		letter = io.read( "*l" );
		letter = letter:upper();
		
		--io.write ( "show this 1\n" );
		
		while true do -- control
			while letter:len() ~= 1 or letter == " " do -- Control for a single letter imput
				io.write ( "ERROR!! EnterJUST one letter (no blanks or repeat letters), please: " );
				letter = io.read( "*l" );
				letter = letter:upper();
				--io.write ( "show this 2" );
			end
			--io.write ( "show this before IF\n" );
			while not fin do
				if said:len() ~= 0 then -- avoid first time
					for i = 1, said:len() do
						local s = said:sub(i,i)
						s = s:upper();
						
						if s == letter then
							io.write ( "ERROR!! EnterJUST one letter (no blanks or repeat letters), please: " );
							letter = io.read( "*l" );
							letter = letter:upper();
							break;
						elseif i == said:len() then
							fin = true;
						end
					end
				else 
					io.write ( "show this ELSE" );
					fin = true;
				end
			end
			--io.write ( "show this after IF\n" );
			if fin then
				break;
			end
		end
		
		j = 0 -- no matches
			

		for i = 1, phrase:len() do  
			local c = auxPhrase:sub(i,i) -- search in the string
			if c == letter then
				said = said .. letter;
				--io.write( said );
				build[i] = letter;
				aux = aux - 1;
				j = j + 1; 
			end
		end
		
		for i = 1, phrase:len() do -- write the actual board game
			io.write ( build[i] );
		end
		io.write ( "\n" );
		io.write ( "\n\n" );
		
		if j == 0 then -- show fail message
			lives = lives - 1;
			io.write ( "There is no ", letter , " in the word. You lost one live!\n" );
			io.write ( lives , " live(s) left\n\n" );
			if lives == 0 then
				ending = true;
			end
		end
		if aux > 0 then -- auxiliar variable for remaining letters to win
			io.write ( "There are ", aux ," letters left\n\n" );
		else
			ending = true;
		end
	end

	if lives == 0 then -- lose
		io.write ( "SORRY!! you lost the game!\n" );
		io.write ( "the word was ", auxPhrase , "\n" );
	else -- win
		io.write ( "YAI!! CONGRATULATIONS!! YOU WON!! \n" );
		io.write ( "YAI!! CONGRATULATIONS!! YOU WON!! \n" );
		io.write ( "YAI!! CONGRATULATIONS!! YOU WON!! \n" );
		io.write ( "The word was ", auxPhrase );
	end
end
