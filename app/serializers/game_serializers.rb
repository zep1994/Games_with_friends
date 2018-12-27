class GameSerializer < ActiveMode::Serializer 
    attributes :id, :name, :drinks, :directions, :image_url
end