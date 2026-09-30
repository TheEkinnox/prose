Program
|  VariableDeclaration
|  |  Start: (1:1) IDENTIFIER(a)
|  |  IsConst: false
|  |  Name: 'a'
|  |  Type: None
|  |  Initializer:
|  |  |  (1:6) LIT_INTEGER(42)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (2:1) IDENTIFIER(b)
|  |  IsConst: false
|  |  Name: 'b'
|  |  Type: None
|  |  Initializer:
|  |  |  (2:7) LIT_INTEGER(42)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (4:1) IDENTIFIER(c)
|  |  IsConst: false
|  |  Name: 'c'
|  |  Type: None
|  |  Initializer:
|  |  |  ConstructionExpression
|  |  |  |  Start: (4:5) T_I32(i32)
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  |  Arguments:
|  |  |  |  |  (4:9) LIT_INTEGER(42)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (5:1) IDENTIFIER(d)
|  |  IsConst: false
|  |  Name: 'd'
|  |  Type: None
|  |  Initializer:
|  |  |  (5:5) IDENTIFIER(MyType)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None
|  VariableDeclaration
|  |  Start: (7:1) IDENTIFIER(e)
|  |  IsConst: false
|  |  Name: 'e'
|  |  Type: None
|  |  Initializer:
|  |  |  MakeExpression
|  |  |  |  Start: (7:5) KW_MAKE(make)
|  |  |  |  Type:
|  |  |  |  |  Base: MyType
|  |  |  |  |  Modifiers: None
|  |  |  |  Arguments: None
|  VariableDeclaration
|  |  Start: (8:1) IDENTIFIER(f)
|  |  IsConst: false
|  |  Name: 'f'
|  |  Type: None
|  |  Initializer:
|  |  |  MakeExpression
|  |  |  |  Start: (8:5) KW_MAKE(make)
|  |  |  |  Type:
|  |  |  |  |  Base: byte
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  FixedArray
|  |  |  |  |  |  |  (8:15) LIT_INTEGER(16)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Arguments: None
|  VariableDeclaration
|  |  Start: (9:1) IDENTIFIER(g)
|  |  IsConst: false
|  |  Name: 'g'
|  |  Type: None
|  |  Initializer:
|  |  |  MakeExpression
|  |  |  |  Start: (9:5) KW_MAKE(make)
|  |  |  |  Type:
|  |  |  |  |  Base: byte
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  DynamicArray
|  |  |  |  Arguments: None