Program
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers: None
|  |  Parameters: None
|  |  Body:
|  |  |  WhileStatement
|  |  |  |  Condition:
|  |  |  |  |  IDENTIFIER(condition)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  IfStatement
|  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  IDENTIFIER(should_skip)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  Continue
|  |  |  |  |  |  Conditional branches: None
|  |  |  |  |  |  Default branch: None
|  |  |  |  |  IfStatement
|  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  IDENTIFIER(should_stop)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  Break
|  |  |  |  |  |  Conditional branches: None
|  |  |  |  |  |  Default branch: None
|  |  |  Return
|  |  |  |  LIT_INTEGER(42)
|  |  |  |  |  Postfix: None
|  FunctionDeclaration
|  |  Name: 'voidReturn'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  Return: None