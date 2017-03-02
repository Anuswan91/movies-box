@MoviesList = React.createClass
  getInitialState: ->
    movies: @props.data
  getDefaultProps: ->
    movies: []
  render: ->
    React.DOM.div
      className: 'movies-list'
      React.DOM.h1
        className: 'title movies-list'
        'List Movies'
      React.DOM.div
        className: 'row'
        for movie in @state.movies
          React.createElement MoviePreview, key: movie.id, movie: movie
