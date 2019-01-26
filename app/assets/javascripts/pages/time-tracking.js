// app/assets/javascripts/cable.js
//= require action_cable
//= require moment
//= require_self
//= require_tree ../channels

function startTracking(username, page) {

  (function () {
    this.App || (this.App = {});

    App.cable = ActionCable.createConsumer();

    const syncChannel = App.cable.subscriptions.create({
      channel: "SyncChannel"
    })

    new Tracker(syncChannel, username, page);
  }).call(this);
}

class Tracker {
  constructor(channel, username, page) {
    this.startWatching = moment()
    this.channel = channel
    this.username = username
    this.page = page

    window.onblur = () => {
      this.stopCounting()
    }

    window.onunload = () => {
      this.stopCounting()
    }

    window.onfocus = () => {
      this.resumeCounting()
    }
  }

  stopCounting() {
    const trackedTime = moment().diff(this.startWatching) / 1000
    this.startWatching = null
    this.channel.send({
      sent_by: this.username,
      body: {
        time: trackedTime,
        page: this.page
      }
    })
  }

  resumeCounting() {
    this.startWatching = moment()
  }
}
