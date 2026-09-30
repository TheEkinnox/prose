Program
|  FunctionDeclaration
|  |  Start: (1:1) KW_FN(fn)
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  ForStatement
|  |  |  |  Start: (2:5) KW_FOR(for)
|  |  |  |  Iterator:
|  |  |  |  |  Name: i
|  |  |  |  |  Is Ref: false
|  |  |  |  Range:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_RANGE
|  |  |  |  |  |  Left:
|  |  |  |  |  |  |  (2:14) LIT_INTEGER(0)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right:
|  |  |  |  |  |  |  (2:17) LIT_INTEGER(10)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  (3:9) IDENTIFIER(process)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  (3:17) IDENTIFIER(i)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  ForStatement
|  |  |  |  Start: (6:5) KW_FOR(for)
|  |  |  |  Iterator:
|  |  |  |  |  Name: value
|  |  |  |  |  Is Ref: false
|  |  |  |  Range:
|  |  |  |  |  (6:18) IDENTIFIER(array)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  (7:9) IDENTIFIER(process)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  (7:17) IDENTIFIER(value)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  ForStatement
|  |  |  |  Start: (10:5) KW_FOR(for)
|  |  |  |  Iterator:
|  |  |  |  |  Name: value
|  |  |  |  |  Is Ref: true
|  |  |  |  Range:
|  |  |  |  |  (10:19) IDENTIFIER(array)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  (11:9) IDENTIFIER(value)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Increment
|  |  |  ForStatement
|  |  |  |  Start: (14:5) KW_FOR(for)
|  |  |  |  Iterator:
|  |  |  |  |  Name: i
|  |  |  |  |  Is Ref: false
|  |  |  |  Range:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_RANGE
|  |  |  |  |  |  Left:
|  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  |  |  |  Left:
|  |  |  |  |  |  |  |  |  (14:14) IDENTIFIER(first)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Right:
|  |  |  |  |  |  |  |  |  (14:22) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right:
|  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  Operator: OP_MINUS
|  |  |  |  |  |  |  |  Left:
|  |  |  |  |  |  |  |  |  (14:25) IDENTIFIER(last)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Right:
|  |  |  |  |  |  |  |  |  (14:32) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  (15:9) IDENTIFIER(process)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  (15:17) IDENTIFIER(i)
|  |  |  |  |  |  |  |  |  |  Postfix: None