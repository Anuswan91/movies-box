@Poster = React.createClass
  statics: {
    imgHeight: 150,
    imgWidth: 150
  }
  getPoster:  ->
    # src = 'test'
    # $.ajax
    #   method: 'GET'
    #   url: @state.url
    #   error: () =>
    #     @setState url: '../images/example.jpg'
    return '../images/example.jpg'
  getInitialState: ->
    url: @getPoster()#@props.url
    height: @props.height || Poster.imgHeight
    width: @props.width || Poster.imgWidth

  render: ->
    React.DOM.img
      className: 'img-responsive'
      src: @state.url
      alt: "#{ @props.title }"
      height: "#{ @state.height }"
      width: "#{ @state.width }"
