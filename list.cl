class List {
  item: String;
  next: List;

  init(i: String, n: List): List {
    {
      item <- i;
      next <- n;
      self;
    }
  };

  item(): String {
    item
  };

  next(): List {
    next
  };

  flatten(): String {
    if (isvoid next) then
      item
    else
      item.concat(next.flatten())
    fi
  };

  flattenLoop(): String {
    let res: String <- item,
      pointer: List <- self
    in {
      while (not (isvoid pointer.next())) loop
        {
          res <- res.concat(pointer.item());
          pointer <- pointer.next();
        }
      pool;
      res;
    }
  };
};

class Main inherits IO {

  main(): Object {
    simpleHello()
  };

  simpleHello(): Object {
    let hello: String <- "Hello ",
      world: String <- "World!",
      newline: String <- "\n"
    in 
      out_string(hello.concat(world.concat(newline)))
  };

  helloWithList(): Object {
    let hello: String <- "Hello ",
      world: String <- "World",
      newline: String <- "\n",
      nil: List,
      list: List <- (new List).init(hello,
        (new List).init(world,
          (new List).init(newline, nil)
        )
      )
    in 
      out_string(list.flattenLoop())
  };
};