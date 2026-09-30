Program
|  FunctionDeclaration
|  |  Start: (1:1) KW_FN(fn)
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  VariableDeclaration
|  |  |  |  Start: (2:5) IDENTIFIER(x)
|  |  |  |  IsConst: false
|  |  |  |  Name: 'x'
|  |  |  |  Type: None
|  |  |  |  Initializer:
|  |  |  |  |  (2:9) LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  ScopeStatement
|  |  |  |  Start: (4:5) KW_SCOPE(scope)
|  |  |  |  Body:
|  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  Start: (5:9) IDENTIFIER(y)
|  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  Name: 'y'
|  |  |  |  |  |  Type: None
|  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  (5:13) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  ScopeStatement
|  |  |  |  |  |  Start: (7:9) KW_SCOPE(scope)
|  |  |  |  |  |  Body:
|  |  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  |  Start: (8:13) IDENTIFIER(z)
|  |  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  |  Name: 'z'
|  |  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  |  |  |  |  |  Left:
|  |  |  |  |  |  |  |  |  |  |  (8:17) IDENTIFIER(x)
|  |  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  |  Right:
|  |  |  |  |  |  |  |  |  |  |  (8:21) IDENTIFIER(y)
|  |  |  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  |  |  Postfix: None