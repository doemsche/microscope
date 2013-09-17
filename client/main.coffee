Meteor.subscribe('posts')

Deps.autorun ->
	#console.log 'there are' +  Posts.find().count()+ ' posts'

 