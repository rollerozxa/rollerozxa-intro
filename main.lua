
resolution = {
	x = 1280,
	y = 720
}

step = 0
running = false

require("util")

function love.load()
	love.window.setMode(resolution.x, resolution.y, { resizable = false })

	assets = {
		intro = NewImage("intro"),
		intro_inv = NewImage("intro_inv"),
	}
end

function love.update()
	if love.keyboard.isDown('p') then
		running = true
	end
end

int_alpha = 1
inv_alpha = 0

inv_y = 0

function love.draw()
	if running then
		step = step + 1
	end

	if (24 < step) and (step < 38) then
		int_alpha = int_alpha - (1 / 13)
	end
	if (38 < step) and (step <= 52) then
		inv_alpha = inv_alpha + (1 / 14)
	end

	if step > 100 then
		inv_y = math.lerp(inv_y, -resolution.y*1.5, 0.05)
	end

	if inv_alpha > 0.9999 then
		love.graphics.setColor(0,0,1,1)
		love.graphics.rectangle("fill", 0, 0, resolution.x, resolution.y)
	end

	love.graphics.setColor(1,1,1,int_alpha)
	love.graphics.draw(assets.intro, 0, 0)
	love.graphics.setColor(1,1,1,inv_alpha)
	love.graphics.draw(assets.intro_inv, 0, inv_y)

	love.graphics.setColor(1,0,0,1)
	love.graphics.print("FPS: "..love.timer.getFPS()..", step: "..step..", inv_alpha: "..inv_alpha..", int_alpha: "..int_alpha, 5, 10)
end
