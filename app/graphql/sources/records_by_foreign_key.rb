module Sources
  class RecordsByForeignKey < GraphQL::Dataloader::Source
    def initialize(model, foreign_key)
      @model       = model
      @foreign_key = foreign_key
    end

    def fetch(ids)
      records = @model.where(@foreign_key => ids).group_by { |r| r.send(@foreign_key) }
      ids.map { |id| records[id] || [] }
    end
  end
end
