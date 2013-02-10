module Csb
  class Client
    def user_info
      get('/users.json')
    end
  end
end
