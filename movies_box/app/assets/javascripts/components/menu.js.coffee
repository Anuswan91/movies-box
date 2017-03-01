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
              datatoggle: 'collapse'
              datatarget: '#bs-example-navbar-collapse-1'
              ariaexpanded: 'false'
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
              href: "#"
              'Brand'
          React.DOM.div
            className: 'collapse navbar-collapse'
            id: 'bs-example-navbar-collapse-1'
            React.DOM.ul
              className: 'nav navbar-nav'
              React.DOM.li
                className: 'active'
                React.DOM.a
                  href: '#'
                  'Movies'
                  React.DOM.span
                    className: 'sr-only'
                    '(current)'
              React.DOM.li
                className: 'el-menu'
                React.DOM.a
                  href: '#'
                  'Help'
              React.DOM.li
                className: 'el-menu'
                React.DOM.a
                  href: '#'
                  'About'
