Program
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'a'
|  |  Type: None
|  |  Initializer:
|  |  |  LIT_INTEGER(42)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'b'
|  |  Type: None
|  |  Initializer:
|  |  |  LIT_INTEGER(42)
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
|  |  |  |  |  LIT_INTEGER(42)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'd'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(MyType)
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
|  |  |  |  |  |  |  LIT_INTEGER(16)
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