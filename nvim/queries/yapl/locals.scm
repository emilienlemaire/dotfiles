(function_definition
  name: (identifier) @definition.function
  parameters: (parameters (_ (simple_declaration
                 name: (identifier) @defintion.parameter)))) @scope

(struct_constructor_initialization (simple_declaration
                                     name: (identifier) @definition.var))

(struct_definition
  name: (identifier) @definition.type
) @scope

(struct_body
    method: (function_definition
          name: (identifier) @definition.method
          )
    attribute: (_ (simple_declaration
                name: (identifier) @definition.field
                )))
(for_statement
  loop_variable: (simple_declaration
                   name: (identifier) @definition.var))

(simple_declaration
  name: (identifier) @definition.var)

(identifier) @reference

((attribute_access
   attribute: (identifier) @reference)
 (set! reference.kind "field"))

[
  (if_statement)
  (for_statement)
  (source_file)
] @scope

