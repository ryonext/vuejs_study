$ ->
  new Vue(
    el: "#new-user"
    data:
      hoge: false
      newUser: '',
      users: window.objUsers
      validation:
        name: false
    filters:
      nameValidator:
        write: (val) ->
          this.validation.name = !!val
          return val
    methods:
      showNewUser: ->
        this.hoge = !this.hoge
      createUser: ->
        this.$http.post('/users', this.newUser, (data, status, request) ->

          name = this.newUser.name
          age = this.newUser.age
          profile = this.newUser.profile
          this.users.push({ name: name, age: age, profile: profile })

          this.newUser = {}

          ).error( (data, status, request) ->
            console.log("post failed")
        )

  )

  return
