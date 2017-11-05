App.line = App.cable.subscriptions.create "LineChannel",

  received: (data) ->
    @appendLine(data)
 
  appendLine: (data) ->
    html = @createLine(data)
    $('.group_cart_menu').append(html)
 
  createLine: (data) ->
    """
    <article class="chat-line">
      <span class="speaker">-----</span>
      <span class="body">==========</span>
    </article>
    """






#  connected: ->
    # Called when the subscription is ready for use on the server

#  disconnected: ->
    # Called when the subscription has been terminated by the server

#  received: (data) ->
    # Called when theres incoming data on the websocket for this channel

