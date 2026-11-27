Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71710606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2W4mDuva;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NoKQmlyD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m+b9qRfoe5kw0wQH5Dx62HKikqet01mDMR3chcUsRE8=; b=2W4mDuvaGeoOWd
	aFz06H4XU4xTYygYrDChFWNW1IUsoQMJNzaeNR3ZEk631JB/jsGbWzKigjFi57NEfPvnhuVaUg7Gi
	W/n/VNTRFIK5MH1+wA+ro7e5b5MqttsW4+LKKbYibILHJGL55HG9IaYNwzJgreCI8sVuVI49kroK9
	uwt1iHR0EKrCaG1yJkal85gVljuqohh/vSwHjcHigsEUitFR7JpBAkutGxH16uBHuNiO7DPIXfVrB
	Ld2/MlTC8YYb43PvWnfxmOnVkNbRZ59WMxau3udOcK4QjbXi0Tq8QLpOnLpPXPFoFwma1uGlWuKx0
	ju/uW7uBggLO/3EEh65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWz6l-0000000H9Ql-18GM;
	Fri, 27 Nov 2026 16:47:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWz5C-0000000H8Lr-0yhn;
	Fri, 27 Nov 2026 16:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795797956;
	bh=26S/azp/tiJQxKKBFeHPtQPyrSoju++dR4OxSkAG01Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NoKQmlyDTa5sD/WJBU9qb2fvJDtd5JszW2pnVhUOo497j0YBEwKWZJln1wSAivObc
	 kIaJNx/n2FipJfAsjTe6aHqbM4bDvHEq5tngcu3FPuACpTRYraNWY/x6dE8QcZiMid
	 DeXqj25V0MC+fbFvHqT6OdGPk63WnTIkSJsUfb6Ky2+koDvjUpKZ7xt8mmi3mksjIz
	 NLWKjoWCBFWf5LWrf+INPWMH7cxrIzQME4ODfPQeT4EITpEpzzcYJbUwOO4T8SvfdZ
	 HrBx6lodJCDWgsQ/KJ0rZjZ2YYdDycXr/8wVQ+VkGcMFPFJq/hMMvLcUoJHcBqO3tS
	 URF2GzkpOzeEA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55E0117E0A27;
	Fri, 27 Nov 2026 17:45:54 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Nov 2026 11:45:12 -0500
Subject: [PATCH v4 8/9] media: Add HW run/done trace events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-v4l2-add-ftrace-v4-8-24138479002f@collabora.com>
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
X-CRM114-CacheID: sfid-20261127_084558_451081_D0A23987 
X-CRM114-Status: GOOD (  12.59  )
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

The events can be fired by drivers when the hardware is run and when it
is done.
That can be used by userspace tracers to see HW performance and usage.

The hw_done event allows setting the number of clock cycles the HW needed
to do the work, to help tools evaluate performances.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-trace.c |  3 +++
 include/trace/events/v4l2.h          | 52 ++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-trace.c b/drivers/media/v4l2-core/v4l2-trace.c
index af9464403f95..5b24b043295d 100644
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
index b11293365123..a72bd3e47511 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -299,6 +299,58 @@ DEFINE_EVENT(v4l2_stream_class, v4l2_streamoff,
 	TP_ARGS(tgid, fd, type)
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
+DECLARE_EVENT_CLASS(v4l2_fh_class,
+	TP_PROTO(u32 tgid, s32 fd),
+	TP_ARGS(tgid, fd),
+
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(s32, fd)
+	),
+
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+	),
+
+	TP_printk("tgid = %u, fd = %d", __entry->tgid, __entry->fd)
+);
+
+DEFINE_EVENT(v4l2_fh_class, v4l2_hw_run,
+	TP_PROTO(u32 tgid, s32 fd),
+	TP_ARGS(tgid, fd)
+);
+
+DECLARE_EVENT_CLASS(v4l2_hw_done_class,
+	TP_PROTO(u32 tgid, s32 fd, u32 hw_cycles),
+	TP_ARGS(tgid, fd, hw_cycles),
+
+	TP_STRUCT__entry(__field(u32, tgid)
+			 __field(s32, fd)
+			 __field(u32, hw_cycles)
+	),
+
+	TP_fast_assign(__entry->tgid = tgid;
+		       __entry->fd = fd;
+		       __entry->hw_cycles = hw_cycles;
+	),
+
+	TP_printk("tgid = %u, fd = %d, hw_cycles = %u",
+		  __entry->tgid, __entry->fd, __entry->hw_cycles)
+);
+
+DEFINE_EVENT(v4l2_hw_done_class, v4l2_hw_done,
+	TP_PROTO(u32 tgid, s32 fd, u32 hw_cycles),
+	TP_ARGS(tgid, fd, hw_cycles)
+);
+
 #endif /* if !defined(_TRACE_V4L2_H) || defined(TRACE_HEADER_MULTI_READ) */
 
 /* This part must be outside protection */

-- 
2.56.1


