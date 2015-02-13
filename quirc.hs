data Ket = Ket Int Int
         | Tens Int [Ket]
         | Sum Int [Ket]
    deriving Show

h::Ket->Ket
h (Ket a 0) = Sum a [Ket 1 0, Ket 1 1]
h (Ket a 1) = Sum a [Ket 1 0, Ket (-1) 1]
h (Sum a k) = Sum a (map h k)
h (Tens a (k:ks)) = Tens a (h k : ks)
