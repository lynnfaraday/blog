class Ruhoh
  module Templaters
    module Helpers    

      GalleryRegex = /^build_gallery_(\d+)/

      def respond_to?(method)
        if method.to_s =~ GalleryRegex          
          true
        else
          super
        end
      end

      def method_missing(name, *args, &block)
        if name.to_s =~ GalleryRegex
          self.build_gallery($1) || super
        else
          super
        end
      end
    end
  end
end