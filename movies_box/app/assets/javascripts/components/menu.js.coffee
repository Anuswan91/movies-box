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
              href: "/home"
              'MoviesBox'
          React.DOM.div
            className: 'collapse navbar-collapse'
            id: 'bs-example-navbar-collapse-1'
            React.DOM.ul
              className: 'nav navbar-nav'
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
