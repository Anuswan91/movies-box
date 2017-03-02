@NewMovieForm = React.createClass
  getInitialState: ->
    title: ''
    released: ''
    runtime: ''
    plot: ''
    rating: ''
    added: ''
    watched: ''
    format_id: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.title && @state.released && @state.runtime && @state.plot && @state.rating && @state.added && @state.format_id
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/movies#create', { movie: @state }, (data) =>
      # @props.handleNewMovie data
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
          React.DOM.input
            type: 'date'
            className: 'form-control'
            placeholder: 'Released'
            name: 'released'
            value: @state.released
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            className: 'form-control'
            placeholder: 'Runtime'
            name: 'runtime'
            value: @state.runtime
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
            type: 'range'
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
          className: 'form-group'
          React.DOM.legend
            className: 'el-form'
            'Watched'
          React.DOM.div
            className: 'form-check'
            React.DOM.label
              className: 'form-check-label'
              React.DOM.input
                type: 'radio'
                className: 'form-check-input'
                name: 'optionsRadios'
                id: 'optionsRadios1'
                value: 'option1'
              'Yes'
          React.DOM.div
            className: 'form-check'
            React.DOM.label
              className: 'form-check-label'
              React.DOM.input
                type: 'radio'
                className: 'form-check-input'
                name: 'optionsRadios'
                id: 'optionsRadios2'
                value: 'option2'
              'No'
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            className: 'form-control'
            placeholder: 'Format'
            name: 'format_id'
            value: @state.format_id
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Submit'
