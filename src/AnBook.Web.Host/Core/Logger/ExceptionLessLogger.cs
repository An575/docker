using System;
using Castle.Core.Logging;
using Exceptionless;
using Exceptionless.Logging;

namespace AnBook.Web.Host.Core.Logger
{
    public class ExceptionLessLogger : ILogger
    {
        public bool IsDebugEnabled => true;

        public bool IsErrorEnabled => true;

        public bool IsFatalEnabled => true;

        public bool IsInfoEnabled => true;

        public bool IsWarnEnabled => true;

        /// <summary>
        /// Trace
        /// </summary>
        public void Trace(string message, params string[] tags)
        {
            ExceptionlessClient.Default.CreateLog(message, LogLevel.Trace).AddTags(tags).Submit();
        }

        /// <summary>
        /// Debug
        /// </summary>
        public void Debug(string message, params string[] tags)
        {
            ExceptionlessClient.Default.CreateLog(message, LogLevel.Debug).AddTags(tags).Submit();
        }

        /// <summary>
        /// Info
        /// </summary>
        public void Info(string message, params string[] tags)
        {
            ExceptionlessClient.Default.CreateLog(message, LogLevel.Info).AddTags(tags).Submit();
        }

        /// <summary>
        /// Warn
        /// </summary>
        public void Warn(string message, params string[] tags)
        {
            ExceptionlessClient.Default.CreateLog(message, LogLevel.Warn).AddTags(tags).Submit();
        }

        /// <summary>
        /// Error
        /// </summary>
        public void Error(string message, params string[] tags)
        {
            ExceptionlessClient.Default.CreateLog(message, LogLevel.Error).AddTags(tags).Submit();
        }

        public ILogger CreateChildLogger(string loggerName)
        {
            return new ExceptionLessLogger();
        }

        public void Debug(string message)
        {
            ExceptionlessClient.Default.CreateLog(message, LogLevel.Debug).Submit();
        }

        public void Debug(Func<string> messageFactory)
        {
            throw new NotImplementedException();
        }

        public void Debug(string message, Exception exception)
        {
            exception.ToExceptionless().Submit();
        }

        public void DebugFormat(string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void DebugFormat(Exception exception, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void DebugFormat(IFormatProvider formatProvider, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void DebugFormat(Exception exception, IFormatProvider formatProvider, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void Error(string message)
        {
            ExceptionlessClient.Default.CreateLog(message, LogLevel.Error).Submit();
        }

        public void Error(Func<string> messageFactory)
        {
            throw new NotImplementedException();
        }

        public void Error(string message, Exception exception)
        {
            exception.ToExceptionless().Submit();
        }

        public void ErrorFormat(string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void ErrorFormat(Exception exception, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void ErrorFormat(IFormatProvider formatProvider, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void ErrorFormat(Exception exception, IFormatProvider formatProvider, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void Fatal(string message)
        {
            ExceptionlessClient.Default.CreateLog(message, LogLevel.Fatal).Submit();
        }

        public void Fatal(Func<string> messageFactory)
        {
            throw new NotImplementedException();
        }

        public void Fatal(string message, Exception exception)
        {
            exception.ToExceptionless().Submit();
        }

        public void FatalFormat(string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void FatalFormat(Exception exception, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void FatalFormat(IFormatProvider formatProvider, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void FatalFormat(Exception exception, IFormatProvider formatProvider, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void Info(string message)
        {
            ExceptionlessClient.Default.CreateLog(message, LogLevel.Info).Submit();
        }

        public void Info(Func<string> messageFactory)
        {
            throw new NotImplementedException();
        }

        public void Info(string message, Exception exception)
        {
            exception.ToExceptionless().Submit();
        }

        public void InfoFormat(string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void InfoFormat(Exception exception, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void InfoFormat(IFormatProvider formatProvider, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void InfoFormat(Exception exception, IFormatProvider formatProvider, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void Warn(string message)
        {
            ExceptionlessClient.Default.CreateLog(message, LogLevel.Warn).Submit();
        }

        public void Warn(Func<string> messageFactory)
        {
            throw new NotImplementedException();
        }

        public void Warn(string message, Exception exception)
        {
            exception.ToExceptionless().Submit();
        }

        public void WarnFormat(string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void WarnFormat(Exception exception, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void WarnFormat(IFormatProvider formatProvider, string format, params object[] args)
        {
            throw new NotImplementedException();
        }

        public void WarnFormat(Exception exception, IFormatProvider formatProvider, string format, params object[] args)
        {
            throw new NotImplementedException();
        }
    }
}
