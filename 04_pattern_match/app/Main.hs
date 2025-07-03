module Main where

describeHttpStatusCode :: Int -> String
describeHttpStatusCode 200 = "200 OK"
describeHttpStatusCode 400 = "400 Bad Request"
describeHttpStatusCode 404 = "404 Not Found"
describeHttpStatusCode 500 = "500 Server Error"
describeHttpStatusCode _ = "Unknown"

main :: IO ()
main = do
    print (describeHttpStatusCode 200)
    print (describeHttpStatusCode 400)
    print (describeHttpStatusCode 404)
    print (describeHttpStatusCode 500)
    print (describeHttpStatusCode 700)
