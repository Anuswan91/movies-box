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
    genres: @props.movie.genres
    countries: @props.movie.countries
    languages: @props.movie.languages
    subtitles: @props.movie.subtitles
  getDefaultProps: ->
    edit: false
    # movie:{ title: '' }
    # movie:{ released: '1995-11-11' }
    # movie:{ runtime: '46' }
    # movie:{ plot: 'sfdsfsd' }
    # movie:{ rating: '3.2' }
    # movie:{ added: '2017-02-28' }
    # movie:{ watched: 'false' }
    # movie:{ format_id: [] }# '2'
    # movie:{ image: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjI1MjkzMjczMV5BMl5BanBnXkFtZTgwNDk4NjYyMTI@._V1_SX300.jpg' }
    # movie:{ genres: [2,5,6] }
    # movie:{ countries: [] }
    # movie:{ languages: [] }
    # movie:{ subtitles: [] }
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
    @state.title && @state.released && @state.runtime && @state.plot && @state.rating && @state.added && @state.watched && @state.format_id && @state.image # TODO add all field
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { movie: @state }, (data) =>
      console.log(@state)
      console.log(data)
      @props.handleNewMovie data
      @setState @getInitialState()
    , 'JSON'
  formInput: (placeholder, name, value, type, min, typeVal) ->
    # console.log(name, value, @props)
    React.DOM.div
      className: 'form-group'
      React.DOM.input
        type: type
        className: 'form-control'
        placeholder: placeholder
        name: name
        value: value
        onChange: @handleChanges
  formSelect: (name, value, onChange, array, mutliple, typeVal) ->
    # console.log(name, value)
    React.DOM.div
      className: 'form-group'
      React.DOM.select
        multiple: "#{ mutliple }"
        className: 'form-control'
        name: name
        value: value
        onChange: onChange
        for element in array
          React.DOM.option
            key: element.id
            value: element.id
            element.name
  formEdit: ->
    React.DOM.h1
      className: 'title'
      'Edit'
      React.DOM.form
        className: 'form-block'
        onSubmit: @handleSubmit
        @formInput('Title', 'title', @state.title, 'text', 'defaultValue')
        @formSelect('genres', @state.genres, @handleChangeGenres, @props.genres, true, 'defaultValue')
        @formInput('Released', 'released', @state.released, 'date', 'defaultValue')
        @formSelect('countries', @state.countries, @handleChangeCountries, @props.countries, true, 'defaultValue')
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            min: '0'
            className: 'form-control'
            placeholder: 'Runtime'
            name: 'runtime'
            value: @state.runtime
            onChange: @handleChange
        @formInput('Poster', 'image', @state.image, 'url', 'defaultValue')
        React.DOM.div
          className: 'form-group'
          React.DOM.textarea
            className: 'form-control'
            placeholder: 'Plot'
            name: 'plot'
            value: @state.plot
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            min: '0'
            max: '10'
            step: '0.1'
            className: 'form-control'
            placeholder: 'Rating'
            name: 'rating'
            value: @state.rating
            onChange: @handleChange
        @formInput('Added', 'added', @state.added, 'date', 'defaultValue')
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
                  # id: 'optionsRadios1'
                  value: 'true'
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
                  # id: 'optionsRadios2'
                  value: 'false'
                  onChange: @handleChange
                ' '
                React.DOM.span
                  className: 'glyphicon glyphicon-eye-close'
        @formSelect('languages', @state.languages, @handleChangeLanguages, @props.languages, true, 'defaultValue')
        @formSelect('subtitles', @state.subtitles, @handleChangeSubtitles, @props.subtitles, true, 'defaultValue')
        @formSelect('format_id', @state.format_id, @handleChange, @props.formats, false, 'defaultValue')
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Submit'
        # React.DOM.button
        #   type: 'submit'
        #   className: 'btn btn-warning'
        #   onClick: @handleToggle
        #   'Cancel'
  formNew: ->
      React.DOM.h1
        className: 'title'
        'New Movie'
        React.DOM.form
          className: 'form-block'
          onSubmit: @handleSubmit
          @formInput('Title', 'title', @state.title, 'value')
          @formSelect('genres', @state.genres, @handleChangeGenres, @props.genres, true, 'value')
          @formInput('Released', 'released', @state.released, 'date', 'value')
          @formSelect('countries', @state.countries, @handleChangeCountries, @props.countries, true, 'value')
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'number'
              min: '0'
              className: 'form-control'
              placeholder: 'Runtime'
              name: 'runtime'
              value: @state.runtime
              onChange: @handleChange
          @formInput('Poster', 'image', @state.image, 'url', 'value')
          React.DOM.div
            className: 'form-group'
            React.DOM.textarea
              className: 'form-control'
              placeholder: 'Plot'
              name: 'plot'
              value: @state.plot
              onChange: @handleChange
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'number'
              min: '0'
              max: '10'
              step: '0.1'
              className: 'form-control'
              placeholder: 'Rating'
              name: 'rating'
              value: @state.rating
              onChange: @handleChange
          @formInput('Added', 'added', @state.added, 'date', 'value')
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
                    value: 'true'
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
                    value: 'false'
                    onChange: @handleChange
                  ' '
                  React.DOM.span
                    className: 'glyphicon glyphicon-eye-close'
          @formSelect('languages', @state.languages, @handleChangeLanguages, @props.languages, true, 'value')
          @formSelect('subtitles', @state.subtitles, @handleChangeSubtitles, @props.subtitles, true, 'value')
          @formSelect('format_id', @state.format_id, @handleChange, @props.formats, false, 'value')
          React.DOM.button
            type: 'submit'
            className: 'btn btn-primary'
            disabled: !@valid()
            'Submit'
  render: ->
    console.log(@props.movie)
    if @props.edit
      @formEdit()
    else
      @formNew()
