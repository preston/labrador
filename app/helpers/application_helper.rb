module ApplicationHelper
	
	def redact_text(text)
		t = text.gsub(/[a-z]/, 'x').gsub(/[A-Z]/, 'X').gsub(/[$,-:;]/,'')
		t = '<span class="redacted">' + t + '</span>'
		t.html_safe
	end

	def yes_or_no(b)
	b ? 'Yes' : 'No'
	end

	def text_with_icon(text, icon)
		"<i class=\"icon icon-#{icon}\"></i> #{text}".html_safe
	end

	def icon(icon)
		"<i class=\"icon icon-#{icon}\"></i>".html_safe
	end

end
