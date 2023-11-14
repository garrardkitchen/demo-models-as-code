workspace {

    model {

        !include model/people-external.dsl
        
        group "internal" {
            
            !include model/people-internal.dsl

            website = softwareSystem "E-Shop" {
                tags "Parent"
            }
        }   
    }   
}