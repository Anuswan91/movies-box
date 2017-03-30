@MoviePreview = React.createClass
  render: ->
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
              href: '#'
              React.DOM.span
                className: 'glyphicon glyphicon-pencil'
