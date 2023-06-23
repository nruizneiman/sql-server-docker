SET IDENTITY_INSERT [dbo].[Products] ON

INSERT [dbo].[Products] ([ProductID], [Name], [Description], [CategoryID]) VALUES (1, N'Coca-Cola', N'Main drink all over the world', 1, CAST(N'2018-05-02T18:25:33.880' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [Description], [CategoryID]) VALUES (2, N'Pepsi', N'Second drink all over the world', 1, CAST(N'2019-05-02T18:25:33.880' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [Description], [CategoryID]) VALUES (3, N'Beer', N'Primary drink all over Ireland', 2, CAST(N'2020-05-02T18:25:33.880' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [Description], [CategoryID]) VALUES (4, N'Wine', NULL, 2, CAST(N'2023-05-02T18:25:33.880' AS DateTime))

SET IDENTITY_INSERT [dbo].[Products] OFF