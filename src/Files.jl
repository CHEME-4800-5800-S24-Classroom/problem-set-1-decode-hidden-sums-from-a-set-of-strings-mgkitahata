include("Types.jl")
include("Factory.jl")

# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    puzzleparse(filename::String) -> Dict{Int64, MyPuzzleRecordModel}

TODO: Add documentation -- written
Parses a file containing encoded puzzle records and returns a dictionary
where the key is the line number (starting from index 1) and the value is
a `MyPuzzleRecordModel` instance holding the encoded line of text.

# Arguments
- `file_path::AbstractString`: The path to the file containing the encoded puzzle records.

# Returns
- `Dict{Int, MyPuzzleRecordModel}`: A dictionary where the key is the line number
  and the value is a `MyPuzzleRecordModel` instance.

# Example
```julia
result = puzzleparse("puzzles.txt")
"""
function puzzleparse(filename::String)::Dict{Int64, MyPuzzleRecordModel}
    
    # initialize -
    records = Dict{Int64, MyPuzzleRecordModel}()
    linecounter = 1;
    
    # main -
    open(filename, "r") do io
        for line ∈ eachline(io)
            strip_line = replace(line, r"\n$" => "")
            puzzle_record = build(strip_line)
            records[linecounter] = puzzle_record
            linecounter += 1 
            
            # TODO: do something with this line of text

        end
    end

    # return the header and the records -
    return records;
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #