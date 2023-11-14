workspace {

    !identifiers hierarchical

    model {
        a = softwareSystem "Admin Portal" {
            tags "Microsoft Azure - App Services"
        }
        b = softwareSystem "Customer Portal" {
            tags "Microsoft Azure - App Services"
        }
        c = softwareSystem "Website" {
            tags "Microsoft Azure - App Services"
        }

        
        e = softwareSystem "Supplier" {
            tags "Microsoft Azure - API Management Services"
        }

        d = softwareSystem "Warehouse" {
            tags "Microsoft Azure - App Services"

            api = container "Microservices" {

                  group "Web Layer" {
                
                    foo = component "order" "API" "ASP.NET Core "
                    foo2 = component "stock" "API" "ASP.NET Core"

                    foo -> foo2 "Purchase items from supplier" "https"
                    foo -> foo2 "Request price update from supplier" "https"
                    
                }

                # foo2 -> e "Order item"
            }
        }

        f = softwareSystem "Order" {
            tags "Microsoft Azure - App Services"
        }

        c_user = person "Customer"

        a_user = person "Administrator"

        w_user = person "Purchaser"

        ac_user = person "Accounts"

        m_user = person "Management"

        c_user -> b "Checks order status"

        a_user -> a "Administers customer account"

        c_user -> c "Visits"

        w_user -> d "Updates stock"

        d -> c "Updates stock details"

        a -> b "Amends account"

        d -> e "Purchase stock"

        d -> c_user "Deliver items"

        e -> d "Deliver stock"

        c -> f "Purchase item"

        ac_user -> f "Consolidate orders"

        ac_user -> m_user "Provide sales reports"

        f -> d "Place order"

    }

    views {
        
        styles {
            relationship "dotted" {
                color #ff0000
                style dotted
            }
        }
    }
    
    
}