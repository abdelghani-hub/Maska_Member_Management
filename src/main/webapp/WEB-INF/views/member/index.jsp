<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:th="http://www.thymeleaf.org"
      class="dark">
<head>
    <title>Maska - Members</title>
</head>
<body>
<jsp:include page="../components/header.jsp"/>

<div class="w-full dark:bg-gray-900">

    <section class="bg-gray-50 dark:bg-gray-900 py-3 sm:py-5 w-full">
        <div class="px-4 mx-auto lg:px-12">
            <div class="relative overflow-hidden bg-white shadow-md dark:bg-gray-800 sm:rounded-lg">
                <div class="">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                        <tr>
                            <th scope="col" class="p-4">
                                <div class="flex items-center">
                                    <input id="checkbox-all" type="checkbox"
                                           class="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                    <label for="checkbox-all" class="sr-only">checkbox</label>
                                </div>
                            </th>
                            <th scope="col" class="px-4 py-3">First Name</th>
                            <th scope="col" class="px-4 py-3">Last name</th>
                            <th scope="col" class="px-4 py-3">CIN</th>
                            <th scope="col" class="px-4 py-3">Nationality</th>
                            <th scope="col" class="px-4 py-3">Joined at</th>
                            <th scope="col" class="px-4 py-3">Licence expire at</th>
                            <th scope="col" class="px-4 py-3">Membership Number</th>
                            <th scope="col" class="px-4 py-3">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="member" items="${members}">
                            <tr class="border-b dark:border-gray-600">
                                <td class="w-4 px-4 py-3">
                                    <div class="flex items-center">
                                        <input id="checkbox-table-search-1" type="checkbox"
                                               class="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                        <label for="checkbox-table-search-1" class="sr-only">checkbox</label>
                                    </div>
                                </td>
                                <th scope="row"
                                    class="flex items-center rounded px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                    <img src="https://flowbite.com/docs/images/people/profile-picture-2.jpg"
                                         alt="profile Image" class="w-auto h-8 mr-3">
                                        ${member.firstName} ${member.lastName}
                                </th>
                                <td class="px-4 py-2">
                                    <span class="bg-primary-100 text-primary-800 text-xs font-medium px-2 py-0.5 rounded dark:bg-primary-900 dark:text-primary-300">
                                            ${member.cin}
                                    </span>
                                </td>
                                <td class="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">${member.nationality}</td>
                                <td class="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">${member.accessionDate}</td>
                                <td class="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">${member.licenceExpiryDate}</td>
                                <td class="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">${member.membershipNumber}</td>
                                <td class="flex items-center x-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        <%-- Edit --%>
                                    <div>
                                        <a href="${pageContext.request.contextPath}/members?action=edit&id=${member.id}"
                                           class="text-blue-700 hover:text-white border border-green-700 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 dark:border-green-500 dark:text-green-500 dark:hover:text-white dark:hover:bg-green-500 dark:focus:ring-green-800">Edit</a>
                                    </div>

                                        <%-- Delete --%>
                                    <form action="${pageContext.request.contextPath}/members?action=delete"
                                          method="post"
                                          class="flex p-0 m-0">
                                        <input type="hidden" name="id" value="${member.id}">
                                        <button type="submit" value="Delete"
                                                class="delete-btn text-red-700 hover:text-white border border-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900">
                                            Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

</div>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>
