[
  (directive)
  (directive_start)
  (directive_end)
] @keyword
(directive) @function
(directive_start) @function
(directive_end) @function
(comment) @comment
((parameter) @include (#set! "priority" 110)) 
((php_only) @include (#set! "priority" 110)) 
((bracket_start) @function (#set! "priority" 120)) 
((bracket_end) @function (#set! "priority" 120)) 
(keyword) @function
([
  (bracket_start)
  (bracket_end)
] @punctuation.special (#set! "priority" 110))

(comment) @comment @spell
