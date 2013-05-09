module Csb
  class Client
    module App
      def app(id)
        get("apps/#{id}")
      end

      def apps
        get("apps")
      end

      def eval_manifest(manifest)
        body = JSON.generate(manifest)
        post("manifest", body, 'application/json', false)
      end

      def app_create(id, repository_type)
        body = { "repository_type" => repository_type }
        post("apps/#{id}", body)
      end

      def app_add_manifest(id, manifest)
        body = JSON.generate(manifest)
        post("apps/#{id}/manifest", body, 'application/json', false)
      end

      def app_destroy(id)
        delete("apps/#{id}")
      end

      def app_info(id)
        get("apps/#{id}/info")
      end

      def app_start(id)
        put("apps/#{id}/start")
      end

      def app_stop(id)
        put("apps/#{id}/stop")
      end

      def app_restart(id)
        put("apps/#{id}/restart")
      end

      def app_log(id)
        get("log/#{id}")
      end

      def app_scale(id, instances)
        put("apps/#{id}/scale/#{instances}")
      end

      def app_monitor(id, samples = 10)
        get("apps/#{id}/monitor?samples=#{samples}")
      end

      def app_migrate(id, provider_id)
        put("apps/#{id}/migrate/#{provider_id}")
      end
    end
  end
end
