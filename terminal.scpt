if application "Terminal" is not running then
	tell application "Terminal"
		activate
		do script ""
		set bounds of window 1 to {250, 550, 840, 940}
		activate
	end tell
else
	tell application "System Events"
		get (the name of every application process whose class of windows contains window)
		repeat with process_name in the result
			if ((process_name) as string is equal to "Terminal") then
				tell application "Terminal"
					activate
				end tell
			end if
		end repeat
		get (the name of every application process whose background only is false and class of windows does not contain window)
		repeat with process_name in the result
			if ((process_name) as string is equal to "Terminal") then
				tell application "Terminal"
					do script ""
					set bounds of window 1 to {250, 550, 840, 940}
					activate
				end tell
			end if
		end repeat
		get (the name of every application process whose background only is false and visible is false)
		repeat with process_name in the result
			if ((process_name) as string is equal to "Terminal") then
				tell application "Terminal"
					activate
					do script ""
					set bounds of window 1 to {250, 550, 840, 940}
					activate
				end tell
			end if
		end repeat
	end tell
end if


on newTab()
	tell application "System Events" to keystroke "n" using command down
	-- tell application "System Events" to keystroke "t" using command down
end newTab
