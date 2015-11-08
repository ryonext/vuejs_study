$ ->
  demo = new Vue(
    el: "#new-user"
    data:
      hoge: false
      users: [
        { name: "hoge", age: 20, profile: "hi" },
        { name: "fuga", age: 18, profile: "fugaga" }
      ]
    methods:
      showNewUser: ->
        this.hoge = !this.hoge
      createUser: ->
        alert "hoge"
  )

  return
