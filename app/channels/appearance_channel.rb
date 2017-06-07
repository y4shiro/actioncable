class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    user = User.where(id: current_user.id).first
    user.is_online
    logger.debug 'Appearance Channel subscribed'
    current_user.subscribed
  end

  def unsubscribed
    user = User.where(id: current_user.id).first
    user.is_offline
    logger.debug 'Appearance Channel unsubscribed'
    current_user.disappear
  end

  def appear(data)
    logger.debug 'Appearance Channel appeared'
    current_user.appear(on: data['appearing_on'])
  end

  def away
    logger.debug 'Appearance Channel away'
    current_user.away
  end
end
