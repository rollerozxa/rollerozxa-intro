
function NewImage(filename)
	return love.graphics.newImage(filename..".png")
end

function Obj(x,y,w,h)
	return {
		x = x,
		y = y,
		size = {
			x = w,
			y = h
		}
	}
end
