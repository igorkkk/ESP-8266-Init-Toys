if file.exists("init.lua") then
	file.rename("init.lua","_init.lua")
	node.restart()
elseif file.exists("_init.lua") then
	print("Really rename to init.lua? \n5 sec. delay!")
	tmr.create():alarm(6000, 0, function()
		file.rename("_init.lua","init.lua")
		node.restart()
	end)
else
	print("No init files! Pattern now.")
	print('tmr.create():alarm(22000, 0, function()\n'..
	'\tif file.exists("main.lua") then\n'..
	'\t\tdofile("main.lua")\n'..
	'\telse\n'..
	'\t\tprint("No file \"main.lua\", Rename init.lua!")\n'..
	'\t\t\tif file.exists("init.lua") then\n'..
	'\t\t\tfile.rename("init.lua","_init.lua")\n'..
	'\t\t\tnode.restart()\n'..
	'\t\t\end\n'..
	'\tend\n'..
	'end)')
end