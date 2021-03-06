class Block < ApplicationRecord
  belongs_to :post

  scope :positioned, -> { order(position: :asc) }
  scope :top_level, -> { where(parent_id: nil) }

  acts_as_list scope: %i(post_id parent_id)

  def self.avaiable_blocks
    %w(Blocks::Text Blocks::TextArea Blocks::RichTextArea Blocks::Cta Blocks::Repeater Blocks::Image)
  end

  def title
    self.class.name.demodulize
  end

  def partial_name
    self.type.demodulize.underscore.downcase
  end
end
