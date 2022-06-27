-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 27 juin 2022 à 12:47
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gest_archivage`
--

-- --------------------------------------------------------

--
-- Structure de la table `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `branches`
--

INSERT INTO `branches` (`id`, `libelle`, `created_at`, `updated_at`) VALUES
(1, 'Tunis', '2022-04-28 06:31:28', '2022-04-28 06:31:28'),
(2, 'Sousse', '2022-04-28 06:31:35', '2022-04-28 06:31:35'),
(3, 'Gabes', '2022-04-28 06:31:44', '2022-04-28 06:31:44'),
(4, 'Béja', '2022-04-28 06:32:01', '2022-04-28 06:32:01');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2022-04-27 08:25:45', '2022-04-27 08:25:45'),
(2, NULL, 1, 'Category 2', 'category-2', '2022-04-27 08:25:45', '2022-04-27 08:25:45');

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'nom', 'text', 'Nom', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'prenom', 'text', 'Prenom', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'date_de_naissance', 'date', 'Date De Naissance', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 7, 'telephone', 'text', 'Telephone', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 7, 'cin', 'text', 'Cin', 0, 1, 1, 1, 1, 1, '{}', 6),
(62, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(63, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(64, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(65, 8, 'libelle', 'text', 'Libelle', 0, 1, 1, 1, 1, 1, '{}', 2),
(66, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(67, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(68, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 9, 'libelle', 'text', 'Libelle', 0, 1, 1, 1, 1, 1, '{}', 2),
(70, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(71, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(72, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(73, 10, 'libelle', 'text', 'Libelle', 0, 1, 1, 1, 1, 1, '{}', 2),
(74, 10, 'etat', 'text', 'Etat', 0, 1, 1, 1, 1, 1, '{}', 3),
(75, 10, 'patient_id', 'text', 'Patient Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(76, 10, 'service_id', 'text', 'Service Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(77, 10, 'branche_id', 'text', 'Branche Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(78, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(79, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(80, 10, 'dossier_belongsto_patient_relationship', 'relationship', 'patients', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Patient\",\"table\":\"patients\",\"type\":\"belongsTo\",\"column\":\"patient_id\",\"key\":\"id\",\"label\":\"nom\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(81, 10, 'dossier_belongsto_branch_relationship', 'relationship', 'branches', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Branch\",\"table\":\"branches\",\"type\":\"belongsTo\",\"column\":\"branche_id\",\"key\":\"id\",\"label\":\"libelle\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(82, 10, 'dossier_belongsto_service_relationship', 'relationship', 'services', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Service\",\"table\":\"services\",\"type\":\"belongsTo\",\"column\":\"service_id\",\"key\":\"id\",\"label\":\"libelle\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(83, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(84, 11, 'motifs', 'text', 'Motifs', 0, 1, 1, 1, 1, 1, '{}', 2),
(85, 11, 'analyses', 'file', 'Analyses', 0, 1, 1, 1, 1, 1, '{}', 3),
(86, 11, 'avis_medecin', 'text', 'Avis Medecin', 0, 1, 1, 1, 1, 1, '{}', 4),
(87, 11, 'dossier_id', 'text', 'Dossier Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(88, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(89, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(90, 11, 'visite_belongsto_dossier_relationship', 'relationship', 'dossiers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Dossier\",\"table\":\"dossiers\",\"type\":\"belongsTo\",\"column\":\"dossier_id\",\"key\":\"id\",\"label\":\"libelle\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-04-27 08:25:25', '2022-04-27 08:25:25'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-04-27 08:25:25', '2022-04-27 08:25:25'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-04-27 08:25:26', '2022-04-27 08:25:26'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2022-04-27 08:25:43', '2022-04-27 08:25:43'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-04-27 08:25:45', '2022-04-27 08:25:45'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2022-04-27 08:25:48', '2022-04-27 08:25:48'),
(7, 'patients', 'patients', 'Patient', 'Patients', NULL, 'App\\Patient', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-27 08:28:41', '2022-04-27 08:28:41'),
(8, 'branches', 'branches', 'Branch', 'Branches', NULL, 'App\\Branch', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-27 08:29:59', '2022-05-09 13:48:31'),
(9, 'services', 'services', 'Service', 'Services', NULL, 'App\\Service', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-27 08:30:37', '2022-04-27 08:30:37'),
(10, 'dossiers', 'dossiers', 'Dossier', 'Dossiers', NULL, 'App\\Dossier', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-27 08:33:13', '2022-04-28 07:24:41'),
(11, 'visites', 'visites', 'Visite', 'Visites', NULL, 'App\\Visite', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-27 08:37:13', '2022-04-28 06:29:08');

-- --------------------------------------------------------

--
-- Structure de la table `dossiers`
--

CREATE TABLE `dossiers` (
  `id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `branche_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dossiers`
--

INSERT INTO `dossiers` (`id`, `libelle`, `etat`, `patient_id`, `service_id`, `branche_id`, `created_at`, `updated_at`) VALUES
(1, 'Dossier 1', 'Contrôle', 1, 1, 2, '2022-04-28 06:35:00', '2022-05-05 06:34:18'),
(2, 'Dossier 2', NULL, 2, 1, 1, '2022-04-28 10:18:00', '2022-05-05 06:34:03'),
(3, 'Dossier 3', 'Contrôle', 1, 3, 1, '2022-04-28 10:18:54', '2022-04-28 10:18:54'),
(4, 'Programme Post-ASCO', 'Contrôle', 2, 2, 2, '2022-05-05 06:33:27', '2022-05-05 06:33:27');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-04-27 08:25:29', '2022-04-27 08:25:29');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-04-27 08:25:29', '2022-04-27 08:25:29', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', '#000000', 5, 5, '2022-04-27 08:25:29', '2022-05-18 07:07:57', 'voyager.media.index', 'null'),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 2, '2022-04-27 08:25:29', '2022-05-18 07:07:56', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 5, 1, '2022-04-27 08:25:29', '2022-05-18 07:07:56', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2022-04-27 08:25:29', '2022-05-18 07:08:06', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 4, '2022-04-27 08:25:29', '2022-05-18 07:07:57', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 3, '2022-04-27 08:25:29', '2022-05-18 07:07:57', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 8, '2022-04-27 08:25:29', '2022-05-18 07:07:57', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 2, '2022-04-27 08:25:30', '2022-05-18 07:07:56', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 9, '2022-04-27 08:25:30', '2022-05-18 07:07:59', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 5, 7, '2022-04-27 08:25:44', '2022-05-18 07:07:57', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 5, 6, '2022-04-27 08:25:48', '2022-05-18 07:07:57', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 5, 10, '2022-04-27 08:25:50', '2022-05-18 07:07:59', 'voyager.pages.index', NULL),
(14, 1, 'Patients', '', '_self', NULL, NULL, NULL, 3, '2022-04-27 08:28:42', '2022-05-18 07:08:06', 'voyager.patients.index', NULL),
(15, 1, 'Branches', '', '_self', NULL, NULL, NULL, 4, '2022-04-27 08:30:00', '2022-05-18 07:08:06', 'voyager.branches.index', NULL),
(16, 1, 'Services', '', '_self', NULL, NULL, NULL, 5, '2022-04-27 08:30:37', '2022-05-18 07:08:06', 'voyager.services.index', NULL),
(17, 1, 'Dossiers', '', '_self', NULL, NULL, NULL, 6, '2022-04-27 08:33:13', '2022-05-18 07:08:06', 'voyager.dossiers.index', NULL),
(18, 1, 'Visites', '', '_self', NULL, NULL, NULL, 7, '2022-04-27 08:37:13', '2022-05-18 07:08:06', 'voyager.visites.index', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-04-27 08:25:50', '2022-04-27 08:25:50');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

CREATE TABLE `patients` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_de_naissance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `patients`
--

INSERT INTO `patients` (`id`, `nom`, `prenom`, `date_de_naissance`, `telephone`, `cin`, `created_at`, `updated_at`) VALUES
(1, 'Maryem', 'ba', '2007-01-17 00:00:00', NULL, '06964582', '2022-04-27 08:29:20', '2022-04-27 08:29:20'),
(2, 'soumaya', NULL, NULL, NULL, NULL, '2022-04-28 10:17:59', '2022-04-28 10:17:59'),
(3, 'test', 'test', '2022-06-23 00:00:00', NULL, '2222', '2022-06-01 13:54:57', '2022-06-01 13:54:57'),
(4, 'Ahlem', 'ryehi', '1996-02-12 00:00:00', '51 245 852', '06964582', '2022-08-11 08:48:00', '2022-06-02 09:00:55');

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-04-27 08:25:30', '2022-04-27 08:25:30'),
(2, 'browse_bread', NULL, '2022-04-27 08:25:30', '2022-04-27 08:25:30'),
(3, 'browse_database', NULL, '2022-04-27 08:25:30', '2022-04-27 08:25:30'),
(4, 'browse_media', NULL, '2022-04-27 08:25:30', '2022-04-27 08:25:30'),
(5, 'browse_compass', NULL, '2022-04-27 08:25:30', '2022-04-27 08:25:30'),
(6, 'browse_menus', 'menus', '2022-04-27 08:25:31', '2022-04-27 08:25:31'),
(7, 'read_menus', 'menus', '2022-04-27 08:25:31', '2022-04-27 08:25:31'),
(8, 'edit_menus', 'menus', '2022-04-27 08:25:31', '2022-04-27 08:25:31'),
(9, 'add_menus', 'menus', '2022-04-27 08:25:31', '2022-04-27 08:25:31'),
(10, 'delete_menus', 'menus', '2022-04-27 08:25:31', '2022-04-27 08:25:31'),
(11, 'browse_roles', 'roles', '2022-04-27 08:25:31', '2022-04-27 08:25:31'),
(12, 'read_roles', 'roles', '2022-04-27 08:25:31', '2022-04-27 08:25:31'),
(13, 'edit_roles', 'roles', '2022-04-27 08:25:31', '2022-04-27 08:25:31'),
(14, 'add_roles', 'roles', '2022-04-27 08:25:31', '2022-04-27 08:25:31'),
(15, 'delete_roles', 'roles', '2022-04-27 08:25:31', '2022-04-27 08:25:31'),
(16, 'browse_users', 'users', '2022-04-27 08:25:32', '2022-04-27 08:25:32'),
(17, 'read_users', 'users', '2022-04-27 08:25:32', '2022-04-27 08:25:32'),
(18, 'edit_users', 'users', '2022-04-27 08:25:32', '2022-04-27 08:25:32'),
(19, 'add_users', 'users', '2022-04-27 08:25:32', '2022-04-27 08:25:32'),
(20, 'delete_users', 'users', '2022-04-27 08:25:32', '2022-04-27 08:25:32'),
(21, 'browse_settings', 'settings', '2022-04-27 08:25:32', '2022-04-27 08:25:32'),
(22, 'read_settings', 'settings', '2022-04-27 08:25:32', '2022-04-27 08:25:32'),
(23, 'edit_settings', 'settings', '2022-04-27 08:25:32', '2022-04-27 08:25:32'),
(24, 'add_settings', 'settings', '2022-04-27 08:25:32', '2022-04-27 08:25:32'),
(25, 'delete_settings', 'settings', '2022-04-27 08:25:32', '2022-04-27 08:25:32'),
(26, 'browse_categories', 'categories', '2022-04-27 08:25:44', '2022-04-27 08:25:44'),
(27, 'read_categories', 'categories', '2022-04-27 08:25:44', '2022-04-27 08:25:44'),
(28, 'edit_categories', 'categories', '2022-04-27 08:25:44', '2022-04-27 08:25:44'),
(29, 'add_categories', 'categories', '2022-04-27 08:25:44', '2022-04-27 08:25:44'),
(30, 'delete_categories', 'categories', '2022-04-27 08:25:45', '2022-04-27 08:25:45'),
(31, 'browse_posts', 'posts', '2022-04-27 08:25:48', '2022-04-27 08:25:48'),
(32, 'read_posts', 'posts', '2022-04-27 08:25:48', '2022-04-27 08:25:48'),
(33, 'edit_posts', 'posts', '2022-04-27 08:25:48', '2022-04-27 08:25:48'),
(34, 'add_posts', 'posts', '2022-04-27 08:25:48', '2022-04-27 08:25:48'),
(35, 'delete_posts', 'posts', '2022-04-27 08:25:48', '2022-04-27 08:25:48'),
(36, 'browse_pages', 'pages', '2022-04-27 08:25:50', '2022-04-27 08:25:50'),
(37, 'read_pages', 'pages', '2022-04-27 08:25:50', '2022-04-27 08:25:50'),
(38, 'edit_pages', 'pages', '2022-04-27 08:25:50', '2022-04-27 08:25:50'),
(39, 'add_pages', 'pages', '2022-04-27 08:25:50', '2022-04-27 08:25:50'),
(40, 'delete_pages', 'pages', '2022-04-27 08:25:50', '2022-04-27 08:25:50'),
(41, 'browse_patients', 'patients', '2022-04-27 08:28:42', '2022-04-27 08:28:42'),
(42, 'read_patients', 'patients', '2022-04-27 08:28:42', '2022-04-27 08:28:42'),
(43, 'edit_patients', 'patients', '2022-04-27 08:28:42', '2022-04-27 08:28:42'),
(44, 'add_patients', 'patients', '2022-04-27 08:28:42', '2022-04-27 08:28:42'),
(45, 'delete_patients', 'patients', '2022-04-27 08:28:42', '2022-04-27 08:28:42'),
(46, 'browse_branches', 'branches', '2022-04-27 08:30:00', '2022-04-27 08:30:00'),
(47, 'read_branches', 'branches', '2022-04-27 08:30:00', '2022-04-27 08:30:00'),
(48, 'edit_branches', 'branches', '2022-04-27 08:30:00', '2022-04-27 08:30:00'),
(49, 'add_branches', 'branches', '2022-04-27 08:30:00', '2022-04-27 08:30:00'),
(50, 'delete_branches', 'branches', '2022-04-27 08:30:00', '2022-04-27 08:30:00'),
(51, 'browse_services', 'services', '2022-04-27 08:30:37', '2022-04-27 08:30:37'),
(52, 'read_services', 'services', '2022-04-27 08:30:37', '2022-04-27 08:30:37'),
(53, 'edit_services', 'services', '2022-04-27 08:30:37', '2022-04-27 08:30:37'),
(54, 'add_services', 'services', '2022-04-27 08:30:37', '2022-04-27 08:30:37'),
(55, 'delete_services', 'services', '2022-04-27 08:30:37', '2022-04-27 08:30:37'),
(56, 'browse_dossiers', 'dossiers', '2022-04-27 08:33:13', '2022-04-27 08:33:13'),
(57, 'read_dossiers', 'dossiers', '2022-04-27 08:33:13', '2022-04-27 08:33:13'),
(58, 'edit_dossiers', 'dossiers', '2022-04-27 08:33:13', '2022-04-27 08:33:13'),
(59, 'add_dossiers', 'dossiers', '2022-04-27 08:33:13', '2022-04-27 08:33:13'),
(60, 'delete_dossiers', 'dossiers', '2022-04-27 08:33:13', '2022-04-27 08:33:13'),
(61, 'browse_visites', 'visites', '2022-04-27 08:37:13', '2022-04-27 08:37:13'),
(62, 'read_visites', 'visites', '2022-04-27 08:37:13', '2022-04-27 08:37:13'),
(63, 'edit_visites', 'visites', '2022-04-27 08:37:13', '2022-04-27 08:37:13'),
(64, 'add_visites', 'visites', '2022-04-27 08:37:13', '2022-04-27 08:37:13'),
(65, 'delete_visites', 'visites', '2022-04-27 08:37:13', '2022-04-27 08:37:13');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 4),
(12, 1),
(12, 4),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 1),
(15, 4),
(16, 1),
(16, 4),
(17, 1),
(17, 4),
(18, 1),
(18, 4),
(19, 1),
(19, 4),
(20, 1),
(20, 4),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(41, 3),
(41, 4),
(42, 1),
(42, 3),
(42, 4),
(43, 1),
(43, 3),
(43, 4),
(44, 1),
(44, 3),
(44, 4),
(45, 1),
(45, 3),
(45, 4),
(46, 1),
(46, 4),
(47, 1),
(47, 4),
(48, 1),
(48, 4),
(49, 1),
(49, 4),
(50, 1),
(50, 4),
(51, 1),
(51, 4),
(52, 1),
(52, 4),
(53, 1),
(53, 4),
(54, 1),
(54, 4),
(55, 1),
(55, 4),
(56, 1),
(56, 3),
(56, 4),
(57, 1),
(57, 3),
(57, 4),
(58, 1),
(58, 3),
(58, 4),
(59, 1),
(59, 3),
(59, 4),
(60, 1),
(60, 3),
(60, 4),
(61, 1),
(61, 3),
(61, 4),
(62, 1),
(62, 3),
(62, 4),
(63, 1),
(63, 3),
(63, 4),
(64, 1),
(64, 3),
(64, 4),
(65, 1),
(65, 3),
(65, 4);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-04-27 08:25:48', '2022-04-27 08:25:48'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-04-27 08:25:48', '2022-04-27 08:25:48'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-04-27 08:25:48', '2022-04-27 08:25:48'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-04-27 08:25:48', '2022-04-27 08:25:48');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-04-27 08:25:30', '2022-04-27 08:25:30'),
(2, 'user', 'Normal User', '2022-04-27 08:25:30', '2022-04-27 08:25:30'),
(3, 'medecin', 'medecin', '2022-04-27 08:38:15', '2022-04-27 08:38:15'),
(4, 'webmaster', 'webmaster', '2022-05-05 05:43:11', '2022-05-05 05:43:11');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `libelle`, `created_at`, `updated_at`) VALUES
(1, 'Service 1', '2022-04-28 06:34:31', '2022-04-28 06:34:31'),
(2, 'Service 2', '2022-04-28 06:34:37', '2022-04-28 06:34:37'),
(3, 'Service 3', '2022-04-28 06:34:43', '2022-04-28 06:34:43');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', NULL, '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\April2022\\jtH5JQR6wKQD2qnJPS4c.jpg', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\May2022\\xUWKXeLyN5gLOndCwlYQ.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Gestion Patients', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Bienvenue à la Plateforme de Gestion et Archivage des Patients', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\April2022\\7QpQSRKoD9kh0JRhFiuG.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\April2022\\XjKILPmfC8yu8uTYMimC.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-04-27 08:25:51', '2022-04-27 08:25:51'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-04-27 08:25:51', '2022-04-27 08:25:51'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-04-27 08:25:51', '2022-04-27 08:25:51'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-04-27 08:25:51', '2022-04-27 08:25:51'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-04-27 08:25:51', '2022-04-27 08:25:51'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-04-27 08:25:51', '2022-04-27 08:25:51'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-04-27 08:25:51', '2022-04-27 08:25:51'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-04-27 08:25:51', '2022-04-27 08:25:51'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-04-27 08:25:51', '2022-04-27 08:25:51'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-04-27 08:25:51', '2022-04-27 08:25:51'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-04-27 08:25:52', '2022-04-27 08:25:52'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-04-27 08:25:53', '2022-04-27 08:25:53'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-04-27 08:25:53', '2022-04-27 08:25:53'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-04-27 08:25:53', '2022-04-27 08:25:53'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-04-27 08:25:53', '2022-04-27 08:25:53'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-04-27 08:25:53', '2022-04-27 08:25:53'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-04-27 08:25:53', '2022-04-27 08:25:53'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-04-27 08:25:53', '2022-04-27 08:25:53');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$sz3vTIoHL5WFZc/5hpm0iuGYaSODUI7VrZNUtDyrw4q/iW/7q8dx.', 'DCnOm71kSr7tcqJ14pI6DZU1wYlrDCWxz7p1FSu90burbuwitrlQluXzrzOR', NULL, '2022-04-27 08:25:45', '2022-04-27 08:25:45'),
(2, 3, 'Medecin', 'medecin@gmail.com', 'users\\April2022\\qmtZbSppb1fKAzygKFJx.jpg', NULL, '$2y$10$ZhRdUY1V/Xa1Ot/QZYNonOsAmbSBQMyVXfrP8TxKp6.CBzxTPjq8W', NULL, '{\"locale\":\"en\"}', '2022-04-27 08:38:53', '2022-04-27 08:44:18'),
(3, 4, 'WebMaster', 'master@master.com', 'users\\May2022\\FnKfuQp1tOyolYtxnedv.png', NULL, '$2y$10$wMw10XcR.B1s8fgBcmLaaOkyRYyqkQyoRoW7QCbiiJ6oPeSVWTCPO', NULL, '{\"locale\":\"en\"}', '2022-05-05 05:49:05', '2022-05-05 05:49:05'),
(4, 2, 'Justyn Harris', 'sgutmann@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1OBjSQ2Ntd', NULL, '2022-05-20 07:53:27', '2022-05-20 07:53:27'),
(5, 2, 'Magnolia Franecki', 'yfadel@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6ZsptyHfkG', NULL, '2022-05-20 07:53:27', '2022-05-20 07:53:28'),
(6, 2, 'Dr. Thalia Wunsch MD', 'mara.berge@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uQN5mmUpMg', NULL, '2022-05-20 07:53:28', '2022-05-20 07:53:28'),
(7, 2, 'Joy Bartoletti PhD', 'jswaniawski@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'opQaYVtyK6', NULL, '2022-05-20 07:53:28', '2022-05-20 07:53:28'),
(8, 2, 'Mr. Buford Runte', 'elva.denesik@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WdfKVCciA9', NULL, '2022-05-20 07:53:28', '2022-05-20 07:53:28'),
(9, 2, 'Dr. Flavie Rippin', 'tanya07@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qzQOOJRuGF', NULL, '2022-05-20 07:53:28', '2022-05-20 07:53:28'),
(10, 2, 'Rolando Jacobs PhD', 'mklocko@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QT88BzWspB', NULL, '2022-05-20 07:53:28', '2022-05-20 07:53:28'),
(11, 2, 'Lempi Gusikowski', 'nikolas67@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fZYlGgo8pH', NULL, '2022-05-20 07:53:28', '2022-05-20 07:53:28'),
(12, 2, 'Vincenza Nader', 'cesar45@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ENGA9gvPYo', NULL, '2022-05-20 07:53:28', '2022-05-20 07:53:29'),
(13, 2, 'Brigitte Strosin', 'yturner@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EBPgd6VGCs', NULL, '2022-05-20 07:53:29', '2022-05-20 07:53:29'),
(14, 2, 'Mr. Fermin Abshire', 'spinka.domingo@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'U9H8mX6cY5', NULL, '2022-05-20 07:53:29', '2022-05-20 07:53:29'),
(15, 2, 'Jewel Stanton III', 'ferry.brionna@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MfGA6ar9r5', NULL, '2022-05-20 07:53:29', '2022-05-20 07:53:29'),
(16, 2, 'Kayla Stroman IV', 'ima54@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QpUNUw74w6', NULL, '2022-05-20 07:53:29', '2022-05-20 07:53:30'),
(17, 2, 'Euna Frami', 'fred.okuneva@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Pn4t7QwOOS', NULL, '2022-05-20 07:53:30', '2022-05-20 07:53:30'),
(18, 2, 'Ward Hayes', 'bernie56@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GZCxDmwY3q', NULL, '2022-05-20 07:53:30', '2022-05-20 07:53:30'),
(19, 2, 'Yadira Nicolas', 'brayan.koss@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'E2Y4G9eRw5', NULL, '2022-05-20 07:53:30', '2022-05-20 07:53:30'),
(20, 2, 'Milton Kris', 'htorphy@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bqiHjldKfk', NULL, '2022-05-20 07:53:30', '2022-05-20 07:53:30'),
(21, 2, 'Jennyfer Jakubowski', 'jbreitenberg@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zdnyUFskIp', NULL, '2022-05-20 07:53:30', '2022-05-20 07:53:31'),
(22, 2, 'Ms. Ida Crist Sr.', 'littel.denis@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sJXDFA2lij', NULL, '2022-05-20 07:53:31', '2022-05-20 07:53:31'),
(23, 2, 'Dr. Eva Bednar', 'bailey.patsy@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8TkEjBv4hN', NULL, '2022-05-20 07:53:31', '2022-05-20 07:53:31'),
(24, 2, 'Karlie Kautzer', 'norris85@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EmDxc7K2p7', NULL, '2022-05-20 07:53:31', '2022-05-20 07:53:31'),
(25, 2, 'Prof. Evangeline Lynch', 'fshanahan@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nlzwOcciI0', NULL, '2022-05-20 07:53:31', '2022-05-20 07:53:31'),
(26, 2, 'Prof. Ed Gaylord', 'reynolds.leila@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Wj9gpZOMwt', NULL, '2022-05-20 07:53:31', '2022-05-20 07:53:31'),
(27, 2, 'Mrs. Georgianna Ratke PhD', 'deckow.keegan@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'd0PjPdEy7b', NULL, '2022-05-20 07:53:31', '2022-05-20 07:53:32'),
(28, 2, 'Willis Mitchell', 'abode@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'c4sXJdWzdM', NULL, '2022-05-20 07:53:32', '2022-05-20 07:53:32'),
(29, 2, 'Dr. Aurore Murphy Sr.', 'gpaucek@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0hPDgJdfoq', NULL, '2022-05-20 07:53:32', '2022-05-20 07:53:32'),
(30, 2, 'Kristoffer Heidenreich', 'wisozk.anita@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CgBdkc1SVo', NULL, '2022-05-20 07:53:32', '2022-05-20 07:53:32'),
(31, 2, 'Mrs. Alanna Bednar DDS', 'hilda86@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'u61pCsnI8H', NULL, '2022-05-20 07:53:32', '2022-05-20 07:53:32'),
(32, 2, 'Angelina Lesch Sr.', 'sferry@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0Ag6cMrKLZ', NULL, '2022-05-20 07:53:32', '2022-05-20 07:53:32'),
(33, 2, 'Rogelio Marvin IV', 'raymond.shanahan@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pfDEygbQ26', NULL, '2022-05-20 07:53:32', '2022-05-20 07:53:32'),
(34, 2, 'Mrs. Marisa Barton', 'yvette15@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Vq0uCQCYjM', NULL, '2022-05-20 07:53:32', '2022-05-20 07:53:33'),
(35, 2, 'Prof. Moshe Walker DDS', 'halie.smith@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UWGM5RBQBY', NULL, '2022-05-20 07:53:33', '2022-05-20 07:53:33'),
(36, 2, 'Mr. Jamarcus Klein DVM', 'shana61@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hGc1RnRT05', NULL, '2022-05-20 07:53:33', '2022-05-20 07:53:33'),
(37, 2, 'Ms. Leonor Schneider', 'lueilwitz.eino@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KBpMhMuVXa', NULL, '2022-05-20 07:53:33', '2022-05-20 07:53:33'),
(38, 2, 'Karl Rodriguez I', 'lbergstrom@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2ddZbN3fjP', NULL, '2022-05-20 07:53:33', '2022-05-20 07:53:33'),
(39, 2, 'Cooper Romaguera', 'jasen77@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '32OEJbUWHJ', NULL, '2022-05-20 07:53:33', '2022-05-20 07:53:33'),
(40, 2, 'Penelope Bins DVM', 'brakus.anais@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yyAYqUxCJb', NULL, '2022-05-20 07:53:33', '2022-05-20 07:53:33'),
(41, 2, 'Raquel Zboncak', 'elsa.cremin@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kWwk8PJ4KH', NULL, '2022-05-20 07:53:33', '2022-05-20 07:53:33'),
(42, 2, 'Raymundo Strosin', 'vhowe@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BAav4FwD1f', NULL, '2022-05-20 07:53:33', '2022-05-20 07:53:33'),
(43, 2, 'Mrs. Rachelle Hartmann DDS', 'dokuneva@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4xMdFcpYcv', NULL, '2022-05-20 07:53:33', '2022-05-20 07:53:34'),
(44, 2, 'Prof. Alessandro Schuster II', 'amayert@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hjjReaXKef', NULL, '2022-05-20 07:53:34', '2022-05-20 07:53:34'),
(45, 2, 'Dr. Ariel Harber PhD', 'haag.marcus@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sGu7wp4mYK', NULL, '2022-05-20 07:53:34', '2022-05-20 07:53:34'),
(46, 2, 'Miss Athena Treutel Jr.', 'aylin46@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ScYdlQcCf8', NULL, '2022-05-20 07:53:34', '2022-05-20 07:53:34'),
(47, 2, 'Merritt Heidenreich', 'telly88@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01xWKP161t', NULL, '2022-05-20 07:53:34', '2022-05-20 07:53:34'),
(48, 2, 'Miss Dovie Von IV', 'parker.willa@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PdmsXknvUn', NULL, '2022-05-20 07:53:34', '2022-05-20 07:53:34'),
(49, 2, 'Ofelia Runolfsdottir Sr.', 'cmraz@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tRvc1WMEOz', NULL, '2022-05-20 07:53:34', '2022-05-20 07:53:34'),
(50, 2, 'Elizabeth Grimes', 'klockman@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2ER7xDoiF9', NULL, '2022-05-20 07:53:34', '2022-05-20 07:53:35'),
(51, 2, 'Jordi Wolf', 'xhickle@example.org', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2WyTvK7ivU', NULL, '2022-05-20 07:53:35', '2022-05-20 07:53:35'),
(52, 2, 'Miss Jacquelyn Rempel DDS', 'kristin68@example.net', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CsJ929sJWV', NULL, '2022-05-20 07:53:35', '2022-05-20 07:53:35'),
(53, 2, 'Dr. Darien Hand II', 'lou.lebsack@example.com', 'users/default.png', '2022-05-20 07:53:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yzgYgk2bqy', NULL, '2022-05-20 07:53:35', '2022-05-20 07:53:35');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `visites`
--

CREATE TABLE `visites` (
  `id` int(10) UNSIGNED NOT NULL,
  `motifs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `analyses` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avis_medecin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dossier_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `visites`
--

INSERT INTO `visites` (`id`, `motifs`, `analyses`, `avis_medecin`, `dossier_id`, `created_at`, `updated_at`) VALUES
(1, 'Motifs 1', '[{\"download_link\":\"visites\\\\April2022\\\\BDUQV3cItlS3TEKREXdk.pdf\",\"original_name\":\"CDC Projet _ patients _ dossiers.pdf\"}]', 'Contrôle la semaine prochaine', 1, '2022-04-28 06:35:34', '2022-04-28 06:35:34'),
(2, 'tunis', '[]', NULL, 2, '2020-04-12 07:02:00', '2022-05-13 09:27:13'),
(3, 's', '[]', NULL, 4, '2021-05-13 11:27:00', '2022-05-13 09:28:00'),
(4, 'Motifs 2', '[]', 'Contrôle la semaine prochaine', 3, '2022-05-13 08:09:38', '2022-05-13 08:09:38'),
(5, 'Motifs 5', '[]', 'Contrôle la semaine prochaine', 3, '2022-03-08 09:19:00', '2022-05-20 08:20:17'),
(6, 'Motifs 3', '[]', 'Contrôle la semaine prochaine', 4, '2022-05-20 08:23:00', '2022-05-20 08:24:11'),
(7, 'Motifs 4', '[]', 'Contrôle la semaine prochaine', 2, '2022-05-20 08:26:00', '2022-05-20 08:27:10'),
(8, 'Motifs 6', '[]', 'Contrôle la semaine prochaine', 1, '2022-02-20 09:30:00', '2022-05-20 08:31:29'),
(9, 'Motifs 7', '[]', 'Contrôle la semaine prochaine', 2, '2022-02-20 09:30:00', '2022-05-20 08:31:42');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Index pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Index pour la table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Index pour la table `dossiers`
--
ALTER TABLE `dossiers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Index pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Index pour la table `visites`
--
ALTER TABLE `visites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT pour la table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `dossiers`
--
ALTER TABLE `dossiers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `visites`
--
ALTER TABLE `visites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
