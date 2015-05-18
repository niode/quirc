import qualified Data.Set as Set

data Gate = Gate String Int Int | CGate String Int Int [Int] | Measure [Int]
type GateGroup = [Gate]

data Circuit = Circuit
  { input :: [QState]
  , groups :: [GateGroup]
  , output :: [QState]}
data QState = Blah

data Params = Params
  { unitlength :: String
  , picture_width :: String
  , picture_height :: String
  , picture_offset :: Maybe (String, String)
  , }
params = Params ".2in"

write_picture_size p = "(" ++ (picture_width p) ++ "," ++ (picture_height p) ++ ")"

write_picture_offset p = case (picture_offset p) of
  Just (a, b) -> "(" ++ a ++ "," ++ b ++")"
  Nothing -> ""

picture_declaration p = "\\begin{center}\large\n"
  ++ "\t\setlength{\unitlength}{" ++ (unitlength p) ++ "}\n"
  ++ "\t\\begin{picture}" ++ (write_picture_size p) ++ (write_picture_offset p)
toLatex :: Params -> Circuit -> String
toLatex p c
  = picture_declaration p ++ (drawCircuit p c) ++ "\t\\end{picture}\n\\end{center}"

drawCircuit :: Params -> Circuit -> String
drawCircuit p c = "whatever"

get_ls :: Params -> Circuit -> Int
get_ls p c = 
-- Gets all lines used by the circuit.
lines :: Circuit -> [Int]
lines c = Set.toList $ lines' (concat . groups c)

lines' :: [Gate] -> Set.Set Int
lines' = (foldr (\ set s -> Set.union set s) Set.empty) . (map lines'')

lines'' :: Gate -> Set.Set Int
lines'' (Gate _ a b) = Set.fromList [a,b]
lines'' (CGate _ a b ls) = Set.fromList $ a:b:ls
lines'' (Measure ls) = Set.fromList ls
