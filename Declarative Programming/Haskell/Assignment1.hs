--Q1
howManyBelowAverage:: Int -> Int -> Int -> Int
howManyBelowAverage x y z =  length [n | n <- [x,y,z], n < (round $ fromIntegral (x+y+z)/3)]

howManyBelowAverage2 :: Int -> Int -> Int -> Int
howManyBelowAverage2 x y z =    if (x < (round $ fromIntegral (x+y+z)/3)) 
                                    then 
                                    (if (y < (round $ fromIntegral (x+y+z)/3)) 
                                        then 
                                        (if (z < (round $ fromIntegral (x+y+z)/3)) 
                                            then 3 
                                        else 2) 
                                    else 
                                        (if (z < (round $ fromIntegral (x+y+z)/3))
                                            then 2
                                        else 1)) 
                                    else 
                                    (if (y < (round $ fromIntegral (x+y+z)/3))
                                        then 
                                        (if (z < (round $ fromIntegral (x+y+z)/3))
                                            then 2
                                        else 1) 
                                    else 
                                        (if (z < (round $ fromIntegral (x+y+z)/3)) 
                                            then 1 
                                        else 0))

q1Test :: Int -> Int -> Int -> Bool
q1Test x y z = (howManyBelowAverage x y z == howManyBelowAverage2 x y z)

doq1Test :: Bool
doq1Test = q1Test 2008622 1000000 2000000

--Q2
round2dp :: Float -> Float
round2dp x = fromIntegral (round $ x * 1e2) / 1e2

pizzaPricing :: Float -> Int -> Int -> Float
pizzaPricing x y z = round2dp ((x * 0.002) + (a * 0.001) + (b * 0.5) * 1.5)
                     where a = fromIntegral y :: Float
                           b = fromIntegral z :: Float


--Q3
--i)
data Direction = North | West | South | East | Unknown deriving (Show,Eq)

direction :: [Direction]
direction  = [North, South, East, West, Unknown]

followDirection :: (Int, Int) -> Direction -> (Int,Int)
followDirection (x,y) West = (x-1,y)
followDirection (x,y) East = (x+1,y)
followDirection (x,y) North = (x,y+1)
followDirection (x,y) South = (x,y-1)
followDirection (x,y) Unknown = (x,y)

--ii)
followDirections :: (Int,Int) -> [Direction] -> (Int,Int)
followDirections (x,y) [] = (x,y)
followDirections (x,y) xs = followDirections (followDirection (x,y) (head xs)) (tail xs) 

followtest :: (Int, Int) -> [Direction] -> [(Int, Int)]
followtest (x,y) xs = map (followDirection (x,y)) xs 

--iii)
data RelativeDirection = GoForward | GoBack | GoLeft | GoRight deriving Show 

relativedirection :: [RelativeDirection]
relativedirection  = [GoBack,GoForward,GoLeft,GoRight]

relativizeDirection :: Direction -> [Direction] -> [RelativeDirection]
relativizeDirection North [North] = [GoForward] 
relativizeDirection North [East] = [GoRight] 
relativizeDirection North [West] = [GoLeft]
relativizeDirection North [South] = [GoBack] 

relativizeDirection South [South] = [GoForward] 
relativizeDirection South [West] = [GoLeft] 
relativizeDirection South [East] = [GoRight]
relativizeDirection South [North] = [GoBack] 

relativizeDirection East [East] = [GoForward] 
relativizeDirection East [North] = [GoLeft] 
relativizeDirection East [South] = [GoRight]
relativizeDirection East [West] = [GoBack] 

relativizeDirection West [West] = [GoForward] 
relativizeDirection West [South] = [GoLeft] 
relativizeDirection West [North] = [GoRight]
relativizeDirection West [East] = [GoBack] 

relativizeDirections :: Direction -> [Direction] -> [RelativeDirection]
relativizeDirections x xs | (xs ==[]) = []
                          |  otherwise = (relativizeDirection x ([head xs]) ++ []) ++ (relativizeDirections (head xs) (tail xs))

--iv)
flipDirection :: Direction -> Direction
flipDirection North = South
flipDirection South = North
flipDirection East = West
flipDirection West = East 

safehead :: [Direction] -> Direction
safehead [] = Unknown
safehead (x : _) = x

safetail :: [a] -> [a] 
safetail xs = if null xs then [] else tail xs 

sanitizeDirections :: [Direction] -> [Direction]
sanitizeDirections xs | (xs == []) = []
                      | ((followDirections (0,0) [(safehead xs),(safehead (safetail xs))]) == (0,0)) = sanitizeDirections(safetail(safetail(xs)))
                      | ((safehead xs) == (safehead(safetail xs))) = (([head xs]) ++ []) ++ sanitizeDirections(tail(tail xs))
                      | otherwise = sanitizeDirections(tail xs)



