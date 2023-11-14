doubleMe :: Int -> Int
doubleMe x = x + x

countEvens1 :: [Int] -> Int
countEvens1 [] = 0
countEvens1 (x:xs)
            | even x = countEvens1 xs	
            | otherwise = countEvens1 xs + 1

countEvens2 :: [Int] -> Int
countEvens2 xs = length [x | x <- xs, even x]

palindrome :: Eq a => [a] -> Bool
palindrome xs = xs == reverse xs


data Tree = Leaf Int | Node Tree Int Tree

bigtree = Node (Node (Leaf 3) 4 (Leaf 2)) 1 (Leaf 0)

smalltree = Node(Leaf 0) 1 (Leaf 2)

balanced :: Tree -> Bool
balanced (Node l x r)| ((depth l) == (depth r)) = True
                     | otherwise = False

depth :: Tree -> Int
depth (Leaf n) = 0
depth (Node l x r) = max(depth l) (depth r) + 1