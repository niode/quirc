import Numeric.LinearAlgebra

data Ket a = Ket (Vector a)
           | KTensor (Ket a) (Ket a)

data Bra a = Bra (Vector a)
           | BTensor (Bra a) (Bra a)

instance Show (Ket a) where
  show (Ket v) = "|" ++ (show v) ++ ">"

-- No idea what to do!
