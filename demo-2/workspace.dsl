workspace {

    model {

        user_customer = person "Customer"

        website = softwareSystem "E-Shop" {
            !docs docs/website

            tags "Microsoft Azure - App Services" "Browser"

            frontend = container "Website" {

            } 

            bff = container "BFF" {
                 group "Application Layer" {
                
                    basket_controller = component "Basket Controller" "Managed the shopper's basket" "ASP.NET Core "
                    item_controller = component "Item Controller" "Get details on items in user's shopping basket" "ASP.NET Core"                   
                    order_controller = component "Order Controller" "Submits an order for processing" "ASP.NET Core"

                }
            } 

            frontend -> bff "Update Basket"

            frontend -> basket_controller "Add item to basket" "HTTPS"
            frontend -> item_controller "Get item details" "HTTPS"
            frontend -> order_controller "Submit order" "HTTPS"
        }


        basket_system = softwareSystem "Shopping Basket"  {
            
            !docs docs/basket
            
            tags "Microsoft Azure - App Services"

            basket_db = container "Basket Db" {
                tags "Microsoft Azure - Azure Cosmos DB"
            }
         
            basket_api = container "Basket API" {
             
                group "Application Layer" {
                
                    api_basket_controller = component "Basket Controller" "Managed the shopper's basket" "ASP.NET Core "
                    api_item_controller = component "Item Controller" "Allows the user to add/remove items to a shopping basket" "ASP.NET Core"                   
                    api_order_controller = component "Order Controller" "Submits an order for processing" "ASP.NET Core"

                    api_basket_controller -> basket_db "Create basket" "HTTPS"
                    api_basket_controller -> basket_db "Add item basket" "HTTPS"
                    api_item_controller -> basket_db "Get item details" "HTTPS" 
                    api_order_controller -> basket_db "Update basket with order status"                
                    
                }

            }

            basket_controller -> api_basket_controller "Add item to basket" "HTTPS"
            item_controller -> api_item_controller "Get item details" "HTTPS"
            order_controller -> api_order_controller "Submit order" "HTTPS"          
        }

        orders_system = softwareSystem "Orders"  {
            tags "Microsoft Azure - App Services"

            orders_db = container "Order Db" {
                tags "Microsoft Azure - Azure Cosmos DB"
            }
         
            orders_api = container "Orders API" {
             
                group "Application Layer" {
                
                    api_orders_controller = component "Orders Controller" "Manage customer orders" "ASP.NET Core "                 

                    api_orders_controller -> orders_db "Create order" "HTTPS"                             
                }

            }

            api_order_controller -> api_orders_controller "Submit a new order" "HTTPS"
            api_orders_controller -> api_order_controller "Order confirmation" "HTTPS"
        }
      
        # relationships

        user_customer -> website "Visits"
    }

    views {
       
        systemLandscape "landscape" {
            include *
            autolayout lr
        }

        systemContext website {
            include *
            autoLayout lr
        }        

        systemContext basket_system {
            include *
            autoLayout lr
        }

        systemContext orders_system {
            include *
            autoLayout lr
        }

        container website {
            include *
            autolayout lr
        }

        component bff {
            include *
            autolayout lr
        }

        container basket_system {
            include *
            autolayout lr
        }

        container orders_system {
            include *
            autolayout lr
        }

        component basket_api {
            include *
            autolayout lr
        }

        component orders_api {
            include *
            autolayout lr
        }

        themes default "https://static.structurizr.com/themes/microsoft-azure-2023.01.24/icons.json"

        styles {
            # default overrides
            element "Azure" {
                color #ffffff                
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

