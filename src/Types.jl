"""
    struct MyPuzzleRecordModel

A mutable struct representing a puzzle record model.

# Fields
- `record::String`: A single encoded line of text.
- `characters::Array{Char, 1}`: The characters of the line of text.
- `len::Int64`: The length (number of characters) of the encoded line of text.
"""
mutable struct MyPuzzleRecordModel
    record::String
    characters::Array{Char, 1}
    len::Int64
    #written
end
