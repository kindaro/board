module Main where
import Graphics.UI.GLUT

r = 0.6

myPoints :: [(GLfloat,GLfloat,GLfloat)]
myPoints = [ (sin (2*pi*k/120) * r, cos (2*pi*k/120) * r, 0) | k <- [1..120] ]

main :: IO ()
main = do
    (_progName, _args) <- getArgsAndInitialize
    _window <- createWindow "Hello World"
    fullScreen
    displayCallback $= display
    reshapeCallback $= Just reshape
    mainLoop
 
display :: DisplayCallback
display = do
    clear [ ColorBuffer ]
    renderPrimitive Points $
       mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) myPoints
    flush

reshape :: ReshapeCallback
reshape size = do
    viewport $= (Position 0 0, size)
    postRedisplay Nothing
