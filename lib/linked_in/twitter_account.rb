module LinkedIn
  class TwitterAccount < LinkedIn::Base

    def twitter_accounts
      @arry ||= begin
        @arry = []
        @doc.children.each do |account|
          @arry << Resource.new(account) unless account.blank?
        end
        @arry
      end
    end

    class Resource

      def initialize(account)
        @account = account
      end

      %w[provider_account_id provider_account_name].each do |f|
        define_method(f.to_sym) do
          @account.xpath("./#{f.gsub(/_/,'-')}").text
        end
      end
      
    end # resource

  end # class
end # module
