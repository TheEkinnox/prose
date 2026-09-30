Program
|  FunctionDeclaration
|  |  Name: 'empty'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Name: 'explicit_empty'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Name: 'returns_void'
|  |  Type:
|  |  |  Base: void
|  |  |  Modifiers: None
|  |  Parameters: None
|  |  Body:
|  |  |  Return: None
|  FunctionDeclaration
|  |  Name: 'one'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Name: 'many'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'b'
|  |  |  |  Type:
|  |  |  |  |  Base: u8
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: true
|  |  |  |  Name: 'c'
|  |  |  |  Type:
|  |  |  |  |  Base: bool
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Name: 'result'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'b'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  Body:
|  |  |  Return
|  |  |  |  BinaryExpression
|  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  Left:
|  |  |  |  |  |  (18:12) IDENTIFIER(a)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Right:
|  |  |  |  |  |  (18:16) IDENTIFIER(b)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Postfix: None
|  FunctionDeclaration
|  |  Name: 'defaults'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'b'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer:
|  |  |  |  |  (21:32) LIT_INTEGER(10)
|  |  |  |  |  |  Postfix: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Name: 'inferred_default'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'enabled'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (24:40) KW_TRUE(true)
|  |  |  |  |  |  Postfix: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Name: 'several_defaults'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'b'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (27:34) LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'c'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (27:41) LIT_INTEGER(3)
|  |  |  |  |  |  Postfix: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Name: 'dependent'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'x'
|  |  |  |  Type:
|  |  |  |  |  Base: u8
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'y'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  |  Left:
|  |  |  |  |  |  |  (30:26) IDENTIFIER(x)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right:
|  |  |  |  |  |  |  (30:30) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  Body:
|  |  |  Empty Block