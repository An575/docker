using Abp.AutoMapper;

namespace AnBook.AnBooks.Books.Dto
{
    [AutoMap(typeof(Book))]
    public class AddBookInput
    {
        /// <summary>
        /// 主键Id
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// 租户ID
        /// </summary>
        public int? TenantId { get; set; }

        /// <summary>
        /// 书名
        /// </summary>
        public string BookName { get; set; }

        /// <summary>
        /// 作者
        /// </summary>
        public string Author { get; set; }

        /// <summary>
        /// 出版社
        /// </summary>
        public string Press { get; set; }

        /// <summary>
        /// 书出版编号
        /// </summary>
        public string PubNumber { get; set; }

        /// <summary>
        /// 介绍
        /// </summary>
        public string Desc { get; set; }

        /// <summary>
        /// 简介
        /// </summary>
        public string ShortDesc { get; set; }

        /// <summary>
        /// 版本号
        /// </summary>
        public string Version { get; set; }

        /// <summary>
        /// 定价
        /// </summary>
        public decimal SourcePrice { get; set; }

        /// <summary>
        /// 书籍类型
        /// </summary>
        public BookType Type { get; set; }
    }
}