module Csb
  class Client
    def app(id)
      get("/apps/#{id}.json")
    end

    def apps
      get("/apps.json")
    end

    def eval_manifest(manifest)
      body = JSON.generate(manifest)
      post("/manifest.json", body, { "Content-Type" => "application/json" })
    end

    def app_create(id, manifest)
      body = JSON.generate(manifest)
      post("/apps/#{id}.json", body, { "Content-Type" => "application/json" })
    end

    def app_destroy(id)
      delete("/apps/#{id}.json")
    end

    def app_info(id)
      get("/apps/#{id}/info.json")
    end

    def app_start(id)
      put("/apps/#{id}/start.json")
    end

    def app_stop(id)
      put("/apps/#{id}/stop.json")
    end

    def app_restart(id)
      put("/apps/#{id}/restart.json")
    end

    def app_log(id)
      get("/log/#{id}.json")
    end

    def app_scale(id, instances)
      put("/apps/#{id}/scale/#{instances}")
    end

    def app_monitor(id, samples = 10)
      get("/apps/#{id}/monitor.json?samples=#{samples}")
    end

    def app_migrate(id, provider_id)
      put("/apps/#{id}/migrate/#{provider_id}.json")
    end
  end
end
