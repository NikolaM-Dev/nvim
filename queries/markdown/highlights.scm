;; extends

;; completed check-box
(list
  (list_item
    (task_list_marker_checked) @text.todo.checked.markdown (#set! conceal "")))

;; uncompleted check-box
(list
  (list_item
    (task_list_marker_unchecked) @text.todo.unchecked.markdown (#set! conceal "")))
