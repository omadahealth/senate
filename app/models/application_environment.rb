class ApplicationEnvironment < ApplicationRecord
  belongs_to :application
  belongs_to :environment
  has_one :postgresql
  has_one :redis, class_name: "Redi"
  has_one :elastic_search
  has_many :secrets

  def chroot
    "#{application.name}/#{environment.name}"
  end
end
