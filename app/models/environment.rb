class Environment < ApplicationRecord
  has_many :application_environments, dependent: :destroy
  has_many :applications, through: :application_environments
  has_many :secrets, through: :application_environments
  has_many :postgresqls, through: :application_environments
  has_many :redis, through: :application_environments
  has_many :elastic_searches, through: :application_environments

  validates :name, presence: true
end
