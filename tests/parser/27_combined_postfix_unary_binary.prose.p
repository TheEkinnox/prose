Program
|  FunctionDeclaration
|  |  Start: (1:1) KW_FN(fn)
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  Start: (2:5) IDENTIFIER(a)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'a'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (2:9) IDENTIFIER(objects)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  |  |  |  |  Left:
|  |  |  |  |  |  |  |  |  |  (2:17) IDENTIFIER(index)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Right:
|  |  |  |  |  |  |  |  |  |  (2:25) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'child'
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'getValue'
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (3:5) IDENTIFIER(b)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'b'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_STAR
|  |  |  |  |  |  Left:
|  |  |  |  |  |  |  UnaryExpression
|  |  |  |  |  |  |  |  Operator: (3:9) OP_MINUS(-)
|  |  |  |  |  |  |  |  Operand:
|  |  |  |  |  |  |  |  |  (3:10) IDENTIFIER(objects)
|  |  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  |  |  |  |  (3:18) IDENTIFIER(i)
|  |  |  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  |  |  |  |  Member: 'values'
|  |  |  |  |  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  |  |  |  |  (3:28) IDENTIFIER(j)
|  |  |  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right:
|  |  |  |  |  |  |  (3:33) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (4:5) IDENTIFIER(c)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'c'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  UnaryExpression
|  |  |  |  |  |  Operator: (4:9) OP_LOGICAL_NOT(!)
|  |  |  |  |  |  Operand:
|  |  |  |  |  |  |  (4:10) IDENTIFIER(foo)
|  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  |  |  Member: 'state'
|  |  |  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  |  |  Member: 'enabled'
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (5:5) IDENTIFIER(d)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'd'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  UnaryExpression
|  |  |  |  |  |  Operator: (5:9) OP_ADDRESS_OF(@)
|  |  |  |  |  |  Operand:
|  |  |  |  |  |  |  (5:10) IDENTIFIER(objects)
|  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  |  |  (5:18) IDENTIFIER(i)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  |  |  Member: 'member'
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (6:5) IDENTIFIER(e)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'e'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  UnaryExpression
|  |  |  |  |  |  Operator: (6:9) KW_MOVE(move)
|  |  |  |  |  |  Operand:
|  |  |  |  |  |  |  (6:14) IDENTIFIER(objects)
|  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  |  |  (6:22) IDENTIFIER(index)
|  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  VariableDeclaration
|  |  |  |  Start: (7:5) IDENTIFIER(f)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'f'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (7:9) IDENTIFIER(foo)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  (7:13) IDENTIFIER(bar)
|  |  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  |  |  |  |  (7:17) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  (7:21) IDENTIFIER(baz)
|  |  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  |  |  |  |  (7:25) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'items'
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  (7:35) LIT_INTEGER(3)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'value'