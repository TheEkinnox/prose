Program
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  IDENTIFIER(objects)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  |  |  IDENTIFIER(index)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'child'
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'getValue'
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'b'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_MUL
|  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  UnaryExpression
|  |  |  |  |  |  |  |  Operator: OP_MINUS
|  |  |  |  |  |  |  |  Operand: 
|  |  |  |  |  |  |  |  |  IDENTIFIER(objects)
|  |  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  |  |  |  |  IDENTIFIER(i)
|  |  |  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  |  |  |  |  Member: 'values'
|  |  |  |  |  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  |  |  |  |  IDENTIFIER(j)
|  |  |  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'c'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  UnaryExpression
|  |  |  |  |  |  Operator: OP_LOGICAL_NOT
|  |  |  |  |  |  Operand: 
|  |  |  |  |  |  |  IDENTIFIER(foo)
|  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  |  |  Member: 'state'
|  |  |  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  |  |  Member: 'enabled'
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'd'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  UnaryExpression
|  |  |  |  |  |  Operator: OP_ADDRESS_OF
|  |  |  |  |  |  Operand: 
|  |  |  |  |  |  |  IDENTIFIER(objects)
|  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  |  |  IDENTIFIER(i)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  |  |  Member: 'member'
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'e'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  UnaryExpression
|  |  |  |  |  |  Operator: KW_MOVE
|  |  |  |  |  |  Operand: 
|  |  |  |  |  |  |  IDENTIFIER(objects)
|  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  |  |  IDENTIFIER(index)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'f'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  IDENTIFIER(foo)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  IDENTIFIER(bar)
|  |  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  IDENTIFIER(baz)
|  |  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'items'
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  LIT_INTEGER(3)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'value'