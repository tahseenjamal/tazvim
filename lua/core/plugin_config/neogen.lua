  require('neogen').setup {
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = "google_docstrings"
          }
        },
        -- Add other language configurations here
      },
    }
