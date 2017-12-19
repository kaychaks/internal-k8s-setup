    let hs = ./hosts-data.dhall 

in  let u = 0000 -- ^ user name  

in  let fun =
            λ(a : { ip : List Integer, name : Text })
          → λ(b : List ./hosts-schema/adt.dhall )
          →   [ { ansible_ssh_host = a.ip
                , ansible_user     = u
                , host_name        = a.name
                , vars             = [ {=} ] : Optional {}
                }
              ]
            # b

in  let xs =
          List/fold
          { ip : List Integer, name : Text }
          hs
          (List ./hosts-schema/adt.dhall )
          fun
          ([] : List ./hosts-schema/adt.dhall )

in  ./Prelude/List/map 
    ./hosts-schema/adt.dhall 
    ./hosts-schema/out.dhall 
    (   λ(a : ./hosts-schema/adt.dhall )
      →   a
        ⫽ { ansible_ssh_host =
              List/fold
              Integer
              a.ansible_ssh_host
              Text
              (λ(x : Integer) → λ(y : Text) → Integer/show x ++ "." ++ y)
              ""
          , ansible_user     = Integer/show a.ansible_user
          }
    )
    xs
