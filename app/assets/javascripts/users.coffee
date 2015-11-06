$ ->
  demo = new Vue(
    el: "#new-user"
    data:
      hoge: false
    methods:
      showNewUser: ->
        this.hoge = !this.hoge
  )

  return
