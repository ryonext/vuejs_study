$ ->
  userComponent = Vue.extend(
    data: ->
      return {
        user: 0
      }
    props: ['user']
    template: '
    <tr>
      <td>
        <div v-if="user.editable">
          <input v-model="user.name" v-on:keyup.enter="updateName(user)" />
        </div>
        <div v-else="">
          <div v-on:click="editName(user)">
            {{ user.name }}
          </div>
        </div>
      </td>
      <td>
        {{ user.age }}
      </td>
      <td>
          {{ user.profile }}
      </td>
      <td>
        <button v-on:click="up($index)">↑</button>
      </td>
      <td>
        <button v-on:click="down($index)">↓</button>
      </td>
      <td>
        <button v-on:click="delete(user, $index)">delete</button>
      </td>
    </tr>
    '
  )

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
    components:
      'user-component': userComponent
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
        unless (!!user.name.trim())
          return
        this.$http.put("/users/#{user.id}", user, (data, status, request) ->
          user.editable = false

          ).error( (data, status, request) ->
            console.log("post failed")
        )
      delete: (user, index) ->
        this.$http.delete("/users/#{user.id}", null, (data, status, request) ->
          this.users.splice(index, 1)
          ).error( (data, status, request) ->
            console.log("post failed")
        )
      up: (index) ->
        return if index == 0

        this.users.splice(index - 1, 2, this.users[index], this.users[index - 1]);
      down: (index) ->
        return if index == this.users.length - 1

        this.users.splice(index, 2, this.users[index + 1], this.users[index]);

  )

  return
