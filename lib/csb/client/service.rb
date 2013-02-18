module Csb
  class Client
    module Service
      def service(id, app_id)
        get("apps/#{app_id}/services/#{id}")
      end

      def services(app_id)
        get("apps/#{app_id}/services")
      end

      def service_create(id, app_id, vendor_id)
        post("apps/#{app_id}/services/#{id}?vendorId=#{vendor_id}")
      end

      def service_destroy(id, app_id)
        delete("apps/#{app_id}/services/#{id}")
      end
    end
  end
end
