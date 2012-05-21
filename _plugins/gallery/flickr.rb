require 'flickraw'

class Ruhoh
  class FlickrGallery
    def initialize(config)
      @api_key = config['flickr']['api_key']
      @shared_secret = config['flickr']['shared_secret']
      @access_token = config['flickr']['access_token']
      @access_secret = config['flickr']['access_secret']
    end

    def get_photos(set_id)
      FlickRaw.api_key=@api_key
      FlickRaw.shared_secret=@shared_secret
      flickr.access_token = @access_token
      flickr.access_secret = @access_secret

      flickr_photos = flickr.photosets.getPhotos( :photoset_id => set_id )
      gallery_photos = []

      flickr_photos.photo.each { |p|
        sizes = flickr.photos.getSizes(:photo_id => p.id)

        thumb = sizes.select { |item| item.label == "Thumbnail" }[0]
        small = sizes.select { |item| item.label == "Small" }[0]
        med = sizes.select { |item| item.label == "Medium" }[0]
        large = sizes.select { |item| item.label == "Large" }[0]
        orig = sizes.select { |item| item.label == "Original" }[0]

        original_source = orig == nil ? "http://www.flickr.com" : orig.source

        photo = Ruhoh::GalleryPhoto.new(
        {
            :thumb_image_url => thumb == nil ? original_source : thumb.source,
            :small_image_url => small == nil ? original_source : small.source,
            :med_image_url => med == nil ? original_source : med.source,
            :large_image_url => large == nil ? original_source : large.source,
            :orig_image_url => original_source,
            :caption => p.title,
            :host => "flickr",
            :view_url => orig.url
        })

        gallery_photos << photo
      }
      gallery_photos
    end
  end
end