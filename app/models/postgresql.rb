class Postgresql < ApplicationRecord
  belongs_to :application_environment
  has_one :application, through: :application_environment
  has_one :environment, through: :application_environment

  validates :user, presence: true
  validates :password, presence: true, length: { minimum: 8, maximum: 32 }
  validates :host, presence: true
  validates :port, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 5432, less_than: 65000 }
  validates :database, presence: true, length: { maximum: 63 }

  after_save :update_consul

  def chrooted_key(key)
    application_environment.chroot+'/postgresql/'+key
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
        "KV" => {
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
          'Key' => chrooted_key("name"), # legacy key
          'Value' => database
        }
      },
      {
        'KV' => {
          'Verb' => "set",
          'Key' => chrooted_key("database"), # future (name replacement) key
          'Value' => database
        }
      }
    ]

    Diplomat::Kv.txn(transaction, dc: 'dc1')
  end
end
