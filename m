Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0768606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v5P/rjsj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQTNjxpd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GSMh+74fPK0ymy278CPAuF9fN6B/X3Bftnl6WSY5S7E=; b=v5P/rjsjNRD6HrQKvo0fJFzEqu
	bSYAJAEs4/CXe/B/n1QV5Zu6QDL9MYwcJQr6lypnTjMOlxnnjGpChKcP/JnKeOqw6JGCam9RF7eZA
	GLRSfCoKrRI8eSB1Dl2s1M3e88mNKfQhKRJ/FqSDV3vn7uL2/qOtQDXI5zt6sMRLontvfIwAj4tk8
	qCh1hEYzT0LQf3cJzsaW3Ll3+S4jlyMcc2kusb++l9A/scRwjFc4Cr3sto/wfBJKW61QQbflJm4XL
	XQc2tBEJLZoFlVYmRo7qnHzXG4nQ1jDd5GR/JClJNKIfO9/mRfLhyr7wkuJ5W3nKc/JudPn3Sque5
	Hp+d8gtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg8D-00000002qRb-1qDp;
	Tue, 10 Nov 2026 07:19:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7i-00000002plD-19EJ;
	Tue, 10 Nov 2026 07:18:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A19AE637B0;
	Tue, 10 Nov 2026 07:18:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295109;
	b=g/yoGwLfsWfa3IXeFqiholfUNZKt2EGIt/df8K9QKsFqOiWY7cQHAHXXAePJs5Sg+dRO
	 So9KP2o/WuWftIa1AjBC9tkCEyK59tEK4iJRZKOztNbzq++ocvxzMirB1qXL1TbOpBkZO
	 ee+5VbTuaQvikg3NHb2+z8RDWmU1HligOPcI7ghmP9cLG1kmoD1J3L2KVOSOA+35+Dcde
	 qPkdiMS0ghPUISs6Uu0TM2oHn1a2+Xgt1769NWhsGSJ/I7GDSGo4jUQAsiIFzL6PS3is7
	 tLUMfC5iXOip2FNJjmyQnPdb0JovGdRKMjyPcsQBI43t5vYThjJiWgFI26y8USgiVWw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295109;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GSMh+74fPK0ymy278CPAuF9fN6B/X3Bftnl6WSY5S7E=;
	b=TJsFEhYexWoHqgBQpFZWqyINRhXoZWWvR+GHwpHBNGXrJkVxjKFXwyYqZwL7AW5q1dZA
	 ZGuRTJNPHl83eGh8n+zraBG4QpNGQ+HaGyKXVbWkQGad9BwG70vnrDl2kE0bfJxAjVf3g
	 l7pFAPzvNLSm2bg6vOYziokkbEUrc8i2p8MshmdPiwxbXEQAdNtxH6r+v/gDA2jglmI5r
	 XYR655oMk7LXdj8cRDnNOwQK1FAg4mh4WlHAwUn0c31V4Sb6m0fmSg61XHI1beE02D2BZ
	 i3+6Ged/s2G9I22B4kKFy+79bJMxVHcBz3jMa+cI+7gUMhtVZWDIWhvV8wAoe9u668g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D86A1F008A4;
	Tue, 10 Nov 2026 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295109;
	bh=GSMh+74fPK0ymy278CPAuF9fN6B/X3Bftnl6WSY5S7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PQTNjxpdmFfyeqRL82uP0aXDLlP010hsPTwQzVvM01tEoRYD86r9NklwFyZpxky+5
	 qgY0MBCikCRiyObPfSvzEqBHfmwhlvO4K7CA+wuhxYIAW3MDP7CU+Q1DYinGWZQDEt
	 g93b+t4XIawcotOxUbUhc6VtzK6H+bWuID6Rbu688QR24A+vrkIAdezgebJl39RNhC
	 yEzk10FGNiIqb6rWpZT4IICJZI4ctMzkmsWHDYP+dB1OfJK62FqWEOoRot742r3CPm
	 mYmcu/iYvwZM/wPczm2xF4mbEdJN8KPFiQQc6vrMJviZc5IPa7dnzCDNkJyxFSAHzF
	 SyIZXZiSRNLvA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D6B87489A5;
	Tue, 10 Nov 2026 07:18:27 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:29 +0000
Subject: [PATCH 3/4] media: verisilicon: Don't offer VP8 above 1080p on the
 Rockchip VDPU2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-hantro-codec-fixes-v1-3-0fd5372ce831@gmail.com>
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295107; l=2123;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=EXI8QBEeHs1R1u0NRn+cDDndC1H6YMS5/uVvMAcEFAg=;
 b=m4jnbHaknfIBjsaMF7gll6ze3KeL+9wDGhUJowJvUWrLufyEswgM3m6nX5sHrSaksG/83qNC2
 jyJ2Yoqy9NxCbqgeusDMt43iYdOG9tPyDN2VW7BiVS6wMBmkyprlDYJ
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

The VDPU2 decoder format tables (RK3328, RK3568, RK3588 VPU121) and the
RK3399 one let the VP8 OUTPUT format go up to 3840x2160, but their only
CAPTURE format, NV12, stops at 1920x1088, and the CAPTURE size is
clamped to it. A 4K VP8 stream is therefore accepted on OUTPUT and then
decoded into a 1920x1088 buffer: on RK3588 GStreamer v4l2slvp8dec runs
into "gst_video_frame_map_id: assertion 'info->width <= meta->width'
failed" for every frame of a 3840x2160 stream and none of the frames
match FFmpeg.

Nothing above 1080p can be decoded with these tables, so don't
advertise it: limit VP8 to the 1920x1088 of the other codecs and of the
CAPTURE format. Userspace that checks VIDIOC_ENUM_FRAMESIZES, and the
S_FMT clamping, then know that a 4K VP8 stream needs another decoder.

Fixes: 73fb5bfa53e9 ("media: hantro: Support RK3399 VP8 decoding")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..2b6242c1fb86 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -274,10 +274,10 @@ static const struct hantro_fmt rockchip_vdpu2_dec_fmts[] = {
 		.max_depth = 2,
 		.frmsize = {
 			.min_width = FMT_MIN_WIDTH,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = FMT_MIN_HEIGHT,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -315,10 +315,10 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 		.max_depth = 2,
 		.frmsize = {
 			.min_width = FMT_MIN_WIDTH,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = FMT_MIN_HEIGHT,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},

-- 
2.55.0



