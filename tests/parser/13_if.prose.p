Program
|  FunctionDeclaration
|  |  Start: (1:1) KW_FN(fn)
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  IfStatement
|  |  |  |  Main branch:
|  |  |  |  |  Start: (3:5) KW_IF(if)
|  |  |  |  |  Condition:
|  |  |  |  |  |  (3:8) IDENTIFIER(condition)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  Start: (4:9) IDENTIFIER(x)
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
|  |  |  |  |  Start: (8:5) KW_IF(if)
|  |  |  |  |  Condition:
|  |  |  |  |  |  (8:8) IDENTIFIER(first)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  Start: (9:9) IDENTIFIER(x)
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  (9:13) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Conditional branches:
|  |  |  |  |  Start: (10:10) KW_IF(if)
|  |  |  |  |  Condition:
|  |  |  |  |  |  (10:13) IDENTIFIER(second)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  Start: (11:9) IDENTIFIER(x)
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  (11:13) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Start: (12:10) KW_IF(if)
|  |  |  |  |  Condition:
|  |  |  |  |  |  (12:13) IDENTIFIER(third)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  Start: (13:9) IDENTIFIER(x)
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  (13:13) LIT_INTEGER(3)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  Default branch:
|  |  |  |  |  Start: (14:5) KW_ELSE(else)
|  |  |  |  |  Body:
|  |  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  |  Start: (15:9) IDENTIFIER(x)
|  |  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  |  Name: 'x'
|  |  |  |  |  |  |  Type: None
|  |  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  |  (15:13) LIT_INTEGER(4)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  IfStatement
|  |  |  |  Main branch:
|  |  |  |  |  Start: (19:5) KW_IF(if)
|  |  |  |  |  Condition:
|  |  |  |  |  |  (19:8) IDENTIFIER(first)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  IfStatement
|  |  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  |  Start: (20:9) KW_IF(if)
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
|  |  |  |  |  |  |  |  Start: (22:9) KW_ELSE(else)
|  |  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  |  (23:13) IDENTIFIER(bar)
|  |  |  |  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  Conditional branches: None
|  |  |  |  Default branch: None