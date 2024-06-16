require("ibl").setup(
{
      indent = { char = "│" },
      whitespace = { highlight = { "Whitespace", "NonText" } },
      scope =  {
        enabled = true,
        show_start = true,
        show_end = false,
        injected_languages = false,
        highlight = { "Function", "Label" },
        priority = 500,
        include = {
          node_type = { ["*"] = { "*" } },    
        },
      },
})
