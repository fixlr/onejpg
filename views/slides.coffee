class Slide
  constructor: (@url, @position) ->
    this.show()

  back: ->
    @setPosition(@position - 1)
    this.show()

  forward: ->
    @setPosition(@position + 1)
    this.show()

  show: ->
    $('#slides').html("<img src=\"#{@url}/#{@position}.jpg\" />")

  respondToKey: (key)->
    if @position > 1 && key == 37
      @back()
    else if key == 39
      @forward()

  setPosition: (newPosition)->
    @position = newPosition
    $('#pos').html(newPosition)

$(document).ready ->
  slide = new Slide(jpg_url, currentPosition)

  $(document).keydown (e)->
    if slide.respondToKey(e.keyCode)
      e.preventDefault()
