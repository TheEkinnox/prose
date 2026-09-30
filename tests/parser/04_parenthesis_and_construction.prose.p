Program
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'a'
|  |  Type: None
|  |  Initializer:
|  |  |  (1:6) LIT_INTEGER(42)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'b'
|  |  Type: None
|  |  Initializer:
|  |  |  (2:7) LIT_INTEGER(42)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'c'
|  |  Type: None
|  |  Initializer:
|  |  |  ConstructionExpression
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Arguments:
|  |  |  |  |  (4:9) LIT_INTEGER(42)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'd'
|  |  Type: None
|  |  Initializer:
|  |  |  (5:5) IDENTIFIER(MyType)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'e'
|  |  Type: None
|  |  Initializer:
|  |  |  MakeExpression
|  |  |  |  Type:
|  |  |  |  |  Base: MyType
|  |  |  |  |  Modifiers: None
|  |  |  |  Arguments: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'f'
|  |  Type: None
|  |  Initializer:
|  |  |  MakeExpression
|  |  |  |  Type:
|  |  |  |  |  Base: byte
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  FixedArray
|  |  |  |  |  |  |  (8:15) LIT_INTEGER(16)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Arguments: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'g'
|  |  Type: None
|  |  Initializer:
|  |  |  MakeExpression
|  |  |  |  Type:
|  |  |  |  |  Base: byte
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  DynamicArray
|  |  |  |  Arguments: None