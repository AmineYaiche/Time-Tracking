class SyncChannel < ApplicationCable::Channel
  
  # Handles receiving a new analitical information from the client websockets
  def receive(data)
    page = data['body']['page']
    time = data['body']['time']
    current_user.add_track(page, time)
  end
end
