# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

TODO: Add documentation
"""
function decode_part_1(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
    
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
    for (linecounter,model) in models
        encoded_line = model.record 

        first_digit = nothing
        last_digit = nothing 

        for num1 in encoded_line   
            if isdigit(num1)
                first_digit=num1
                break
            end
        end

        for num2 in reverse(encoded_line)
            if isdigit(num2)
                last_digit=num2
                break
            end
        end 

        if first_digit !==nothing && last_digit !== nothing 
            combined_number=string(first_digit,last_digit) 
            code = parse(Int,combined_number)

            total = total + code 
            codes[linecounter]= code 
        end
    end 

    
    # TODO: Add the logic for part 1 here
    # ...
    
    # return the total -
    return (total, codes);
end

"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

TODO: Add documentation
"""
function decode_part_2(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
    
     
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();

    Listofdigits_words = ["one","two","three","four","five","six","seven","eight","nine"]
    Listofdigits = ["1","2","3","4","5","6","7","8","9"]
    
    for (linecounter, model) in models
        encoded_line = model.record 
        first_digit = nothing
        last_digit = nothing
        first_word_index = 10000
        first_digit_index = 10000
        lowestnum = nothing


        

        place_holder = 10000
        for (i, str1) in enumerate(Listofdigits_words)
            index_1 = findfirst(str1,encoded_line)
            

            #place_holder = index_1[1]
            if index_1 == nothing
                i = i+1
                continue

            elseif index_1[1] < place_holder
                place_holder = index_1[1]
                lowestnum = i
                #println("ran: $str1")
                #println("lowestnum $place_holder")
        
            end 
            first_word_index = place_holder  
        end
            

        lowestnum1 = nothing
        digit_holder = 1000               
        for (j, str1) in enumerate(Listofdigits)
            
            digitindex_1 = findfirst(str1,encoded_line)
            if digitindex_1 == nothing 
                j+=1 
                continue
            elseif digitindex_1[1] < digit_holder
                digit_holder = digitindex_1[1]
                lowestnum1 = j
            end 
            first_digit_index = digit_holder
        end 

        if first_word_index > first_digit_index

            first_digit = Listofdigits[lowestnum1]


        elseif first_word_index < first_digit_index 
            first_digit = Listofdigits[lowestnum]
        end 

        # println(first_digit)


    
        
        
        last_word_index = 0
        last_digit_index = 0 
        place_holder1 = 0
        highestnum = nothing
        for (i, str1) in enumerate(Listofdigits_words)
            
            index_1 = findlast(str1,encoded_line)
            #place_holder = index_1[1]
            if index_1 == nothing
                i+=1
                continue

            elseif index_1[1] > place_holder1
                place_holder1 = index_1[1]
                highestnum = i
                #println("str1 $str1")
                #println("index: $place_holder1")
                

            end 
            last_word_index = place_holder1 
        end
            
        highestnum1 = nothing

        digit_holder = 0 
        for (j, str1) in enumerate(Listofdigits) 
            
            digitindex_1 = findlast(str1,encoded_line)
            if digitindex_1 == nothing 
                j+=1 
                continue
            elseif digitindex_1[1] > digit_holder
                digit_holder = digitindex_1[1]
                highestnum1 = j

            end 
            last_digit_index = digit_holder   
        end 

        if last_word_index < last_digit_index 
            last_digit = Listofdigits[highestnum1]

        elseif last_word_index > last_digit_index 
            last_digit = Listofdigits[highestnum]
            
        end

    

        if first_digit !==nothing && last_digit !== nothing 
        combined_number=string(first_digit,last_digit) 
        #println("combined number $combined_number")
        code = parse(Int,combined_number)
        
        total = total + code 
    
        
        codes[linecounter]= code 
        end
    end 

    # TODO: Add the logic for part 2 here
    # ...
     
     # return the total -
    return (total, codes);

end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #