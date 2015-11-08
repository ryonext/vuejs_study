$ ->
  demo = new Vue(
    el: "#new-user"
    data:
      hoge: false
      newUser: '',
      users: [
        { name: "hoge", age: 20, profile: "hi" },
        { name: "fuga", age: 18, profile: "fugaga" }
      ]
    methods:
      showNewUser: ->
        this.hoge = !this.hoge
      createUser: ->
        this.users.push(this.newUser)
  )

  return
