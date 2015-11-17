$ ->
  new Vue(
    el: "#new-user"
    data:
      hoge: false
      newUser: {
        name: ""
        age: ""
        profile: ""
      },
      users: window.objUsers
    computed:
      validation: ->
        name: !!this.newUser.name.trim()
      isValid: ->
        validation = this.validation
        Object.keys(validation).every( (key) ->
          validation[key]
        )
    methods:
      showNewUser: ->
        this.hoge = !this.hoge
      createUser: ->
        unless this.isValid
          return
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
