Template.postItem.helpers
	domain: ->
		a = document.createElement 'a'
		a.href = @url
		a.hostname

	ownPost: ->
		@userId == Meteor.userId()

	upvotedClass: ->
		userId = Meteor.userId()
		if userId and not _.include(@upvoters, userId)
			'btn-primary upvotable'
		else
			'disbaled'


Template.postItem.events
	'click .upvotable': (e) ->
		e.preventDefault()
		console.log @._id
		Meteor.call 'upvote', @._id
