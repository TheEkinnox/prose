Program
|  FunctionDeclaration
|  |  Start: (1:1) KW_FN(fn)
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  Start: (2:5) IDENTIFIER(result)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'result'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  BinaryExpression
|  |  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  |  Left:
|  |  |  |  |  |  |  (2:14) IDENTIFIER(first)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Right:
|  |  |  |  |  |  |  (3:9) IDENTIFIER(second)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  (5:5) IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  (6:9) IDENTIFIER(first)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (7:9) IDENTIFIER(second)
|  |  |  |  |  |  |  |  Postfix: None