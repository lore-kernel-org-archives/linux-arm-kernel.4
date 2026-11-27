Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4A3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vpEbKcHx;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bMLqzdv0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lDfky6SuvAz9YREJEg5XyCekcclpWUJwmfT04L5Ocuo=; b=vpEbKcHxnj4jwIt7q8TQIVmDUa
	j/p3A9ip3XLhVAfUfPuMaKWFTgt30H9sb79A3s0gCn7NqpwrNoPG/KEpk+pDl4vXeC7DVNiMjrz1c
	EUbSoNvpIyiqXlJfd2JDAZ86EuL1OK1vvbtBwx166aQtMvhquscBC0UB6LM927+3yAfT3nvujs3Nw
	t41GcqF2OqVst9uAec2hxihmCKNguj4z5S1j9r9j/Vs10KHb58pcwN9giSRkMQ6wTLpnEUsmSSlvK
	dnI56kYlE7/V+Qi3F3HC0iku5Cr7juGxxb7qnWe8W2zGX8yTU3V7trWVFycKTEZu087oKmfByK+CV
	wzI7MJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWz4y-0000000H8Fd-2Hyf;
	Fri, 27 Nov 2026 16:45:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWz4u-0000000H8Ec-1fwN;
	Fri, 27 Nov 2026 16:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795797937;
	bh=mxFODSb/WKuiMK1tmmBnOBrFqLuGs+xiiCktJN4Ejsw=;
	h=From:Subject:Date:To:Cc:From;
	b=bMLqzdv05IgdzeOe3SjapBamP6TCtIukuOMbct3PvDXhaDkczBi7VzbasX6Tqn5TJ
	 D9cw5r5s/oZw+zdNvkEK2MdIa33Be0PFfPW6yUn2X8bGkfpDuhgS/MzjQDMfxRL1fg
	 EKhUcPQnASmcoT/keO9HriS0wSIl/ushunzN9ZJk5X0yOYEUImLLwiI0iXmm5rL9Lg
	 qluhU1SShJUiIyN9V2NjusmRTR/ljqWFerCjCIq2os3f95uHbgbC6YYMicR79EWzOV
	 rAyao3sVrGeh8hGxrgoSeFNKzwpi8OdvYZj/I4ZnqNZq3BF1i4b06o25k8p3/SQLM+
	 NdHtoYwwM677Q==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED1AF17E010F;
	Fri, 27 Nov 2026 17:45:35 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v4 0/9] v4l2: Add tracing for stateless codecs
Date: Fri, 27 Nov 2026 11:45:04 -0500
Message-Id: <20261127-v4l2-add-ftrace-v4-0-24138479002f@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNQQ7CIBQE0KsY1mKAtrS68h7GxS98LKYWA5Vom
 t5dqMaFXU4y82YiAb3FQA6biXiMNlg3pFBuN0R1MFyQWp0yEUxIJllDY9kLClpTM3pQSAGVxNp
 IBlKRtLp7NPa5iKfzJ4dHe0U1ZiY3OhtG51/LZRS599U5W+lRUEb3dSVRm1qA4kfl+h5a52Gn3
 I3kh1j8DM5FtTaKZHDNdVs2RS1Q/xvzPL8BY14asAgBAAA=
X-Change-ID: 20260608-v4l2-add-ftrace-aec6e7f60a6c
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
X-CRM114-CacheID: sfid-20261127_084540_603177_90D5E75D 
X-CRM114-Status: GOOD (  17.46  )
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

Hi !

This patchset aims to improve codec event tracing in v4l2.

The traces added in visl by Daniel Almeida are moved to the global trace
events.
They are adapted to trace each each field separately and not just the
whole struct so that userspace can filter on different fields and
libraries like libtracefs and libtraceevent can be used to list the
fields instead of parsing the trace printk's.

The trace event templates are also reworked to avoid long lines, but
quoted string splits are kept as they don't cut words.

To each trace event are also added a tgid and fd fields, helping
userspace track different decoding sessions (contexts) based on the given
file descriptor used by the given process id.

Also for better tracking, stream on and stream off events are added as
well as HW run and HW done events to track decoder core usage.

The main focus is to be able to generate perfetto traces to show VPU usage,
a perfetto producer using this can be found at [1].
Other controls can be traced later as well, this patch set only focuses on
mem2mem type drivers.

checkpatch.pl reports alignement issues in the trace headers, they are
voluntary. No other warnings should be reported.

[1]:
https://gitlab.collabora.com/detlev/v4l2-perfetto.git

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v4:
- Update visl doc with new trace names
- hantro: Move hw_cycles in vpu to avoid ctx race in irq with watchdog
- hantro: trace run before starting watchdog and done after canceling watchdog
- Trace controls from p_new instead of p_cur
- Trace controls if there was no errors
- Add missing EXT_SPS_LT and EXT_SPS_ST tracing
- Allow fd to be 0
- Also report queue type in run trace
- Move v4l2_ctrl_vp9_frame tracepoint symbol to the VP9 code block
- Use s32 instead of u32 for file descriptors
- Fix a HEVC flag print in trace
- Link to v3: https://patch.msgid.link/20261125-v4l2-add-ftrace-v3-0-1d1db48372ed@collabora.com

Changes in v3:
- Rebased on master
- Fixed sps_st field size in traces
- Fixed checkpatch issues (except parenthesis alignment in trace headers)
- Link to v2: https://patch.msgid.link/20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com

Changes in v2:
- Don't modify the printk format
- Trace all fields of the structs instead of the whole struct as a buffer
- Remove fdinfo patches (they will come in another patch set)
- Fix long lines
- Rename v4l2_requests.h trace header to v4l2_controls.h
- Add basic documentation

To: Daniel Almeida <daniel.almeida@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Detlev Casanova (9):
      media: Move visl traces to v4l2-core
      media: Map each struct field to its own trace field
      media: Add tgid and fd fields in v4l2_fh struct
      media: Add tgid and fd to the v4l2-requests trace fields
      media: Add missing types to v4l2_ctrl_ptr
      media: Trace the stateless controls when set in v4l2-ctrls-core.c
      media: Add stream on/off traces and run them in the ioctl
      media: Add HW run/done trace events
      media: hantro: Add v4l2_hw run/done traces

 Documentation/admin-guide/media/visl.rst           |   24 +-
 drivers/media/platform/verisilicon/hantro.h        |    3 +
 drivers/media/platform/verisilicon/hantro_drv.c    |    9 +
 .../platform/verisilicon/rockchip_vpu981_regs.h    |    1 +
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |    2 +
 drivers/media/test-drivers/visl/Makefile           |    2 +-
 drivers/media/test-drivers/visl/visl-dec.c         |   76 -
 drivers/media/test-drivers/visl/visl-trace-av1.h   |  314 ---
 drivers/media/test-drivers/visl/visl-trace-fwht.h  |   66 -
 drivers/media/test-drivers/visl/visl-trace-h264.h  |  349 ---
 drivers/media/test-drivers/visl/visl-trace-hevc.h  |  464 ----
 drivers/media/test-drivers/visl/visl-trace-mpeg2.h |   99 -
 .../media/test-drivers/visl/visl-trace-points.c    |   11 -
 drivers/media/test-drivers/visl/visl-trace-vp8.h   |  156 --
 drivers/media/test-drivers/visl/visl-trace-vp9.h   |  292 ---
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   10 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  131 +
 drivers/media/v4l2-core/v4l2-fh.c                  |    2 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   39 +-
 drivers/media/v4l2-core/v4l2-trace.c               |   50 +
 include/media/v4l2-ctrls.h                         |   19 +
 include/media/v4l2-fh.h                            |    4 +
 include/trace/events/v4l2.h                        |   89 +
 include/trace/events/v4l2_controls.h               | 2704 ++++++++++++++++++++
 24 files changed, 3076 insertions(+), 1840 deletions(-)
---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20260608-v4l2-add-ftrace-aec6e7f60a6c

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


