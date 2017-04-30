@MovieComplete = React.createClass
  getInitialState: ->
    movie: @props.movie
    genres: @props.genres
    countries: @props.countries
    languages: @props.languages
    subtitles: @props.subtitles
  getDefaultProps: ->
    genres: []
    countries: []
    languages: []
    subtitles: []
  handleClose: (e) ->
    e.preventDefault()
    @props.handleToggle e
  render: ->
    React.DOM.div
      className: 'movie-complete'
      React.DOM.div
        # className: 'jumbotron text-center'
        className: 'well well-lg'
        React.DOM.div
          className: 'description'
          React.createElement Poster, title: @state.movie.title, url: @props.movie.image, height: 300, width: 300
          React.DOM.h3
            className: 'title movie-preview'
            @props.movie.title
          React.DOM.p
            className: 'movie-preview-desc'
            "Released : #{ @state.movie.released }"
          React.DOM.p
            className: 'movie-preview-desc'
            "Runtime : #{ @state.movie.runtime }min"
          React.DOM.p
            className: 'movie-preview-desc'
            "Rating : #{ @state.movie.rating }"
          React.createElement ListGroup, list: @state.genres
          React.DOM.p
            className: 'movie-preview-desc'
            "Watched : #{ @state.movie.watched }"
          React.createElement ListGroup, list: @state.countries
          React.createElement ListGroup, list: @state.languages
          React.createElement ListGroup, list: @state.subtitles
          React.DOM.p
            className: 'buttons-preview'
            React.DOM.a
              className: 'btn btn-default'
              role: 'button'
              href: '#'
              React.DOM.span
                className: 'glyphicon glyphicon-pencil'
            React.DOM.button
              type: 'button'
              className: 'btn btn-warning'
              onClick: @handleClose
              'Cancel'
