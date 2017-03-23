@NewMovieForm = React.createClass
  getInitialState: ->
    title: ''
    released: '1995-11-11'
    runtime: '46'
    plot: 'sfdsfsd'
    rating: '3.2'
    added: '2017-02-28'
    watched: 'false'
    format_id: '2'
    image: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjI1MjkzMjczMV5BMl5BanBnXkFtZTgwNDk4NjYyMTI@._V1_SX300.jpg'
    genres: [3,7,10]
    countries: [5,2,3]
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleChangeGenres: (e) ->
    genres = @state.genres # TODO make a function which do this step
    newValue = e.target.value
    if genres.includes( newValue )
      genres.splice( genres.indexOf( newValue ), 1 )
      @setState genres: genres
    else
      genres.push( newValue )
      @setState genres: genres
  handleChangeCountries: (e) ->
    countries = @state.countries
    newValue = e.target.value
    if countries.includes( newValue )
      countries.splice( countries.indexOf( newValue ), 1 )
      @setState countries: countries
    else
      countries.push( newValue )
      @setState countries: countries
  valid: ->
    @state.title && @state.released && @state.runtime && @state.plot && @state.rating && @state.added && @state.watched && @state.format_id && @state.image
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/movies#create', { movie: @state }, (data) =>
      console.log(@state)
      console.log(data)
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.h1
      className: 'title'
      'New Movie'
      React.DOM.form
        className: 'form-block'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Title'
            name: 'title'
            value: @state.title
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.select
            multiple: 'true'
            className: 'form-control'
            name: 'genres'
            value: @state.genres
            onChange: @handleChangeGenres
            for genre in @props.genres
              React.DOM.option
                key: genre.id
                value: genre.id
                genre.name
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'date'
            className: 'form-control'
            placeholder: 'Released'
            name: 'released'
            value: @state.released
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.select
            multiple: 'true'
            className: 'form-control'
            name: 'countries'
            value: @state.countries
            onChange: @handleChangeCountries
            for country in @props.countries
              React.DOM.option
                key: country.id
                value: country.id
                country.name
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
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'url'
            className: 'form-control'
            placeholder: 'Poster'
            name: 'image'
            value: @state.image
            onChange: @handleChange
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
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'date'
            className: 'form-control'
            placeholder: 'Added'
            name: 'added'
            value: @state.added
            onChange: @handleChange
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
        React.DOM.div
          className: 'form-group'
          React.DOM.select
            className: 'form-control'
            name: 'format_id'
            value: @state.format_id
            onChange: @handleChange
            for format in @props.formats
              React.DOM.option
                key: format.id
                value: format.id
                format.name
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Submit'
