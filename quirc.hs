data Ket = Ket Int Int
         | Tens Int [Ket]
         | Sum Int [Ket]
instance Show Ket where
  show (Ket a b) = (show a) ++ "|" ++ (show b) ++ ">"
  show (Tens a b) = (show a) ++ (show b)
  show (Sum a b) = (show a) ++ (show b)

foldKet fk ft fs k = case k of
  Ket a b -> fk a b
  Tens a b -> ft a b
  Sum a b -> fs a b

h = foldKet (\a b -> if b == 0 then (Sum 1 [Ket 1 0, Ket 1 1])
                               else (Sum 1 [Ket 1 0, Ket (-1) 1]))
            (\a b -> Tens a b)
            (\a b -> Sum a b)
x = foldKet (\a b -> if b == 0 then Ket a 1 else Ket a 0)
            (\a b -> Tens a b)
            (\a b -> Sum a b)

z = foldKet (\a b -> if b == 0 then Ket a b else Ket (-a) b)
            (\a b -> Tens a b)
            (\a b -> Sum a b)
