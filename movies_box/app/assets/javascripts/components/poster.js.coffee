@Poster = React.createClass
  statics: {
    imgHeight: 234,
    imgWidth: 150
  }
  getInitialState: ->
    url: @props.url
    height: @props.height || Poster.imgHeight
    width: @props.width || Poster.imgWidth
  componentDidMount: ->
    @getPoster()
  getPoster:  ->
    if @state.url == null
      # @setState url: '../images/example.jpg'
      @setState url: '../images/posternotfound.png'
    $.ajax
      method: 'GET'
      url: @state.url
      error: () =>
        # @setState url: '../images/example.jpg'
        @setState url: '../images/posternotfound.png'
  render: ->
    React.DOM.img
      className: 'img-responsive'
      src: @state.url
      alt: "#{ @props.title }"
      height: "#{ @state.height }"
      width: "#{ @state.width }"
