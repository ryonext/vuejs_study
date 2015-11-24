$ ->
  new Vue(
    el: "#new-user"
    data:
      userForm: false
      newUser: {
        name: ""
        age: ""
        profile: ""
      },
      users: window.objUsers
    computed:
      validation: ->
        name: !!this.newUser.name.trim()
        age: !!this.newUser.age.trim()
        profile: !!this.newUser.profile.trim()
      isValid: ->
        validation = this.validation
        Object.keys(validation).every( (key) ->
          validation[key]
        )
    methods:
      showNewUser: ->
        this.userForm = !this.userForm
      createUser: ->
        unless this.isValid
          return
        this.$http.post('/users', this.newUser, (data, status, request) ->

          name = this.newUser.name
          age = this.newUser.age
          profile = this.newUser.profile
          this.users.push({ name: name, age: age, profile: profile, editable: false })

          this.newUser = {}

          ).error( (data, status, request) ->
            console.log("post failed")
        )
      editName: (user) ->
        user.editable = true
      updateName: (user) ->
        user.editable = false
  )

  return
