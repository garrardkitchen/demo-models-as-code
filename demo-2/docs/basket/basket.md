# Website

Index:

| Section | Type | Responsibility |
| :- | :- | :- |
| [Diagram](#diagram) | Diagram | ... |
| [BasketController](#basketcontroller) | MVC Controller| ... |


## Diagram

![E-Shop](embed:SystemContext-002)

### BasketController

This controller is responsible for processing calls to the BasketController endpoint.

```csharp
[Route("api/[controller]")]
[ApiController]
public class EShop.Web.BasketController : ControllerBase {
    private ILogger<BasketController> _logger;

    public void BasketController (ILogger<BasketController> logger) {
        _logger = logger
    }
}
```