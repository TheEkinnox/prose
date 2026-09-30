Program
|  VariableDeclaration
|  |  Start: (1:1) IDENTIFIER(a)
|  |  IsConst: false
|  |  Name: 'a'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Start: (1:5) KW_SIZEOF(sizeof)
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  VariableDeclaration
|  |  Start: (2:1) IDENTIFIER(b)
|  |  IsConst: false
|  |  Name: 'b'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Start: (2:5) KW_SIZEOF(sizeof)
|  |  |  |  Type:
|  |  |  |  |  Base: byte
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  FixedArray
|  |  |  |  |  |  |  (2:17) LIT_INTEGER(4)
|  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (3:1) IDENTIFIER(c)
|  |  IsConst: false
|  |  Name: 'c'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Start: (3:5) KW_SIZEOF(sizeof)
|  |  |  |  Value:
|  |  |  |  |  (3:12) IDENTIFIER(value)
|  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (4:1) IDENTIFIER(d)
|  |  IsConst: false
|  |  Name: 'd'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Start: (4:5) KW_SIZEOF(sizeof)
|  |  |  |  Value:
|  |  |  |  |  (4:12) IDENTIFIER(array)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  (4:18) LIT_INTEGER(0)
|  |  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (5:1) IDENTIFIER(e)
|  |  IsConst: false
|  |  Name: 'e'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Start: (5:5) KW_SIZEOF(sizeof)
|  |  |  |  Value:
|  |  |  |  |  (5:12) IDENTIFIER(MyType)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  (5:19) LIT_INTEGER(6)
|  |  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (6:1) IDENTIFIER(f)
|  |  IsConst: false
|  |  Name: 'f'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Start: (6:5) KW_SIZEOF(sizeof)
|  |  |  |  Value:
|  |  |  |  |  (6:12) IDENTIFIER(foo)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'member'