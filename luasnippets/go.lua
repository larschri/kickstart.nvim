-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
-- lua require("luasnip.loaders").edit_snippet_files()
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

	s("funchandler", fmt([[
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
