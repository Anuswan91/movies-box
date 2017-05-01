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
  editMovie: (movie, data) ->
    index = @state.movies.indexOf movie
    movies = React.addons.update(@state.movies, { $splice: [[index, 1, data]] })
    @replaceState movies: movies
  filterMovies: (movies) ->
    @replaceState movies: movies
  render: ->
    React.DOM.div
      className: 'movies-list'
      React.createElement Notification, null
      React.createElement MovieForm, handleNewMovie: @addMovie, allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
      React.createElement MovieSearch, handleSearch: @filterMovies, allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
      React.createElement MovieAddAPI, handleNewMovie: @addMovie
      React.DOM.div
        className: 'jumbotron'
        React.DOM.div
          className: 'row'
          React.DOM.h2
            className: 'title movies-list'
            'List Movies'
          for movie in @state.movies
            React.createElement MoviePreview, key: movie.id, handleDeleteMovie: @deleteMovie, handleEditMovie: @editMovie, movie: movie, allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
