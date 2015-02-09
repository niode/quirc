import Data.Complex

data Qubit = Single (Complex, Complex)

data Tensor = Qubit (X)


plus::Qubit
plus = 

h::Qubit->Qubit

cnot::Qubit->Qubit->Qubit

not::Qubit->Qubit


z::Qubit->Qubit

cz::Qubit->Qubit

control::(Qubit->Qubit)->Qubit->Qubit->Qubit
