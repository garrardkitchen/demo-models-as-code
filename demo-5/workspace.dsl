workspace {

    model {

        user_customer = person "Customer" {
            tags "External"
        }        

        group "internal" {
            
            user_buyer = person "Buyer"
            user_customer_services = person "Agent"

            website = softwareSystem "E-Shop" {
                tags "Microsoft Azure - App Services" "Browser"
            }

            basket_system = softwareSystem "Shopping Basket"  {
                tags "Microsoft Azure - App Services"
            }

            orders_system = softwareSystem "Orders"  {
                tags "Microsoft Azure - App Services"
            }     

            warehouse_system = softwareSystem "Warehouse"  {
                tags "Microsoft Azure - App Services"
            }     

            logistics_system = softwareSystem "Logistics"  {
                tags "Microsoft Azure - App Services"
            }    
        }   

        supplier_system = softwareSystem "Supplier"  {
            tags "Browser" "External"
        } 
       
        # relationships

        user_customer -> website "Visits"
        user_customer -> user_customer_services "Calls"
        user_customer_services -> orders_system "Access order"
        warehouse_system -> user_buyer "Replenish stocks"
        user_buyer -> supplier_system "Order stock"
        website -> basket_system "Add item"
        basket_system -> orders_system "Submits order"
        orders_system -> warehouse_system "Reserves items"
        orders_system -> logistics_system "Schedules delivery"
        logistics_system -> user_customer "Deliver goods"
        warehouse_system -> logistics_system "Collects goods"
        supplier_system -> warehouse_system "Deliver stock"

    }

    views {
       
        systemLandscape "landscape" {
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
                stroke #000000
            }
            
        }
    }
}

