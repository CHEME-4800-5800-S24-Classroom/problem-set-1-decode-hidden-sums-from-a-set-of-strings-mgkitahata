include("Types.jl")


function build(record::String)::MyPuzzleRecordModel
    characters = collect(Char, record)
    len = length(record)
    return MyPuzzleRecordModel(record, characters, len)
    #written
end
