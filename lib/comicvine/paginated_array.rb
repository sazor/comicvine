module Comicvine
  class PaginatedArray < Array
    attr_accessor :limit, :offset, :number_of_page_results, :number_of_total_results

    def initialize(array, args)
      @limit, @offset, @number_of_page_results, @number_of_total_results = args.values_at(:limit, :offset, :number_of_page_results, :number_of_total_results)
      super(array)
    end

    [:collect, :compact, :flatten, :map, :reject, :reverse, :rotate, :select, :shuffle, :slice, :sort, :uniq].each do |meth_name|
      define_method meth_name do |&bl|
        PaginatedArray.new(super(&bl), {
                                          limit: limit, offset: offset,
                                          number_of_page_results: number_of_page_results,
                                          number_of_total_results: number_of_total_results
                                       })
      end
    end

    alias_method :page_results, :number_of_page_results
    alias_method :total_results, :number_of_total_results
  end
end