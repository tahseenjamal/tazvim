local inlay_hints = require("inlay-hints")

inlay_hints.setup({
  commands = { 
    enable = true 
  },
  autocmd = { 
    enable = true 
  },
  options = {
    highlight = "Comment",
    prefix = " » ",
    aligned = true,
    only_current_line = true,
    show_parameter_hints = true,
    show_type_hints = true,
    enabled = { "TypeHint", "ChainingHint", "ParameterHint" },
    disable_virtual_text = false,  
    max_len_align = false,         
    right_align = false,           
    right_align_padding = 7,       
    hint_formatters = {
      TypeHint = function(hint)
        return "=> " .. hint
      end,
      ParameterHint = function(hint)
        return "param: " .. hint
      end,
      ChainingHint = function(hint)
        return "chain: " .. hint
      end,
    },
  },
  languages = {
    rust = {
      enabled = {"TypeHint", "ParameterHint"},
      only_current_line = false,
      prefix = " -> ",
    },

  },
})

