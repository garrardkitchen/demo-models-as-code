  # SiT = deploymentEnvironment "SiT" {
        #     deploymentNode "UK South" {
        #         containerInstance basket_api
        #         containerInstance order_api
        #     }          
        # }

        # production = deploymentEnvironment "Production" {
        #     deploymentNode "UK South" {
        #         containerInstance basket_api
        #         containerInstance order_api
        #     }
        #     deploymentNode "UK West" {
        #         containerInstance basket_api
        #         containerInstance order_api
        #     }
        # }

        #  views {
       

        # deployment * production {
        #     include *
        #     autolayout
        # }

        # deployment * SiT {
        #     include *
        #     autolayout
        # }

        # }
