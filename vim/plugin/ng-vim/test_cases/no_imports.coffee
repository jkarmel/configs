angular.module("services").
factory 'attachReady', [\
->
  (object) ->
    isReady = false
    fns = []
    object.ready = (fn) ->
      if isReady
        fn.apply(object, [])
      else
        fns.push fn
    object.isReady = ->
      for fn in fns
        fn.apply(object, [])
      isReady = true

]
