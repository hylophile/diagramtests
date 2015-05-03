{-# LANGUAGE NoMonomorphismRestriction #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

main = mainWith d

{-example = hcat (map circle (iterate (/1.618) 1))-}
{-example = hcat (circle  1 )-}

{-d :: Diagram SVG V2 Double-}
d :: Diagram B
d = (mconcat $ take 8 $ iterate (rotateBy (1/8)) c)
c:: Diagram B
c = hcat $ invisHead (map d' (take 7 (iterate (/1.618) 1)))

invisHead (x:xs) = opacity 0 x : xs
invisHead [] = []


d' :: Double -> Diagram B
d' r = scale r $ mconcat $ take 6 $ iterate (rotateBy (1/6)) c'
c' :: Diagram B
c' = hcat $ (map circle (take 4 (iterate (/1.618) 1)))
