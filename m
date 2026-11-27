Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3522F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hvQ/IEH8;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=hMZMbxgX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1M3acFGCLR5KsNELoY15riziLexMyJMhHyB0Ci8R3Vo=; b=hvQ/IEH8sqnuSo
	nJePDh1LAjcbAy9ghm8nK6ncM9/86TKKQrbw+T/wtY8QgbPtBbwrWndRp1YI/LE9zt0YNbTj/oycA
	cm+2m3L9Rn5Pt3MwCLc4y5goYlVdfo/8dEPLfERm+DgOnkDI1ecxqXLqrRn2LJx5TUHigJlfLS4LW
	i1BB93yxyY2UG3v1gIQeqDglq3lL20LDQ50q0Q2rYhC5G/HQOGTnU0ygV1WXtewq6ZnForIo0cTNc
	mNsSC5A+B7mcTc+Jpuhi63iOkojt4yxE0GDKSXBzB9GO9wbwsM0bGTFeEYq+UrncnKwCg04gCUxI+
	Hnq80+zIQo9Gcw268vNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWz5R-0000000H8dY-0pfI;
	Fri, 27 Nov 2026 16:46:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWz5A-0000000H8L7-0by0;
	Fri, 27 Nov 2026 16:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795797954;
	bh=L6rZvcWM1EhsZRVJ5/aUwEYKuvUsh9+nsLQFVzmMG7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hMZMbxgXT3mbhra3N6rQX9B1oSR1Cf2j4MhwgxKNwunaIj+6erhWva49h+QSuQ+gK
	 Sts4VtKDLxYCBLApHIZylitJCXV91x2JcvAyk9/V8dBSExR7d4+t1wcWaI89udoUYF
	 a1cKnrIF5N7Dmy23/zqqCIjDdXI2a8z9k2k2sinQtut1pYww1VCWXMf75EiTa4R1Zx
	 Gbnq8prjbWK/2gg0/aiOfvtjLgjvwaZLUOTjRMKIhDc0NFCrVhkpxOgN8ltMPHZvAc
	 87JtlUVM/wSXZ1KjoKRfgp+hrCyPtjDaHjpoOwM8PDQSu+QSGw+1y5qMPMjU1hhkKE
	 +FZldVVotlIVw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 206BF17E010F;
	Fri, 27 Nov 2026 17:45:52 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Nov 2026 11:45:11 -0500
Subject: [PATCH v4 7/9] media: Add stream on/off traces and run them in the
 ioctl
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-v4l2-add-ftrace-v4-7-24138479002f@collabora.com>
References: <20261127-v4l2-add-ftrace-v4-0-24138479002f@collabora.com>
In-Reply-To: <20261127-v4l2-add-ftrace-v4-0-24138479002f@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_084556_360469_AE235959 
X-CRM114-Status: GOOD (  14.63  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Automatically trace stream on/off events for all v4l2 drivers.

The queue type is also logged so that userspace can identify the possible
multiple stream on/off events per stream.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 22 +++++++++++++++++++--
 include/trace/events/v4l2.h          | 37 ++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 29ca2f7959ef..71dec6618d08 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1965,13 +1965,31 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
 static int v4l_streamon(const struct v4l2_ioctl_ops *ops, struct file *file,
 			void *arg)
 {
-	return ops->vidioc_streamon(file, NULL, *(unsigned int *)arg);
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
+	unsigned int type = *(unsigned int *)arg;
+	int err;
+
+	err = ops->vidioc_streamon(file, NULL, type);
+
+	if (!err)
+		trace_v4l2_streamon(fh->tgid, fh->fd, type);
+
+	return err;
 }
 
 static int v4l_streamoff(const struct v4l2_ioctl_ops *ops, struct file *file,
 			 void *arg)
 {
-	return ops->vidioc_streamoff(file, NULL, *(unsigned int *)arg);
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
+	unsigned int type = *(unsigned int *)arg;
+	int err;
+
+	err = ops->vidioc_streamoff(file, NULL, type);
+
+	if (!err)
+		trace_v4l2_streamoff(fh->tgid, fh->fd, type);
+
+	return err;
 }
 
 static int v4l_g_tuner(const struct v4l2_ioctl_ops *ops, struct file *file,
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index 248bc09bfc99..b11293365123 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -262,6 +262,43 @@ DEFINE_EVENT(vb2_v4l2_event_class, vb2_v4l2_qbuf,
 	TP_ARGS(q, vb)
 );
 
+/* Events for stream on/off.
+ *
+ * These events will be fired every time userspace starts or stops a stream.
+ * tgid and fd are used to identify the process that opened the video device.
+ * type is the &enum v4l2_buf_type of the queue being started or stopped.
+ *
+ * Note that this even can be fired multiple times for a given tgid/fd pair.
+ * E.g.: mem2mem drivers expect stream on/off on both output and capture queues.
+ */
+DECLARE_EVENT_CLASS(v4l2_stream_class,
+	TP_PROTO(u32 tgid, s32 fd, u32 type),
+	TP_ARGS(tgid, fd, type),
+
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(s32, fd)
+			 __field(u32, type)
+	),
+
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->type = type;
+	),
+
+	TP_printk("tgid = %u, fd = %d, type = %s",
+		  __entry->tgid, __entry->fd, show_type(__entry->type))
+);
+
+DEFINE_EVENT(v4l2_stream_class, v4l2_streamon,
+	TP_PROTO(u32 tgid, s32 fd, u32 type),
+	TP_ARGS(tgid, fd, type)
+);
+
+DEFINE_EVENT(v4l2_stream_class, v4l2_streamoff,
+	TP_PROTO(u32 tgid, s32 fd, u32 type),
+	TP_ARGS(tgid, fd, type)
+);
+
 #endif /* if !defined(_TRACE_V4L2_H) || defined(TRACE_HEADER_MULTI_READ) */
 
 /* This part must be outside protection */

-- 
2.56.1


