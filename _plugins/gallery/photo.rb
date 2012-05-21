class Ruhoh
  class GalleryPhoto
    attr_accessor :original_image_url, :thumb_image_url, :small_image_url, :med_image_url, :large_image_url, :orig_image_url, :caption, :host, :view_url

    def initialize(args)
      args.each_pair do | key, value |
        instance_variable_set("@#{key}", value)
      end
    end
  end #GalleryPhoto
end #Ruhoh