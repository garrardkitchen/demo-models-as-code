# Website

Index:

| Section | Type | Responsibility |
| :- | :- | :- |
| [Diagram](#diagram) | Diagram | ... |
| [HomeController](#homecontroller) | MVC Controller| ... |


## Diagram

![E-Shop](embed:Container-001)

### HomeController

This controller is responsible for rendering the Home view.

```csharp
[Route("api/[controller]")]
[ApiController]
public class EShop.Web.HomeController : ControllerBase {
    private ILogger<HomeController> _logger;

    public void HomeController (ILogger<HomeController> logger) {
        _logger = logger
    }
}
```