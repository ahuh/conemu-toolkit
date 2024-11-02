
local exports = {}

--- Add common arg to parser
exports.add_common_arg = function (parser)
    parser:addarg("", "+", "-")
    parser:adddescriptions(
        {"+", description="split to right"},
        {"-", description="split to bottom"}
    )
    return parser
end

return exports