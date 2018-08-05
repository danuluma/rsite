jQuery(document).on 'turbolinks:load', ->
  comments = $("#comments")


  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "BlogsChannel"
      blog_id: comments.data("blog-id")
      },
      connected: -> 

      disconnected: ->

      received: (data) ->
        comments.append data["comment"]
        
      send_comment: (comment, blog_id) ->
        @perform "send_comment", comment: comment, blog_id: blog_id
      $("#new_comment").submit (event) ->
        $this = $(this)
        textarea = $this.find("#comment_content")
        if $.trim(textarea.val()).length > 1
          App.global_chat.send_comment textarea.val(), comments.data('blog-id')
          textarea.val('')
          event.preventDefault()
          return false

# App.global_chat = App.cable.subscriptions.create {
#   channel: "BlogsChannel"
#   blog_id: comments.data("blog-id")
#   },
#   connected: ->
#     # Called when the subscription is ready for use on the server

#     disconnected: ->
#     # Called when the subscription has been terminated by the server

#     received: (data) ->
#       unless data.content.blank?
#         $('#messages-table').append '<div class="message">' +
#           '<div class="message-user">' + data.username + ":" + '</div>' +
#             '<div class="message-content">' + data.content + '</div>' + '</div>'
#               scroll_bottom()

#               $(document).on 'turbolinks:load', ->
#                 submit_message()
#                 scroll_bottom()

#                 submit_message = () ->

#                    $("#new_comment").submit (event) ->
#                 $this = $(this)
#                 textarea = $this.find("#comment_content")
#                 if $.trim(textarea.val()).length > 1
#                   App.global_chat.send_comment textarea.val(), comments.data('blog-id')
#                   textarea.val('')
#                   event.preventDefault()

#                   # $('#message_content').on 'keydown', (event) ->
#                   #   if event.keyCode is 13
#                   #     $('input').click()
#                   #     event.target.value = ""
#                   #     event.preventDefault()