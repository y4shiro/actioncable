class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def subscribed
    logger.info "User #{self.email} subscribed"
  end

  def appear(on)
    logger.info "User #{self.email} appears on #{on}"
  end

  def disappear(option = {})
    logger.info "User #{self.email} disappears"
  end

  def away
    logger.info "User #{self.email} away"
  end

  def is_online
    self.update(online: true)
    ActionCable.server.broadcast 'appearance_channel', message: "#{self.name} is online."
  end

  def is_offline
    self.update(online: false)
    ActionCable.server.broadcast 'appearance_channel', message: "#{self.name} is offline."
  end
end
