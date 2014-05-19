RECORDER_SWF_URL = "/flash/recorder.swf"
FLASH_ELEMENT_ID = "flash-element"
FLASH_CONTAINER_ID = "flash-container"

angular.module("services").
factory 'Recorder', [\
"$document", "$timeout", "$rootScope", "yo"
($document,   $timeout,   $rootScope,   yo) ->
  callbackId = 0
  Recorder = {}
  Recorder.flashElement = $($document[0].createElement "div")
  Recorder.flashElement.attr('id', FLASH_ELEMENT_ID)

  Recorder.flashContainer = $($document[0].createElement "div")
  Recorder.flashContainer.attr('id', FLASH_CONTAINER_ID)
  Recorder.flashContainer.css('position', 'fixed')
  Recorder.flashContainer.hide = ->
    Recorder.flashContainer.css top: '-9999px', left: '-9999px'

  Recorder.flashContainer.append Recorder.flashElement
  Recorder.flashContainer.hide()

  $document.find('body').append Recorder.flashContainer
  swfobject.embedSWF(
    RECORDER_SWF_URL
    FLASH_ELEMENT_ID
    "215", "137"
    "10.1.0"
    false, false
    {allowscriptaccess: "always"}
    false
    (e) ->
      if e.success
        Recorder.swf = e.ref
  )


  Recorder.record = (options = {}) ->
    @swf.record()

  Recorder.stop = ->
    @swf.stop()

  Recorder.play = ->
    @swf.play()

  Recorder.upload = (params = {}) ->
    @swf.upload(params)

  Recorder

  Recorder.setup = (options = {}) ->
    Recorder.ready ->
      Recorder.setupComplete = ->
        Recorder.record()
        Recorder.stop()
        options.success()
        $rootScope.$apply()
      Recorder.swf.setup(callbackId)

  window.__Recorder = Recorder
  Recorder.log = (message) ->
    if window.console # allow
      console.log message # allow

  Recorder


]
