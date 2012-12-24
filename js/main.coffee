main = $ '#main'

win = $ window
winWidth = win.width()
winHeight = win.height()

delay = 0

flakes = []

createFlake = -> 
	flake = $('<div class="snowflake" data-size="' + Math.floor(Math.random() * 4) + '">*</div>')
	
	flake.css
		position: 'absolute'
		top: Math.floor(Math.random() * winHeight)
		left: Math.floor(Math.random() * winWidth)
		opacity: 0
	
	main.append flake
	
	delay += 100
	
	setTimeout (-> flake.css('opacity', 0.5)), delay
	
	flake

flakes.push(createFlake()) for i in [0..30]

moveFlakes = ->
	
	$.each flakes, ->
		
		flake = @
		
		pos = flake.position()
		
		newTop = if(pos.top < winHeight) then pos.top + 1 else 0
		
		if(newTop isnt 0)
			flake.css top: newTop
		else
			flake.css top: newTop, opacity: 0
			setTimeout (-> flake.css('opacity', 0.5)), 250
	
	setTimeout moveFlakes, 100

moveFlakes()