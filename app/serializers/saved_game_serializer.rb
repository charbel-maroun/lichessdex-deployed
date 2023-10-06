class SavedGameSerializer < ActiveModel::Serializer
  attributes :id, :studiedPosition, :notes, :gameID
end
