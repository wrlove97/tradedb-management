/* tradeDB 商城分类聚集索引 buildTime 排序 （由大到小）*/

USE [tradeDB];
GO

IF EXISTS (
    SELECT 1 FROM sys.indexes
    WHERE name = 'CIX_ClassInfo_parent_cls'
      AND object_id = OBJECT_ID('dbo.ClassInfo')
)
    DROP INDEX CIX_ClassInfo_parent_cls ON dbo.ClassInfo;
GO

CREATE CLUSTERED INDEX CIX_ClassInfo_parent_buildTime
ON dbo.ClassInfo (parentID ASC, buildTime DESC);
GO
