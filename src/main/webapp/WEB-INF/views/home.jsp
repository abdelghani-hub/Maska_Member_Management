<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="dark">
<head>
    <title>Maska - Home</title>
</head>
<body>
<jsp:include page="components/header.jsp" />
<div class="w-full dark:bg-gray-900">
    <section class="bg-white py-8 antialiased dark:bg-gray-900 md:py-16 p-0 w-full">
        <div class="w-full flex justify-between px-16 py-16 h-full items-center">
            <div class="content-center justify-self-start md:col-span-7 md:text-start">
                <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight dark:text-white md:max-w-2xl md:text-5xl xl:text-6xl">Welcome to Maska!<br />Members Management</h1>
                <p class="mb-4 max-w-2xl text-gray-500 dark:text-gray-400 md:mb-12 md:text-lg mb-3 lg:mb-5 lg:text-xl">Streamline your workflow, track your progress, and achieve more with ease.</p>
                <a href="${pageContext.request.contextPath}/users?action=register" class="text-white bg-gradient-to-r from-cyan-400 via-cyan-500 to-cyan-600 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-cyan-300 dark:focus:ring-cyan-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2">
                    Get Started
                </a>
            </div>
            <div class="hidden md:col-span-5 md:mt-0 md:flex pt-16">
                <img class="dark:hidden" src="https://flowbite.s3.amazonaws.com/blocks/e-commerce/girl-shopping-list.svg" alt="shopping illustration" />
                <img class="hidden dark:block" src="https://flowbite.s3.amazonaws.com/blocks/e-commerce/girl-shopping-list-dark.svg" alt="shopping illustration" />
            </div>
        </div>
    </section>
</div>
<jsp:include page="components/footer.jsp" />
</body>
</html>
