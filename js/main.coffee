win = $ window
winWidth = win.width()
winHeight = win.height()

unicodeFlakes = ['&#x2744', '&#x2745', '&#x2746']
delay = 0

createFlake = (container) -> 
	
	unicodeFlake = unicodeFlakes[Math.floor(Math.random() * unicodeFlakes.length)]
	
	flake = $ '<div class="snowflake" data-size="' + (Math.floor(Math.random() * 4) + 1) + '">' + unicodeFlake + '</div>' 
	
	flake.css
		position: 'absolute'
		top: Math.floor(Math.random() * winHeight)
		left: Math.floor(Math.random() * winWidth)
		opacity: 0
		# Reinstate when Firefox doesn't freak out
		#transform: "rotate(#{Math.floor(Math.random() * 360)}deg)"
	
	container.append flake
	
	delay += 100
	
	setTimeout (-> flake.css('opacity', 0.5)), delay

createContainer = -> $ '<div class="snowflakes"/>'

containers = [createContainer(), createContainer()]
containerTop = 0

main = $ '#main'

for container in containers
	
	container.css
		position: 'absolute'
		top: containerTop
		left: 0
		width: winWidth,
		height: winHeight
	
	containerTop -= winHeight
	
	createFlake(container) for i in [0..30]
	
	main.append container

(moveContainers = ->
	
	for container in containers
		
		currentTop = parseInt(container.css 'top')
		
		container.css(top: (if currentTop >= winHeight then -winHeight else currentTop + 1))
	
	setTimeout moveContainers, 100
)()