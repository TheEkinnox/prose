Program
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  SwitchStatement
|  |  |  |  Expression:
|  |  |  |  |  IDENTIFIER(value)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Case 0
|  |  |  |  |  Is Fallthrough: true
|  |  |  |  |  Condition:
|  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  IDENTIFIER(prepare)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  Case 1
|  |  |  |  |  Is Fallthrough: false
|  |  |  |  |  Condition:
|  |  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  IDENTIFIER(execute)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  Case 2
|  |  |  |  |  Is Fallthrough: true
|  |  |  |  |  Condition:
|  |  |  |  |  |  LIT_INTEGER(3)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  IDENTIFIER(cleanup)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  Default:
|  |  |  |  |  IDENTIFIER(fallback)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments: None