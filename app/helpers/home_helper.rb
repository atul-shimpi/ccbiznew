module HomeHelper
	def offset_class(value)
		return value.odd? ? "col-lg-offset-1" : ""
	end
end
