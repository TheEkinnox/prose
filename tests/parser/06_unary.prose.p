Program
|  VariableDeclaration
|  |  Start: (1:1) IDENTIFIER(a)
|  |  IsConst: false
|  |  Name: 'a'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (1:5) OP_MINUS(-)
|  |  |  |  Operand:
|  |  |  |  |  (1:6) IDENTIFIER(value)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (2:1) IDENTIFIER(b)
|  |  IsConst: false
|  |  Name: 'b'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (2:5) OP_LOGICAL_NOT(!)
|  |  |  |  Operand:
|  |  |  |  |  (2:6) IDENTIFIER(condition)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (3:1) IDENTIFIER(c)
|  |  IsConst: false
|  |  Name: 'c'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (3:5) OP_BITWISE_NOT(~)
|  |  |  |  Operand:
|  |  |  |  |  (3:6) IDENTIFIER(flags)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (4:1) IDENTIFIER(d)
|  |  IsConst: false
|  |  Name: 'd'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (4:5) OP_ADDRESS_OF(@)
|  |  |  |  Operand:
|  |  |  |  |  (4:6) IDENTIFIER(value)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (5:1) IDENTIFIER(e)
|  |  IsConst: false
|  |  Name: 'e'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (5:5) KW_MOVE(move)
|  |  |  |  Operand:
|  |  |  |  |  (5:10) IDENTIFIER(value)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (7:1) IDENTIFIER(f)
|  |  IsConst: false
|  |  Name: 'f'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (7:5) OP_INC(++)
|  |  |  |  Operand:
|  |  |  |  |  (7:7) IDENTIFIER(counter)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (8:1) IDENTIFIER(g)
|  |  IsConst: false
|  |  Name: 'g'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (8:5) OP_DEC(--)
|  |  |  |  Operand:
|  |  |  |  |  (8:7) IDENTIFIER(counter)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (10:1) IDENTIFIER(h)
|  |  IsConst: false
|  |  Name: 'h'
|  |  Type: None
|  |  Initializer:
|  |  |  (10:5) IDENTIFIER(counter)
|  |  |  |  Postfix:
|  |  |  |  |  Increment
|  VariableDeclaration
|  |  Start: (11:1) IDENTIFIER(i)
|  |  IsConst: false
|  |  Name: 'i'
|  |  Type: None
|  |  Initializer:
|  |  |  (11:5) IDENTIFIER(counter)
|  |  |  |  Postfix:
|  |  |  |  |  Decrement
|  VariableDeclaration
|  |  Start: (13:1) IDENTIFIER(j)
|  |  IsConst: false
|  |  Name: 'j'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (13:5) OP_MINUS(-)
|  |  |  |  Operand:
|  |  |  |  |  (13:6) IDENTIFIER(array)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  (13:12) LIT_INTEGER(0)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (14:1) IDENTIFIER(k)
|  |  IsConst: false
|  |  Name: 'k'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (14:5) OP_LOGICAL_NOT(!)
|  |  |  |  Operand:
|  |  |  |  |  (14:6) IDENTIFIER(foo)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'enabled'
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (15:1) IDENTIFIER(l)
|  |  IsConst: false
|  |  Name: 'l'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (15:5) OP_ADDRESS_OF(@)
|  |  |  |  Operand:
|  |  |  |  |  (15:6) IDENTIFIER(array)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  (15:12) IDENTIFIER(index)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (16:1) IDENTIFIER(m)
|  |  IsConst: false
|  |  Name: 'm'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (16:5) KW_MOVE(move)
|  |  |  |  Operand:
|  |  |  |  |  (16:10) IDENTIFIER(objects)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Index
|  |  |  |  |  |  |  |  (16:18) IDENTIFIER(index)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (17:1) IDENTIFIER(n)
|  |  IsConst: false
|  |  Name: 'n'
|  |  Type: None
|  |  Initializer:
|  |  |  UnaryExpression
|  |  |  |  Operator: (17:5) OP_INC(++)
|  |  |  |  Operand:
|  |  |  |  |  (17:7) IDENTIFIER(object)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'member'
|  |  |  |  Postfix: None