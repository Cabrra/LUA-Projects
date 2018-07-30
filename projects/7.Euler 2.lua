--[[
	Author: Jagoba Marcos "Jake"
	Date: 01/13/2014
	Description: Euler 2
]]--

function main()

	local first = 1;
	local second = 2;
	local sum = 2;
	local aux;
	

	while second < 4000000 do
		
		aux = first + second;
		if aux % 2 == 0 then
			sum = sum + aux;
		end
		first = second;
		second = aux;
	
	end

	io.write( " the sum of Fibonacci is: ", sum );

end