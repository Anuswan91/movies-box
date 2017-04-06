@formInput = (placeholder, name, value, onChange, type, typeVal, className) ->
  React.DOM.div
    className: "#{className}"
    React.DOM.input
      type: type
      className: 'form-control'
      placeholder: placeholder
      name: name
      "#{typeVal}": value
      onChange: onChange

@formMultiSelect = (name, value, onChange, array, mutliple, typeVal, className) ->
  React.DOM.div
    className: "#{className}"
    React.DOM.select
      multiple: "#{ mutliple }"
      className: 'form-control'
      name: name
      "#{typeVal}": value
      onChange: onChange
      for element in array
        React.DOM.option
          key: element.id
          value: element.id
          element.name

@formSelect = (name, value, onChange, array, typeVal, className) ->
  React.DOM.div
    className: "#{className}"
    React.DOM.select
      className: 'form-control'
      name: name
      "#{typeVal}": value
      onChange: onChange
      for element in array
        React.DOM.option
          key: element.id
          value: element.id
          element.name

@formTextArea = (placeholder, name, value, onChange, typeVal, className) ->
  React.DOM.div
    className: "#{className}"
    React.DOM.textarea
      className: 'form-control'
      placeholder: placeholder
      name: name
      "#{typeVal}": value
      onChange: onChange

@formInputNumber = (placeholder, name, value, onChange, typeVal, min, step, max, className) ->
  React.DOM.div
    className: "#{className}"
    React.DOM.input
      type: 'number'
      min: "#{min}"
      max: "#{max}"
      step: "#{step}"
      className: 'form-control'
      placeholder: placeholder
      name: name
      "#{typeVal}": value
      onChange: onChange

@formRadioYesNo = (label, name, value, onChange, typeVal) ->
  React.DOM.fieldset
    className: 'form-group row'
    React.DOM.legend
      className: 'col-form-legend col-sm-2'
      "#{ label }"
      React.DOM.div
        className: 'col-sm-10'
      React.DOM.div
        className: 'form-check'
        React.DOM.label
          className: 'form-check-label'
          React.DOM.input
            type: 'radio'
            className: 'form-check-input'
            name: "#{ name }"
            "#{typeVal}": 'true'
            onChange: onChange
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
            name: "#{ name }"
            "#{typeVal}": 'false'
            onChange: onChange
          ' '
          React.DOM.span
            className: 'glyphicon glyphicon-eye-close'
