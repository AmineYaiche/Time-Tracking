class SyncChannel < ApplicationCable::Channel
  def receive(data)
    page = data['body']['page']
    time = data['body']['time']
    track = current_user.time_track.find_by(page: page)
    
    if track.nil?
      track = TimeTrack.new
      track.time = time
      track.user = current_user
      track.page = page
    else
      track.time += time
    end
    track.save
  end
end
