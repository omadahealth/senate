class Redi < ApplicationRecord
  belongs_to :application_environment
  has_one :application, through: :application_environment
  has_one :environment, through: :application_environment

  validates :password, length: { minimum: 8, maximum: 32 }
  validates :host, presence: true
  validates :port, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 5432, less_than: 65000 }
  validates :db, numericality: { only_integer: true, less_than_or_equal_to: 16 }

  after_save :update_consul

  def chrooted_key(key)
    application_environment.chroot+'/redis/'+key
  end

  def url
    "redis://#{user}:#{password}@#{host}:#{port}/#{db}"
  end

  def update_consul
    transaction = [
      {
        'KV' => {
          'Verb' => "set",
          'Key' => chrooted_key("user"),
          'Value' => user
        }
      },
      {
        'KV' => {
          'Verb' => "set",
          'Key' => chrooted_key("password"),
          'Value' => password
        }
      },
      {
        'KV' => {
          'Verb' => "set",
          'Key' => chrooted_key("host"),
          'Value' => host
        }
      },
      {
        'KV' => {
          'Verb' => "set",
          'Key' => chrooted_key("port"),
          'Value' => port.to_s
        }
      },
      {
        'KV' => {
          'Verb' => "set",
          'Key' => chrooted_key("url"), # legacy key
          'Value' => url
        }
      },
      {
        'KV' => {
          'Verb' => "set",
          'Key' => chrooted_key("database"),
          'Value' => db.to_s
        }
      },
      {
        'KV' => {
          'Verb' => "set",
          'Key' => chrooted_key("db"),
          'Value' => db.to_s
        }
      }
    ]

    Diplomat::Kv.txn(transaction, dc: 'dc1')
  end
end
