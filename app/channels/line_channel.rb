class LineChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    def subscribed
      stream_from "LineChannel"
    end

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
