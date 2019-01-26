class SyncChannel < ApplicationCable::Channel
  def receive(data)
    username = data['sent_by']
    page = data['body']['page']
    time = data['body']['time']
    track = TimeTrack.joins(:user).find_by(users: {username: username}, page: page)
    
    if track == nil
      track = TimeTrack.new
      track.time = time
      user = User.find_by(username: username)
      track.user = user
      track.page = page
    else
      track.time += time
    end
    track.save
  end
end
