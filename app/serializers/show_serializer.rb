class ShowSerializer < ActiveModel::Serializer
  attributes :date, :start_time, :end_time

  belongs_to :movie
end
