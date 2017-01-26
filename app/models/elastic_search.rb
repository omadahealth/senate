class ElasticSearch < ApplicationRecord
  belongs_to :application_environment
  has_one :application, through: :application_environment
  has_one :environment, through: :application_environment

  validates :password, length: { minimum: 8, maximum: 32 }
  validates :host, presence: true
  validates :port, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 9200, less_than: 65000 }

  after_save :update_consul

  def chrooted_key(key)
    application_environment.chroot+'/elastic_search/'+key
  end

  def url
    "https://#{user}:#{password}@#{host}:#{port}/"
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
          'Key' => chrooted_key("url"),
          'Value' => url
        }
      }
    ]

    Diplomat::Kv.txn(transaction, dc: 'dc1')
  end
end
