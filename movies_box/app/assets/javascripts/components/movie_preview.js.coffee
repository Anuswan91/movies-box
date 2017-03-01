@MoviePreview = React.createClass
  render: ->
    React.DOM.div
      className: 'col-sm-6 col-md-4'
      React.DOM.div
        className: 'thumbnail'
        React.DOM.img
          src: 'images/example.jpg'
          alt: 'Example'
          height: '150'
          width: '150'
        React.DOM.div
          className: 'caption'
          React.DOM.h3
            className: 'title movie-preview'
            @props.movie.title
          React.DOM.p
            className: 'movie-preview-desc'
            'Released : ' + @props.movie.released
          React.DOM.p
            className: 'movie-preview-desc'
            'Runtime : ' + @props.movie.runtime + "min"
          React.DOM.p
            className: 'movie-preview-desc'
            # React.DOM.div
            #   className: 'progress'
            #   React.DOM.div
            #     className: 'progrssbar'
            #     role: 'progressbar'
            #     aria-valuenow: '70'
            #     aria-valuemin: '0'
            #     aria-valuemax: '100'
            #     style: '{{width: 60%;}}'
            'Rating : ' + @props.movie.rating
          React.DOM.p
            className: 'movie-preview-desc'
            'Watched : ' + @props.movie.watched
          React.DOM.p, null
            React.DOM.a
              className: 'btn btn-primary'
              role: 'button'
              href: '#'
              React.DOM.span
                className: 'glyphicon glyphicon-eye-open'
            React.DOM.a
              className: 'btn btn-default'
              role: 'button'
              href: '#'
              React.DOM.span
                className: 'glyphicon glyphicon-pencil'
