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
        this.$http.post('/users', this.newUser, (data, status, request) ->
          console.log("post success")
          console.log(status)
          ).error( (data, status, request) ->
            console.log("post failed")
        )

        name = this.newUser.name
        age = this.newUser.age
        profile = this.newUser.profile
        this.users.push({ name: name, age: age, profile: profile })
  )

  return
