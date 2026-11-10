Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CBE606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i2GLSgaX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQfR8rGB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9pL+fygB5ssTmFqgMVv9/XaMYzhrOZx7qK1PSJTEus4=; b=i2GLSgaX/Zuijun9ZJvDYtxR7H
	BxBZ/uHLIYOPe2/dOk6Yl+U1TZVUJpXy6Enj/6yQ9FDYjaD7IsOnb5gQ3WdG0pUprKSbijq9esjyQ
	GiH2uNCqL8l7mT3CBPVNwaW+oiz+W/BsKms+c/VsaN8kl/jH746RgPb0Ubmg8jYHDQrQDTV82wvHK
	S2BFLuUOhui72rZQq5OpEklnM9p1U4Yqy6TwRn2jlvtfKe24HyTvrN5wK5qdyPWLGB0jWMLdj0unQ
	InNP8vN2wfs190FmG0vdnB58o/e/Dqnh0F5O8WXmzxrIjLh92VskdRQ6Ohtsc7bNbwiW9yrEficlD
	rjEWJYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg8F-00000002qVo-0IMU;
	Tue, 10 Nov 2026 07:19:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7h-00000002pl0-0LNr;
	Tue, 10 Nov 2026 07:18:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D14D1456B7;
	Tue, 10 Nov 2026 07:18:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295108;
	b=AJhMD1SfjNsqDoaI5KmPRIoKj/5rxgpZFjv3781z81LCfbNYrpAUgqX14sg25j7ZGAnf
	 Y3npzcHwAwDP1Q+c5TwJwyHrXvdpzHUzmUjP2RSYKX3MZl3UIGESe2TBnc6NB4FcX1nR6
	 aPUnogxYSF3tCfJZRBIAkFyt5EyAUUmrO3WfAJsaID4nPrL172xTflafeu0UFh32+5lfV
	 Mt26FLL+syaKAqqRTiylaPVuofjSpvJjWoPHOf50YiedO6nBH/kGpo2YzG1y+WdOmgfHt
	 mJkk+NDOFhg8sjNTGl70k1ALrQREAzVzPzFNUtNFe5HIlQ3+h7g5ZzRUKh/gjchTcpQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295108;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9pL+fygB5ssTmFqgMVv9/XaMYzhrOZx7qK1PSJTEus4=;
	b=Yz7Fn8poFup5+uICH1fHuSMoa+EQv+BL4MMuZRsuETf+P9+Uhe3L1BkLE0CYAqP7WRf5
	 8YWjvm//erSSY+Mu4jXQon5vCruRKFfuF+DDusERDnUhpkBR5YCjVd9sBag2/s39ZYv30
	 MEpGgbAEdrq7Lf2cSSJZvnY+Cjmt1GSA8HL37XODFz46ufZwE9qu87HheT2FYTxSkFiSP
	 IVbhuF1sY9Xp+YdOA9PUx6L+j30wTE+zJf6Yy5n/VgBFuqyAfug1qUMa3BqVk6wxA06/4
	 s3weFQUUxvPTcdmaeGZ3+PPJGsGAVozGGXWRN2BhC3ZIHaZDbnsRoh1tl9HlWuqF9Qg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29F851F008A1;
	Tue, 10 Nov 2026 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295108;
	bh=9pL+fygB5ssTmFqgMVv9/XaMYzhrOZx7qK1PSJTEus4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mQfR8rGBeJhOdBjkMY1Cgp5xAaToZg2VgnMAlOks3igTpCR9WzZH9cnAxk472CzUt
	 w72oTnd53wym4t5Vn9EEA2QpvhPtoyTfZCRuHBPEeNwI+75RDXLfJYGRs2JT8slXtj
	 LkEN0qWgjlGsrzH7qQ8BaG97YBza1mCUojqkzXWiZ9shtkk4ztD8nH11bQjoDO7XF4
	 W3xgrLCBEpN7af0nwx1IqsRE5GOtHgEUrJb1RWFQFgMatiYiWN4r085RgJzcD3e3PR
	 us2vwpdViW4iKwSuBiH/Dk0vdn/3GRGhbuKwtQMZhUGaSOsK2k29USCmTsEl6z8FPb
	 LmX1LjhPOmoqQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B38A048998;
	Tue, 10 Nov 2026 07:18:27 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:27 +0000
Subject: [PATCH 1/4] media: verisilicon: Support holding the CAPTURE buffer
 for MPEG-2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-hantro-codec-fixes-v1-1-0fd5372ce831@gmail.com>
References: <20261110-hantro-codec-fixes-v1-0-0fd5372ce831@gmail.com>
In-Reply-To: <20261110-hantro-codec-fixes-v1-0-0fd5372ce831@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Jeffy Chen <jeffy.chen@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295107; l=2131;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=BG5kaLLN/ROlelCT7uSwGI2mCcFqWk5IizY+1FV3tNk=;
 b=wRvr7eOgQpL3ozh78/XKoaKe6Y/TjXxuVvDD8gNMo57boZzHz3d5hcWVnk9p4hP9YMqQ/K+A4
 kzA7BhShQkqD1UPAkGB7aat6wMVEbMmM0FUKsY+KcRSIslWxWPCYBM9
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

An MPEG-2 frame can be coded as two field pictures, each decoded by its
own request. Both fields have to land in the same CAPTURE buffer: the
G1 and VPU2 back-ends already write a bottom field one line into the
destination buffer and use the current buffer as the reference for the
second field of a P picture, so the second field must be decoded into
the buffer that holds the first one.

Userspace asks for that with V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF, which
the driver only allows for H.264. GStreamer's v4l2slmpeg2dec sets it on
the first field of every field-coded frame, so queueing that request
fails ("Driver does not support holding capture buffer") and decoding
stops. On RK3588 none of the field-picture streams of the ISO/IEC
13818-4 main-profile conformance suite (sony-ct1..4, tcela-8/9/10/16/19,
hhi_burst_*) decoded.

Allow holding the CAPTURE buffer for MPEG-2 too. Job completion goes
through v4l2_m2m_buf_done_and_job_finish(), which already keeps a held
CAPTURE buffer queued until the last field has been decoded.

Fixes: 340ce50f75a6 ("media: hantro: Enable HOLD_CAPTURE_BUF for H.264")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 83af9fa1ce94..822c4b371671 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -513,13 +513,13 @@ hantro_update_requires_hold_capture_buf(struct hantro_ctx *ctx, u32 fourcc)
 
 	switch (fourcc) {
 	case V4L2_PIX_FMT_JPEG:
-	case V4L2_PIX_FMT_MPEG2_SLICE:
 	case V4L2_PIX_FMT_VP8_FRAME:
 	case V4L2_PIX_FMT_HEVC_SLICE:
 	case V4L2_PIX_FMT_VP9_FRAME:
 		vq->subsystem_flags &= ~(VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
 		break;
 	case V4L2_PIX_FMT_H264_SLICE:
+	case V4L2_PIX_FMT_MPEG2_SLICE:
 		vq->subsystem_flags |= VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
 		break;
 	default:

-- 
2.55.0



