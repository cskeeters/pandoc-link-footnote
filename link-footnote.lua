--[[
This adds Notes (footnotes) for links with their URL when the content is not
just the URL itself.
]]

-- There is no table.len in Lua (Boo!!)
function tablelen(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- Tests for links like <http://...>
function isContentTarget(elem)
    if tablelen(elem.content) == 1 then
        if elem.content[1].text == elem.target then
            return true
        end
    end
    return false
end

function Link(elem)
    if isContentTarget(elem) then
        -- Content is URL.  No need for footnote
        return elem
    end

    -- Return elem and target as footnote
    return {elem, pandoc.Note(elem.target)}
end

--    , Link
--        ( "" , [] , [] )
--        [ Str "link" ]
--        ( "http://www.google.com" , "" )

-- Link (content, target[, title[, attr]])
--   Creates a link inline element, usually a hyperlink.
-- 
-- Parameters:
--   content:  text for this link (Inlines)
--   target:  the link target (string)
--   title: brief link description (string)
--   attr:  link attributes (Attr)
--
-- Returns:
--   link element (Inline)
