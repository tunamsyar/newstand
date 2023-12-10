class ErrorRecord < ApplicationRecord
  belongs_to :errorable, polymorphic: true

  validates :function_name, presence: true
  validates :message, presence: true

  scope :unresolved, -> { where(is_resolved: false) }

  def retry!
    ErrorResolverJob.perform_later(id)
  end

  def resolve!
    update!(is_resolved: true, resolved_at: Time.zone.now)
  end

  def errorable_display
    "#{errorable_type} #{errorable_id}"
  end
end
