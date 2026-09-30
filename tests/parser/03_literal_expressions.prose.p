Program
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'integer'
|  |  Type: None
|  |  Initializer:
|  |  |  (1:11) LIT_INTEGER(42)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'floating'
|  |  Type: None
|  |  Initializer:
|  |  |  (2:12) LIT_FLOATING_POINT(3.14)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'floating_no_left'
|  |  Type: None
|  |  Initializer:
|  |  |  (3:20) LIT_FLOATING_POINT(.5)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'floating_no_right'
|  |  Type: None
|  |  Initializer:
|  |  |  (4:21) LIT_FLOATING_POINT(42.)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'boolean_true'
|  |  Type: None
|  |  Initializer:
|  |  |  (6:16) KW_TRUE(true)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'boolean_false'
|  |  Type: None
|  |  Initializer:
|  |  |  (7:17) KW_FALSE(false)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'nothing'
|  |  Type: None
|  |  Initializer:
|  |  |  (8:11) KW_NULL(null)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'character'
|  |  Type: None
|  |  Initializer:
|  |  |  (10:13) LIT_RUNE('a')
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'escaped_character'
|  |  Type: None
|  |  Initializer:
|  |  |  (11:21) LIT_RUNE('\n')
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'text'
|  |  Type: None
|  |  Initializer:
|  |  |  (13:8) LIT_STRING("hello")
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'empty_text'
|  |  Type: None
|  |  Initializer:
|  |  |  (14:14) LIT_STRING("")
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  IsConst: false
|  |  Name: 'array'
|  |  Type: None
|  |  Initializer:
|  |  |  ArrayLiteralExpression
|  |  |  |  Elements:
|  |  |  |  |  (16:10) LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  (16:13) LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  (16:16) LIT_INTEGER(3)
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
|  |  |  |  |  |  |  (17:21) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (17:24) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  (17:29) LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (17:32) LIT_INTEGER(4)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  (17:37) LIT_INTEGER(5)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (17:40) LIT_INTEGER(6)
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