Program
|  VariableDeclaration
|  |  Start: (1:1) IDENTIFIER(integer)
|  |  IsConst: false
|  |  Name: 'integer'
|  |  Type: None
|  |  Initializer:
|  |  |  (1:11) LIT_INTEGER(42)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (2:1) IDENTIFIER(floating)
|  |  IsConst: false
|  |  Name: 'floating'
|  |  Type: None
|  |  Initializer:
|  |  |  (2:12) LIT_FLOATING_POINT(3.14)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (3:1) IDENTIFIER(floating_no_left)
|  |  IsConst: false
|  |  Name: 'floating_no_left'
|  |  Type: None
|  |  Initializer:
|  |  |  (3:20) LIT_FLOATING_POINT(.5)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (4:1) IDENTIFIER(floating_no_right)
|  |  IsConst: false
|  |  Name: 'floating_no_right'
|  |  Type: None
|  |  Initializer:
|  |  |  (4:21) LIT_FLOATING_POINT(42.)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (6:1) IDENTIFIER(boolean_true)
|  |  IsConst: false
|  |  Name: 'boolean_true'
|  |  Type: None
|  |  Initializer:
|  |  |  (6:16) KW_TRUE(true)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (7:1) IDENTIFIER(boolean_false)
|  |  IsConst: false
|  |  Name: 'boolean_false'
|  |  Type: None
|  |  Initializer:
|  |  |  (7:17) KW_FALSE(false)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (8:1) IDENTIFIER(nothing)
|  |  IsConst: false
|  |  Name: 'nothing'
|  |  Type: None
|  |  Initializer:
|  |  |  (8:11) KW_NULL(null)
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (10:1) IDENTIFIER(character)
|  |  IsConst: false
|  |  Name: 'character'
|  |  Type: None
|  |  Initializer:
|  |  |  (10:13) LIT_RUNE('a')
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (11:1) IDENTIFIER(escaped_character)
|  |  IsConst: false
|  |  Name: 'escaped_character'
|  |  Type: None
|  |  Initializer:
|  |  |  (11:21) LIT_RUNE('\n')
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (13:1) IDENTIFIER(text)
|  |  IsConst: false
|  |  Name: 'text'
|  |  Type: None
|  |  Initializer:
|  |  |  (13:8) LIT_STRING("hello")
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (14:1) IDENTIFIER(empty_text)
|  |  IsConst: false
|  |  Name: 'empty_text'
|  |  Type: None
|  |  Initializer:
|  |  |  (14:14) LIT_STRING("")
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (16:1) IDENTIFIER(array)
|  |  IsConst: false
|  |  Name: 'array'
|  |  Type: None
|  |  Initializer:
|  |  |  ArrayLiteralExpression
|  |  |  |  Start: (16:9) LBRACKET([)
|  |  |  |  Elements:
|  |  |  |  |  (16:10) LIT_INTEGER(1)
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  (16:13) LIT_INTEGER(2)
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  (16:16) LIT_INTEGER(3)
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (17:1) IDENTIFIER(array_of_arrays)
|  |  IsConst: false
|  |  Name: 'array_of_arrays'
|  |  Type: None
|  |  Initializer:
|  |  |  ArrayLiteralExpression
|  |  |  |  Start: (17:19) LBRACKET([)
|  |  |  |  Elements:
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Start: (17:20) LBRACKET([)
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  (17:21) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (17:24) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Start: (17:28) LBRACKET([)
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  (17:29) LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (17:32) LIT_INTEGER(4)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  |  ArrayLiteralExpression
|  |  |  |  |  |  Start: (17:36) LBRACKET([)
|  |  |  |  |  |  Elements:
|  |  |  |  |  |  |  (17:37) LIT_INTEGER(5)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (17:40) LIT_INTEGER(6)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  Postfix: None
|  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (18:1) IDENTIFIER(empty_array)
|  |  IsConst: false
|  |  Name: 'empty_array'
|  |  Type: None
|  |  Initializer:
|  |  |  ArrayLiteralExpression
|  |  |  |  Start: (18:15) LBRACKET([)
|  |  |  |  Elements: None
|  |  |  |  Postfix: None