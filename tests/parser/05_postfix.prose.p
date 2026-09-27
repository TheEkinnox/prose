Program
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'a'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'b'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'c'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Index
|  |  |  |  |  |  LIT_INTEGER(0)
|  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'd'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Index
|  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  IDENTIFIER(index)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'e'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Slice
|  |  |  |  |  |  Start:
|  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  End:
|  |  |  |  |  |  |  LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'f'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Slice
|  |  |  |  |  |  Start: None
|  |  |  |  |  |  End:
|  |  |  |  |  |  |  LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'g'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Slice
|  |  |  |  |  |  Start:
|  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  End: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'h'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Slice
|  |  |  |  |  |  Start: None
|  |  |  |  |  |  End: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'i'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(object)
|  |  |  |  Postfix:
|  |  |  |  |  MemberAccess
|  |  |  |  |  |  Member: 'member'
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'j'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None
|  |  |  |  |  MemberAccess
|  |  |  |  |  |  Member: 'member'
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'k'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None
|  |  |  |  |  Index
|  |  |  |  |  |  LIT_INTEGER(0)
|  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'l'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None
|  |  |  |  |  Index
|  |  |  |  |  |  LIT_INTEGER(0)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  MemberAccess
|  |  |  |  |  |  Member: 'member'
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'm'
|  |  Type: None
|  |  Initializer:
|  |  |  IDENTIFIER(objects)
|  |  |  |  Postfix:
|  |  |  |  |  Index
|  |  |  |  |  |  IDENTIFIER(index)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  MemberAccess
|  |  |  |  |  |  Member: 'member'
|  |  |  |  |  MemberAccess
|  |  |  |  |  |  Member: 'foo'
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None