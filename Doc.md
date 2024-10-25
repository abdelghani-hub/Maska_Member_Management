## Table Of Content
* [1. Dependency Injection (DI)](#1-dependency-injection-di)
  * [1.1 Constructor Injection](#11-constructor-injection)
    * [How it works:](#how-it-works)
      * [Example:](#example)
      * [Advantages :](#advantages-)
      * [Disadvantages :](#disadvantages-)
  * [1.2 Setter Injection](#12-setter-injection)
      * [How it works:](#how-it-works-1)
      * [Example:](#example-1)
      * [Advantages :](#advantages--1)
      * [Disadvantages :](#disadvantages--1)
  * [1.3 Field Injection](#13-field-injection)
      * [How it works:](#how-it-works-2)
      * [Example:](#example-2)
      * [Advantages :](#advantages--2)
      * [Disadvantages :](#disadvantages--2)
* [2. Inversion of Control (IoC)](#2-inversion-of-control-ioc)
  * [2.1 How IoC Works in Practice](#21-how-ioc-works-in-practice)
  * [2.2 IoC in Dependency Injection](#22-ioc-in-dependency-injection)
  * [2.3 Types of IoC:](#23-types-of-ioc)
      * [Dependency Injection (DI):](#dependency-injection-di)
      * [Event-driven IoC:](#event-driven-ioc)
      * [Service Locator:](#service-locator)
  * [2.4 Benefits of IoC:](#24-benefits-of-ioc)
* [3. Spring Beans](#3-spring-beans)
    * [3.1 Key Concepts of Spring Beans:](#31-key-concepts-of-spring-beans)
        * [**Definition** :](#definition-)
        * [**Bean Lifecycle**:](#bean-lifecycle)
        * [**Configuration of Beans**:](#configuration-of-beans)
    * [3.2 Beans Scopes:](#32-beans-scopes)
        * [Singleton (Default):](#singleton-default)
        * [Prototype:](#prototype)
        * [Other scopes (used in web apps):](#other-scopes-used-in-web-apps)
* [4. ApplicationContext](#4-applicationcontext)
  * [4.1 Key Features of ApplicationContext:](#41-key-features-of-applicationcontext)
    * [**Bean Factory :**](#bean-factory-)
    * [**Dependency Injection :**](#dependency-injection-)
    * [**Internationalization :**](#internationalization-)
    * [**Event Propagation :**](#event-propagation-)
    * [**AOP (Aspect-Oriented Programming) :**](#aop-aspect-oriented-programming-)
    * [**Resource Loading :**](#resource-loading-)
    * [**Automatic Bean Registration :**](#automatic-bean-registration-)
    * [**Multiple Context Support :**](#multiple-context-support-)
  * [4.2 Common ApplicationContext Implementations :](#42-common-applicationcontext-implementations-)
    * [ClassPathXmlApplicationContext:](#classpathxmlapplicationcontext)
    * [FileSystemXmlApplicationContext:](#filesystemxmlapplicationcontext)
    * [AnnotationConfigApplicationContext:](#annotationconfigapplicationcontext)
    * [WebApplicationContext:](#webapplicationcontext)
* [5. Component Scanning and Stereotype Annotations](#5-component-scanning-and-stereotype-annotations)
  * [5.1 Component Scanning](#51-component-scanning)
        * [a) XML Configuration:](#a-xml-configuration)
        * [b) Java-Based Configuration:](#b-java-based-configuration)
  * [5.2 Stereotype Annotations](#52-stereotype-annotations)
    * [Key Stereotype Annotations:](#key-stereotype-annotations)
        * [a) ``@Component``:](#a-component)
        * [b) ``@Service``:](#b-service)
        * [c) ``@Repository``:](#c-repository)
        * [d) ``@Controller``:](#d-controller)
    * [Benefits of Component Scanning and Stereotype Annotations:](#benefits-of-component-scanning-and-stereotype-annotations)
* [6. Spring Data JPA](#6-spring-data-jpa)
  * [6.1 Key Features of Spring Data JPA](#61-key-features-of-spring-data-jpa)
    * [Repositories and CRUD Operations](#repositories-and-crud-operations)
    * [Query Methods](#query-methods)
    * [Custom Queries with JPQL (Java Persistence Query Language) and Native SQL:](#custom-queries-with-jpql-java-persistence-query-language-and-native-sql)
    * [Pagination and Sorting:](#pagination-and-sorting)
    * [Custom Repository Methods:](#custom-repository-methods)
    * [Transaction Management:](#transaction-management)
  * [6.2 Core Interfaces in Spring Data JPA](#62-core-interfaces-in-spring-data-jpa)
    * [``Repository``:](#repository)
    * [``CrudRepository``:](#crudrepository)
    * [``PagingAndSortingRepository``:](#pagingandsortingrepository)
    * [``JpaRepository``:](#jparepository)
  * [6.3 Example of Spring Data JPA Repository](#63-example-of-spring-data-jpa-repository)
* [7. Spring MVC](#7-spring-mvc)
  * [7.1 Key Components of Spring MVC](#71-key-components-of-spring-mvc)
    * [DispatcherServlet](#dispatcherservlet)
    * [Controller](#controller)
    * [Model and ModelAndView](#model-and-modelandview)
    * [View Resolver:](#view-resolver)
    * [DispatcherServlet](#dispatcherservlet-1)
    * [Request Mapping](#request-mapping)
  * [7.2 Lifecycle of a Spring MVC Request](#72-lifecycle-of-a-spring-mvc-request)
<!-- TOC -->

# 1. Dependency Injection (DI)

## 1.1 Constructor Injection

### How it works:

Dependencies are provided through the class constructor. When the object is created, all its required dependencies are
passed as parameters.

#### Example:

```java
public class MemberService {
    private final MemberRepository memberRepository;

    // Constructor Injection
    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }
}
```

#### Advantages :

- Ensures that the class is always in a fully initialized state since dependencies are provided at object creation.
- Suitable for immutable dependencies (i.e., those that should not change during the object's lifecycle).
- Encourages cleaner, more testable code by promoting immutability.

#### Disadvantages :

- Can lead to large constructors if there are many dependencies, potentially reducing readability.

## 1.2 Setter Injection

#### How it works:

Dependencies are provided through setter methods. The object is created first, and then the dependencies are set using
these methods.

#### Example:

```java
public class MemberService {
    private MemberRepository memberRepository;

    // Setter Injection
    public void setMemberRepository(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }
}
```

#### Advantages :

- Useful when dependencies are optional or changeable.
- Allows partial initialization of objects, which can be helpful in some scenarios where not all dependencies are
  immediately available.

#### Disadvantages :

- The object may exist in an incomplete or inconsistent state until all dependencies are set, which could introduce
  errors.
- Mutability can lead to harder-to-debug issues if dependencies are changed after initialization.

## 1.3 Field Injection

#### How it works:

Dependencies are injected directly into the fields, typically using annotations like `@Autowired` in Spring.

#### Example:

```java
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    // Field Injection (no setter or constructor)
}
```

#### Advantages :

- Cleaner syntax, as there’s no need for constructor or setter methods.
- Less boilerplate code compared to constructor or setter injection.

#### Disadvantages :

- Harder to test because dependencies are injected directly and cannot be easily mocked or controlled externally.
- Promotes mutability and can obscure the class’s dependencies, making it less clear which dependencies are required.
- **Less recommended** in modern Spring applications due to the difficulties with testing and maintainability.

____________________________________________________________________________________

# 2. Inversion of Control (IoC)

**Inversion of Control (IoC)** is a principle in software engineering where the control of objects or components is
transferred from the programmer (or application code) to a framework or container. This means that the framework
controls how dependencies are instantiated, managed, and injected, instead of the programmer doing it manually.

## 2.1 How IoC Works in Practice

In a traditional application, the developer is responsible for creating objects and managing their lifecycle. With IoC,
this responsibility is inverted—objects are provided by the container (like the Spring IoC container), and dependencies
are injected where needed.

## 2.2 IoC in Dependency Injection

One of the most common ways to implement IoC is Dependency Injection (DI). With DI, the IoC container injects the
necessary dependencies (objects) into classes, so they don’t need to create or manage their own dependencies.

## 2.3 Types of IoC:

#### Dependency Injection (DI):

The framework provides the required dependencies when needed.

#### Event-driven IoC:

- The control flow is determined by events or messages in an event-driven system.
- The framework invokes the required methods when specific events occur.

#### Service Locator:

- Objects or components ask for their dependencies from a centralized service locator rather than having them injected.

## 2.4 Benefits of IoC:

- **Decoupling**: It decouples the logic of object creation from the actual business logic, improving flexibility.
- **Testability**: Classes become easier to test since their dependencies can be mocked or replaced with alternatives
  during testing.
- **Maintainability**: It leads to cleaner code and a more maintainable architecture by separating concerns.

____________________________________________________________________________________

# 3. Spring Beans

**Spring Beans** are the objects that form the backbone of a Spring application. These beans are managed, created, and
configured by the Spring IoC (Inversion of Control) container. The container is responsible for the entire lifecycle of
a bean, from its instantiation to its destruction, as well as resolving any dependencies that a bean may have.

### 3.1 Key Concepts of Spring Beans:

##### **Definition** :

- A bean in Spring is simply an object that is instantiated, configured, and managed by the Spring IoC container. Beans
  are the building blocks of a Spring application.
- Beans are typically defined in configuration files (XML or Java-based configurations) or by using annotations in the
  code.

##### **Bean Lifecycle**:

The lifecycle of a Spring bean includes several stages that the Spring IoC container manages. The common lifecycle
stages are:

- **Instantiation**:The bean is created by the container.
- **Dependency Injection**: The container injects any required dependencies into the bean.
- **Initialization**: If the bean implements the InitializingBean interface or defines a custom initialization method,
  this stage is triggered after dependencies are injected.
- **Use**: The bean can now be used by the application.
- **Destruction**: When the container is shut down, beans are destroyed, and any cleanup tasks (such as closing
  resources) are performed.

##### **Configuration of Beans**:

- XML Configuration (legacy, But still supported):

```xml

<bean id="memberService" class="com.example.MemberService"/> 
```

- Java-based Configuration (preferred in modern Spring apps using ``@Configuration`` and ``@Bean``):

```java

@Configuration
public class AppConfig {
    @Bean
    public MemberService memberService() {
        return new MemberService();
    }
} 
```

- Annotation-based Configuration (using ``@Component``, ``@Service``, ``@Repository``, etc.):

```java

@Service
public class MemberService {
    // Bean automatically created and managed by Spring
}
```

### 3.2 Beans Scopes:

##### Singleton (Default):

- By default, Spring beans are singleton scoped, meaning only one instance of the bean is created per Spring container.
- If multiple components need the same bean, they get a reference to the same instance.

##### Prototype:

- A bean with prototype scope means a new instance is created every time the bean is requested.

##### Other scopes (used in web apps):

- **Request**: A new instance of the bean is created for each HTTP request.
- **Session**: A new instance is created for each HTTP session.
- **Global session**: In a portlet-based web application, this scope creates a bean for each global session.

____________________________________________________________________________________

# 4. ApplicationContext

``ApplicationContext`` is a central interface in the Spring Framework that provides configuration and management of
beans in a Spring application. It is a container that holds and manages all Spring beans, enabling dependency injection
and various advanced features like event propagation, AOP (Aspect-Oriented Programming), internationalization, and more.
Essentially, ApplicationContext is responsible for creating, configuring, and managing Spring beans during the lifecycle
of the application.

## 4.1 Key Features of ApplicationContext:

### **Bean Factory :**

At its core, ApplicationContext builds upon the BeanFactory, which is a more basic interface responsible for bean
instantiation and wiring. However, ApplicationContext offers more advanced features than a basic BeanFactory, including:

- **Lifecycle management**: It manages the lifecycle of the beans, handling their creation, dependency injection, and
  destruction.
- **Automatic Bean Discovery**: It can automatically discover beans using annotations like ``@Component``, ``@Service``
  and ``@Repository``.

### **Dependency Injection :**

The ``ApplicationContext`` enables the core feature of Spring: **dependency injection** (DI). It resolves dependencies
between beans by automatically injecting them where needed. This can be done via constructor, setter, or field
injection.

### **Internationalization :**

It provides support for internationalization using message sources, making it easy to work with multilingual text and
messages.

### **Event Propagation :**

The ApplicationContext is able to publish events to registered listeners. This is useful for decoupled communication
between different parts of an application.

- **Example**: If an application raises a context event (such as starting up or shutting down), registered listeners can
  react to these events.

### **AOP (Aspect-Oriented Programming) :**

Spring uses ``ApplicationContext`` to apply AOP, which allows you to separate cross-cutting concerns like logging,
security, and transaction management.

### **Resource Loading :**

It provides a consistent way to load external resources (like files, classpath resources, etc.) by implementing
the ``ResourceLoader`` interface.

### **Automatic Bean Registration :**

``ApplicationContext`` automatically registers and wires beans at startup based on configuration files (XML, Java-based
configuration) or classpath scanning (annotation-based).

### **Multiple Context Support :**

It can manage hierarchical configurations, meaning you can have multiple ``ApplicationContext`` instances that share
beans or have child-parent relationships.

## 4.2 Common ApplicationContext Implementations :

### ClassPathXmlApplicationContext:

This implementation loads context definitions from an XML file located in the classpath.

Example:

```java
ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
MyBean myBean = context.getBean(MyBean.class);
```

### FileSystemXmlApplicationContext:

This is similar to ClassPathXmlApplicationContext, but it loads the context from an XML configuration file located in the
filesystem (rather than the classpath).

Example:

```java
ApplicationContext context = new FileSystemXmlApplicationContext("/path/to/beans.xml");
        MyBean myBean=context.getBean(MyBean.class);
```

### AnnotationConfigApplicationContext:

This implementation is used in modern Spring applications to load the context from Java-based configuration classes that
use annotations.
Example:

```java
@Configuration
public class AppConfig {
    @Bean
    public MyBean myBean() {
        return new MyBean();
    }
}

ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
MyBean myBean = context.getBean(MyBean.class);
```

### WebApplicationContext:

A specialized form of ApplicationContext used in web applications. It integrates with web technologies and provides
features specific to web development, like handling servlet context or web requests.
Typically, WebApplicationContext is used in Spring MVC applications.
____________________________________________________________________________________

# 5. Component Scanning and Stereotype Annotations

Component Scanning and Stereotype Annotations are essential concepts in the Spring Framework that help simplify
configuration and reduce boilerplate code. They enable the automatic detection and registration of Spring beans without
manually defining them in configuration files.

## 5.1 Component Scanning

Component scanning is a mechanism that Spring uses to automatically detect and register beans in the application context
by scanning the classpath for certain classes (usually annotated with specific annotations like @Component). This
eliminates the need to explicitly declare beans in XML or Java configuration.

**How It Works**:
Spring scans the specified packages for classes annotated with specific stereotype annotations (like @Component,
@Service, @Repository, @Controller).
These classes are automatically registered as beans in the Spring container, allowing them to be managed and injected by
Spring.
**Enabling Component Scanning**:
You enable component scanning either through XML configuration or Java-based configuration:

##### a) XML Configuration:

```xml
<context:component-scan base-package="com.example.app"/>
```

This tells Spring to scan the package com.example.app and its subpackages for components (classes annotated with
stereotype annotations).

##### b) Java-Based Configuration:

```java
@Configuration
@ComponentScan(basePackages = "com.example.app")
public class AppConfig {
    // Other configuration...
}
```

In this example, the ``@ComponentScan`` annotation tells Spring to scan com.example.app and register all the beans found
in
that package.

_Example_:

```java
@Component
public class MemberService {
    public void registerMember() {
        System.out.println("Member registered");
    }
}
```

Here, MemberService is automatically detected by Spring through component scanning, and no need exists to manually
define it as a bean.

## 5.2 Stereotype Annotations

Stereotype annotations are special annotations in Spring that indicate that a class is a Spring-managed component. They
are used to mark classes that perform specific roles in an application, helping Spring categorize and manage beans more
effectively. The main stereotype annotations are:

- ``@Component``
- ``@Service``
- ``@Repository``
- ``@Controller``

### Key Stereotype Annotations:

##### a) ``@Component``:

**Purpose**: The generic stereotype annotation that indicates a class is a Spring-managed bean.
**Usage**: It is used when the class does not fit into a more specific stereotype (such as @Service or @Controller).
_Example_:

```java
@Component
public class TaskManager {
    // Task handling logic
}
```

##### b) ``@Service``:

**Purpose**: Indicates that a class provides some business logic. It’s a specialized form of @Component.
**Usage**: Typically used to annotate service-layer classes that contain business logic.
_Example_:
```java
@Service
public class MemberService {
  public void registerMember() {
    // Business logic for registering a member
  }
}
```
##### c) ``@Repository``:
**Purpose**: Indicates that a class is a data access object (DAO), responsible for interacting with the database. This
annotation also enables exception translation, converting database exceptions into Spring’s DataAccessException.

**Usage**: Applied to classes that interact with the database or persistent storage.
_Example_:

```java
@Repository
public class MemberRepository {
    // Code to interact with the database
}
```

##### d) ``@Controller``:
**Purpose**: Marks a class as a Spring MVC controller, responsible for handling web requests.

**Usage**: Typically used in web applications to define endpoints and manage HTTP requests.

_Example_:

```java
@Controller
public class MemberController {
    @RequestMapping("/register")
    public String registerMember() {
        // Handle member registration
        return "registerSuccess";
    }
}
```

### Benefits of Component Scanning and Stereotype Annotations:
Automatic Bean Discovery:

No need to manually declare each bean in the configuration file. Spring automatically discovers and registers beans
through component scanning.
Less Boilerplate:

Reduces the amount of configuration code (XML or Java) needed to define beans.
Role-based Classification:

Using stereotype annotations (like @Service or @Repository) helps categorize and organize beans based on their
responsibilities (service, DAO, controller, etc.).
Centralized Configuration:

By specifying base packages for component scanning, you centralize and streamline the configuration process, allowing
Spring to manage the creation and injection of beans automatically.
Use in the Maska Project:
In your Maska project, component scanning will simplify the bean registration process. For example, you might annotate
your MemberService, MemberRepository, and MemberController with @Service, @Repository, and @Controller respectively.
Spring will automatically detect and register these components, and you won’t need to manually configure them as beans.
This allows you to focus more on implementing business logic and less on wiring the application.

For example:
```java
@Service
public class MemberService {
  public void registerMember() {
    // Your business logic
  }
}
```
Here, MemberService would be automatically detected and managed by Spring, thanks to component scanning.

**Summary**:
Component Scanning allows Spring to automatically detect and register beans by scanning specified packages.
Stereotype Annotations (``@Component``, ``@Service``, ``@Repository``, and ``@Controller``) provide more context on the roles of beans,
helping categorize components and simplifying Spring configuration.
By using these features, you can make your Spring application more modular, maintainable, and efficient in managing
dependencies.
____________________________________________________________________________________

# 6. Spring Data JPA

Spring Data is a solution initiated in 2010 by the Spring team to address a major challenge: simplifying data access in Java applications. It aligns with Spring's 'convention over configuration' philosophy, aiming to drastically reduce boilerplate code while maintaining great flexibility.

Spring Data is a Spring project that simplifies data access in Java applications.<br>
It provides a unified abstraction layer for:<br>
- Accessing both relational and non-relational data
- Automatic repository management
- Implementing standard CRUD operations
- Creating custom queries
- Reducing repetitive code

## 6.1 Key Features of Spring Data JPA
### Repositories and CRUD Operations
- **Repositories**: In Spring Data JPA, you create repository interfaces to handle database interactions instead of writing implementation classes. Spring generates the necessary code at runtime.
- **CRUD Methods**: The framework provides several basic methods like ``save()``, ``findById()``, ``findAll()``, ``deleteById()``, etc., so you can perform basic database operations without writing SQL.

### Query Methods
- Spring Data JPA allows for **derived queries**, meaning you can define methods in the repository interface, and Spring will automatically generate queries based on method names.
- _Example_
  ```java
  List<Member> findByLastName(String lastName);
  ```
  The method findByLastName would query the database for members with the specified last name.
### Custom Queries with JPQL (Java Persistence Query Language) and Native SQL:

- If derived queries are not sufficient, you can use custom queries with **JPQL** (object-oriented query language) or native SQL.
- _Example_
```java
// JPQL example
@Query("SELECT m FROM Member m WHERE m.age > :age")
List<Member> findMembersOlderThan(@Param("age") int age);

// Native SQL
@Query(value = "SELECT * FROM members WHERE age > :age", nativeQuery = true)
List<Member> findMembersOlderThanNative(@Param("age") int age);
```
### Pagination and Sorting:

- Spring Data JPA supports pagination and sorting for large datasets.
- ``Pageable`` and ``Sort`` interfaces can be used to paginate results and sort them.
- _Example_
````java
Page<Member> findByLastName(String lastName, Pageable pageable);
List<Member> findAll(Sort sort);
````
### Custom Repository Methods:
- For more complex queries, Spring Data JPA lets you define custom methods in your repository. You can add a custom implementation of your repository by extending both JpaRepository and an additional custom interface.


### Transaction Management:
- Spring Data JPA can automatically handle transactions for repository methods, making sure that data integrity is maintained across operations. For example, methods like @Transactional can help control transaction boundaries.

## 6.2 Core Interfaces in Spring Data JPA
Spring Data JPA provides several core interfaces to define repositories:

### ``Repository``:
- This is the root interface. It does not provide any methods and is used only as a marker interface to indicate that a specific interface is a repository.

### ``CrudRepository``:
- Extends Repository and provides CRUD functionalities like save, delete, findById, findAll, etc.

### ``PagingAndSortingRepository``:
- Extends CrudRepository and adds methods for pagination and sorting.

### ``JpaRepository``:
- Extends PagingAndSortingRepository and adds JPA-specific methods. This is the most commonly used interface in Spring Data JPA applications.

## 6.3 Example of Spring Data JPA Repository
Suppose you have an entity ``Member``:
````java
@Entity
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private int age;

    // Getters and Setters
}
````
Then, define a repository interface by extending ``JpaRepository``:
````java
public interface MemberRepository extends JpaRepository<Member, Long> {
    // Derived query methods
    List<Member> findByLastName(String lastName);
    List<Member> findByAgeGreaterThan(int age);

    // Custom query with JPQL
    @Query("SELECT m FROM Member m WHERE m.firstName = :firstName")
    List<Member> findByFirstName(@Param("firstName") String firstName);
}
````
Here:
- ``MemberRepository`` provides all basic CRUD operations through JpaRepository.
- ``findByLastName`` and findByAgeGreaterThan are derived query methods.
- ``findByFirstName`` uses a custom JPQL query.
____________________________________________________________________________________
# 7. Spring MVC

Spring MVC (Model-View-Controller) is a web framework within the Spring Framework, designed to simplify the creation of Java-based web applications by implementing the MVC design pattern. It divides an application into three interconnected components:

- **Model**: Handles the data and business logic.
- **View**: Represents the user interface, typically using HTML, JSP, Thymeleaf, or similar templating engines.
- **Controller**: Manages user input, processes requests, and directs them to appropriate services.<br>
 
Spring MVC’s modular approach makes it highly suitable for building complex, large-scale applications while keeping them manageable and maintainable.

## 7.1 Key Components of Spring MVC

### DispatcherServlet
- The core component in Spring MVC, which acts as a front controller. All incoming HTTP requests go through the ``DispatcherServlet``, which then routes them to appropriate controllers.

### Controller
- Controllers handle HTTP requests, interact with services, and prepare data for the view layer. Each controller method corresponds to a specific URL mapping.
- _Example_
  ````java
  @Controller
  public class MemberController {
  
      @GetMapping("/members")
      public String listMembers(Model model) {
          List<Member> members = memberService.getAllMembers();
          model.addAttribute("members", members);
          return "members";
      }
  ````
  Here, ``listMembers`` handles GET requests for the ``/members`` URL, retrieves member data, and passes it to the view named ``members``.

### Model and ModelAndView
- **Model**: Used to pass data to the view. In Spring MVC, the ``Model`` interface lets you add attributes to be rendered in the view.
- **ModelAndView**: Combines the model data and the view name in a single object.

### View Resolver:
- A ``ViewResolver`` maps logical view names returned by controllers to actual view files. For example, if a controller returns ``home``, the ``ViewResolver`` could map it to ``/WEB-INF/views/home.jsp``.

### DispatcherServlet
- The core component in Spring MVC, which acts as a front controller. All incoming HTTP requests go through the ``DispatcherServlet``, which then routes them to appropriate controllers.
- _Example_<br>
  ````java
  @Bean
  public InternalResourceViewResolver viewResolver() {
      InternalResourceViewResolver resolver = new InternalResourceViewResolver();
      resolver.setPrefix("/WEB-INF/views/");
      resolver.setSuffix(".jsp");
      return resolver;
  }
  ````
### Request Mapping
- ``@RequestMapping`` and its specialized annotations (``@GetMapping``, ``@PostMapping``, etc.) map HTTP requests to controller methods.
- _Example_<br>
  ````java
  @RequestMapping(value = "/members", method = RequestMethod.POST)
  public String saveMember(@ModelAttribute Member member) {
      memberService.saveMember(member);
      return "redirect:/members";
  }
  ````
  Here, ``saveMember`` handles POST requests for ``/members``, processes the data, and then redirects to the ``/members`` page.

## 7.2 Lifecycle of a Spring MVC Request
1) **Incoming Request:** A request enters the application and hits the ``DispatcherServlet``.
2) **Handler Mapping:** The ``DispatcherServlet`` consults ``HandlerMapping`` to find an appropriate controller for the URL.
3) **Controller Method Execution:** The controller method processes the request, calling services and business logic as needed.
4) **Model Population:** The controller populates the ``Model`` with data to be displayed.
5) **View Resolution:** The ``ViewResolver`` maps the logical view name to an actual view.
6) **Response Rendering:** The view is rendered with data from the ``Model`` and sent back to the client.
