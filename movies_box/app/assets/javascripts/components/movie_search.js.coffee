@MovieSearch = React.createClass
  getInitialState: ->
    title: ''
    released: ''
    runtime: ''
    plot: ''
    rating: ''
    added: ''
    watched: ''
    format_id: ''
    genres: []
    countries: []
    languages: []
    subtitles: []
  getDefaultProps: ->
    allGenres: []
    allCountries: []
    allLanguages: []
    allSubtitles: []
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
    # @handleSearchChange()
  handleChangeArray: (e) ->
    name = e.target.name
    options = []
    for option in e.target.selectedOptions
      options.push(option.value)
    @setState "#{ name }": options
    # @handleSearchChange
  handleSearchChange: (e) ->
    # TODO update all @state
    # console.log(@state)
    e.preventDefault()
    $.ajax
      method: 'GET'
      url: "/search"
      dataType: 'JSON'
      data:
        search: @state
      success: (data) =>
        # console.log(data)
        @props.handleSearch data
  render: ->
    typeVal = 'defaultValue'
    React.DOM.div
      className: 'well well-lg'
      React.DOM.h2
        className: 'title'
        'Search Movie'
        React.DOM.form
          className: 'form-horizontal'
          # onChange: @handleSearchChange
          onSubmit: @handleSearchChange
          formInput('Title', 'title', @state.title, @handleChange, 'text', typeVal, 'form-group')
          formInput('Released', 'released', @state.released, @handleChange, 'date', typeVal, 'form-group')
          formInputNumber('Runtime', 'runtime', @state.runtime, @handleChange, typeVal, 0, 1, 1000, 'form-group')
          formInput('Added', 'added', @state.added, @handleChange, 'date', typeVal, 'form-group')
          formRadioYesNo('Watched', 'watched', @state.watched, @handleChange, typeVal)
          React.DOM.div
            className: 'form-group'
            React.DOM.div
              className: 'col-md-4'
              React.DOM.div
                className: 'form-group row'
                # formMultiSelect('genres', @state.genres, @handleChangeArray, @props.allGenres, true, typeVal, 'col-md-4')
                # formMultiSelect('languages', @state.languages, @handleChangeArray, @props.allLanguages, true, typeVal, 'col-md-4')
                # formMultiSelect('subtitles', @state.subtitles, @handleChangeArray, @props.allSubtitles, true, typeVal, 'col-md-4')
                # formMultiSelect('countries', @state.countries, @handleChangeArray, @props.allCountries, true, typeVal, 'col-md-4')
          formSelect('format_id', @state.format_id, @handleChange, @props.allFormats, typeVal, 'form-group')
          React.DOM.button
            type: 'submit'
            className: 'btn btn-primary'
            onClick: @handleSearchChange
            'Search'
          React.DOM.button
            type: 'button'
            className: 'btn btn-warning'
            onClick: @handleClose
            'Cancel'
          React.DOM.button
            type: 'reset'
            className: 'btn btn-danger'
            'Reset'
