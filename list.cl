class List inherits A2I {
  item: Object;
  next: List;

  init(i: Object, n: List): List {
    {
      item <- i;
      next <- n;
      self;
    }
  };

  item(): Object {
    item
  };

  next(): List {
    next
  };

  flatten(): String {
    let str: String <-
      case item of
        i: Int => i2a(i);
        s: String => s;
        o: Object => { abort(); ""; };
      esac
    in {
      if (isvoid next) then
        str
      else
        str.concat(next.flatten())
      fi;
    }
  };

  flattenLoop(): String {
    let res: String <- "",
      pointer: List <- self
    in {
      while (not (isvoid pointer.next())) loop
        {
          let str: String <-
            case pointer.item() of
              i: Int => i2a(i);
              s: String => s;
              o: Object => { abort(); ""; };
            esac
          in {
            res <- res.concat(str);
            pointer <- pointer.next();
          };
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
      i: Int <- 18,
      newline: String <- "\n",
      nil: List,
      list: List <- (new List).init(hello,
        (new List).init(world,
          (new List).init(i,
            (new List).init(newline, nil)
          )
        )
      )
    in 
      out_string(list.flatten())
  };
};