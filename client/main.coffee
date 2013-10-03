@postsHandle = Meteor.subscribeWithPagination('newPosts', 5)

Deps.autorun ->
  Meteor.subscribe "singlePost", Session.get("currentPostId")
  Meteor.subscribe "comments", Session.get("currentPostId")

Meteor.subscribe('notifications')


 