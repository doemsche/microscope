@Errors = new Meteor.Collection(null)

@throwError = (message) ->
	Errors.insert message: message, seen:false

@clearErrors = ->
	console.log 'errors cleared'
	Errors.remove seen: true

Template.errors.helpers
	errors: ->
		Errors.find()

Template.error.rendered = ->
	error = @data
	Meteor.defer ->
		Errors.update error._id
				$set:
					seen: true