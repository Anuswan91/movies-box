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
    genres: []
    countries: []
    languages: []
    subtitles: []
  setArray: ->
    $.ajax
      method: 'show'
      url: ''
      success: (data) =>
        console.log(data)
        # @setState genres: []
        # countries: []
        # languages: []
        # subtitles: []
  handleView: (e) ->
    e.preventDefault()
    @setState display: 'view'
  handleCompleteView: (e) ->
    e.preventDefault()
    @setState display: 'complete'
  handleEdit: (e) ->
    e.preventDefault()
    @setState display: 'edit'
  movieViewComplete: ->
      React.DOM.h1
        className: 'col-sm-6 col-md-4'
        'Movie COmplete View'
        # TODO create react element
        React.DOM.button
          type: 'button'
          className: 'btn btn-warning'
          onClick: @handleView
          'Cancel'
  movieView: ->
    React.DOM.div
      className: 'col-sm-6 col-md-4'
      React.DOM.div
        className: 'thumbnail'
        React.DOM.a
          href: '/movies/' + @props.movie.id
          React.createElement Poster, title: @props.movie.title, url: @props.movie.image
        React.DOM.div
          className: 'caption'
          React.DOM.h3
            className: 'title movie-preview'
            @props.movie.title
          React.DOM.p
            className: 'movie-preview-desc'
            "Released : #{ @props.movie.released }"
          React.DOM.p
            className: 'movie-preview-desc'
            "Runtime : #{ @props.movie.runtime }min"
          React.DOM.p
            className: 'movie-preview-desc'
            "Rating : #{ @props.movie.rating }"
          React.DOM.p
            className: 'movie-preview-desc'
            "Watched : #{ @props.movie.watched }"
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
  movieEdit: ->
    React.createElement MovieForm, handleToggle: @handleView, handleNewMovie: @addMovie, edit: true, movie: @props.movie, genres: getIdInArray(@props.movie.genres), countries: getIdInArray(@props.movie.countries), genres: getIdInArray(@props.movie.genres), languages: getIdInArray(@props.movie.languages), subtitles: getIdInArray(@props.movie.subtitles), allFormats: @props.allFormats, allGenres: @props.allGenres, allCountries: @props.allCountries, allLanguages: @props.allLanguages, allSubtitles: @props.allSubtitles
  render: ->
    if @state.display == 'edit'
      @movieEdit()
    else if @state.display == 'complete'
      @movieViewComplete()
    else
      @movieView()
