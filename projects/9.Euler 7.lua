--[[
	Author: Jagoba Marcos "Jake"
	Date: 01/10/2014
	Description: Euler 7:
	By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
	we can see that the 6th prime is 13.
	What is the 10 001st prime number?
]]--

function main()
	--[[
	I should find all the prime numbers until the 10 001st
	the highest multiple of a number would be its half.
	the easiest way would be checking if the number is multiple of 2. 3 or 5
	]]--
	
	local aux, j;
	local i = 1;
	local count = 0;
	
	while count < 10001 do
		i = i + 1; -- this update should be placed before the in statement to avoid inaccurate results.
		aux = math.floor( i/2 ); -- round the number.
		if 2 <= aux then -- to avoid errors with first number.
			for j = 2, aux do
				--io.write( i );
				if i % j == 0 then
					break;
				elseif j == aux then
					count = count + 1;
				end					
			end
		else
			count = count + 1
		end
	end
	
	io.write( "The 10 001st prime number is: ", i, "\n\n" );
	
end