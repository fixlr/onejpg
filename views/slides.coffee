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

  respondToKey: (code)->
    key = new Key(code)

    if key.isLeftArrow() && not this.isFirstPosition()
      @back()
    else if key.isRightArrow()
      @forward()

  isFirstPosition: ->
    @position == 1

  setPosition: (newPosition)->
    @position = newPosition
    $('#pos').html(newPosition)

class Key
  constructor: (@code) ->

  isLeftArrow: ->
    (@code == 37)

  isRightArrow: ->
    (@code == 39)

$(document).ready ->
  slide = new Slide(jpg_url, currentPosition)

  $(document).keydown (e)->
    if slide.respondToKey(e.keyCode)
      e.preventDefault()
