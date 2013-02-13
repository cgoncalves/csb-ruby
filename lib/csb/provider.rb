module Csb
  class Client
    def providers
      get("/paas/offerings.json")
    end

    def provider(id)
      providers.each do |p|
        return p if p.id.eql? id
      end
    end

    def providers_runtimes(providers = nil)
      providers_generic_feature('runtimes', providers)
    end

    def providers_frameworks(providers = nil)
      providers_generic_feature('frameworks', providers)
    end

    def providers_service_vendors(providers = nil)
      providers_generic_feature('service_vendors', providers)
    end

    def providers_metrics(providers = nil)
      providers_generic_feature('metrics', providers)
    end

    private
    def providers_generic_feature(name, provs = nil)
      provs = providers if provs.nil?
      generic = []
      provs.each do |p|
        generic |= p[name]
      end
      generic
    end
  end
end
