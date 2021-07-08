--To count distinct values in desired columns--
select COUNT(DISTINCT name) as NameCount, COUNT(DISTINCT platform) as PlatformCount,COUNT(DISTINCT year) as YearCount,
COUNT(DISTINCT genre) as GenreCount,COUNT(DISTINCT publisher) as PublisherCount from vgsales