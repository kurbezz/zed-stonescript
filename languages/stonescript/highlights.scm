; Statement keywords
(variable_declaration "var" @keyword)
(function_declaration "func" @keyword)
(for_loop "for" @keyword)
(return_statement "return" @keyword)
(break_statement) @keyword
(continue_statement) @keyword
(import_statement "import" @keyword)
(new_expression "new" @keyword)

; Commands (highlighted through their parent nodes)
(equip_command) @keyword.control
(activate_command) @keyword.control
(loadout_command) @keyword.control
(brew_command) @keyword.control
(disable_enable_command) @keyword.control
(play_command) @keyword.control
(print_command) @keyword.control



; Conditionals (highlighted through their parent nodes)
(conditional) @keyword.control.conditional
(else_if_clause) @keyword.control.conditional
(else_clause) @keyword.control.conditional

; Operators (captured within expressions)
; Note: Operators are part of binary_expression, assignment_expression, etc.
; They don't exist as separate node types in the grammar

; Delimiters are captured in context of their parent nodes
; Tree-sitter doesn't support capturing anonymous nodes in lists

; Literals
(number) @number
(float) @number.float
(string) @string
(boolean) @boolean
(null) @constant.builtin
(color_code) @string.special

; Comments
(comment) @comment
(block_comment) @comment.block

; Identifiers
(identifier) @variable

; Function declarations
(function_declaration
  name: (identifier) @function)

; Function calls
(call_expression
  function: (identifier) @function.call)

; Member expressions
(member_expression
  property: (identifier) @property)

; Variable declarations
(variable_declaration
  name: (identifier) @variable)

; Parameters
(parameter_list
  (identifier) @parameter)

; Built-in game state
((identifier) @constant.builtin
 (#match? @constant.builtin "^(loc|foe|hp|maxhp|time|screen|res|key|input|ai|armor|import|player|ui|item|potion|pos|draw|save|storage)$"))

; Module paths
(module_path) @namespace

; Star and enchantment levels  
(star_level) @number.float
(enchantment_level) @number.float
