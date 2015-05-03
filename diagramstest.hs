{-# LANGUAGE NoMonomorphismRestriction #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

main = mainWith d

{-example = hcat (map circle (iterate (/1.618) 1))-}
{-example = hcat (circle  1 )-}

{-d :: Diagram SVG V2 Double-}
d :: Diagram B
d =  mconcat $ take 42 $ iterate (rotateBy (1/8) . scale 1.1) c
c:: Diagram B
c = hcat $ invisHead (map circle (take 10 (iterate (/1.618) 1)))

invisHead (x:xs) = opacity 0 x : xs
invisHead [] = []


