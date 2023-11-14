workspace extends system-wide.dsl {

    model {

        !ref orders_system  {
            tags "Microsoft Azure - App Services"

            ms = container "Microservices" {

                group "Data Layer" {

                    db = component "Database" "" "" "Microsoft Azure - Azure Cosmos DB"
                }

                group "Application Layer" {
                
                    basket_api = component "Basket" "API" "ASP.NET Core "
                    item_api = component "Item" "API" "ASP.NET Core"
                    order_api = component "Order" "API" "ASP.NET Core"

                    item_api -> basket_api "Add item to basket" "HTTPS"
                    item_api -> basket_api "Remove item from basket" "HTTPS"

                    basket_api -> order_api "Order items" "HTTPS"

                    order_api -> db "Read/Write doc"

                }

                

                # foo2 -> e "Order item"
            }
        }

    }

    views {

        # systemContext orders_system "ctx" {
        #     include *
        #     autolayout lr
        # }

        # container orders_system "containers" {
        #     include * ms
        #     autoLayout lr
        # }

        # component ms "components" {
        #     include * 
        #     autoLayout lr
        # }

        themes default "https://static.structurizr.com/themes/microsoft-azure-2023.01.24/icons.json"

        styles {
            # default overrides
            element "Azure" {
                color #ffffff
                #stroke #438dd5
            }
            element "External" {
                background #999999
                color #ffffff
            }
            element "Database" {
                shape Cylinder
            }
            element "Browser" {
                shape WebBrowser
            }
        }
    }
}

