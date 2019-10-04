CREATE (Alajuela:Location{ address:'Center of Alajuela'})
CREATE (Cartago:Location{ address:'Center of Cartago'})
CREATE (Guanacaste:Location{ address:'Center of Guanacaste'})
CREATE (Heredia:Location       { address:'Center of Heredia'                     })
CREATE (Limon:Location         { address:'Center of Limon'                       })
CREATE (Puntarenas:Location    { address:'Center of Puntarenas'                  })
CREATE (SanJose:Location       { address:'Center of San Jose'                    })
CREATE (VolcanIrazu:Location   { address:'Volcan Irazu, in site'                 })
CREATE (NaturalMuseum:Location { address:'Inside the natural museum in San Jose' })
CREATE (Metropolis:Location    { address:'Metropolis community center'           })

CREATE (p01:Product { name:'Beer'              , price:'$4'     , description:'600ml bottle of local beer'                          })
CREATE (p02:Product { name:'Wine'              , price:'$12'    , description:'600ml bottle of red wine'                            })
CREATE (p03:Product { name:'Large Soda'        , price:'$3.50'  , description:'750ml glass of soda'                                 })
CREATE (p04:Product { name:'Small Soda'        , price:'$2'     , description:'350ml glass of soda'                                 })
CREATE (p05:Product { name:'Steak'             , price:'$20.50' , description:'Quarter pound steak accompanied with rice and salad' })
CREATE (p06:Product { name:'Cheese Burger'     , price:'$10'    , description:'Cheese burger with fries and a small drink'          })
CREATE (p07:Product { name:'Grilled Chicken'   , price:'$15'    , description:'Grilled chicken  accompanied with rice and salad'    })
CREATE (p08:Product { name:'Fried Chicken'     , price:'$6.75'  , description:'3 pieces of friend chicken with fries'               })
CREATE (p09:Product { name:'Pork Slices'       , price:'$12'    , description:'4 small pieces of pork with rice and salad'          })
CREATE (p10:Product { name:'Pizza Slice'       , price:'$2'     , description:'Single pizza slice'                                  })
CREATE (p11:Product { name:'Small Pizza'       , price:'$6'     , description:'Pizza of choice, 4 slices'                           })
CREATE (p12:Product { name:'Medium Pizza'      , price:'$10'    , description:'Pizza of choice, 8 slices'                           })
CREATE (p13:Product { name:'Large Pizza'       , price:'$15'    , description:'Pizza of choice, 12 slices'                          })
CREATE (p14:Product { name:'Extra-Larfe Pizza' , price:'$25'    , description:'Pizza of choice, 16 slices'                          })
CREATE (p15:Product { name:'Monster Pizza'     , price:'$35'    , description:'Pizza of choice, 25 slices'                          })

CREATE
  (Alajuela)-[:SELLS]->(p01),
  (Alajuela)-[:SELLS]->(p02),
  (Alajuela)-[:SELLS]->(p03),
  (Alajuela)-[:SELLS]->(p04),
  (Alajuela)-[:SELLS]->(p05),
  (Alajuela)-[:SELLS]->(p06),
  (Alajuela)-[:SELLS]->(p07),
  (Alajuela)-[:SELLS]->(p08),
  (Alajuela)-[:SELLS]->(p09),
  (Alajuela)-[:SELLS]->(p10),
  (Alajuela)-[:SELLS]->(p11),
  (Alajuela)-[:SELLS]->(p12),
  (Alajuela)-[:SELLS]->(p13),
  (Alajuela)-[:SELLS]->(p14),
  (Alajuela)-[:SELLS]->(p15)

  CREATE
  (Cartago)-[:SELLS]->(p01),
  (Cartago)-[:SELLS]->(p02),
  (Cartago)-[:SELLS]->(p03),
  (Cartago)-[:SELLS]->(p04),
  (Cartago)-[:SELLS]->(p05),
  (Cartago)-[:SELLS]->(p06),
  (Cartago)-[:SELLS]->(p07),
  (Cartago)-[:SELLS]->(p08),
  (Cartago)-[:SELLS]->(p09),
  (Cartago)-[:SELLS]->(p10),
  (Cartago)-[:SELLS]->(p11),
  (Cartago)-[:SELLS]->(p12),
  (Cartago)-[:SELLS]->(p13),
  (Cartago)-[:SELLS]->(p14),
  (Cartago)-[:SELLS]->(p15)

  CREATE
  (Guanacaste)-[:SELLS]->(p01),
  (Guanacaste)-[:SELLS]->(p02),
  (Guanacaste)-[:SELLS]->(p03),
  (Guanacaste)-[:SELLS]->(p04),
  (Guanacaste)-[:SELLS]->(p05),
  (Guanacaste)-[:SELLS]->(p06),
  (Guanacaste)-[:SELLS]->(p07),
  (Guanacaste)-[:SELLS]->(p08),
  (Guanacaste)-[:SELLS]->(p09),
  (Guanacaste)-[:SELLS]->(p10),
  (Guanacaste)-[:SELLS]->(p11),
  (Guanacaste)-[:SELLS]->(p12),
  (Guanacaste)-[:SELLS]->(p13),
  (Guanacaste)-[:SELLS]->(p14),
  (Guanacaste)-[:SELLS]->(p15);