import consumer from 'rails_design_engine_ui/javascripts/rails_design/cable'

consumer.subscriptions.create({channel: 'Notice::ReceiverChannel', room: 'room'}, {

  collection() {
    return $("[data-channel='notices']")
  },

  received(data) {
    this.collection().css('color', '#ff7f24')
    this.collection().html(data.body)
    Messenger().post({
      message: data.body,
      type: 'info',
      showCloseButton: true
    })
    $('#notify_show').css('color', '#ff7f24')
    $('#notice_count').html(data.count)
  },

  connected() {
    console.debug('connected:', this.identifier)
  },

  disconnected() {
    console.debug('disconnected:', this.identifier)
  }

})
