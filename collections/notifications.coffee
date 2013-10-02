@Notifications = new Meteor.Collection('notifications')

Notifications.allow
	update: ownsDocument

@createCommentNotificaion = (comment) ->
	post = Posts.findOne(comment.postId)
	if comment.userId isnt post.userId
		Notifications.insert
			userId: post.userId
			postId: post._id
			commentId: comment._id
			commenterName: comment.author
			read: false