Program
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  IsConst: false
|  |  |  |  Name: 'x'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (2:9) LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  ScopeStatement
|  |  |  |  VariableDeclaration
|  |  |  |  |  IsConst: false
|  |  |  |  |  Name: 'y'
|  |  |  |  |  Type: None
|  |  |  |  |  Initializer:
|  |  |  |  |  |  (5:13) LIT_INTEGER(2)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  ScopeStatement
|  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  Name: 'z'
|  |  |  |  |  |  Type: None
|  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  |  |  |  Left:
|  |  |  |  |  |  |  |  |  (8:17) IDENTIFIER(x)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Right:
|  |  |  |  |  |  |  |  |  (8:21) IDENTIFIER(y)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Postfix: None