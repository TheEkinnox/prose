Program
|  FunctionDeclaration
|  |  Start: (1:1) KW_FN(fn)
|  |  Name: 'main'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  DeferStatement
|  |  |  |  Start: (2:5) KW_DEFER(defer)
|  |  |  |  Call:
|  |  |  |  |  (2:11) IDENTIFIER(cleanup)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments: None
|  |  |  DeferStatement
|  |  |  |  Start: (3:5) KW_DEFER(defer)
|  |  |  |  Call:
|  |  |  |  |  (3:11) IDENTIFIER(log)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  |  |  (3:15) LIT_STRING("finished")
|  |  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  DeferStatement
|  |  |  |  Start: (4:5) KW_DEFER(defer)
|  |  |  |  Call:
|  |  |  |  |  (4:11) IDENTIFIER(object)
|  |  |  |  |  |  Postfix:
|  |  |  |  |  |  |  MemberAccess
|  |  |  |  |  |  |  |  Member: 'shutdown'
|  |  |  |  |  |  |  Call
|  |  |  |  |  |  |  |  Arguments: None