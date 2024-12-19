<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Check if the user session exists
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pemesanan Tiket Kereta</title>
        <link rel="stylesheet" href="CSS/css-searching-result.css">
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
                    <a href="my-ticket.jsp">My Ticket</a>
                    <div class="profile-menu">
                        <img id="profile-icon" src="Asset/profile-navbar.png" alt="Profile Icon">
                        <div id="profile-dropdown" class="dropdown-menu hidden">
                            <a href="profile.jsp">Profile</a>
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

        <!-- Date Navigation -->
        <div class="date-navigation-container">
            <!-- Previous Date Button -->
            <form action="search" method="GET" style="display: inline;">
                <input type="hidden" name="stasiunAsal" value="${param.stasiunAsal}">
                <input type="hidden" name="stasiunTujuan" value="${param.stasiunTujuan}">
                <input type="hidden" name="jumlahPenumpang" value="${param.jumlahPenumpang}">
                <input type="hidden" name="tanggal" value="${previousDate}">
                <button class="nav-date-button" type="submit" <c:if test="${previousDate == null}">disabled</c:if>>
                        <img src="Asset/result-previous-day.png" alt="Previous Date">
                    </button>
                </form>

                <!-- Current Date Info -->
                <div class="date-info">
                    <span class="station-text">${param.stasiunAsal} ke ${param.stasiunTujuan}</span>
                <span class="availability-text">Ada ${trainResults.size()} kereta tersedia</span>
                <span class="current-date">${param.tanggal}</span>
            </div>

            <!-- Next Date Button -->
            <form action="search" method="GET" style="display: inline;">
                <input type="hidden" name="stasiunAsal" value="${param.stasiunAsal}">
                <input type="hidden" name="stasiunTujuan" value="${param.stasiunTujuan}">
                <input type="hidden" name="jumlahPenumpang" value="${param.jumlahPenumpang}">
                <input type="hidden" name="tanggal" value="${nextDate}">
                <button class="nav-date-button" type="submit" <c:if test="${nextDate == null}">disabled</c:if>>
                        <img src="Asset/result-next-day.png" alt="Next Date">
                    </button>
                </form>
            </div>

            <!-- Train Results -->
            <div class="results-container">
            <c:forEach var="train" items="${trainResults}">
                <div class="train-card">
                    <div class="train-info">
                        <div class="train-header">
                            <h3>${train.namaKereta} (${train.nomorKereta})</h3>
                        </div>
                        <div class="train-details">
                            <div class="train-time">
                                <img src="Asset/result-stasiun-keberangkatan.png" alt="Departure">
                                <span>${train.departureTime}</span>
                                <span>${train.stasiunAsal}</span>
                            </div>
                            <div class="train-time">
                                <img src="Asset/result-stasiun-tiba.png" alt="Arrival">
                                <span>${train.arrivalTime}</span>
                                <span>${train.stasiunTujuan}</span>
                            </div>
                        </div>
                    </div>
                    <!-- Updated Section -->
                    <div class="train-actions">
                        <!-- Harga -->
                        <div class="train-price">
                            <span>Rp ${train.harga}</span>
                        </div>
                        <!-- Tombol Reservasi -->
                        <button class="btn-reservasi">Reservasi</button>
                        <!-- Kursi Tersedia -->
                        <div class="train-capacity">
                            <span>${train.availableCapacity} kursi tersedia</span>
                        </div>
                    </div>
                </div>
            </c:forEach>


            <!-- Jika Tidak Ada Data -->
            <c:if test="${empty trainResults}">
                <p style="text-align: center; color: red;">Tidak ada kereta yang ditemukan untuk tanggal tersebut.</p>
            </c:if>
        </div>
    </div>



    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", () => {
            const stations = [<c:forEach items="${stations}" var="stasiun">"${stasiun.nama}",</c:forEach>];
                    function setupAutocomplete(inputId, listId) {
                        const input = document.getElementById(inputId);
                        const list = document.getElementById(listId);

                        input.addEventListener("input", () => {
                            const value = input.value.toLowerCase();
                            list.innerHTML = ""; // Clear the dropdown
                            stations.forEach((station) => {
                                if (station.toLowerCase().includes(value)) {
                                    const item = document.createElement("div");
                                    item.textContent = station;
                                    item.addEventListener("click", () => {
                                        input.value = station; // Set input value to the selected item
                                        list.innerHTML = ""; // Clear the dropdown
                                    });
                                    list.appendChild(item);
                                }
                            });
                        });

                        // Hide the dropdown when clicking outside
                        document.addEventListener("click", (e) => {
                            if (!input.contains(e.target) && !list.contains(e.target)) {
                                list.innerHTML = "";
                            }
                        });
                    }

            setupAutocomplete("stasiunAsal", "stasiunAsal-list");
            setupAutocomplete("stasiunTujuan", "stasiunTujuan-list");
        });


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