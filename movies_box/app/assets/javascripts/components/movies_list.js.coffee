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
    # movies = @state.movies.slice()
    # movies.push movie
    # @setState movies: movies
    movies = React.addons.update(@state.movies, { $push: [movie] })
    @setState movies: movies
  render: ->
    React.DOM.div
      className: 'movies-list'
      React.DOM.h1
        className: 'title movies-list'
        'List Movies'
      # React.createElement MovieForm, handleNewMovie: @addMovie, formats: @props.allFormats, genres: @props.allGenres, countries: @props.allCountries, languages: @props.allLanguages, subtitles: @props.allSubtitles
      React.DOM.div
        className: 'row'
        for movie in @state.movies
          React.createElement MoviePreview, key: movie.id, movie: movie, allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
