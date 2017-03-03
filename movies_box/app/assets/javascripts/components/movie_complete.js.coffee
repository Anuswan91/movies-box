@MovieComplete = React.createClass
  getInitialState: ->
    movie: @props.movie
    genres: @props.genres
  render: ->
    React.DOM.div
      className: 'movie-complete'
      React.DOM.div
        className: 'jumbotron text-center'
        React.DOM.img
          src: '../images/example.jpg'
          alt: 'Example'
          # height: '150'
          # width: '150'
        React.DOM.div
          className: 'description'
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
          React.DOM.ul
            className: 'list-group'
            for genre in @state.genres
              React.DOM.li
                className: 'list-group-item'
                key: genre.id
                "#{ genre.name }"
          React.DOM.p
            className: 'movie-preview-desc'
            "Watched : #{ @state.movie.watched }"
          React.DOM.p
            className: 'buttons-preview'
            React.DOM.a
              className: 'btn btn-default'
              role: 'button'
              href: '#'
              React.DOM.span
                className: 'glyphicon glyphicon-pencil'
