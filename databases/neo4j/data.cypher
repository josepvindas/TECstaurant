CREATE CONSTRAINT ON (l:Location) ASSERT l.id IS UNIQUE
CREATE CONSTRAINT ON (p:Product) ASSERT p.id IS UNIQUE
CREATE CONSTRAINT ON (s:Service) ASSERT s.id IS UNIQUE

CREATE (Alajuela:Location{ id: 1, name: 'TECstaurant - Alajuela', address:'Center of Alajuela' })
CREATE (Cartago:Location{ id: 2,  name: 'TECstaurant - Cartago', address:'Center of Cartago' })
CREATE (Guanacaste:Location{ id: 3,  name: 'TECstaurant - Guanacaste', address:'Center of Guanacaste' })
CREATE (Heredia:Location{ id: 4,  name: 'TECstaurant - Heredia', address:'Center of Heredia' })
CREATE (Limon:Location{ id: 5,  name: 'TECstaurant - Limon', address:'Center of Limon' })
CREATE (Puntarenas:Location{ id: 6,  name: 'TECstaurant - Puntarenas', address:'Center of Puntarenas' })
CREATE (SanJose:Location{ id: 7,  name: 'TECstaurant - San Jose', address:'Center of San Jose' })
CREATE (Escazu:Location{ id: 8,  name: 'TECstaurant - Escazu', address:'Center of Escazu' })
CREATE (Lindora:Location{ id: 9,  name: 'TECstaurant - Lindora', address:'Center of Lindora' })
CREATE (TresRios:Location{ id: 10,  name: 'TECstaurant - TresRios', address:'Center of TresRios' })

CREATE (p01:Product { id: 1, name:'Beer', price:'$4', description:'600ml bottle of local beer' })
CREATE (p02:Product { id: 2, name:'Wine', price:'$12', description:'600ml bottle of red wine' })
CREATE (p03:Product { id: 3, name:'Large Soda', price:'$3.50', description:'750ml glass of soda' })
CREATE (p04:Product { id: 4, name:'Small Soda', price:'$2', description:'350ml glass of soda' })
CREATE (p05:Product { id: 5, name:'Steak', price:'$20.50', description:'Quarter pound steak accompanied with rice and salad' })
CREATE (p06:Product { id: 6, name:'Cheese Burger', price:'$10', description:'Cheese burger with fries and a small drink' })
CREATE (p07:Product { id: 7, name:'Grilled Chicken', price:'$15', description:'Grilled chicken  accompanied with rice and salad' })
CREATE (p08:Product { id: 8, name:'Fried Chicken', price:'$6.75', description:'3 pieces of friend chicken with fries' })
CREATE (p09:Product { id: 9, name:'Pork Slices', price:'$12', description:'4 small pieces of pork with rice and salad' })
CREATE (p10:Product { id: 0, name:'Pizza Slice', price:'$2', description:'Single pizza slice' })
CREATE (p11:Product { id: 11, name:'Small Pizza', price:'$6', description:'Pizza of choice, 4 slices' })
CREATE (p12:Product { id: 12, name:'Medium Pizza', price:'$10', description:'Pizza of choice, 8 slices' })
CREATE (p13:Product { id: 13, name:'Large Pizza', price:'$15', description:'Pizza of choice, 12 slices' })
CREATE (p14:Product { id: 14, name:'Extra-Large Pizza', price:'$25', description:'Pizza of choice, 16 slices' })
CREATE (p15:Product { id: 15, name:'Monster Pizza', price:'$35', description:'Pizza of choice, 25 slices' })

CREATE (s01:Service { id: 1, name:'Birthday Party', hourly_fee: 100, description: 'Large, private room with capacity for 50 people + service' })
CREATE (s02:Service { id: 2, name:'Children Party', hourly_fee: 50, description: 'Large, private room with capacity for 50 people + service + cake' })
CREATE (s03:Service { id: 3, name:'Anniversary', hourly_fee: 20, description: 'Small, private room + service' })
CREATE (s04:Service { id: 4, name:'Private event', hourly_fee: 250, description: 'Private access to the entire premises of the location + service' })

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
  (TresRios)-[:SELLS]->(p15)

  CREATE
  (Alajuela)-[:OFFERS]->(s01),
  (Alajuela)-[:OFFERS]->(s02),
  (Alajuela)-[:OFFERS]->(s03),
  (Alajuela)-[:OFFERS]->(s04)

  CREATE
  (Cartago)-[:OFFERS]->(s01),
  (Cartago)-[:OFFERS]->(s02),
  (Cartago)-[:OFFERS]->(s03),
  (Cartago)-[:OFFERS]->(s04)

  CREATE
  (Guanacaste)-[:OFFERS]->(s01),
  (Guanacaste)-[:OFFERS]->(s02),
  (Guanacaste)-[:OFFERS]->(s03),
  (Guanacaste)-[:OFFERS]->(s04)

  CREATE
  (Heredia)-[:OFFERS]->(s01),
  (Heredia)-[:OFFERS]->(s02),
  (Heredia)-[:OFFERS]->(s03),
  (Heredia)-[:OFFERS]->(s04)

  CREATE
  (Limon)-[:OFFERS]->(s01),
  (Limon)-[:OFFERS]->(s02),
  (Limon)-[:OFFERS]->(s03),
  (Limon)-[:OFFERS]->(s04)

  CREATE
  (Puntarenas)-[:OFFERS]->(s01),
  (Puntarenas)-[:OFFERS]->(s02),
  (Puntarenas)-[:OFFERS]->(s03),
  (Puntarenas)-[:OFFERS]->(s04)

  CREATE
  (SanJose)-[:OFFERS]->(s01),
  (SanJose)-[:OFFERS]->(s02),
  (SanJose)-[:OFFERS]->(s03),
  (SanJose)-[:OFFERS]->(s04)

  CREATE
  (Escazu)-[:OFFERS]->(s01),
  (Escazu)-[:OFFERS]->(s02),
  (Escazu)-[:OFFERS]->(s03),
  (Escazu)-[:OFFERS]->(s04)

  CREATE
  (Lindora)-[:OFFERS]->(s01),
  (Lindora)-[:OFFERS]->(s02),
  (Lindora)-[:OFFERS]->(s03),
  (Lindora)-[:OFFERS]->(s04)

  CREATE
  (TresRios)-[:OFFERS]->(s01),
  (TresRios)-[:OFFERS]->(s02),
  (TresRios)-[:OFFERS]->(s03),
  (TresRios)-[:OFFERS]->(s04)

  