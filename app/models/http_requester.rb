class HttpRequester
  include HTTParty

  def self.build
    instance = self.new
  end

  def self.configure(receiver)
    instance = self.build
    receiver.http_requester = instance
  end

  def get(uri, query, headers)
    self.class.get(uri,
                    :query => query,
                    :headers => headers
                    )
  end

  module Substitute
    class NullHttpRequester

      def get(*)
        self
      end

      def method_missing(*)
        self
      end
    end
  end
end