String getCleanImageUrl(String? url) {
  const fallbackUrl =
      'https://basecamplive.com/wp-content/uploads/2023/02/books.jpeg';

  if (url == null) {
    return fallbackUrl;
  }

  final cleanedUrl = url.trim();

  if (cleanedUrl.isEmpty || !cleanedUrl.startsWith(RegExp(r'https?://'))) {
    return fallbackUrl;
  }

  return cleanedUrl;
}
