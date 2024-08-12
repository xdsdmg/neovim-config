return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim'
    },
    event = "VeryLazy",
    config = function(_, opts)
      require("telescope").load_extension("live_grep_args")
    end
  },
}
