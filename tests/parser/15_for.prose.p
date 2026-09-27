Program
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  ForStatement
|  |  |  |  Iterator:
|  |  |  |  |  Name: i
|  |  |  |  |  Is Ref: false
|  |  |  |  Range:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_RANGE
|  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  LIT_INTEGER(0)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  LIT_INTEGER(10)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  IDENTIFIER(process)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  IDENTIFIER(i)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  ForStatement
|  |  |  |  Iterator:
|  |  |  |  |  Name: value
|  |  |  |  |  Is Ref: false
|  |  |  |  Range:
|  |  |  |  |  IDENTIFIER(array)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  IDENTIFIER(process)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  IDENTIFIER(value)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  ForStatement
|  |  |  |  Iterator:
|  |  |  |  |  Name: value
|  |  |  |  |  Is Ref: true
|  |  |  |  Range:
|  |  |  |  |  IDENTIFIER(array)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  IDENTIFIER(value)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Increment
|  |  |  ForStatement
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
|  |  |  |  |  |  |  |  |  IDENTIFIER(first)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  Operator: OP_MINUS
|  |  |  |  |  |  |  |  Left: 
|  |  |  |  |  |  |  |  |  IDENTIFIER(last)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Right: 
|  |  |  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  IDENTIFIER(process)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  IDENTIFIER(i)
|  |  |  |  |  |  |  |  |  |  Postfix: None