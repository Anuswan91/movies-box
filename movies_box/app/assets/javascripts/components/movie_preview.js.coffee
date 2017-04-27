@MoviePreview = React.createClass
  getDefaultProps: ->
    # movies: []
    allFormats: []
    allGenres: []
    allCountries: []
    allLanguages: []
    allSubtitles: []
  getInitialState: ->
    display: 'view'
    movie: @props.movie
    genres: []
    countries: []
    languages: []
    subtitles: []
  handleView: (e) ->
    e.preventDefault()
    @setState display: 'view'
  handleCompleteView: (e) ->
    e.preventDefault()
    @setState display: 'complete'
  handleEdit: (e) ->
    e.preventDefault()
    @setState display: 'edit'
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/movies/#{ @props.movie.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteMovie @props.movie
  editMovie: (movie, data) ->
    # @replaceState movie: data
    # console.log(movie, data)
    @props.handleEditMovie movie, data
  movieViewComplete: ->
    React.createElement MovieComplete, handleToggle: @handleView, movie: @state.movie, genres: @state.movie.genres, countries: @state.movie.countries, languages: @state.movie.languages, subtitles: @state.movie.subtitles
  movieView: ->
    React.DOM.div
      className: 'col-sm-6 col-md-4'
      React.DOM.div
        className: 'thumbnail'
        React.DOM.a
          React.createElement Poster, title: @state.movie.title, url: @props.movie.image
        React.DOM.div
          className: 'caption'
          React.DOM.h3
            className: 'title movie-preview'
            @state.movie.title
          React.DOM.p
            className: 'movie-preview-desc'
            "Released : #{ @state.movie.released }"
          React.DOM.p
            className: 'movie-preview-desc'
            "Runtime : #{ @state.movie.runtime }min"
          React.DOM.p
            className: 'movie-preview-desc'
            "Rating : #{ @state.movie.rating }"
          React.DOM.p
            className: 'movie-preview-desc'
            "Watched : #{ @state.movie.watched }"
          React.DOM.p, null
            React.DOM.a
              className: 'btn btn-primary btn-block'
              role: 'button'
              onClick: @handleCompleteView
              React.DOM.span
                className: 'glyphicon glyphicon-eye-open'
            React.DOM.a
              className: 'btn btn-default btn-block'
              role: 'button'
              onClick: @handleEdit
              React.DOM.span
                className: 'glyphicon glyphicon-pencil'
            React.DOM.a
              className: 'btn btn-danger btn-block'
              role: 'button'
              onClick: @handleDelete
              React.DOM.span
                className: 'glyphicon glyphicon-trash'
  movieEdit: ->
    React.createElement MovieForm, handleToggle: @handleView, handleEditMovie: @editMovie, edit: true, movie: @props.movie, genres: getIdInArray(@props.movie.genres), countries: getIdInArray(@props.movie.countries), genres: getIdInArray(@props.movie.genres), languages: getIdInArray(@props.movie.languages), subtitles: getIdInArray(@props.movie.subtitles), allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
  render: ->
    if @state.display == 'edit'
      @movieEdit()
    else if @state.display == 'complete'
      @movieViewComplete()
    else
      @movieView()
