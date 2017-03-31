@MoviePreview = React.createClass
  getDefaultProps: ->
    # movies: []
    allFormats: []
    allGenres: []
    allCountries: []
    allLanguages: []
    allSubtitles: []
  getInitialState: ->
    edit: false
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
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
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
              href: "/movies/#{ @props.movie.id }"
              React.DOM.span
                className: 'glyphicon glyphicon-eye-open'
            React.DOM.a
              className: 'btn btn-default btn-block'
              role: 'button'
              onClick: @handleToggle
              React.DOM.span
                className: 'glyphicon glyphicon-pencil'
  movieEdit: ->
    # @setArray()
    # console.log(@state)
    React.createElement MovieForm, handleNewMovie: @addMovie, edit: true, movie: @props.movie, formats: @props.allFormats, genres: @props.allGenres, countries: @props.allCountries, languages: @props.allLanguages, subtitles: @props.allSubtitles
    # React.DOM.h1
    #   className: 'title'
    #   'New Movie'
    #   React.DOM.form
    #     className: 'form-block'
    #     onSubmit: @handleSubmit
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.input
    #         type: 'text'
    #         className: 'form-control'
    #         placeholder: 'Title'
    #         name: 'title'
    #         value: @state.title
    #         onChange: @handleChange
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.select
    #         multiple: 'true'
    #         className: 'form-control'
    #         name: 'genres'
    #         value: @state.genres
    #         onChange: @handleChangeGenres
    #         for genre in @props.genres
    #           React.DOM.option
    #             key: genre.id
    #             value: genre.id
    #             genre.name
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.input
    #         type: 'date'
    #         className: 'form-control'
    #         placeholder: 'Released'
    #         name: 'released'
    #         value: @state.released
    #         onChange: @handleChange
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.select
    #         multiple: 'true'
    #         className: 'form-control'
    #         name: 'countries'
    #         value: @state.countries
    #         onChange: @handleChangeCountries
    #         for country in @props.countries
    #           React.DOM.option
    #             key: country.id
    #             value: country.id
    #             country.name
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.input
    #         type: 'number'
    #         min: '0'
    #         className: 'form-control'
    #         placeholder: 'Runtime'
    #         name: 'runtime'
    #         value: @state.runtime
    #         onChange: @handleChange
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.input
    #         type: 'url'
    #         className: 'form-control'
    #         placeholder: 'Poster'
    #         name: 'image'
    #         value: @state.image
    #         onChange: @handleChange
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.textarea
    #         className: 'form-control'
    #         placeholder: 'Plot'
    #         name: 'plot'
    #         value: @state.plot
    #         onChange: @handleChange
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.input
    #         type: 'number'
    #         min: '0'
    #         max: '10'
    #         step: '0.1'
    #         className: 'form-control'
    #         placeholder: 'Rating'
    #         name: 'rating'
    #         value: @state.rating
    #         onChange: @handleChange
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.input
    #         type: 'date'
    #         className: 'form-control'
    #         placeholder: 'Added'
    #         name: 'added'
    #         value: @state.added
    #         onChange: @handleChange
    #     React.DOM.fieldset
    #       className: 'form-group row'
    #       React.DOM.legend
    #         className: 'col-form-legend col-sm-2'
    #         'Watched'
    #         React.DOM.div
    #           className: 'col-sm-10'
    #         React.DOM.div
    #           className: 'form-check'
    #           React.DOM.label
    #             className: 'form-check-label'
    #             React.DOM.input
    #               type: 'radio'
    #               className: 'form-check-input'
    #               name: 'watched'
    #               # id: 'optionsRadios1'
    #               value: 'true'
    #               onChange: @handleChange
    #             ' '
    #             React.DOM.span
    #               className: 'glyphicon glyphicon-eye-open'
    #         React.DOM.div
    #           className: 'form-check'
    #           React.DOM.label
    #             className: 'form-check-label'
    #             React.DOM.input
    #               type: 'radio'
    #               className: 'form-check-input'
    #               name: 'watched'
    #               # id: 'optionsRadios2'
    #               value: 'false'
    #               onChange: @handleChange
    #             ' '
    #             React.DOM.span
    #               className: 'glyphicon glyphicon-eye-close'
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.select
    #         multiple: 'true'
    #         className: 'form-control'
    #         name: 'languages'
    #         value: @state.languages
    #         onChange: @handleChangeLanguages
    #         for language in @props.languages
    #           React.DOM.option
    #             key: language.id
    #             value: language.id
    #             language.name
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.select
    #         multiple: 'true'
    #         className: 'form-control'
    #         name: 'subtitles'
    #         value: @state.subtitles
    #         onChange: @handleChangeSubtitles
    #         for subtitle in @props.subtitles
    #           React.DOM.option
    #             key: subtitle.id
    #             value: subtitle.id
    #             subtitle.name
    #     React.DOM.div
    #       className: 'form-group'
    #       React.DOM.select
    #         className: 'form-control'
    #         name: 'format_id'
    #         value: @state.format_id
    #         onChange: @handleChange
    #         for format in @props.formats
    #           React.DOM.option
    #             key: format.id
    #             value: format.id
    #             format.name
    #     React.DOM.button
    #       type: 'submit'
    #       className: 'btn btn-primary'
    #       disabled: !@valid()
    #       'Submit'
    # React.DOM.a
    #   className: 'btn btn-default btn-block'
    #   role: 'button'
    #   onClick: @handleToggle
    #   React.DOM.span
    #     className: 'glyphicon glyphicon-pencil'
  render: ->
    if @state.edit
      @movieEdit()
    else
      @movieView()
