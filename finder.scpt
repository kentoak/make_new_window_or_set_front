--もしFinderが起動していない場合、起動して現在の仮想デスクトップに新しいウィンドウを作る
--もし現在の仮想デスクトップにFinderのウィンドウが開かれている場合、activateにして最前面に持ってくる
--もし現在の仮想デスクトップにFinderのウィンドウが開かれていないがアプリ自体は起動している場合、現在の仮想デスクトップに新しいウィンドウを作る
--もし非表示の場合、現在の仮想デスクトップに新しいウィンドウを作る
if application "Finder" is not running then --もしFinderが起動していない場合、起動して現在の仮想デスクトップに新しいウィンドウを作る
	tell application "Finder"
		launch --ここactivateにしたら、以前開いていたデスクトップにかってに移動してしまう。
		make new Finder window to "Macintosh HD:Users:kt:Downloads"
		set bounds of window 1 to {670, 300, 1500, 810} --set bounds of window 1 of application "'アプリケーション名'" to {左上X座標,左上Y座標,右下X座標,右下Y座標}
		set frontmost to true --activateしているのになぜか最前面に来ないのでこの行を追加している。activeでも良いはず
	end tell
else
	tell application "System Events"
		get (the name of every application process whose class of windows contains window)
		repeat with process_name in the result
			if ((process_name) as string is equal to "Finder") then --もし現在の仮想デスクトップにFinderのウィンドウが開かれている場合、activateにして最前面に持ってくる
				--display dialog process_name
				tell application "Finder"
					activate --activateコマンドはアプリが起動していなければ起動し（ただしそのままだと最前面には表示せずにbackground状態、隠した状態になる）、起動していればアプリのウィンドウを最前面に表示する。「アプリケーションが起動しており、なおかつ、ウインドウが背面に表示されている状態」だと上手く前面に表示されるが、「アプリケーションは起動していてもウインドウが閉じられている状態」だとメニューバーはactiveになるがウインドウが表示されません。）
				end tell
			end if
		end repeat
		get (the name of every application process whose background only is false and class of windows does not contain window)
		repeat with process_name in the result
			if ((process_name) as string is equal to "Finder") then --もし現在の仮想デスクトップにFinderのウィンドウが開かれていないがアプリ自体は起動している場合、現在の仮想デスクトップに新しいウィンドウを作る
				--display dialog process_name
				tell application "Finder"
					make new Finder window to "Macintosh HD:Users:kt:Downloads"
					set bounds of window 1 to {670, 300, 1500, 810} --set bounds of window 1 of application "'アプリケーション名'" to {左上X座標,左上Y座標,右下X座標,右下Y座標}
					activate
				end tell
			end if
		end repeat
		get (the name of every application process whose background only is false and visible is false)
		repeat with process_name in the result
			if ((process_name) as string is equal to "Finder") then --もし非表示の場合、現在の仮想デスクトップに新しいウィンドウを作る				--display dialog process_name
				tell application "Finder"
					activate
					make new Finder window to "Macintosh HD:Users:kt:Downloads"
					set bounds of window 1 to {670, 300, 1500, 810} --set bounds of window 1 of application "'アプリケーション名'" to {左上X座標,左上Y座標,右下X座標,右下Y座標}
					activate
				end tell
			end if
		end repeat
	end tell
end if
