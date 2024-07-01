#ifndef XLOG_H
#define XLOG_H
#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <memory>
#ifdef _WIN32
//int i = 0;
#endif
#include "xconfig.h"


#ifdef _WIN32
#define DEFAULT_LOG_PATH "./"
#else
#define DEFAULT_LOG_PATH "/var/log/xcpp/"
#endif
#define DEFAULT_LOG_FILENAME  "xlog.txt"

_XCPP_NAMESPACE_
// INFO:
//   Use for state changes or other major events, or to aid debugging.
// WARNING:
//   Use for undesired but relatively expected events, which may indicate a
//   problem
// ERROR:
//   Use for undesired and unexpected events that the program can recover from.
//   All ERRORs should be actionable - it should be appropriate to file a bug
//   whenever an ERROR occurs in production.
// FATAL:

/** @brief ��־���� !<���ɱ���
*/
enum class LogLevel
{
	DEBUG,			//!< ���Լ�����־
	INFO,			//!< ����������־
	WARNING,		//!< ����
	ERROR,			//!< ����
	FATAL			//!< �����жϵĴ��� 
};
#define LOG(level) xcpp::XLogMessage(__FILE__, __LINE__, xcpp::LogLevel::level).stream()
#define LOGDEBUG LOG(DEBUG)	
#define LOGINFO LOG(INFO)
#define LOGWARNING LOG(WARNING)
#define LOGERROR LOG(ERROR)
#define LOGFATAL LOG(FATAL)
	

/**
 * @brief  ��ʼ����־ģ�飬�Ὺ����־д���߳�
 * @param appname	������־��Ӧ������
 * @param logpath	��־��д��·�����Ժ�֧������·��
 * @param filename ��־д����ļ�����Ժ�֧�ָ�ʽ�����ƣ�����������־
 * @return ��ʼ���ɹ�ʧ�� ��Ԫ������
 */
XCPP_API bool InitXLog(const char* appname,const char *logpath = DEFAULT_LOG_PATH, const char* filename = DEFAULT_LOG_FILENAME);
	
/**
 * @brief  �����ã�������־�̺߳Ͷ���
 * @return �ɹ�����true 
 */
XCPP_API bool CloseXLog();

/**
 * @brief ��־д��ӿ�
 */
class XCPP_API XWrite
{
public:
	virtual int Write(const char* msg) = 0;
	XWrite(){}
	virtual ~XWrite() {}
};


/**
 * @brief ��־��Ϣ������.
 * �����������־��Ϣ�����͵�д���߳�
 */
class XCPP_API XLogMessage
{
public:
	/**
	 * @brief  ������
	 * @return stringstream �ַ�������д�����У����������лᷢ�͸�д���߳�
	 */
	std::stringstream& stream()
	{
		return stream_;
	}
	XLogMessage();

	/**
	 * @brief ���캯��.
	 * @brief Constructor.
	 *
	 * @param[in] file		��־���������ļ���
	 * @param[in] line		��־�����к�
	 * @param[in] level		��־����
	 */
	XLogMessage(const char* file, int line, LogLevel level);
	~XLogMessage() ;
	static void set_write(std::unique_ptr<XWrite> &&w) { write_ = move(w); }
	void set_name(const char* name) { name_ = name; }
private:
	/**
	 * ��־�ַ�����
	 */
	std::stringstream stream_;
	
	/**
	 * ע���д��������
	 */
	static std::unique_ptr<XWrite> write_;

	std::string name_;
};

_END_NAMESPACE_

//class XFileWrite
//{
//public:
//	int Write(const std::string&& msg);
//private:
//	std::ofstream ofs_;
//};
//LOG(INFO) << "Found " << num_cookies << " cookies";


#endif

/*! @} */