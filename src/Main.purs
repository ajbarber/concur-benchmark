module Main where

import Prelude

import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props as P
import Concur.React.Run (runWidgetInDom)
import Data.Array (range)
import Data.Either (Either(..))
import Data.Maybe (fromMaybe)
import Data.Int (fromString)
import Effect (Effect)

inputs :: String -> Int -> Widget HTML Unit
inputs txt num = do
  newState <- D.p' [
    D.label' [D.text "Number of inputs:"],
    D.input [P.defaultValue $ show num,
             P._type "number",
             (Left <<< P.unsafeTargetValue) <$> P.onChange],
    D.hr',
    D.div_ [] $ D.text $ "State: " <> txt,
    D.div' $ inputBox <$> range 1 num ]
  case newState of
    Left n -> inputs txt $ (fromMaybe 100 $ fromString n)
    Right t -> inputs t num
  where
    inputBox _ =  D.input [(Right <<< P.unsafeTargetValue) <$> P.onChange]


main :: Effect Unit
main = runWidgetInDom "root" $ inputs "" 100
