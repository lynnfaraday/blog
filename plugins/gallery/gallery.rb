require 'flickr_badge_maker'

class Ruhoh
  module Templaters
    module Helpers    
    
      def gallery(id)
        id.to_s.chomp!
        Ruhoh::Friend.say { plain "Processing gallery: '#{id}'" }
        
        gallery_config = self.context['site']['config']['gallery']
        
        if (gallery_config['provider'] == 'flickr')
          begin
            flickr_config = gallery_config['flickr']
            badge_maker = FlickrBadgeMaker.new(
            {
              :api_key => flickr_config["api_key"],
              :shared_secret => flickr_config["shared_secret"],
              :access_token => flickr_config["access_token"],
              :access_secret => flickr_config["access_secret"]
              })
              photos = badge_maker.get_photos(id)
              error_text = ""
            rescue Exception=>e
              error_text = "<div style='color:red'>!Gallery error '#{e}'</div>"
              photos = []
            end
          else
            error_text = "<div style='color:red'>!No gallery support for '#{gallery_config['provider']}'</div>"
            photos = []
          end
          { 'gallery_photos' => photos, 'gallery_error' => error_text }
        end
      end
    end
  end