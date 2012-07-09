class Ruhoh
  module Templaters
    module Helpers      
      def recent_posts(page_number)
        all_posts = self.context['db']['posts']['chronological']
        per_page = self.context['site']['config']['posts']['latest']
        
        pager = Paginator.new(per_page, all_posts)
        pager.paginate
        current_page = pager.get_page(page_number)
        posts = self.to_posts(current_page[:posts])
      end      
    end
  end
end