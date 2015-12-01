module AppPrototype
  class Assets
    attr_reader :env
    attr_reader :root
    attr_reader :server_url

    def initialize(env:, root:, server_url: nil)
      @env = env
      @root = root
      @server_url = server_url
    end

    def [](asset)
      if precompiled?
        asset_path_from_manifest(asset)
      else
        asset_path_on_server(asset)
      end
    end

    private

    def precompiled?
      env == :production
    end

    def asset_path_from_manifest(asset)
      if (hashed_asset = manifest["assets"][asset])
        "/assets/#{hashed_asset}"
      end
    end

    def asset_path_on_server(asset)
      "#{server_url}/assets/#{asset}"
    end

    def manifest
      @manifest ||= YAML.load_file(manifest_path)
    end

    def manifest_path
      Dir["#{root}/public/assets/manifest_*.json"].first
    end
  end
end
