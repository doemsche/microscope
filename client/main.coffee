Meteor.subscribe('posts')
Meteor.subscribe('comments')

Deps.autorun ->
	#console.log 'there are' +  Posts.find().count()+ ' posts'

 