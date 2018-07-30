--[[
	Author: Jagoba Marcos "Jake"
	Date: 01/13/2014
	Description: Euler 3

]]--

function main()
	
	local aux = math.floor(600851475143/2); -- the highest factor will never exceed number's half
	local prime;
	local i,j;
	local count;

	for i = aux, 2 , -1 do -- inverse for
		if 600851475143 % i == 0 then -- check if factor
			count = math.floor(i/2);
			for j = 2, count do -- check if prime
				if i % j == 0 then
					break;
				elseif j == count then 
					prime = i;
					break
				end
			end
		end
		if prime ~= nil then
			break;
		end
	end	
	
	io.write( " Largest prime factor of 600851475143 is ", prime);
	
end