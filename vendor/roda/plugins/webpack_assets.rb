class Roda
  module RodaPlugins
    module WebpackAssets
      def self.load_dependencies(app, opts={})
        if opts[:precompiled]
          app.plugin :static, ["/#{opts[:assets_path] || 'assets'}"]
        end
      end

      def self.configure(app, opts={})
        opts[:public] = File.expand_path(opts[:public] || "public", app.opts[:root]).freeze
        opts[:assets_path] = (opts[:assets_path] || "assets").freeze
        opts[:development_server_base_url] = opts[:development_server_base_url].to_s.freeze

        if opts[:precompiled]
          if (manifest_file = Dir["#{opts[:public]}/#{opts[:assets_path]}/manifest_*.json"].first)
            require "yaml"
            opts[:manifest] = YAML.load_file(manifest_file).freeze
          end
        end

        app.opts[:webpack_assets] = opts.freeze
      end

      module ClassMethods
        def webpack_assets_opts
          opts[:webpack_assets]
        end

        def webpack_assets_manifest
          webpack_assets_opts.fetch(:manifest, {})
        end
      end

      module InstanceMethods
        def asset_path(asset_name)
          if self.class.webpack_assets_opts[:precompiled]
            _asset_path_from_manifest(asset_name)
          else
            "#{self.class.webpack_assets_opts[:development_server_base_url]}/#{self.class.webpack_assets_opts[:assets_path]}/#{asset_name}"
          end
        end

        private

        def _asset_path_from_manifest(asset_name)
          hashed_asset_name = self.class.webpack_assets_manifest["assets"][asset_name.to_s]
          "/#{self.class.webpack_assets_opts[:assets_path]}/#{hashed_asset_name}" if hashed_asset_name
        end
      end
    end

    register_plugin :webpack_assets, WebpackAssets
  end
end
