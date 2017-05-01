@MoviePreviewCheck = React.createClass
  getDefaultProps: ->
    title: ''
    poster: ''
    imdbID: ''
    year: ''
  handleAddMovie: (e) ->
    @props.handleAddMovie @props.movie.imdbID
  render: ->
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
            React.DOM.small null, ' '+@props.movie.Year
        React.DOM.p null
          React.DOM.a
            className: 'btn btn-default'
            role: 'button'
            onClick: @handleAddMovie
            React.DOM.span
              className: 'glyphicon glyphicon-plus'
