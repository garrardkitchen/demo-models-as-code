workspace {

    !identifiers hierarchical

    model {
        website = softwareSystem "Website"

        orders_system = softwareSystem "Orders"

        warehouse_system = softwareSystem "Warehouse"

        logistics_system = softwareSystem "Logistics"
    
        website -> orders_system "Fills basket"

        orders_system -> warehouse_system "Reserve stock"

        warehouse_system -> logistics_system "Schedule delivery"

        user_customer = person "Customer"

        logistics_system -> user_customer "Deliver goods"

        user_customer -> website "Visit"

    }
    
}