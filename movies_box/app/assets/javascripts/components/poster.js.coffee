@Poster = React.createClass
  getInitialState: ->
    url: @props.url
  getPoster:  ->
    src = 'test'
    $.ajax
      method: 'GET'
      url: @state.url
      error: () =>
        src = '../images/example.jpg'
        @setState url: src
  render: ->
    @getPoster()
    React.DOM.img
      className: 'img-responsive'
      src: @state.url
      alt: "#{ @props.title }"
      # height: '150'
      # width: '150'
