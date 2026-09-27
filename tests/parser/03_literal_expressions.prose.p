Program
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'integer'
|  |  Type: None
|  |  Initializer:
|  |  |  LIT_INTEGER(42)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'floating'
|  |  Type: None
|  |  Initializer:
|  |  |  LIT_FLOATING_POINT(3.14)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'floating_no_left'
|  |  Type: None
|  |  Initializer:
|  |  |  LIT_FLOATING_POINT(.5)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'floating_no_right'
|  |  Type: None
|  |  Initializer:
|  |  |  LIT_FLOATING_POINT(42.)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'boolean_true'
|  |  Type: None
|  |  Initializer:
|  |  |  KW_TRUE(true)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'boolean_false'
|  |  Type: None
|  |  Initializer:
|  |  |  KW_FALSE(false)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'nothing'
|  |  Type: None
|  |  Initializer:
|  |  |  KW_NULL(null)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'character'
|  |  Type: None
|  |  Initializer:
|  |  |  LIT_RUNE('a')
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'escaped_character'
|  |  Type: None
|  |  Initializer:
|  |  |  LIT_RUNE('\n')
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'text'
|  |  Type: None
|  |  Initializer:
|  |  |  LIT_STRING("hello")
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'empty_text'
|  |  Type: None
|  |  Initializer:
|  |  |  LIT_STRING("")
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'array'
|  |  Type: None
|  |  Initializer:
|  |  |  ArrayLiteralExpression
|  |  |  |  Elements:
|  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  LIT_INTEGER(3)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'array_of_arrays'
|  |  Type: None
|  |  Initializer:
|  |  |  ArrayLiteralExpression
|  |  |  |  Elements:
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  LIT_INTEGER(4)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  LIT_INTEGER(5)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  LIT_INTEGER(6)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'empty_array'
|  |  Type: None
|  |  Initializer:
|  |  |  ArrayLiteralExpression
|  |  |  |  Elements: None
|  |  |  |  Postfix: None