Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xcma0HJi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JQbTJ1XH;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kxY16Jt2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dHRCyQo7dq5D49B4YZY64/wU+0HlRz/vDWJ+XFm+iJE=; b=Xcma0HJiJa4PPP
	TtMAng+L+AzhoL/WlB4VkUdELAfIygkOo/b2SxEbWhvkelL1kCO3MGi9Rh6bLS277AtzyvDMDC7T2
	UVzndI75opuEUgCrkb7LyPX85rubXdJSlaqGj90PO/MqpjfP3XpV6GdEENkjlOcVX6GESb1QO0jAM
	1WhBwtw1KmIgh2/uTGJPa2XNZ4005UFZ3NmrOTKmvi1ZLPy0BceugaX40P8ko9XVWHDHBalP5MO16
	0gFL2DPQx5yQEUUsOX6VU2NLnd1EambyarIyoRsgauF8J3vht0kYSyYTXIOlrWZ5RI1W5JE0dTxGU
	016TES9X18/f7aShRCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI0Z-0000000B3et-43EO;
	Wed, 25 Nov 2026 18:46:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHzd-0000000B31Q-2nPw;
	Wed, 25 Nov 2026 18:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dHRCyQo7dq5D49B4YZY64/wU+0HlRz/vDWJ+XFm+iJE=; b=JQbTJ1XH+Be6/C7hfQ5Oqr1KbK
	G83N5fSiyX4NwMnBkz3mXraeKTjcactnTgXBvGbIMaiiyoI/bybImsFOgEpPXq1f5viGNZX3FNL6z
	dD44W5F4TKKWTByNqNuYzDycesc26KMzC6zWw0NJBbuZ207eZHVEgTF7nl5m2kIcuT4T4Ofc1+D2b
	khv1Nv82TnCkvN/uNXuLJhHWckhN3+050AuRMlLC2wMH978KMTdxo+sLEiETj8AIYiwQnQ3Q5pp+L
	6Rc7dFvfAchVdcZXJKJs0TN67Bu5Sz/zbiTZX+HAo7S8j6UYlmqA1B3U4qBDKUQGOmQBU+ClMVuMo
	mqzhyQ0A==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHzT-00000005fZ9-2xYN;
	Wed, 25 Nov 2026 18:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795632307;
	bh=LXS/hgrURmCAgZZnO8b7PuFF+e6o5fpYsv2HbgVKqaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kxY16Jt2j5jj1108ytuVIh5wVYLYnKNiOHrynv9xiTFBAJoZK4kO+c9xfbaaa3LwF
	 ENRZPeGG+V2FOIjkEmocqVwFtpBXK5i7KTNltmXBh4H6Ubu0qNOmgwTSDrh6AaL9DK
	 UaB2L3wMkQY9OaBtNoUy1dWQZTGYo283ujUr5uX1eqJg1QNC/6w+IWxqN/31iP6XUj
	 apDSxYjioUbZcf9HS8waIU6oB3jFAxBTXgmtk8s4IOR/Gdckiq/C+dU4Sdj/IBl2Az
	 9v0gMh95w+Sj3w4EifG7MilaFh5aGrPW8l9IV+B7ff4/IlSXn//iltlO4D7dlQuzRH
	 QmTNIzi7UvAXA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2886217E12EB;
	Wed, 25 Nov 2026 19:45:05 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 13:33:30 -0500
Subject: [PATCH v3 8/9] media: Add HW run/done trace events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-ftrace-v3-8-1d1db48372ed@collabora.com>
References: <20261125-v4l2-add-ftrace-v3-0-1d1db48372ed@collabora.com>
In-Reply-To: <20261125-v4l2-add-ftrace-v3-0-1d1db48372ed@collabora.com>
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
X-CRM114-CacheID: sfid-20261125_184511_765295_BDD05862 
X-CRM114-Status: GOOD (  14.28  )
X-Spam-Score: -0.2 (/)
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

The events can be fired by drivers when the hardware is run and when it
is done.
That can be used by userspace tracers to see HW performance and usage.

The hw_done event allows setting the number of clock cycles the HW needed
to do the work, to help tools evaluate performances.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-trace.c |  3 +++
 include/trace/events/v4l2.h          | 37 ++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-trace.c b/drivers/media/v4l2-core/v4l2-trace.c
index 183d5ecb49c5..59cf6f8807ac 100644
--- a/drivers/media/v4l2-core/v4l2-trace.c
+++ b/drivers/media/v4l2-core/v4l2-trace.c
@@ -12,6 +12,9 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_buf_queue);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_dqbuf);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_qbuf);
 
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_hw_run);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_hw_done);
+
 /* Export AV1 controls */
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_av1_sequence);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_av1_frame);
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index 089c5ff0b3af..7f0d0b5193d7 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -296,6 +296,43 @@ DEFINE_EVENT(v4l2_stream_class, v4l2_streamoff,
 	TP_ARGS(tgid, fd)
 );
 
+/* Events for hardware run/done.
+ *
+ * These events will be fired respectively when the hardware is run (v4l2_hw_run) and done
+ * (v4l2_hw_done).
+ * As for other events, tgid and fd are used to identify the process that opened the video device.
+ *
+ * The v4l2_hw_done event also includes the number of hardware cycles taken by the hardware to
+ * process the command.
+ */
+DEFINE_EVENT(v4l2_stream_class, v4l2_hw_run,
+	TP_PROTO(u32 tgid, u32 fd),
+	TP_ARGS(tgid, fd)
+);
+
+DECLARE_EVENT_CLASS(v4l2_hw_done_class,
+	TP_PROTO(u32 tgid, u32 fd, u32 hw_cycles),
+	TP_ARGS(tgid, fd, hw_cycles),
+
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(u32, fd)
+			 __field(u32, hw_cycles)
+	),
+
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->hw_cycles = hw_cycles;
+	),
+
+	TP_printk("tgid = %u, fd = %u, hw_cycles = %u",
+		  __entry->tgid, __entry->fd, __entry->hw_cycles)
+);
+
+DEFINE_EVENT(v4l2_hw_done_class, v4l2_hw_done,
+	TP_PROTO(u32 tgid, u32 fd, u32 hw_cycles),
+	TP_ARGS(tgid, fd, hw_cycles)
+);
+
 #endif /* if !defined(_TRACE_V4L2_H) || defined(TRACE_HEADER_MULTI_READ) */
 
 /* This part must be outside protection */

-- 
2.56.1


