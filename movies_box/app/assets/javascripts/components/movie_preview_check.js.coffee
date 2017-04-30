@MoviePreviewCheck = React.createClass
  getDefaultProps: ->
    title: ''
    poster: ''
    imdbID: ''
  render: ->
    console.log(@props.movie)
    React.DOM.div
      className: 'col-sm-6 col-md-4'
      React.DOM.div
        className: 'thumbnail'
        React.DOM.a
          React.createElement Poster, title: @props.movie.Title, url: @props.movie.Poster
        React.DOM.div
          className: 'caption'
          React.DOM.h3
            className: 'title movie-preview'
            @props.movie.Title
