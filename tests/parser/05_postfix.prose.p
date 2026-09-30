Program
|  VariableDeclaration
|  |  Start: (1:1) IDENTIFIER(a)
|  |  IsConst: false
|  |  Name: 'a'
|  |  Type: None
|  |  Initializer:
|  |  |  (1:5) IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None
|  VariableDeclaration
|  |  Start: (2:1) IDENTIFIER(b)
|  |  IsConst: false
|  |  Name: 'b'
|  |  Type: None
|  |  Initializer:
|  |  |  (2:5) IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments:
|  |  |  |  |  |  |  (2:9) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (2:12) LIT_INTEGER(2)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  (2:15) LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (4:1) IDENTIFIER(c)
|  |  IsConst: false
|  |  Name: 'c'
|  |  Type: None
|  |  Initializer:
|  |  |  (4:5) IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Index
|  |  |  |  |  |  (4:11) LIT_INTEGER(0)
|  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (5:1) IDENTIFIER(d)
|  |  IsConst: false
|  |  Name: 'd'
|  |  Type: None
|  |  Initializer:
|  |  |  (5:5) IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Index
|  |  |  |  |  |  BinaryExpression
|  |  |  |  |  |  |  Operator: OP_PLUS
|  |  |  |  |  |  |  Left:
|  |  |  |  |  |  |  |  (5:11) IDENTIFIER(index)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Right:
|  |  |  |  |  |  |  |  (5:19) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (7:1) IDENTIFIER(e)
|  |  IsConst: false
|  |  Name: 'e'
|  |  Type: None
|  |  Initializer:
|  |  |  (7:5) IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Slice
|  |  |  |  |  |  Start:
|  |  |  |  |  |  |  (7:11) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  End:
|  |  |  |  |  |  |  (7:13) LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (8:1) IDENTIFIER(f)
|  |  IsConst: false
|  |  Name: 'f'
|  |  Type: None
|  |  Initializer:
|  |  |  (8:5) IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Slice
|  |  |  |  |  |  Start: None
|  |  |  |  |  |  End:
|  |  |  |  |  |  |  (8:12) LIT_INTEGER(3)
|  |  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (9:1) IDENTIFIER(g)
|  |  IsConst: false
|  |  Name: 'g'
|  |  Type: None
|  |  Initializer:
|  |  |  (9:5) IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Slice
|  |  |  |  |  |  Start:
|  |  |  |  |  |  |  (9:11) LIT_INTEGER(1)
|  |  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  |  End: None
|  VariableDeclaration
|  |  Start: (10:1) IDENTIFIER(h)
|  |  IsConst: false
|  |  Name: 'h'
|  |  Type: None
|  |  Initializer:
|  |  |  (10:5) IDENTIFIER(array)
|  |  |  |  Postfix:
|  |  |  |  |  Slice
|  |  |  |  |  |  Start: None
|  |  |  |  |  |  End: None
|  VariableDeclaration
|  |  Start: (12:1) IDENTIFIER(i)
|  |  IsConst: false
|  |  Name: 'i'
|  |  Type: None
|  |  Initializer:
|  |  |  (12:5) IDENTIFIER(object)
|  |  |  |  Postfix:
|  |  |  |  |  MemberAccess
|  |  |  |  |  |  Member: 'member'
|  VariableDeclaration
|  |  Start: (14:1) IDENTIFIER(j)
|  |  IsConst: false
|  |  Name: 'j'
|  |  Type: None
|  |  Initializer:
|  |  |  (14:5) IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None
|  |  |  |  |  MemberAccess
|  |  |  |  |  |  Member: 'member'
|  VariableDeclaration
|  |  Start: (15:1) IDENTIFIER(k)
|  |  IsConst: false
|  |  Name: 'k'
|  |  Type: None
|  |  Initializer:
|  |  |  (15:5) IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None
|  |  |  |  |  Index
|  |  |  |  |  |  (15:11) LIT_INTEGER(0)
|  |  |  |  |  |  |  Postfix: None
|  VariableDeclaration
|  |  Start: (16:1) IDENTIFIER(l)
|  |  IsConst: false
|  |  Name: 'l'
|  |  Type: None
|  |  Initializer:
|  |  |  (16:5) IDENTIFIER(foo)
|  |  |  |  Postfix:
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None
|  |  |  |  |  Index
|  |  |  |  |  |  (16:11) LIT_INTEGER(0)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  MemberAccess
|  |  |  |  |  |  Member: 'member'
|  VariableDeclaration
|  |  Start: (17:1) IDENTIFIER(m)
|  |  IsConst: false
|  |  Name: 'm'
|  |  Type: None
|  |  Initializer:
|  |  |  (17:5) IDENTIFIER(objects)
|  |  |  |  Postfix:
|  |  |  |  |  Index
|  |  |  |  |  |  (17:13) IDENTIFIER(index)
|  |  |  |  |  |  |  Postfix: None
|  |  |  |  |  MemberAccess
|  |  |  |  |  |  Member: 'member'
|  |  |  |  |  MemberAccess
|  |  |  |  |  |  Member: 'foo'
|  |  |  |  |  Call
|  |  |  |  |  |  Arguments: None