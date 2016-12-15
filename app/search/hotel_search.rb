class HotelSearch
  def initialize options = {}

    @name = options[:name].presence
    @countRoom = options[:countRoom].presence
    @start_price = options[:start_price].presence
    @end_price = options[:end_price].presence
    @start_score = options[:start_score].presence
    @end_score = options[:end_score].presence
    filter
  end

  attr_reader :hotels
  attr_reader :name, :countRoom, :start_price, :end_price, :start_score, :end_score

  private

  def filter
    if search_fields.any?(&:present?)
      @hotels = search
    else
      @hotels = ::Hotel.all
    end
  end

  def search_fields
    [name, countRoom, start_score, end_score, start_price, end_price]
  end

  def search
    ::Hotel.search body: query
  end

  def query
    must = []

    if name.present?
      must << simple_field_search(:name, name)
    end

    if start_price || end_price
      conditions = {}.tap do |cond|
        if start_price
          cond["gte"] = start_price.to_f
        end
        if end_price
          cond["lte"] = end_price.to_f
        end
      end

      must << {
        "range": {
          "price": conditions
        }
      }
    end

    if start_score || end_score
      conditions = {}.tap do |cond|
        if start_score
          cond["gte"] = start_score.to_f
        end
        if end_score
          cond["lte"] = end_score.to_f
        end
      end

      must << {
        "range": {
          "score": conditions
        }
      }
    end

    if countRoom
      must << simple_field_search(:countRoom, countRoom)
    end


    {
      query: {
        bool: {
          must: must
        }
      },
      fields: []
    }
  end

  def simple_field_search field, query
    {"dis_max":
      {"queries":
        [{"match":
          {"#{field}.analyzed":
            {"query": query,
             "boost": 10,
             "operator": "and",
             "analyzer": "searchkick_search"
            }
           }
         },
         {"match":
           {"#{field}.analyzed":
             {"query": query,
              "boost": 10,
              "operator": "and",
              "analyzer": "searchkick_search2"
             }
           }
         },
         {"match":
           {"#{field}.analyzed":
             {"query": query,
              "boost": 1,
              "operator": "and",
              "analyzer": "searchkick_search",
              "fuzziness": 1,
              "prefix_length": 0,
              "max_expansions": 3,
              "fuzzy_transpositions": true}}},
         {"match":
           {"#{field}.analyzed":
             {"query": query,
              "boost": 1,
              "operator": "and",
              "analyzer": "searchkick_search2",
              "fuzziness": 1,
              "prefix_length": 0,
              "max_expansions": 3,
              "fuzzy_transpositions": true}}}]}}
  end
end
