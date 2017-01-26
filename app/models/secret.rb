class Secret < ApplicationRecord
  belongs_to :application_environment
  has_one :application, through: :application_environment
  has_one :environment, through: :application_environment

  validates :key, presence: true
  validates :value, presence: true

  after_save :update_consul

  def update_consul
    Diplomat::Kv.put(application_environment.chroot+'/secrets/'+key, value, dc: environment.consul_dc)
  end
end
