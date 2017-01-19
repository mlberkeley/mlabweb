# MathJax stuff
$ ->
  loadMathJax()
  $(document).on 'turbolinks:load', loadMathJax

loadMathJax = ->
  window.MathJax = null
  $.getScript "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML", ->
    MathJax.Hub.Config
      showMathMenu: false
