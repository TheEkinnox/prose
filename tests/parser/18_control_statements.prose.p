Program
|  FunctionDeclaration
|  |  Start: (1:1) KW_FN(fn)
|  |  Name: 'main'
|  |  Type:
|  |  |  Base: i32
|  |  |  Modifiers: None
|  |  Parameters: None
|  |  Body:
|  |  |  WhileStatement
|  |  |  |  Start: (2:5) KW_WHILE(while)
|  |  |  |  Condition:
|  |  |  |  |  (2:11) IDENTIFIER(condition)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Body:
|  |  |  |  |  IfStatement
|  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  Start: (3:9) KW_IF(if)
|  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  (3:12) IDENTIFIER(should_skip)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  ControlStatement
|  |  |  |  |  |  |  |  |  Type: (4:13) KW_CONTINUE(continue)
|  |  |  |  |  |  Conditional branches: None
|  |  |  |  |  |  Default branch: None
|  |  |  |  |  IfStatement
|  |  |  |  |  |  Main branch:
|  |  |  |  |  |  |  Start: (7:9) KW_IF(if)
|  |  |  |  |  |  |  Condition:
|  |  |  |  |  |  |  |  (7:12) IDENTIFIER(should_stop)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Body:
|  |  |  |  |  |  |  |  ControlStatement
|  |  |  |  |  |  |  |  |  Type: (8:13) KW_BREAK(break)
|  |  |  |  |  |  Conditional branches: None
|  |  |  |  |  |  Default branch: None
|  |  |  ControlStatement
|  |  |  |  Type: (12:5) KW_RETURN(return)
|  |  |  |  Value:
|  |  |  |  |  (12:12) LIT_INTEGER(42)
|  |  |  |  |  |  Postfix: None
|  FunctionDeclaration
|  |  Start: (15:1) KW_FN(fn)
|  |  Name: 'voidReturn'
|  |  Type: None
|  |  Parameters: None
|  |  Body:
|  |  |  ControlStatement
|  |  |  |  Type: (16:5) KW_RETURN(return)
|  |  |  |  Value: None