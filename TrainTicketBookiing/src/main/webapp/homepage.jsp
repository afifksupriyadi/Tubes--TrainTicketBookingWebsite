<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="model.User" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Check if the user session exists
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
        <link rel="stylesheet" href="CSS/css-home.css">
        <!-- Flatpickr CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <!-- Flatpickr JS -->
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    </head>
    <body>
        <header>
            <div class="header-container">
                <!-- Logo Section -->
                <div class="header-logo">
                    <h1>Kereta Kuy</h1>
                </div>

                <!-- Middle Icon Section -->
                <div class="header-middle">
                    <img src="Asset/train-navbar.png" alt="Train Logo">
                </div>

                <!-- Actions Section -->
                <div class="header-actions">
                    <a href="showPenumpang?id=${user.idUser}">List Penumpang</a>
                    <a href="myticket">My Ticket</a>
                    <div class="profile-menu">
                        <img id="profile-icon" src="Asset/profile-navbar.png" alt="Profile Icon">
                        <div id="profile-dropdown" class="dropdown-menu hidden">
                            <a>Hello ${user.nama}</a>
                            <a href="user?id=${user.idUser}">Profile</a>
                            <a href="logout">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Horizontal Line -->
            <div class="header-line"></div>
        </header>
        <div class="outer-container">
            <div class="main-container">
                <div class="ticket-container">
                    <h1>Pemesanan Tiket Kereta</h1>
                    <form action="search" method="GET">
                        <!-- Stasiun Asal and Stasiun Tujuan -->
                        <div class="form-row">
                            <div class="form-group-container">
                                <label class="form-label" for="stasiunAsal">Stasiun Asal</label>
                                <div class="form-group">
                                    <img src="Asset/searching-stasiun-asal.png">
                                    <div class="separator"></div>
                                    <input type="text" id="stasiunAsal" name="stasiunAsal" placeholder="Cari Stasiun Asal..." autocomplete="off" required>
                                    <div class="autocomplete-list" id="stasiunAsal-list"></div>
                                </div>
                            </div>
                            <div class="form-group-container">
                                <label class="form-label" for="stasiunTujuan">Stasiun Tujuan</label>
                                <div class="form-group">
                                    <img src="Asset/searching-stasiun-tujuan.png" alt="Stasiun Tujuan">
                                    <div class="separator"></div>
                                    <input type="text" id="stasiunTujuan" name="stasiunTujuan" placeholder="Cari Stasiun Tujuan..." autocomplete="off" required>
                                    <div class="autocomplete-list" id="stasiunTujuan-list"></div>
                                </div>
                            </div>
                        </div>

                        <!-- Tanggal Keberangkatan and Jumlah Penumpang -->
                        <div class="form-row">
                            <div class="form-group-container">
                                <label class="form-label" for="tanggal">Tanggal Keberangkatan</label>
                                <div class="form-group">
                                    <img src="Asset/searching-date.png" alt="Tanggal Keberangkatan">
                                    <div class="separator"></div>
                                    <input type="text" id="tanggal" name="tanggal" placeholder="Pilih Tanggal" autocomplete="off" required>
                                </div>
                            </div>
                            <div class="form-group-container">
                                <label class="form-label" for="jumlahPenumpang">Jumlah Penumpang</label>
                                <div class="form-group">
                                    <img src="Asset/searching-penumpang.png" alt="Jumlah Penumpang">
                                    <div class="separator"></div>
                                    <select name="jumlahPenumpang" id="jumlahPenumpang">
                                        <option value="1">1 Penumpang</option>
                                        <option value="2">2 Penumpang</option>
                                        <option value="3">3 Penumpang</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn-submit">Cari Kereta</button>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            const stations = [<c:forEach items="${stations}" var="stasiun">"${stasiun.nama}",</c:forEach>];
                    function setupAutocomplete(inputId, listId) {
                        const input = document.getElementById(inputId);
                        const list = document.getElementById(listId);

                        // Function to populate the dropdown
                        const populateDropdown = (filter = "") => {
                            list.innerHTML = "";
                            stations.forEach(station => {
                                if (station.toLowerCase().includes(filter)) {
                                    const item = document.createElement("div");
                                    item.textContent = station;
                                    item.addEventListener("click", () => {
                                        input.value = station;
                                        list.innerHTML = "";
                                    });
                                    list.appendChild(item);
                                }
                            });
                        };

                        // Show dropdown on input click
                        input.addEventListener("focus", () => {
                            populateDropdown();
                        });

                        // Filter dropdown items on input
                        input.addEventListener("input", () => {
                            const value = input.value.toLowerCase();
                            populateDropdown(value);
                        });

                        // Hide dropdown when clicking outside
                        document.addEventListener("click", (e) => {
                            if (!input.contains(e.target) && !list.contains(e.target)) {
                                list.innerHTML = "";
                            }
                        });
                    }

            setupAutocomplete("stasiunAsal", "stasiunAsal-list");
            setupAutocomplete("stasiunTujuan", "stasiunTujuan-list");

            // New Profile Dropdown Functionality
            document.addEventListener("DOMContentLoaded", () => {
                const profileIcon = document.getElementById("profile-icon");
                const dropdownMenu = document.getElementById("profile-dropdown");

                // Toggle dropdown visibility on icon click
                profileIcon.addEventListener("click", () => {
                    dropdownMenu.classList.toggle("hidden");
                    dropdownMenu.classList.toggle("visible");
                });

                // Close dropdown when clicking outside
                document.addEventListener("click", (event) => {
                    if (!profileIcon.contains(event.target) && !dropdownMenu.contains(event.target)) {
                        dropdownMenu.classList.add("hidden");
                        dropdownMenu.classList.remove("visible");
                    }
                });
            });


            // Date Picker Functionality
            document.addEventListener("DOMContentLoaded", () => {
                // Initialize flatpickr for the date picker
                flatpickr("#tanggal", {
                    dateFormat: "Y-m-d",
                    disable: [], // Placeholder for dynamically disabled dates
                    enable: [], // Placeholder for dynamically enabled dates
                    onReady: function (selectedDates, dateStr, instance) {
                        // Fetch available dates from the backend
                        fetch('available-dates')
                                .then(response => response.json())
                                .then(data => {
                                    // Dynamically set the enabled dates based on data from the server
                                    instance.set("enable", data.map(date => new Date(date)));
                                })
                                .catch(error => console.error("Error fetching available dates:", error));
                    }
                });
            });
        </script>
    </body>
</html>
