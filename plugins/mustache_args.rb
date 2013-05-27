class Ruhoh
  module Templaters
    module Helpers    

      def respond_to?(method)
        if method.to_s =~ /^build_gallery_(\d+)/          
          true
        else
          super
        end
      end

      def method_missing(name, *args, &block)
        if name.to_s =~ /^build_gallery_(\d+)/
          self.build_gallery($1) || super
        else
          super
        end
      end
    end
  end
end