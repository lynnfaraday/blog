class Ruhoh
  module Templaters
    module Helpers      
      def gallery(id)
        id.to_s.chomp!
        gallery_config = self.context['site']['config']['gallery']
        if (gallery_config['provider'] == 'flickr')
          begin
            flickrGallery = Ruhoh::FlickrGallery.new(gallery_config)
            self.context['gallery_photos'] = flickrGallery.get_photos(id)
            code = self.partial("gallery")
          rescue Exception=>e
            code = "<div style='color:red'>!Gallery error '#{e}'</div>"
          end
        else
          code = "<div style='color:red'>!No gallery support for '#{gallery_config['provider']}'</div>"
        end
        self.render(code)
      end
    end
  end
end