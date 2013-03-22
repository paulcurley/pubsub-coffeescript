pubsub = (->
  listeners = {}
  subscribe: (name, callback) ->
    listeners[name] = []  unless listeners[name]
    listeners[name].push callback

  publish: (name) ->
    args = Array::slice.call(arguments, 1)
    if listeners[name]
      i = 0
      
      while i < listeners[name].length
        listeners[name][i].apply null, args
        i++

)()
