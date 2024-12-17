data BiTree a = Empty 
    | Node (BiTree a) a (BiTree a)
    deriving (Show, Eq)
    
treeInsert :: (Ord a) => a -> BiTree a -> BiTree a
treeInsert x Empty = Node Empty x Empty
treeInsert x (Node left a right)
    | x == a  = Node left a right  -- Если элемент уже существует, не вставляем
    | x < a   = Node (treeInsert x left) a right  -- Вставляем в левое поддерево
    | x > a   = Node left a (treeInsert x right)  -- Вставляем в правое поддерево
    
treeRemove :: (Ord a) => BiTree a -> a -> BiTree a
treeRemove Empty _ = Empty
treeRemove (Node left x right) k  
    | k > x = Node left x (treeRemove right k)
    | k < x = Node (treeRemove left k) x right
    | otherwise = nodeRemove (Node left x right)
    
nodeRemove :: (Ord a) => BiTree a -> BiTree a
nodeRemove (Node left x right)
    | left == Empty && right == Empty = Empty
    | left /= Empty && right /= Empty = Node left (treeMin right) (treeRemove right (treeMin right)) 
    | left == Empty = right
    | otherwise = left

treeMin :: BiTree a -> a
treeMin (Node Empty x _) = x
treeMin (Node left _ _) = treeMin left   
    
search :: (Ord a) => BiTree a -> a -> BiTree a
search Empty _ = Empty  -- Если дерево пустое, возвращаем Nothing
search (Node left x right) k
    | k == x    = Node left x right  -- Если нашли узел, возвращаем его
    | k < x     = search left k              -- Ищем в левом поддереве
    | otherwise = search right k             -- Ищем в правом поддереве
    
main :: IO ()
main = do
    let tree = Empty
    let tree1 = treeInsert 5 tree
    let tree2 = treeInsert 3 tree1
    let tree3 = treeInsert 7 tree2
    let tree4 = treeInsert 4 tree3
    print tree4
    let newTree = treeRemove tree4 5
    print newTree
    let result = search tree4 3
    print result
