;; extends

;; comment highlight for completed check-box
(list_item (task_list_marker_checked)) @comment

;; NOTE: Commented because I am currently using markdwon.nvim

;; completed check-box
; (list
;   (list_item
;     (task_list_marker_checked) @text.todo.checked.markdown (#set! conceal "")))

;; uncompleted check-box
; (list
;   (list_item
;     (task_list_marker_unchecked) @text.todo.unchecked.markdown (#set! conceal "")))

;; list markers/bullet points
; (
;   ([
;     (list_marker_star)
;     (list_marker_plus)
;     (list_marker_minus)
;   ]) @markdown_list_marker
;   ; (#offset! @markdown_list_marker 0 0 0 -1)
;   (#set! conceal "•")
; )

;; block quotes
; ((block_quote_marker) @markdown_quote_marker (#set! conceal "▍"))
;
; ((block_quote
;   (paragraph (inline
;     (block_continuation) @markdown_quote_marker (#set! conceal "▍")
;   ))
; ))

;; code blocks
; (fenced_code_block
;  (fenced_code_block_delimiter) @conceal (#set! conceal "")
; )
