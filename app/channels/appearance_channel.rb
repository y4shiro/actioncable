class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    logger.debug 'Appearance Channel subscribed'
    current_user.subscribed
  end

  def unsubscribed
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
