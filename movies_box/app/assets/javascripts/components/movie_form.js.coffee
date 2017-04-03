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
    movie: {title: '', released: '', runtime: '46', plot: 'sfdsfsd', rating: '3.2', added: '2017-02-28', watched: 'false', format_id: '', image: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjI1MjkzMjczMV5BMl5BanBnXkFtZTgwNDk4NjYyMTI@._V1_SX300.jpg'}
    genres: []
    countries: []
    languages: []
    subtitles: []
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleChangeGenres: (e) ->
    @setState genres: setArray(@state.genres, e.target.value)
  handleChangeCountries: (e) ->
    @setState countries: setArray(@state.countries, e.target.value)
  handleChangeLanguages: (e) ->
    @setState languages: setArray(@state.languages, e.target.value)
  handleChangeSubtitles: (e) ->
    @setState subtitles: setArray(@state.subtitles, e.target.value)
  valid: ->
    @state.title && @state.released && @state.runtime && @state.plot && @state.rating && @state.added && @state.watched && @state.image # TODO add all field
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { movie: @state }, (data) =>
      @props.handleNewMovie data
      @setState @getInitialState()
    , 'JSON'
  handleClose: (e) ->
    e.preventDefault()
    @props.handleToggle e
  formEdit: ->
    typeVal = 'defaultValue'
    React.DOM.h1
      className: 'title'
      'Edit'
      React.DOM.form
        className: 'form-block'
        onSubmit: @handleSubmit
        formInput('Title', 'title', @state.title, @handleChange, 'text', typeVal)
        formMultiSelect('genres', @state.genres, @handleChangeGenres, @props.allGenres, true, typeVal)
        formInput('Released', 'released', @state.released, @handleChange, 'date', typeVal)
        formMultiSelect('countries', @state.countries, @handleChangeCountries, @props.allCountries, true, typeVal)
        formInputNumber('Runtime', 'runtime', @state.runtime, @handleChange, typeVal, 0, 1, 1000)
        formInput('Poster', 'image', @state.image, @handleChange, 'url', typeVal)
        formTextArea('Plot', 'plot', @state.plot, @handleChange, typeVal)
        formInputNumber('Rating', 'rating', @state.rating, @handleChange, typeVal, 0, 0.1, 10)
        formInput('Added', 'added', @state.added, @handleChange, 'date', typeVal)
        React.DOM.fieldset
          className: 'form-group row'
          React.DOM.legend
            className: 'col-form-legend col-sm-2'
            'Watched'
            React.DOM.div
              className: 'col-sm-10'
            React.DOM.div
              className: 'form-check'
              React.DOM.label
                className: 'form-check-label'
                React.DOM.input
                  type: 'radio'
                  className: 'form-check-input'
                  name: 'watched'
                  "#{typeVal}": 'true'
                  onChange: @handleChange
                ' '
                React.DOM.span
                  className: 'glyphicon glyphicon-eye-open'
            React.DOM.div
              className: 'form-check'
              React.DOM.label
                className: 'form-check-label'
                React.DOM.input
                  type: 'radio'
                  className: 'form-check-input'
                  name: 'watched'
                  "#{typeVal}": 'false'
                  onChange: @handleChange
                ' '
                React.DOM.span
                  className: 'glyphicon glyphicon-eye-close'
        formMultiSelect('languages', @state.languages, @handleChangeLanguages, @props.allLanguages, true, typeVal)
        formMultiSelect('subtitles', @state.subtitles, @handleChangeubtitles, @props.allSubtitles, true, typeVal)
        formSelect('format_id', @state.format_id, @handleChange, @props.allFormats, typeVal)
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Submit'
        React.DOM.button
          type: 'button'
          className: 'btn btn-warning'
          onClick: @handleClose
          'Cancel'
  formNew: ->
    typeVal = 'defaultValue'
    React.DOM.h1
      className: 'title'
      'New Movie'
      React.DOM.form
        className: 'form-block'
        onSubmit: @handleSubmit
        formInput('Title', 'title', @state.title, @handleChange, 'text', typeVal)
        formMultiSelect('genres', @state.genres, @handleChangeGenres, @props.allGenres, true, typeVal)
        formInput('Released', 'released', @state.released, @handleChange, 'date', typeVal)
        formMultiSelect('countries', @state.countries, @handleChangeCountries, @props.allCountries, true, typeVal)
        formInputNumber('Runtime', 'runtime', @state.runtime, @handleChange, typeVal, 0, 1, 1000)
        formInput('Poster', 'image', @state.image, @handleChange, 'url', typeVal)
        formTextArea('Plot', 'plot', @state.plot, @handleChange, typeVal)
        formInputNumber('Rating', 'rating', @state.rating, @handleChange, typeVal, 0, 0.1, 10)
        formInput('Added', 'added', @state.added, @handleChange, 'date', typeVal)
        React.DOM.fieldset
          className: 'form-group row'
          React.DOM.legend
            className: 'col-form-legend col-sm-2'
            'Watched'
            React.DOM.div
              className: 'col-sm-10'
            React.DOM.div
              className: 'form-check'
              React.DOM.label
                className: 'form-check-label'
                React.DOM.input
                  type: 'radio'
                  className: 'form-check-input'
                  name: 'watched'
                  "#{typeVal}": 'true'
                  onChange: @handleChange
                ' '
                React.DOM.span
                  className: 'glyphicon glyphicon-eye-open'
            React.DOM.div
              className: 'form-check'
              React.DOM.label
                className: 'form-check-label'
                React.DOM.input
                  type: 'radio'
                  className: 'form-check-input'
                  name: 'watched'
                  "#{typeVal}": 'false'
                  onChange: @handleChange
                ' '
                React.DOM.span
                  className: 'glyphicon glyphicon-eye-close'
        formMultiSelect('languages', @state.languages, @handleChangeLanguages, @props.allLanguages, true, typeVal)
        formMultiSelect('subtitles', @state.subtitles, @handleChangeubtitles, @props.allSubtitles, true, typeVal)
        formSelect('format_id', @state.format_id, @handleChange, @props.allFormats, typeVal)
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
