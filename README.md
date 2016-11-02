# Apple Market

An exercise in Threads to play around with race conditions and Mutexes

### The Italian Apples Market
 
Italian farmers produce apples and put them in one basket ready for people to savour them
 
There are two types of apple farmers:
* Lazy farmers, who produce 1 apple at a random interval between 1 and 5 seconds
* Caffeinated farmers, who produce 10 apples every 2 seconds
 
Apple eaters are of two types:
* Retail apple eaters only take one apple at a time at a random internal between 1 and 5 seconds
* Enterprise apple eaters who take 10 apples every 5 seconds
 
Being small, the market only has 1 basket available. The basket size is of 50 apples
To avoid wasting apples farmers can't place apples in a basket that is full
Apple eaters cannot take apples from a basket that is empty
 
This code implements a solution with Ruby threads with the following people in the market:

* 2 Lazy farmers
* 2 Caffeinated farmers
* 2 Retail apple eaters
* 2 Enterprise apple eaters
