@MovieForm = React.createClass
  getInitialState: ->
    title: @props.movie.title
    released: @props.movie.released
    runtime: @props.movie.runtime
    plot: @props.movie.plot
    rating: @props.movie.rating
    added: @props.movie.added
    watched: @props.movie.watched
    format_id: @props.movie.format_id
    image: @props.movie.image
    genres: @props.genres
    countries: @props.countries
    languages: @props.languages
    subtitles: @props.subtitles
  getDefaultProps: ->
    edit: false
    movie: {title: '', released: '', runtime: '', plot: '', rating: '', added: '', watched: '', format_id: '', image: ''}
    genres: []
    countries: []
    languages: []
    subtitles: []
    allGenres: []
    allCountries: []
    allLanguages: []
    allSubtitles: []
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleChangeArray: (e) ->
    name = e.target.name
    options = []
    for option in e.target.selectedOptions
      options.push(option.value)
    @setState "#{ name }": options
  valid: ->
    # @state.title &&
    # @state.released &&
    # @state.runtime &&
    # @state.plot &&
    # @state.rating &&
    # # @state.added &&
    # @state.watched &&
    # @state.image # TODO add all field
    return true
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { movie: @state }, (data) =>
      @props.handleNewMovie data
      @setState @getInitialState()
    , 'JSON'
  handleEdit: (e) ->
    e.preventDefault()
    $.ajax
      method: 'PUT'
      url: "/movies/#{ @props.movie.id }"
      dataType: 'JSON'
      data:
        movie: @state
      success: (data) =>
        @props.handleEditMovie @state.movie, data, data.genres
      @handleClose(e)
  handleClose: (e) ->
    e.preventDefault()
    @props.handleToggle e
  formEdit: ->
    typeVal = 'defaultValue'
    React.DOM.div
      className: 'well well-lg'
      React.DOM.h1
        className: 'title'
        'Edit'
      React.DOM.form
        className: 'form-block'
        onSubmit: @handleSubmit # TODO enlever
        formInput('Title', 'title', @state.title, @handleChange, 'text', typeVal, 'form-group')
        formMultiSelect('genres', @state.genres, @handleChangeArray, @props.allGenres, true, typeVal, 'form-group')
        formInput('Released', 'released', @state.released, @handleChange, 'date', typeVal, 'form-group')
        formMultiSelect('countries', @state.countries, @handleChangeArray, @props.allCountries, true, typeVal, 'form-group')
        formInputNumber('Runtime', 'runtime', @state.runtime, @handleChange, typeVal, 0, 1, 1000, 'form-group')
        formInput('Poster', 'image', @state.image, @handleChange, 'url', typeVal, 'form-group')
        formTextArea('Plot', 'plot', @state.plot, @handleChange, typeVal)
        formInputNumber('Rating', 'rating', @state.rating, @handleChange, typeVal, 0, 0.1, 10, 'form-group')
        formInput('Added', 'added', @state.added, @handleChange, 'date', typeVal, 'form-group')
        formRadioYesNo('Watched', 'watched', @state.watched, @handleChange, typeVal)
        formMultiSelect('languages', @state.languages, @handleChangeArray, @props.allLanguages, true, typeVal, 'form-group')
        formMultiSelect('subtitles', @state.subtitles, @handleChangeArray, @props.allSubtitles, true, typeVal, 'form-group')
        formSelect('format_id', @state.format_id, @handleChange, @props.allFormats, typeVal, 'form-group')
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          onClick: @handleEdit
          'Submit'
        React.DOM.button
          type: 'button'
          className: 'btn btn-warning'
          onClick: @handleClose
          'Cancel'
  formNew: ->
    typeVal = 'defaultValue'
    React.DOM.div
      className: 'well well-lg'
      React.DOM.h1
        className: 'title'
        'New Movie'
      React.DOM.form
        className: 'form-horizontal'
        onSubmit: @handleSubmit
        formInput('Title', 'title', @state.title, @handleChange, 'text', typeVal, 'form-group')
        formInput('Released', 'released', @state.released, @handleChange, 'date', typeVal, 'form-group')
        formInput('Poster', 'image', @state.image, @handleChange, 'url', typeVal, 'form-group')
        formTextArea('Plot', 'plot', @state.plot, @handleChange, typeVal)
        formInputNumber('Rating', 'rating', @state.rating, @handleChange, typeVal, 0, 0.1, 10, 'form-group')
        formInputNumber('Runtime', 'runtime', @state.runtime, @handleChange, typeVal, 0, 1, 1000, 'form-group')
        formInput('Added', 'added', @state.added, @handleChange, 'date', typeVal, 'form-group')
        formRadioYesNo('Watched', 'watched', @state.watched, @handleChange, typeVal)
        React.DOM.div
          className: 'form-group'
          React.DOM.div
            className: 'col-md-4'
            React.DOM.div
              className: 'form-group row'
              formMultiSelect('genres', @state.genres, @handleChangeArray, @props.allGenres, true, typeVal, 'col-md-4')
              formMultiSelect('languages', @state.languages, @handleChangeArray, @props.allLanguages, true, typeVal, 'col-md-4')
              formMultiSelect('subtitles', @state.subtitles, @handleChangeArray, @props.allSubtitles, true, typeVal, 'col-md-4')
              formMultiSelect('countries', @state.countries, @handleChangeArray, @props.allCountries, true, typeVal, 'col-md-4')
        formSelect('format_id', @state.format_id, @handleChange, @props.allFormats, typeVal, 'form-group')
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Submit'
  render: ->
    if @props.edit
      @formEdit()
    else
      @formNew()
