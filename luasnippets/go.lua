-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
-- lua require("luasnip.loaders").edit_snippet_files()

local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

return {

	s("iferr", fmt([[
		if err != nil {
			return <> fmt.Errorf("<>: %w", err)
		}

		]], {i(1), i(2)}, {delimiters = "<>"})
	),

	s("iferrhttp", fmt([[
		if err != nil {
			http.Error(w, err.Error(), http.Status<>)
			return
		}
		]], {i(1, "InternalServerError")}, {delimiters = "<>"})
	),

	s("selecttimeout", fmt([[
		select {
		case <<-time.After(<>):
		}
		]], {i(1, "time.Hour")}, {delimiters = "<>"})
	),

	s("handlerfunc", fmt([[
		http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			<>
		})
		]], {i(1, "http.Error(w, http.StatusText(http.StatusNotImplemented), http.StatusNotImplemented)")}, {delimiters = "<>"})
	),

	s("embedfs", fmt([[
		//go:embed <>
		var <> embed.FS

		]], {i(1, "*"), i(2, "files")}, {delimiters = "<>"})
	),

	s("templatefs", fmt([[
		var <> = template.Must(template.ParseFS(<>, <>))
		]], {i(1, "templates"), i(2, "files"), i(3, "\"*\"")}, {delimiters = "<>"})
	),

	s("switchtype", fmt([[
		switch v := <>.(type) {
		case <>:
			<>
		}
		]], {i(1, "variable"), i(2, "string"), i(3, "fmt.Println(v)")}, {delimiters = "<>"})
	)
}
