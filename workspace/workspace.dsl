workspace {

    model {

        user_customer = person "Customer"

        website = softwareSystem "Website" {
            tags "Microsoft Azure - App Services"
        }

        sales = softwareSystem "Sales" {
            tags "Microsoft Azure - App Services"

            sales_api = container "Price API" {

            }

        }

        warehouse = softwareSystem "Warehouse" {
            tags "Microsoft Azure - App Services"

            stock_api = container "Stock API" {

            }
        }

        Logistics = softwareSystem "Logistics" {
            tags "Microsoft Azure - App Services"
        }





        orders_system = softwareSystem "Shopping Basket"  {
            tags "Microsoft Azure - App Services"

            order_db = container "Order Db" {
                tags "Microsoft Azure - Azure Cosmos DB"
            }
         
            basket_api = container "Basket API" {
             
                group "Application Layer" {
                
                    basket_controller = component "Basket Controller" "Managed the shopper's basket" "ASP.NET Core "
                    item_controller = component "Item Controller" "Allows the user to add/remove items to a shopping basket" "ASP.NET Core"
                   
                    order_controller = component "Order Controller" "Submits an order for processing" "ASP.NET Core"

                    basket_controller -> order_db "Create basket" "HTTPS"
                    item_controller -> order_db "Add item to basket" "HTTPS"
                    
                    
                }

            }

            order_api = container "Order API" {

                  group "Application Layer" {
                

                    order_api_controller = component "Order Controller" "Submits an order for processing" "ASP.NET Core"

                    order_api_controller -> order_db "Create an order" "HTTPS"
                    
                    

                }

               
            }
           
        }
        
        SiT = deploymentEnvironment "SiT" {
            deploymentNode "UK South" {
                containerInstance basket_api
                containerInstance order_api
            }          
        }

        production = deploymentEnvironment "Production" {
            deploymentNode "UK South" {
                containerInstance basket_api
                containerInstance order_api
            }
            deploymentNode "UK West" {
                containerInstance basket_api
                containerInstance order_api
            }
        }

        # relationships

        user_customer -> website "Visits"
        website -> orders_system "Place item in"
        orders_system -> warehouse "Reserve item"
        warehouse -> Logistics "Schedule delivery"
        Logistics -> user_customer "Deliver order"
        orders_system -> sales "Get price"

        order_api -> stock_api "Reserve item" "HTTPS"
        order_api -> sales_api "Get price" "HTTPS"
        order_api -> sales_api "Get offers" "HTTPS"

        basket_api -> order_api "Submit Order" "HTTPS"
        
        order_controller -> order_api "Submit order Id" "HTTPS"

    }

    views {
       
        systemLandscape "landscape" {
            include *
            autolayout lr
        }

        systemContext orders_system {
            include *
            autoLayout lr
        }

        deployment * production {
            include *
            autolayout
        }

        deployment * SiT {
            include *
            autolayout
        }

        container orders_system {
            include *
            autolayout lr
        }

        component basket_api {
            include *
            autolayout lr
        }


        # systemContext * "ctx" {
        #     include *  
        #     autolayout lr
        # }

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

