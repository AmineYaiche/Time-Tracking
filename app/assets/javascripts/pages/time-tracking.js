// app/assets/javascripts/cable.js
//= require action_cable
//= require moment
//= require_self
//= require_tree ../channels

// This function initiate a websocket connection with the server
// And start the tracking of a given page.
function startTracking(page) {

  (function () {
    this.App || (this.App = {});

    App.cable = ActionCable.createConsumer();

    const syncChannel = App.cable.subscriptions.create({
      channel: "SyncChannel"
    })

    new Tracker(syncChannel, page);
  }).call(this);
}

// This class contains a set of methods and events used to track the user spent time.
// This class require the page name and the websocket channel object.
class Tracker {
  constructor(channel, page) {
    this.startWatching = moment()
    this.channel = channel
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
