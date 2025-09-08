; extends

; From https://github.com/chrisgrieser/.config/blob/main/nvim/queries/lua/highlights.scm
; Add hlgroup `@namespace.builtin.lua`:
; - nvim: `vim`
((identifier) @namespace.builtin
  (#any-of? @namespace.builtin "vim"))
