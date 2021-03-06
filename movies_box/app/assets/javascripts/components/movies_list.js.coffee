@MoviesList = React.createClass
  getInitialState: ->
    movies: @props.data
    notification: ''
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
    @setState notification: 'add'
  deleteMovie: (movie) ->
    index = @state.movies.indexOf movie
    movies = React.addons.update(@state.movies, { $splice: [[index, 1]] })
    @replaceState movies: movies
    @setState notification: 'delete'
  editMovie: ->
    console.log('edit')
    @setState notification: 'edit'
  filterMovies: (movies) ->
    @replaceState movies: movies
  renderNotification: ->
    if @state.notification != '' && @state.notification != undefined
      React.createElement Notification, type: @state.notification
  render: ->
    React.DOM.div
      className: 'movies-list'
      @renderNotification()
      React.createElement MovieForm, handleNewMovie: @addMovie, allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
      React.createElement MovieSearch, handleSearch: @filterMovies, allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
      React.createElement MovieAddAPI, handleNewMovie: @addMovie, allGenres: @props.allGenres
      React.DOM.div
        className: 'jumbotron'
        React.DOM.div
          className: 'row'
          React.DOM.h2
            className: 'title movies-list'
            'List Movies'
          for movie in @state.movies
            React.createElement MoviePreview, key: movie.id, handleDeleteMovie: @deleteMovie, handleEditMovie: @editMovie, movie: movie, allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
