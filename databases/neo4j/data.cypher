CREATE (Alajuela:Location{ name: 'TECstaurant - Alajuela', address:'Center of Alajuela' })
CREATE (Cartago:Location{ name: 'TECstaurant - Cartago', address:'Center of Cartago' })
CREATE (Guanacaste:Location{ name: 'TECstaurant - Guanacaste', address:'Center of Guanacaste' })
CREATE (Heredia:Location{ name: 'TECstaurant - Heredia', address:'Center of Heredia' })
CREATE (Limon:Location{ name: 'TECstaurant - Limon', address:'Center of Limon' })
CREATE (Puntarenas:Location{ name: 'TECstaurant - Puntarenas', address:'Center of Puntarenas' })
CREATE (SanJose:Location{ name: 'TECstaurant - San Jose', address:'Center of San Jose' })
CREATE (Escazu:Location{ name: 'TECstaurant - Escazu', address:'Center of Escazu' })
CREATE (Lindora:Location{ name: 'TECstaurant - Lindora', address:'Center of Lindora' })
CREATE (TresRios:Location{ name: 'TECstaurant - TresRios', address:'Center of TresRios' })

CREATE (p01:Product { name:'Beer', price:'$4', description:'600ml bottle of local beer' })
CREATE (p02:Product { name:'Wine', price:'$12', description:'600ml bottle of red wine' })
CREATE (p03:Product { name:'Large Soda', price:'$3.50', description:'750ml glass of soda' })
CREATE (p04:Product { name:'Small Soda', price:'$2', description:'350ml glass of soda' })
CREATE (p05:Product { name:'Steak', price:'$20.50', description:'Quarter pound steak accompanied with rice and salad' })
CREATE (p06:Product { name:'Cheese Burger', price:'$10', description:'Cheese burger with fries and a small drink' })
CREATE (p07:Product { name:'Grilled Chicken', price:'$15', description:'Grilled chicken  accompanied with rice and salad' })
CREATE (p08:Product { name:'Fried Chicken', price:'$6.75', description:'3 pieces of friend chicken with fries' })
CREATE (p09:Product { name:'Pork Slices', price:'$12', description:'4 small pieces of pork with rice and salad' })
CREATE (p10:Product { name:'Pizza Slice', price:'$2', description:'Single pizza slice' })
CREATE (p11:Product { name:'Small Pizza', price:'$6', description:'Pizza of choice, 4 slices' })
CREATE (p12:Product { name:'Medium Pizza', price:'$10', description:'Pizza of choice, 8 slices' })
CREATE (p13:Product { name:'Large Pizza', price:'$15', description:'Pizza of choice, 12 slices' })
CREATE (p14:Product { name:'Extra-Larfe Pizza', price:'$25', description:'Pizza of choice, 16 slices' })
CREATE (p15:Product { name:'Monster Pizza', price:'$35', description:'Pizza of choice, 25 slices' })

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
  (Guanacaste)-[:SELLS]->(p15)

  CREATE
  (Heredia)-[:SELLS]->(p01),
  (Heredia)-[:SELLS]->(p02),
  (Heredia)-[:SELLS]->(p03),
  (Heredia)-[:SELLS]->(p04),
  (Heredia)-[:SELLS]->(p05),
  (Heredia)-[:SELLS]->(p06),
  (Heredia)-[:SELLS]->(p07),
  (Heredia)-[:SELLS]->(p08),
  (Heredia)-[:SELLS]->(p09),
  (Heredia)-[:SELLS]->(p10),
  (Heredia)-[:SELLS]->(p11),
  (Heredia)-[:SELLS]->(p12),
  (Heredia)-[:SELLS]->(p13),
  (Heredia)-[:SELLS]->(p14),
  (Heredia)-[:SELLS]->(p15)

  CREATE
  (Limon)-[:SELLS]->(p01),
  (Limon)-[:SELLS]->(p02),
  (Limon)-[:SELLS]->(p03),
  (Limon)-[:SELLS]->(p04),
  (Limon)-[:SELLS]->(p05),
  (Limon)-[:SELLS]->(p06),
  (Limon)-[:SELLS]->(p07),
  (Limon)-[:SELLS]->(p08),
  (Limon)-[:SELLS]->(p09),
  (Limon)-[:SELLS]->(p10),
  (Limon)-[:SELLS]->(p11),
  (Limon)-[:SELLS]->(p12),
  (Limon)-[:SELLS]->(p13),
  (Limon)-[:SELLS]->(p14),
  (Limon)-[:SELLS]->(p15)

  CREATE
  (Puntarenas)-[:SELLS]->(p01),
  (Puntarenas)-[:SELLS]->(p02),
  (Puntarenas)-[:SELLS]->(p03),
  (Puntarenas)-[:SELLS]->(p04),
  (Puntarenas)-[:SELLS]->(p05),
  (Puntarenas)-[:SELLS]->(p06),
  (Puntarenas)-[:SELLS]->(p07),
  (Puntarenas)-[:SELLS]->(p08),
  (Puntarenas)-[:SELLS]->(p09),
  (Puntarenas)-[:SELLS]->(p10),
  (Puntarenas)-[:SELLS]->(p11),
  (Puntarenas)-[:SELLS]->(p12),
  (Puntarenas)-[:SELLS]->(p13),
  (Puntarenas)-[:SELLS]->(p14),
  (Puntarenas)-[:SELLS]->(p15)

  CREATE
  (SanJose)-[:SELLS]->(p01),
  (SanJose)-[:SELLS]->(p02),
  (SanJose)-[:SELLS]->(p03),
  (SanJose)-[:SELLS]->(p04),
  (SanJose)-[:SELLS]->(p05),
  (SanJose)-[:SELLS]->(p06),
  (SanJose)-[:SELLS]->(p07),
  (SanJose)-[:SELLS]->(p08),
  (SanJose)-[:SELLS]->(p09),
  (SanJose)-[:SELLS]->(p10),
  (SanJose)-[:SELLS]->(p11),
  (SanJose)-[:SELLS]->(p12),
  (SanJose)-[:SELLS]->(p13),
  (SanJose)-[:SELLS]->(p14),
  (SanJose)-[:SELLS]->(p15)

  CREATE
  (Escazu)-[:SELLS]->(p01),
  (Escazu)-[:SELLS]->(p02),
  (Escazu)-[:SELLS]->(p03),
  (Escazu)-[:SELLS]->(p04),
  (Escazu)-[:SELLS]->(p05),
  (Escazu)-[:SELLS]->(p06),
  (Escazu)-[:SELLS]->(p07),
  (Escazu)-[:SELLS]->(p08),
  (Escazu)-[:SELLS]->(p09),
  (Escazu)-[:SELLS]->(p10),
  (Escazu)-[:SELLS]->(p11),
  (Escazu)-[:SELLS]->(p12),
  (Escazu)-[:SELLS]->(p13),
  (Escazu)-[:SELLS]->(p14),
  (Escazu)-[:SELLS]->(p15)

  CREATE
  (Lindora)-[:SELLS]->(p01),
  (Lindora)-[:SELLS]->(p02),
  (Lindora)-[:SELLS]->(p03),
  (Lindora)-[:SELLS]->(p04),
  (Lindora)-[:SELLS]->(p05),
  (Lindora)-[:SELLS]->(p06),
  (Lindora)-[:SELLS]->(p07),
  (Lindora)-[:SELLS]->(p08),
  (Lindora)-[:SELLS]->(p09),
  (Lindora)-[:SELLS]->(p10),
  (Lindora)-[:SELLS]->(p11),
  (Lindora)-[:SELLS]->(p12),
  (Lindora)-[:SELLS]->(p13),
  (Lindora)-[:SELLS]->(p14),
  (Lindora)-[:SELLS]->(p15)

  CREATE
  (TresRios)-[:SELLS]->(p01),
  (TresRios)-[:SELLS]->(p02),
  (TresRios)-[:SELLS]->(p03),
  (TresRios)-[:SELLS]->(p04),
  (TresRios)-[:SELLS]->(p05),
  (TresRios)-[:SELLS]->(p06),
  (TresRios)-[:SELLS]->(p07),
  (TresRios)-[:SELLS]->(p08),
  (TresRios)-[:SELLS]->(p09),
  (TresRios)-[:SELLS]->(p10),
  (TresRios)-[:SELLS]->(p11),
  (TresRios)-[:SELLS]->(p12),
  (TresRios)-[:SELLS]->(p13),
  (TresRios)-[:SELLS]->(p14),
  (TresRios)-[:SELLS]->(p15);