--[[
	Author: Jagoba Marcos "Jake"
	Date: 01/10/2014
	Description: Euler 1:
	If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
	The sum of these multiples is 23.
	Find the sum of all the multiples of 3 or 5 below 1000.
]]--

function main ()
	--[[
	I should calculate the sum of all the multiples of 3, multiples of 5 
	and subtract the multiples of 3 and 5.
	]]--
	
	local i;
	local sum = 0;
	
	for i = 1, 1000 do
		if i % 3 == 0 then
			sum = sum + i;
		end
		if i % 5 == 0 then
			sum = sum + i;
		end
		if i % 5 == 0 and i % 3 == 0 then -- delete the repeat once
			sum = sum - i;
		end
	end
	
	io.write( "the sum of all the multiples of 3 or 5 below 1000 is: ", sum, ".\n\n" );
end