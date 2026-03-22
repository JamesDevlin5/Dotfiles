; extends

; Highlight `r"..."` strings with regex
((string
  (string_start) @_start
  (#any-of? @_start "r\"" "r'"))
  @injection.content
  (#set! injection.language "regex")
  (#set! injection.include-children))

; Highlight `re.*()` calls with regex
(call
  function: (attribute
    object: (identifier) @_module
    (#eq? @_module "re"))
  arguments: (argument_list
    (string) @injection.content
    (#set! injection.language "regex")
    (#set! injection.include-children)))
