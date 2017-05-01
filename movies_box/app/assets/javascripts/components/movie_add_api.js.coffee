@MovieAddAPI = React.createClass
  getInitialState: ->
    searchName: ''
    movies: []
    movie: null
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleCheck: (e) ->
    e.preventDefault()
    $.get
      url: "http://www.omdbapi.com/?s="+@state.searchName+"&type=movie&r=json"
      success: (data) =>
        console.log(data)
        array = data.Search
        @replaceState movies: array
      error: =>
        # console.log("not found")
  handleAddMovie: (imdbID) ->
    $.get
      url: "http://www.omdbapi.com/?i="+imdbID
      success: (data) =>
        @setState movie: convertDataFromAPI(data)
        @addMovie()
      error: =>
        console.log("not found")
  addMovie: ->
    $.post '', { movie: @state.movie }, (data) =>
      @props.handleNewMovie data
    , 'JSON'
  render: ->
    typeVal = 'defaultValue'
    React.DOM.div
      className: 'well well-lg'
      React.DOM.h2
        className: 'title'
        'Add Movie with API'
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSearchChange
        formInput('Title', 'searchName', @state.searchName, @handleChange, 'text', typeVal, 'form-group')
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          onClick: @handleCheck
          'Check'
        React.DOM.div
          className: 'movies-list-check'
          React.DOM.div
            className: 'row'
            for movie in @state.movies
              React.createElement MoviePreviewCheck, key: movie.imdbID, handleAddMovie: @handleAddMovie, movie: movie
