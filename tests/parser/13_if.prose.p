Program
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  IfStatement
|  |  |  |  Main branch:
|  |  |  |  |  Condition:
|  |  |  |  |  |  (3:8) IDENTIFIER(condition)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  (4:13) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Conditional branches: None
|  |  |  |  Default branch: None
|  |  |  IfStatement
|  |  |  |  Main branch:
|  |  |  |  |  Condition:
|  |  |  |  |  |  (8:8) IDENTIFIER(first)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  (9:13) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Conditional branches:
|  |  |  |  |  Condition:
|  |  |  |  |  |  (10:13) IDENTIFIER(second)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  (11:13) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Condition:
|  |  |  |  |  |  (12:13) IDENTIFIER(third)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  (13:13) LIT_INTEGER(3)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Default branch:
|  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  Type: None
|  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  (15:13) LIT_INTEGER(4)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  IfStatement
|  |  |  |  Main branch:
|  |  |  |  |  Condition:
|  |  |  |  |  |  (19:8) IDENTIFIER(first)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  IfStatement
|  |  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  |  (20:12) IDENTIFIER(second)
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  |  (21:13) IDENTIFIER(foo)
|  |  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  |  |  |  Conditional branches: None
|  |  |  |  |  |  |  Default branch:
|  |  |  |  |  |  |  |  (23:13) IDENTIFIER(bar)
|  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  Conditional branches: None
|  |  |  |  Default branch: None