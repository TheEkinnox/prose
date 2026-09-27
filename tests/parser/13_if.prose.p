Program
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  IfStatement
|  |  |  |  Main branch:
|  |  |  |  |  Condition:
|  |  |  |  |  |  IDENTIFIER(condition)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Conditional branches: None
|  |  |  |  Default branch: None
|  |  |  IfStatement
|  |  |  |  Main branch:
|  |  |  |  |  Condition:
|  |  |  |  |  |  IDENTIFIER(first)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Conditional branches:
|  |  |  |  |  Condition:
|  |  |  |  |  |  IDENTIFIER(second)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Condition:
|  |  |  |  |  |  IDENTIFIER(third)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  LIT_INTEGER(3)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Default branch:
|  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  Type: None
|  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  LIT_INTEGER(4)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  IfStatement
|  |  |  |  Main branch:
|  |  |  |  |  Condition:
|  |  |  |  |  |  IDENTIFIER(first)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  IfStatement
|  |  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  |  IDENTIFIER(second)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  |  IDENTIFIER(foo)
|  |  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  |  |  |  Conditional branches: None
|  |  |  |  |  |  |  Default branch:
|  |  |  |  |  |  |  |  IDENTIFIER(bar)
|  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  Conditional branches: None
|  |  |  |  Default branch: None