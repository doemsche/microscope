@Posts = new Meteor.Collection("posts")

Posts.allow
  update: ownsDocument
  remove: ownsDocument

Posts.deny
  update: (userId, post, fieldNames) ->
    _.without(fieldNames, "url", "title").length > 0


Meteor.methods post: (postAttributes) ->
  user = Meteor.user()
  postWithSameLink = Posts.findOne(url: postAttributes.url)
  
  # ensure the user is logged in
  throw new Meteor.Error(401, "You need to login to post new stories")  unless user
  
  # ensure the post has a title
  throw new Meteor.Error(422, "Please fill in a headline")  unless postAttributes.title
  
  # check that there are no previous posts with the same link
  throw new Meteor.Error(302, "This link has already been posted", postWithSameLink._id)  if postAttributes.url and postWithSameLink
  
  # pick out the whitelisted keys
  post = _.extend(_.pick(postAttributes, "url", "title", "message"),
    userId: user._id
    author: user.username
    submitted: new Date().getTime()
    commentsCount: 0
  )
  postId = Posts.insert(post)
  postId
