Program
|  FunctionDeclaration
|  |  Start: (1:1) KW_FN(fn)
|  |  Name: 'empty'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Start: (4:1) KW_FN(fn)
|  |  Name: 'explicit_empty'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Start: (7:1) KW_FN(fn)
|  |  Name: 'returns_void'
|  |  Type:
|  |  |  Base: void
|  |  |  Modifiers: None
|  |  Parameters: None
|  |  Body:
|  |  |  ControlStatement
|  |  |  |  Type: (8:5) KW_RETURN(return)
|  |  |  |  Value: None
|  FunctionDeclaration
|  |  Start: (11:1) KW_FN(fn)
|  |  Name: 'one'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  Start: (11:8) IDENTIFIER(a)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Start: (14:1) KW_FN(fn)
|  |  Name: 'many'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  Start: (14:9) IDENTIFIER(a)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (14:18) IDENTIFIER(b)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'b'
|  |  |  |  Type:
|  |  |  |  |  Base: u8
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (14:26) KW_CONST(const)
|  |  |  |  IsConst: true
|  |  |  |  Name: 'c'
|  |  |  |  Type:
|  |  |  |  |  Base: bool
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Start: (17:1) KW_FN(fn)
|  |  Name: 'result'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  Start: (17:11) IDENTIFIER(a)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (17:20) IDENTIFIER(b)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'b'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  Body:
|  |  |  ControlStatement
|  |  |  |  Type: (18:5) KW_RETURN(return)
|  |  |  |  Value:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  |  Left:
|  |  |  |  |  |  |  (18:12) IDENTIFIER(a)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right:
|  |  |  |  |  |  |  (18:16) IDENTIFIER(b)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  FunctionDeclaration
|  |  Start: (21:1) KW_FN(fn)
|  |  Name: 'defaults'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  Start: (21:13) IDENTIFIER(a)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (21:22) IDENTIFIER(b)
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
|  |  Start: (24:1) KW_FN(fn)
|  |  Name: 'inferred_default'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  Start: (24:21) IDENTIFIER(a)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (24:30) IDENTIFIER(enabled)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'enabled'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (24:40) KW_TRUE(true)
|  |  |  |  |  |  Postfix: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Start: (27:1) KW_FN(fn)
|  |  Name: 'several_defaults'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  Start: (27:21) IDENTIFIER(a)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (27:30) IDENTIFIER(b)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'b'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (27:34) LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (27:37) IDENTIFIER(c)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'c'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (27:41) LIT_INTEGER(3)
|  |  |  |  |  |  Postfix: None
|  |  Body:
|  |  |  Empty Block
|  FunctionDeclaration
|  |  Start: (30:1) KW_FN(fn)
|  |  Name: 'dependent'
|  |  Type: None
|  |  Parameters:
|  |  |  VariableDeclaration
|  |  |  |  Start: (30:14) IDENTIFIER(x)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'x'
|  |  |  |  Type:
|  |  |  |  |  Base: u8
|  |  |  |  |  Modifiers: None
|  |  |  |  Initializer: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (30:22) IDENTIFIER(y)
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