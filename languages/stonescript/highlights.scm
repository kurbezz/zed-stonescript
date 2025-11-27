; Minimal highlights for StoneScript
; Most highlighting is provided by LSP semantic tokens

; Comments
(comment) @comment
(block_comment) @comment.block

; Literals
(number) @number
(float) @number.float
(string) @string
(boolean) @boolean
(color_code) @string.special

; Keywords
"var" @keyword
"func" @keyword
"for" @keyword
"return" @keyword
"import" @keyword
"new" @keyword
"if" @keyword.control.conditional
"else" @keyword.control.conditional

; Operators
"=" @operator
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"%" @operator
"&" @operator
"|" @operator
"!" @operator
"<" @operator
">" @operator
"?" @operator

; Identifiers (fallback - LSP will provide better classification)
(identifier) @variable

; Function calls
(call_expression
  function: (identifier) @function.call)

; Member expressions
(member_expression
  property: (identifier) @property)
