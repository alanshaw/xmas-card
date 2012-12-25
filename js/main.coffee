main = $ '#main'

win = $ window
winWidth = win.width()
winHeight = win.height()

delay = 0

flakes = []

createFlake = -> 
	flake = $('<div class="snowflake" data-size="' + (Math.floor(Math.random() * 4) + 1) + '">*</div>')
	
	top = Math.floor(Math.random() * winHeight)
	
	flake.css
		position: 'absolute'
		top: top
		left: Math.floor(Math.random() * winWidth)
		opacity: 0
	
	flake.data 'top', top
	
	main.append flake
	
	delay += 100
	
	setTimeout (-> flake.css('opacity', 0.5)), delay
	
	flake

flakes.push(createFlake()) for i in [0..30]

moveFlakes = ->
	
	$.each flakes, ->
		
		flake = @
		
		top = flake.data 'top'
		
		newTop = if top < winHeight then parseInt(top) + 1 else 0 - parseInt(flake.data('size')) * 16
		
		flake.css(top: newTop).data(top: newTop)
		
		if top >= winHeight
			flake.css opacity: 0
			setTimeout (-> flake.css('opacity', 0.5)), 5000
	
	setTimeout moveFlakes, 100

moveFlakes()