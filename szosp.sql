-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 15, 2025 at 07:53 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `szosp`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `interwencja_pojazdy`
--

CREATE TABLE `interwencja_pojazdy` (
  `interwencja_id` int(11) NOT NULL,
  `pojazd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interwencja_pojazdy`
--

INSERT INTO `interwencja_pojazdy` (`interwencja_id`, `pojazd_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `interwencja_uczestnicy`
--

CREATE TABLE `interwencja_uczestnicy` (
  `interwencja_id` int(11) NOT NULL,
  `strazak_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interwencja_uczestnicy`
--

INSERT INTO `interwencja_uczestnicy` (`interwencja_id`, `strazak_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `interwencje`
--

CREATE TABLE `interwencje` (
  `interwencja_id` int(11) NOT NULL,
  `data_zdarzenia` datetime NOT NULL COMMENT 'Dokładna data i godzina zdarzenia',
  `rodzaj_zdarzenia` varchar(100) NOT NULL COMMENT 'Np. Pożar, Miejscowe zagrożenie',
  `miejsce_zdarzenia` varchar(255) NOT NULL,
  `opis_dzialan` text DEFAULT NULL COMMENT 'Szczegółowy opis podjętych działań'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interwencje`
--

INSERT INTO `interwencje` (`interwencja_id`, `data_zdarzenia`, `rodzaj_zdarzenia`, `miejsce_zdarzenia`, `opis_dzialan`) VALUES
(1, '2025-06-10 18:30:00', 'Pożar', 'Rzeszów, ul. Kwiatowa', 'Pożar suchych traw '),
(2, '2025-06-14 23:15:00', 'Miejscowe zagrożenie', 'Rzeszów, ul. Długa 55', 'Pochylone drzewo nad jezdnią');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pojazdy`
--

CREATE TABLE `pojazdy` (
  `pojazd_id` int(11) NOT NULL,
  `oznaczenie` varchar(50) NOT NULL COMMENT 'Np. GBA 3/16, SLRt',
  `numer_rejestracyjny` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pojazdy`
--

INSERT INTO `pojazdy` (`pojazd_id`, `oznaczenie`, `numer_rejestracyjny`) VALUES
(1, 'GBA 3/16 MAN', 'RZE12345');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `strazacy`
--

CREATE TABLE `strazacy` (
  `strazak_id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `stopien` varchar(50) DEFAULT NULL,
  `data_wstapienia` date DEFAULT NULL,
  `waznosc_badan_lekarskich` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strazacy`
--

INSERT INTO `strazacy` (`strazak_id`, `imie`, `nazwisko`, `stopien`, `data_wstapienia`, `waznosc_badan_lekarskich`) VALUES
(1, 'Jan', 'Kowalski', 'Starszy ogniomistrz', '2019-12-10', '2026-05-20'),
(2, 'Adam', 'Nowak', 'Naczelnik', '2015-11-12', '2025-11-10');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `uzytkownik_id` int(11) NOT NULL,
  `nazwa_uzytkownika` varchar(50) NOT NULL,
  `haslo` varchar(255) NOT NULL COMMENT 'Przechowuje hasło jako czysty tekst - NIEBEZPIECZNE!',
  `rola` varchar(20) NOT NULL DEFAULT 'user',
  `strazak_id` int(11) DEFAULT NULL COMMENT 'Odwołanie do ID strażaka. NULL, jeśli użytkownik nie jest strażakiem.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`uzytkownik_id`, `nazwa_uzytkownika`, `haslo`, `rola`, `strazak_id`) VALUES
(1, 'jkowalski', 'haslo123', 'user', 1),
(2, 'admin', 'admin', 'admin', 2),
(7, 'robkow', 'robert123', 'user', NULL),
(8, 'kamil', 'kamil123', 'user', NULL),
(9, 'damin123', 'damin123', 'admin', NULL),
(10, 'kacper', '1123das1', 'user', NULL),
(11, 'patryk123', 'haslo123', 'admin', NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `interwencja_pojazdy`
--
ALTER TABLE `interwencja_pojazdy`
  ADD PRIMARY KEY (`interwencja_id`,`pojazd_id`),
  ADD KEY `pojazd_id` (`pojazd_id`);

--
-- Indeksy dla tabeli `interwencja_uczestnicy`
--
ALTER TABLE `interwencja_uczestnicy`
  ADD PRIMARY KEY (`interwencja_id`,`strazak_id`),
  ADD KEY `strazak_id` (`strazak_id`);

--
-- Indeksy dla tabeli `interwencje`
--
ALTER TABLE `interwencje`
  ADD PRIMARY KEY (`interwencja_id`);

--
-- Indeksy dla tabeli `pojazdy`
--
ALTER TABLE `pojazdy`
  ADD PRIMARY KEY (`pojazd_id`),
  ADD UNIQUE KEY `numer_rejestracyjny` (`numer_rejestracyjny`);

--
-- Indeksy dla tabeli `strazacy`
--
ALTER TABLE `strazacy`
  ADD PRIMARY KEY (`strazak_id`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`uzytkownik_id`),
  ADD UNIQUE KEY `nazwa_uzytkownika` (`nazwa_uzytkownika`),
  ADD UNIQUE KEY `strazak_id` (`strazak_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `interwencje`
--
ALTER TABLE `interwencje`
  MODIFY `interwencja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pojazdy`
--
ALTER TABLE `pojazdy`
  MODIFY `pojazd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `strazacy`
--
ALTER TABLE `strazacy`
  MODIFY `strazak_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `uzytkownik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `interwencja_pojazdy`
--
ALTER TABLE `interwencja_pojazdy`
  ADD CONSTRAINT `interwencja_pojazdy_ibfk_1` FOREIGN KEY (`interwencja_id`) REFERENCES `interwencje` (`interwencja_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interwencja_pojazdy_ibfk_2` FOREIGN KEY (`pojazd_id`) REFERENCES `pojazdy` (`pojazd_id`) ON DELETE CASCADE;

--
-- Constraints for table `interwencja_uczestnicy`
--
ALTER TABLE `interwencja_uczestnicy`
  ADD CONSTRAINT `interwencja_uczestnicy_ibfk_1` FOREIGN KEY (`interwencja_id`) REFERENCES `interwencje` (`interwencja_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interwencja_uczestnicy_ibfk_2` FOREIGN KEY (`strazak_id`) REFERENCES `strazacy` (`strazak_id`) ON DELETE CASCADE;

--
-- Constraints for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD CONSTRAINT `fk_uzytkownik_strazak` FOREIGN KEY (`strazak_id`) REFERENCES `strazacy` (`strazak_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
