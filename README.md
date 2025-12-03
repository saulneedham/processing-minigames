# processing-minigames
A collection of three Java minigames built using the Processing framework. These interactive projects focus on object-oriented programming, user input, and real-time animation within factory and assembly-line themes

## 📘 Included Projects

* **Pizza\_Factory:** A time-management minigame where the player must assemble pizzas by clicking and dragging toppings onto a crust.
    * **Design Note:** Uses a **PizzaClass** and a single **ToppingsClass** to manage all different topping types as objects.
      
* **Toolbox\_Factory:** A rhythm or matching game where the player selects the correct tools to place in a toolbox based on a rapidly changing assembly order.
    * **Design Note:** Uses a single, generalized **ToolClass** to represent all tools, where tool attributes are managed by object properties.
      
* **Product\_Assembly\_Game:** A sequence-based game where the player must use multiple tools in the correct order (e.g., hammer, screwdriver, spanner) to complete a product assembly task.
    * **Design Note:** Utilizes **polymorphism** by creating separate classes for each tool (**HammerClass**, **PliersClass**, etc.) that **inherit** from a parent **ToolClass**.

## 🛠 Built With

* Java
* Processing Framework (.pde)
