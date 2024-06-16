vim.cmd [[
    function! LazyGitToggle()
        set lazyredraw
        call termopen('lazygit', {'on_exit': function('s:OnExitLazyGit')})
    endfunction

    function! s:OnExitLazyGit(job_id, data, event)
        set nolazyredraw
    endfunction

    command! LazyGitToggle call LazyGitToggle()
]]


vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

