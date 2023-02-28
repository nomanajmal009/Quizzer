collection @test
attributes :name, :description
child :questions do 
    attributes :name, :description
    child :options do
        attributes :description, :is_true
    end
end