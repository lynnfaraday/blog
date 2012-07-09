class Ruhoh
  module Templaters
    module Helpers    

      GalleryRegex = /^gallery_(\d+)/
      RecentPostsRegex = /^recent_posts_(\d+)/

      def respond_to?(method)
        if method.to_s =~ GalleryRegex
          true
        elsif method.to_s =~ RecentPostsRegex
            true
        else
          super
        end
      end

      def method_missing(name, *args, &block)
        if name.to_s =~ GalleryRegex
          self.gallery($1) || super
        elsif name.to_s =~ RecentPostsRegex
          self.recent_posts($1.to_i) || super
        else
          super
        end
      end
    end
  end
end