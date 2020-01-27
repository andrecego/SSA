class Character < ApplicationRecord
  belongs_to :rank
  belongs_to :constellation
  has_one_attached :picture
  has_one :stat, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :cosmos_sets, dependent: :destroy
  #accepts_nested_attributes_for :stat, :skills
  # validates :name, uniqueness: true
  validates :name, :constellation_id, :rank_id, presence: { message: 'Não pode ter nenhum campo vazio' }

  def uniq_name
    "#{name} - #{constellation.name}"
  end
end