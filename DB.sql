-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2024 at 05:57 PM
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
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`) VALUES
(7, 'Newsy', 'Co słychać w wielkim świecie'),
(8, 'Jedzenie', 'Dla fan&oacute;w kulinari&oacute;w'),
(10, 'Recenzje', 'Do dzielenia się opiniami o danych seriach'),
(11, 'Ciekawostki', 'asd');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `idpost` int(10) UNSIGNED NOT NULL,
  `user` varchar(50) NOT NULL,
  `coment` text NOT NULL,
  `t` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `idpost`, `user`, `coment`, `t`) VALUES
(1, 14, 'Bonzai', 'spoko', '2024-07-04 22:14:10'),
(17, 16, 'admin', 'test', '2024-08-21 15:55:51');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `observed`
--

CREATE TABLE `observed` (
  `id` int(10) UNSIGNED NOT NULL,
  `idobserved` int(10) UNSIGNED NOT NULL,
  `iduser` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `observed`
--

INSERT INTO `observed` (`id`, `idobserved`, `iduser`) VALUES
(5, 13, 14),
(27, 14, 13),
(28, 13, 13),
(29, 13, 15),
(31, 14, 15);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) UNSIGNED DEFAULT NULL,
  `author_id` int(11) UNSIGNED NOT NULL,
  `is_featured` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `thumbnail`, `date_time`, `category_id`, `author_id`, `is_featured`) VALUES
(14, 'Recenzja anime: &quot;Made in Abyss&quot;', 'Opis:\r\n&quot;Made in Abyss&quot; to fascynująca opowieść o młodej dziewczynce imieniem Riko i jej robocim towarzyszu Regu, kt&oacute;rzy wyruszają w głąb tajemniczej przepaści zwanej Otchłanią. Otchłań to ogromny, niezbadany system jaskiń, pełen niezwykłych stworzeń i starożytnych relikt&oacute;w. Mimo pięknych krajobraz&oacute;w, kryje ona wiele niebezpieczeństw.\r\n\r\nFabuła:\r\nHistoria zaczyna się niewinnie, przedstawiając codzienne życie młodych odkrywc&oacute;w w mieście Orth, kt&oacute;re otacza Otchłań. Wraz z postępem fabuły, widzowie zostają wciągnięci w coraz mroczniejszy i bardziej tajemniczy świat. Riko pragnie odnaleźć swoją matkę, legendarną odkrywczynię, co staje się gł&oacute;wną motywacją jej podr&oacute;ży w głąb Otchłani.\r\n\r\nPostacie:\r\nPostacie są jedną z największych zalet tego anime. Riko to pełna energii i determinacji dziewczynka, kt&oacute;rej optymizm jest zaraźliwy. Regu, tajemniczy chłopiec-robot, dostarcza wsparcia i ochrony, a także sam jest obiektem wielu zagadek. Ich relacja jest pełna ciepła i wzruszeń, co dodaje historii głębi.\r\n\r\nGrafika:\r\nJednym z najbardziej uderzających aspekt&oacute;w &quot;Made in Abyss&quot; jest jego oprawa graficzna. Piękne, szczeg&oacute;łowe tła i kreatywne projekty potwor&oacute;w tworzą niesamowitą atmosferę. Kontrast między uroczą estetyką a mroczną treścią potęguje wrażenie tajemniczości i niebezpieczeństwa.\r\n\r\nMuzyka:\r\nŚcieżka dźwiękowa, skomponowana przez Kevina Penkina, idealnie dopełnia klimat anime. Melodie są zar&oacute;wno nastrojowe, jak i epickie, doskonale oddając emocje towarzyszące podr&oacute;ży bohater&oacute;w.\r\n\r\nPodsumowanie:\r\n&quot;Made in Abyss&quot; to wyjątkowe anime, kt&oacute;re łączy piękno wizualne z głęboką, poruszającą historią. To opowieść o odwadze, przyjaźni i nieustannym dążeniu do odkrywania nieznanego, kt&oacute;ra na długo pozostaje w pamięci. Jest to tytuł godny polecenia dla każdego miłośnika gatunku, ale ze względu na niekt&oacute;re mroczne i intensywne momenty, najlepiej nadaje się dla starszych widz&oacute;w.', '1719909607e0627d11552cc936317798cee2d7f756fe03095dd514eaf79312269264932054.jpg', '2024-07-02 08:40:07', 10, 13, 0),
(15, 'Ciekawostka z Neon Genesis Evangelion', 'Czy wiesz, że &quot;Neon Genesis Evangelion&quot;, jedno z najbardziej wpływowych i kontrowersyjnych anime wszech czas&oacute;w, miało bardzo trudną produkcję? Tw&oacute;rca serii, Hideaki Anno, zmagał się z depresją podczas tworzenia tego anime. Jego osobiste doświadczenia i emocje miały ogromny wpływ na fabułę oraz na psychologiczne i filozoficzne aspekty postaci. Co więcej, ze względu na ograniczenia budżetowe, studio Gainax musiało improwizować, co doprowadziło do powstania nietypowych i abstrakcyjnych scen w ostatnich odcinkach serii. Pomimo (a może dzięki) tych trudności, &quot;Neon Genesis Evangelion&quot; stał się klasykiem i jest szeroko analizowany oraz dyskutowany do dziś.', '1720163314AAAABSApf69V_WtoaiAaxrw1YY_9_6OaKv-hU8LcLSIbmGiXkqIfeKKt4653gLve0Nzav0xhipg4J6g8NQwKDZsHwzvDChDs7wQhyYsZeuNmeugvHAx1-ov4Obn3.jpg', '2024-07-05 07:08:34', 11, 14, 1),
(16, 'Test', 'To jest post testowy', '1724254555Test-prywatnego-wierzyciela-czym-jest-i-na-czym-polega1.jpg', '2024-08-21 15:35:55', 7, 15, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `avatar`, `is_admin`) VALUES
(13, 'Bonzai', 'blazejkomosinski@gmail.com', '$2y$10$FNzU6DW.UoiIGPkOdrLFLeCPA3Rhlq12qwzrTFQ46NPhhzmjahp/i', '1719872765nero_claudius_navidad___padoru_padoru_by_alexzer09_dbwh40a-fullview.png', 1),
(14, 'Timetraveler', 'email@mail.com', '$2y$10$yGfmCtZxpXteKhsZZK.QD.9zANlYRlpWn4g6W79oQ8CF47VrUJmn6', '1719909811u44jp1tvrdeka_600.jpg', 0),
(15, 'admin', 'gmail@mail.com', '$2y$10$5UWNzs2vvDG.IZ48D6lAYO4Mj8eMEOVqJfzVif7Q6x4nGeHjq7kwK', '1724245005pngtree-office-work-user-icon-avatar-png-image_1527655.jpg', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpost` (`idpost`);

--
-- Indeksy dla tabeli `observed`
--
ALTER TABLE `observed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idobserved` (`idobserved`),
  ADD KEY `iduser` (`iduser`);

--
-- Indeksy dla tabeli `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_blog_category` (`category_id`),
  ADD KEY `FK_blog_author` (`author_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `observed`
--
ALTER TABLE `observed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`idpost`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `observed`
--
ALTER TABLE `observed`
  ADD CONSTRAINT `observed_ibfk_1` FOREIGN KEY (`idobserved`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `observed_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_blog_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_blog_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
