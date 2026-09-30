Program
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  SwitchStatement
|  |  |  |  Expression:
|  |  |  |  |  (2:12) IDENTIFIER(value)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Case 0
|  |  |  |  |  Is Fallthrough: true
|  |  |  |  |  Condition:
|  |  |  |  |  |  (3:14) LIT_INTEGER(1)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  (4:13) IDENTIFIER(prepare)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  Case 1
|  |  |  |  |  Is Fallthrough: false
|  |  |  |  |  Condition:
|  |  |  |  |  |  (6:14) LIT_INTEGER(2)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  (7:13) IDENTIFIER(execute)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  Case 2
|  |  |  |  |  Is Fallthrough: true
|  |  |  |  |  Condition:
|  |  |  |  |  |  (8:14) LIT_INTEGER(3)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  Body:
|  |  |  |  |  |  (9:13) IDENTIFIER(cleanup)
|  |  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  |  Arguments: None
|  |  |  |  Default:
|  |  |  |  |  (12:13) IDENTIFIER(fallback)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments: None