(fn config []
  (local treesitter (require :nvim-treesitter.configs))
  (treesitter.setup {:ensure_installed "all"
                     :highlight {:enable true}
                     :indent {:enable false}
                     :yati {:enable true}
                     :rainbow {:enable true
                               :extended_mode true}}))

{1 "nvim-treesitter/nvim-treesitter"
 :dependencies ["p00f/nvim-ts-rainbow"
                {1 "yioneko/nvim-yati" :version "*"}]}

