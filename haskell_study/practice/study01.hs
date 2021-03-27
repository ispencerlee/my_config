{-
-- Eq 
main = do 
  if 3/= 3
     then putStrLn "The values are Equal"
     else putStrLn "The values are not Equal"

-- Ord 
main = print (4 <= 2)

-- Show 
main = print(show [1..100])

-- Read 
main = print(read"4" + 4)

main = print(readInt"45")
  readInt :: String -> Int 
  readInt =read 

-- Enum 
main = print (succ 12)

-- Bounded 
main = do 
  print(maxBound :: Int)
  print(minBound :: Int)

-- Num 
main = do 
  print(2::Int)
  print(3::Float)
  
-- Integral 

-- Floating 

-- DIY
  
  -}
