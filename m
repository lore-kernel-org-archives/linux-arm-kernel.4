Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1267E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NwY3/quq;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DwvH3gte
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6TexNp2ZDl+3hX+Vq6c0lera+2kj3Ba5hH/oMxLRynY=; b=NwY3/quq1STvVp
	pCNU50MiF7RX+JAZ89UAMMg53DntiwB0SiWMPVUZUtV9KK939IRlS6UrxBqKAbi8LVK2vmxQyFnq/
	B/pyVKzQ5bmmmHaALjifjFPtRUiRpcgt/7jZjaW0G0ZQ1bNSw9hYq30+OpC3Dgzu46UpCb3c6uuwN
	HPeEGDa+Hi0WCQW3CvPYMUwV3R9RFt3MC3KMpbiLBV0tQbdr4ne/gZdCxVqxnCrjm6gpFYH5i7Wpg
	Eq/CMU8zakWA6BXgszpPVptTId8EoCYMgVnOWOOuSmi6wKfBloo1iwGzW60KqusrQiAutBdfQ/UZ0
	CvVh5Sb17IkpyWNRbN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI0L-0000000B3Ve-3EFH;
	Wed, 25 Nov 2026 18:46:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHzK-0000000B2qq-1EBj;
	Wed, 25 Nov 2026 18:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795632300;
	bh=Ojr4CPkhMmvonRIHNhgph/1SQ75Ajo/2PT1nLoJMfng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DwvH3gtezJ+4oH1RMZdnB4D83zg0cMy/kuhOGAW1HaP6kJKNg93Hcr2w7umBLdAiD
	 GZYqj1R/zZU61EJ3SxfhmLLkrWcBsVlYflwTzN/8Wh2b9UJNWvAWKm9EAXaild+3Qy
	 19XhqP5wdqEaa3egnvZvijmt9qHnbL/ojYCI14DPMr3kkg7XJ1xy6Jdlz57j8gwUZE
	 MHCxCXKqynfDUcBU/+dY+5tja9w/gLXyIiyj75J23ARqMLz/fqxxl9T5bkow+MuMX3
	 n8v99Q4zjApvxl039NFZbMS/cPeITiO05akxhidBc+BRBryiG3oXwaC2eRU+uJj7ck
	 cwQLbg5ISaitw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 60FD817E1202;
	Wed, 25 Nov 2026 19:44:58 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 13:33:27 -0500
Subject: [PATCH v3 5/9] media: Add missing types to v4l2_ctrl_ptr
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-ftrace-v3-5-1d1db48372ed@collabora.com>
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
X-CRM114-CacheID: sfid-20261125_104507_870265_97FCA259 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

The v4l2_ctrl_ptr union contains pointers for all control types, but
v4l2_ctrl_hevc_decode_params and v4l2_ctrl_hevc_scaling_matrix are missing.

Add them.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 include/media/v4l2-ctrls.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index cec9217d97ac..6e363262c868 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -49,6 +49,8 @@ struct video_device;
  * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
  * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
  * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
+ * @p_hevc_decode_params:	Pointer to an HEVC decode parameters structure.
+ * @p_hevc_scaling_matrix:	Pointer to an HEVC scaling matrix structure.
  * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
  * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
  * @p_area:			Pointer to an area.
@@ -81,6 +83,8 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
+	struct v4l2_ctrl_hevc_scaling_matrix *p_hevc_scaling_matrix;
 	struct v4l2_ctrl_vp9_compressed_hdr *p_vp9_compressed_hdr_probs;
 	struct v4l2_ctrl_vp9_frame *p_vp9_frame;
 	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;

-- 
2.56.1


