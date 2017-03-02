@Menu = React.createClass
  render: ->
    React.DOM.div
      className: 'menu'
      React.DOM.nav
        className: 'navbar navbar-default'
        React.DOM.div
          className: 'container-fluid'
          React.DOM.div
            className: 'navbar-header'
            React.DOM.button
              type: 'button'
              className: 'collapsed navbar-toggle'
              # dataToggle: 'collapse'
              # dataTarget: '#bs-example-navbar-collapse-1'
              # ariaExpanded: 'false'
              React.DOM.span
                className: 'sr-only'
                'Toggle navigation'
              React.DOM.span
                className: 'icon-bar'
              React.DOM.span
                className: 'icon-bar'
              React.DOM.span
                className: 'icon-bar'
            React.DOM.a
              className: 'navbar-brand'
              href: "/"
              'MoviesBox'
          React.DOM.div
            className: 'collapse navbar-collapse'
            id: 'bs-example-navbar-collapse-1'
            React.DOM.ul
              className: 'nav navbar-nav'
              # React.DOM.li
              #   className: 'dropdown'
              #   React.DOM.a
              #     className: 'dropdown-toggle'
              #     # data-toggle: 'dropdown'
              #     href: '#'
              #     role: 'button'
              #     # aria-haspopup: 'true'
              #     # aria-expanded: 'false'
              #     'dropdown'
              #     React.DOM.span
              #       className: 'caret'
              #   React.DOM.ul
              #     className: 'dropdown-menu'
              #     React.DOM.li
              #       className: 'el-menu'
              #       React.DOM.a
              #         href: '#'
              #         'Add'
              React.DOM.li
                className: 'el-menu'
                React.DOM.a
                  href: '/movies'
                  React.DOM.span
                    className: 'glyphicon glyphicon-film'
                    # ariaHidden: 'true'
                  ' Movies'
              React.DOM.li
                className: 'el-menu'
                React.DOM.a
                  href: '/movies/new'
                  React.DOM.span
                    className: 'glyphicon glyphicon-plus'
                    # ariaHidden: 'true'
                  ' Add Movie'
              React.DOM.li
                className: 'el-menu'
                React.DOM.a
                  href: '/help'
                  React.DOM.span
                    className: 'glyphicon glyphicon-question-sign'
                    # ariaHidden: 'true'
                  ' Help'
              React.DOM.li
                className: 'el-menu'
                React.DOM.a
                  href: '/about'
                  React.DOM.span
                    className: 'glyphicon glyphicon-info-sign'
                    # ariaHidden: 'true'
                  ' About'
