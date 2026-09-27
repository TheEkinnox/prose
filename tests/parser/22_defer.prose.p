Program
|  FunctionDeclaration
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  DeferStatement
|  |  |  |  IDENTIFIER(cleanup)
|  |  |  |  |  Postfix:
|  |  |  |  |  |  Call
|  |  |  |  |  |  |  Arguments: None
|  |  |  DeferStatement
|  |  |  |  IDENTIFIER(log)
|  |  |  |  |  Postfix:
|  |  |  |  |  |  Call
|  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  LIT_STRING("finished")
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  DeferStatement
|  |  |  |  IDENTIFIER(object)
|  |  |  |  |  Postfix:
|  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  Member: 'shutdown'
|  |  |  |  |  |  Call
|  |  |  |  |  |  |  Arguments: None