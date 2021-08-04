# frozen_string_literal: true

# app/components/alert/alert_component.rb
class AlertComponent < MountainView::Presenter
  properties :type, :title, :body, :closeable

  def initialize(slug, properties = {})
    properties[:type] = property_types_mapping[properties[:type].to_sym] if properties[:type].present?
    super(slug, properties)
  end

  def type_classes
    "alert--#{properties[:type]}"
  end

  def size_classes
    "alert--#{properties[:size]}" if properties[:size]
  end

  def alert_id
    return properties[:id] unless properties[:id].blank?

    properties[:id] = format('alert__%<guid>s', guid: SecureRandom.uuid)
  end

  def property_types_mapping
    message_types = ApplicationController::FLASH_MESSAGES_TYPE
    message_types.each_with_object({}) do |type, h|
      case type
        when :alert, :error
          h[type] = 'error'
        when :warning
          h[type] = 'warning'
        when :notice, :success
          h[type] = 'success'
        when :instructions
          h[type] = 'instructions'
        else
          h[type] = 'info'
      end
    end
  end
end
