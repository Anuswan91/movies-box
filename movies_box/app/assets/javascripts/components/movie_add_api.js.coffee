@MovieAddAPI = React.createClass
  getInitialState: ->
    searchName: ''
    # movie: null
    movies: []
  getDefaultProps: ->

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleCheck: (e) ->
    e.preventDefault()
    # console.log("http://www.omdbapi.com/?s="+@state.searchName)
    $.get
      url: "http://www.omdbapi.com/?s="+@state.searchName+"&type=movie&r=json"
      success: (data) =>
        console.log(data)
        array = data.Search
        # TODO modifer chaque movie pour aller dans le bon format
        @replaceState movies: array
      error: =>
        # console.log("not found")
  render: ->
    typeVal = 'defaultValue'
    React.DOM.h1
      className: 'title'
      'Check Movie'
      React.DOM.form
        className: 'form-horizontal'
        # onChange: @handleSearchChange
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
            React.createElement MoviePreviewCheck, key: movie.imdbID, movie: movie
