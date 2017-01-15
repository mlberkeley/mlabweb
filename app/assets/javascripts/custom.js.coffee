# MathJax stuff
$ ->
  loadMathJax()
  $(document).on 'turbolinks:load', loadMathJax

loadMathJax = ->
  window.MathJax = null
  $.getScript "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML", ->
    MathJax.Hub.Config
      showMathMenu: false

# Facebook
# $ ->
#   loadFacebookSDK()
#   bindFacebookEvents() unless window.fbEventsBound
#
# bindFacebookEvents = ->
#   $(document)
#     .on('turbolinks:fetch', saveFacebookRoot)
#     .on('turbolinks:change', restoreFacebookRoot)
#     .on('turbolinks:load', ->
#       FB?.XFBML.parse()
#     )
#   @fbEventsBound = true
#
# saveFacebookRoot = ->
#   if $('#fb-root').length
#     @fbRoot = $('#fb-root').detach()
#
# restoreFacebookRoot = ->
#   if @fbRoot?
#     if $('#fb-root').length
#       $('#fb-root').replaceWith @fbRoot
#     else
#       $('body').append @fbRoot
#
# loadFacebookSDK = ->
#   window.fbAsyncInit = initializeFacebookSDK
#   $.getScript("//connect.facebook.net/en_US/sdk.js")
#
# initializeFacebookSDK = ->
#   FB.init
#     appId  : Rails.application.secrets.fb_app_id.to_s
#     status : true
#     cookie : true
#     xfbml  : true
#     version: Rails.application.secrets.fb_api_version.to_s
#
#   FB.getLoginStatus (response) ->
#   if response.status == 'connected'
#     uid = response.authResponse.userID
#     accessToken = response.authResponse.accessToken
#     FB.api("/me", (response) ->
#       console.log("Hello #{response.name}")
#     )
#   return
