Template.postItem.helpers domain: ->
	a = document.createElement 'a'
	a.href = @url
	console.log a
	a.hostname