library(tidyverse)

url <- 'https://en.wikipedia.org/wiki/FIFA_World_Cup'
page <- read_html(url)

table <- html_nodes(page,".sortbottom th , .unsortable:nth-child(2), .jquery-tablesorter th:nth-child(7), :nth-child(109) td, .jquery-tablesorter tbody:nth-child(2) tr:nth-child(1) td:nth-child(1) a, :nth-child(109) .headerSort")

yearT <- html_nodes(page, ":nth-child(109) td:nth-child(1) , :nth-child(109) tr:nth-child(1) .headerSort:nth-child(1)")
year <- html_text(yearT, trim=TRUE)
year <- year[1:22]

hostT <- html_nodes(page, ":nth-child(109) td:nth-child(2) , :nth-child(109) td:nth-child(2), :nth-child(109) .headerSort:nth-child(2)")
host <- html_text(hostT, trim=TRUE)
host <- host[1:22]

matchesT <- html_nodes(page, ":nth-child(109) td:nth-child(5) , :nth-child(109) td:nth-child(5), :nth-child(109) .headerSort:nth-child(5)")
matches <- html_text(matchesT, trim=TRUE)
matches <- matches[1:22]
matches <- as.numeric(matches)

total_attendanceT <- html_nodes(page, ":nth-child(109) td:nth-child(4) , :nth-child(109) .headerSort:nth-child(4)" )
total_attendance <- html_text(total_attendanceT, trim=TRUE)
total_attendance <- total_attendance[1:22]
total_attendance <- str_remove_all(total_attendance, ",")
total_attendance <- as.numeric(total_attendance)


average_attendanceT <- html_nodes(page, ":nth-child(109) td:nth-child(6) , :nth-child(109) .headerSort:nth-child(6)" )
average_attendance <- html_text(average_attendanceT, trim=TRUE)
average_attendance <-average_attendance[1:22]
average_attendance <- str_remove_all(average_attendance, ",")
average_attendance <- as.numeric(average_attendance)


World_Cup <- data.frame(
  Year = year,
  Hosts = host,
  Matches = matches,
  Totalattendance = total_attendance,
  Averageattendance = average_attendance
)

usethis::use_data(World_Cup)
