import consumer from 'rails_design_engine_ui/javascripts/rails_design/cable'

consumer.subscriptions.create({channel: 'Com::SessionChannel', room: 'room'}, {

  received(data) {
    document.addEventListener('turbo:before-fetch-request', event => {
      let xhr = event.detail.fetchOptions
      xhr.headers['Auth-Token'] = data.auth_token
    })
    Turbo.visit('/')
  },

  connected() {
    console.debug('connected:', this.identifier)
  },

  disconnected() {
    console.debug('disconnected:', this.identifier)
  }

})
