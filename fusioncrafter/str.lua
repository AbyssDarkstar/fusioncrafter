-- simple modules

-- capture the name searched for by require
local NAME=...

-- table for our functions
local M = { }

--[[

    string.split (s, p)
    ====================================================================
    Splits the string [s] into substrings wherever pattern [p] occurs.

    Returns: a table of substrings or, if no match is made [nil].

--]]
M.split = function(s, p)
    local temp = {}
    local index = 0
    local last_index = string.len(s)

    while true do
        local i, e = string.find(s, p, index)

        if i and e then
            local next_index = e + 1
            local word_bound = i - 1
            table.insert(temp, string.sub(s, index, word_bound))
            index = next_index
        else            
            if index > 0 and index <= last_index then
                table.insert(temp, string.sub(s, index, last_index))
            elseif index == 0 then
                temp = nil
            end
            break
        end
    end

    return temp
end

return M