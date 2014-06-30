module AutoPresenter
  class RelationPresenter < SimpleDelegator

    delegate :to_xml, :to_yaml, :length, :collect, :map, :each, :all?, :include?, :to_ary, to: :to_a

    def initialize(object)
      __setobj__(object)

      name = object.model.name
      @_presenter = "#{name}Presenter".safe_constantize

      present_records if loaded?
    end

    def to_a
      if @_presented || !@_presenter
        __getobj__.to_a
      else
        present_records
      end
    end

    def present_records
       records = __getobj__.to_a.collect! { |record| @_presenter.new(record) }
       @_presented = true
       records
    end
  end
end
