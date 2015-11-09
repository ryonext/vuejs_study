$ ->
  demo = new Vue(
    el: "#new-user"
    data:
      hoge: false
      newUser: '',
      users: window.objUsers
    methods:
      showNewUser: ->
        this.hoge = !this.hoge
      createUser: ->
        name = this.newUser.name
        age = this.newUser.age
        profile = this.newUser.profile
        this.users.push({ name: name })
  )

  return
