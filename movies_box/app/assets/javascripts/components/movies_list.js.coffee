@MoviesList = React.createClass
  getInitialState: ->
    movies: @props.data
  getDefaultProps: ->
    movies: []
    allFormats: []
    allGenres: []
    allCountries: []
    allLanguages: []
    allSubtitles: []
  addMovie: (movie) ->
    movies = React.addons.update(@state.movies, { $push: [movie] })
    @setState movies: movies
  deleteMovie: (movie) ->
    index = @state.movies.indexOf movie
    movies = React.addons.update(@state.movies, { $splice: [[index, 1]] })
    @replaceState movies: movies
  render: ->
    React.DOM.div
      className: 'movies-list'
      React.DOM.h1
        className: 'title movies-list'
        'List Movies'
      React.createElement MovieForm, handleNewMovie: @addMovie, allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
      React.DOM.div
        className: 'row'
        for movie in @state.movies
          React.createElement MoviePreview, key: movie.id, handleDeleteMovie: @deleteMovie, movie: movie, allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
