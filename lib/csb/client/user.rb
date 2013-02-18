module Csb
  class Client
    module User
      def user
        get('users')
      end
      alias user_info user

      # Valid parameters are:
      #   :name      Unique User name
      #   :email     Email address
      #   :password  Password
      def user_new(options)
        post('users', options)
      end
    end
  end
end
