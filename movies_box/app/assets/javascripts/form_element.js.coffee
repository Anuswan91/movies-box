@formInput = (placeholder, name, value, onChange, type, typeVal) ->
  React.DOM.div
    className: 'form-inline'
    React.DOM.input
      type: type
      className: 'form-control'
      placeholder: placeholder
      name: name
      "#{typeVal}": value
      onChange: onChange

@formMultiSelect = (name, value, onChange, array, mutliple, typeVal) ->
  React.DOM.div
    className: 'form-inline'
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

@formSelect = (name, value, onChange, array, typeVal) ->
  React.DOM.div
    className: 'form-group'
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

@formTextArea = (placeholder, name, value, onChange, typeVal) ->
  React.DOM.div
    className: 'form-group'
    React.DOM.textarea
      className: 'form-control'
      placeholder: placeholder
      name: name
      "#{typeVal}": value
      onChange: onChange

@formInputNumber = (placeholder, name, value, onChange, typeVal, min, step, max) ->
  React.DOM.div
    className: 'form-inline'
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
