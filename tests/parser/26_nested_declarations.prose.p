Program
|  FunctionDeclaration
|  |  Start: (1:1) KW_FN(fn)
|  |  Name: 'outer'
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
|  |  |  AliasDeclaration
|  |  |  |  Start: (4:5) KW_ALIAS(alias)
|  |  |  |  Name: 'LocalInt'
|  |  |  |  Type:
|  |  |  |  |  Base: i32
|  |  |  |  |  Modifiers: None
|  |  |  TypeDeclaration
|  |  |  |  Start: (6:5) KW_TYPE(type)
|  |  |  |  Name: 'LocalType'
|  |  |  |  Members:
|  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  Start: (7:9) IDENTIFIER(value)
|  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  Name: 'value'
|  |  |  |  |  |  Type:
|  |  |  |  |  |  |  Base: LocalInt
|  |  |  |  |  |  |  Modifiers: None
|  |  |  |  |  |  Initializer: None
|  |  |  EnumDeclaration
|  |  |  |  Start: (10:5) KW_ENUM(enum)
|  |  |  |  Name: 'LocalEnum'
|  |  |  |  Type: None
|  |  |  |  Element 0
|  |  |  |  |  Name: A
|  |  |  |  |  Initializer: None
|  |  |  |  Element 1
|  |  |  |  |  Name: B
|  |  |  |  |  Initializer: None
|  |  |  FunctionDeclaration
|  |  |  |  Start: (15:5) KW_FN(fn)
|  |  |  |  Name: 'inner'
|  |  |  |  Type: None
|  |  |  |  Parameters: None
|  |  |  |  Body:
|  |  |  |  |  VariableDeclaration
|  |  |  |  |  |  Start: (16:9) IDENTIFIER(y)
|  |  |  |  |  |  IsConst: false
|  |  |  |  |  |  Name: 'y'
|  |  |  |  |  |  Type: None
|  |  |  |  |  |  Initializer:
|  |  |  |  |  |  |  (16:13) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None