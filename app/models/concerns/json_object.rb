module JsonObject
  extend ActiveSupport::Concern

  included do
    scope :where_brewery_db_id, -> (id) {
      where("brewery_db_json ->> 'id' = ?", id)
    }
  end

  ACCESSOR_PREFIX = 'brewery_'

  def method_missing(method_sym, *args, &block)
    method_s = method_sym.to_s
    unless method_s.start_with?(ACCESSOR_PREFIX) || brewery_object.send(method_s)
      super
    end
    method_name_without_prefix = method_s.gsub(/\A#{Regexp.escape(ACCESSOR_PREFIX)}/, '')
    method_name = method_name_without_prefix.gsub(/[\?=]\z/, '')
                                            .to_sym
    case method_s.last
    when '='
      # Setter
      if args.count != 1
        fail ArgumentError, "wrong number of arguments (#{args.count} for 1)"
      else
        brewery_object.send(method_name_without_prefix, args.first)
        set_chargebee_data
        args.first
      end
    when '?'
      # Predicate (presence)
      if args.count != 0
        fail ArgumentError, "wrong number of arguments (#{args.count} for 0)"
      else
        !!brewery_object.send(method_name)
      end
    else
      # Getter
      if args.count != 0
        fail ArgumentError, "wrong number of arguments (#{args.count} for 0)"
      else
        brewery_object.send(method_name)
      end
    end
  end

  def brewery_object
    @brewery_object ||= JSON.parse(brewery_db_json.to_json, object_class: OpenStruct)
  end
end