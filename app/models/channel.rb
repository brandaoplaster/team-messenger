class Channel < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :messages, as: :messagable, :dependent => :destroy

  validates_presence_of :slug, :team, :user
end
