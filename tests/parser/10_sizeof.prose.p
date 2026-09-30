Program
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'a'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'b'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Type:
|  |  |  |  |  Base: byte
|  |  |  |  |  Modifiers:
|  |  |  |  |  |  FixedArray
|  |  |  |  |  |  |  (2:17) LIT_INTEGER(4)
|  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'c'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Value:
|  |  |  |  |  (3:12) IDENTIFIER(value)
|  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'd'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Value:
|  |  |  |  |  (4:12) IDENTIFIER(array)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  (4:18) LIT_INTEGER(0)
|  |  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'e'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Value:
|  |  |  |  |  (5:12) IDENTIFIER(MyType)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  (5:19) LIT_INTEGER(6)
|  |  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'f'
|  |  Type: None
|  |  Initializer:
|  |  |  SizeOfExpression
|  |  |  |  Value:
|  |  |  |  |  (6:12) IDENTIFIER(foo)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'member'