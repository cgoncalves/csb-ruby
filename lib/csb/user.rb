module Csb
  class Client
    def user
      get('/users.json')
    end
    alias user_info user

    # Valid parameters are:
    #   :name      Unique User name
    #   :email     Email address
    #   :password  Password
    def user_new(params)
      post('/users.json', params)
    end
  end
end
