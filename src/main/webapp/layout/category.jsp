<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common.jsp"/>
<html>
<head>
    <title>${categoryTitle} - Nét Việt</title>
    <link rel="stylesheet" href="../template/style/user/category.css">
    <jsp:include page="public/library.jsp"/>
</head>
<body>
<jsp:include page="public/header.jsp"/>

<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb" class="container">
    <ol class="breadcrumb pt-2">
        <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
        <li id="breadcrumb-current" class="breadcrumb-item active" aria-current="page">${categoryTitle}</li>
    </ol>
</nav>

<section class="container mt-2 mb-5">
    <div class="row">
        <div style="width: 20%;" class="pe-3 ps-0">
            <div class="py-4_5 background-container">
                <div class="category-list">
                    <h5 class="ms-2 mb-2 main-color p-1 ps-2">Danh mục </h5>
                    <hr/>
                    <c:forEach var="category" items="${listCategoryName}" varStatus="status">
                        <c:choose>
                            <c:when test="${category.getPatternName() eq categoryName}">
                                <p class="p-2 category-element category-active"
                                   data-categoryName='${category.getPatternName()}'>${category.getTitle()}</p>
                            </c:when>
                            <c:otherwise>
                                <p class="p-2 category-element"
                                   data-categoryName='${category.getPatternName()}'>${category.getTitle()}</p>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="category-filter mt-4_5">
                    <h5 class="ms-2 mb-2 main-color p-1 ps-2">Bộ lọc </h5>
                    <hr/>
                    <div class="mt-3 ps-2">
                        <p class="mb-2 fw-semibold">Theo chủ đề tranh:</p>
                        <div class="mb-4">
                            <c:forEach var="topic" items="${listTopic}">
                                <div class="form-check my-1">
                                    <input name="topic-filter" class="form-check-input topic-filter" type="checkbox"
                                           value="${topic.getId()}" id="topic-${topic.getId()}">
                                    <label class="form-check-label" for="topic-${topic.getId()}">
                                            ${topic.getTitle()}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                        <p class="fw-semibold">Theo nhà cung cấp:</p>
                        <div class="mt-1 mb-4 mx-1 pe-3">
                            <select name="" id="provider-filter" class="py-1 rounded col text-truncate w-100">
                                <option value="" selected disabled>Hãy chọn nhà cung cấp</option>
                                <c:forEach var="provider" items="${listProvider}">
                                    <option value="${provider.getProviderName()}">${provider.getProviderName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <p class="mt-3 fw-semibold">Theo giá tiền (VNĐ):</p>
                        <div class="d-flex mt-1 mb-4">
                            <input id="filter-price-from" type="text" class="rounded col-5" placeholder="Từ">
                            <div class=" mb-1 col-1 text-center">-</div>
                            <input id="filter-price-to" type="text" class="rounded col-5" placeholder="Đến">
                        </div>
                        <p class="mt-3 fw-semibold">Theo đánh giá:</p>
                        <div class="d-flex mb-4">
                            <div>
                                <div class="d-flex align-items-center">
                                    <div class="radio-container pt-2"><input value="5" class="form-check-input" type="radio"
                                                                             name="rating-star"></div>
                                    <div class="style-label"><span
                                            class="style-star ms-2">&#9733; &#9733; &#9733; &#9733; &#9733;</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="radio-container pt-2"><input value="4" class="form-check-input" type="radio"
                                                                             name="rating-star"></div>
                                    <div class="style-label"><span
                                            class="style-star mx-2">&#9733; &#9733; &#9733; &#9733; &#x2729;</span>trở
                                        lên
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="radio-container pt-2"><input value="3" class="form-check-input" type="radio"
                                                                             name="rating-star"></div>
                                    <div class="style-label"><span
                                            class="style-star mx-2">&#9733; &#9733; &#9733; &#x2729; &#x2729;</span>trở
                                        lên
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="radio-container pt-2"><input value="2" class="form-check-input" type="radio"
                                                                             name="rating-star"></div>
                                    <div class="style-label"><span
                                            class="style-star mx-2">&#9733; &#9733; &#x2729; &#x2729; &#x2729;</span>trở
                                        lên
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="radio-container pt-2"><input value="1" class="form-check-input" type="radio"
                                                                             name="rating-star"></div>
                                    <div class="style-label"><span
                                            class="style-star mx-2">&#9733; &#x2729; &#x2729; &#x2729; &#x2729;</span>trở
                                        lên
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row d-flex justify-content-evenly mt-4">
                        <button id="remove-filter" class="col-3 p-2 border-0 rounded sub-cta-button">Hủy</button>
                        <button id="filter-btn" class="col-6 p-2 border-0 rounded sub-cta-button-background">Áp dụng
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div style="width: 80%;" class="background-container p-4_5">
            <h4 id="category-title" class="main-color">${categoryTitle}</h4>
            <hr class="mb-5"/>
            <div id="category-displayed-product"></div>
        </div>
        <nav class="mt-3">
            <ul class="pagination d-flex justify-content-center">
                <li class="page-item cursor-pointer">
                    <p class="page-link text-button" id="prev-page"><span aria-hidden="true">&laquo;</span></p>
                </li>
                <li class="page-item" style="user-select: none"><p class="page-link text-button" id="current-page">1</p>
                </li>
                <li class="page-item cursor-pointer">
                    <p class="page-link text-button" id="next-page"><span aria-hidden="true">&raquo;</span></p>
                </li>
            </ul>
        </nav>
    </div>

</section>

<jsp:include page="public/footer.jsp"/>
<script src="/template/script/header.js"></script>
<script src="/template/script/category.js"></script>
</body>
</html>
