Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587CC606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=osfpKfI+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKkoO7el
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T8BMjQzOIvYi6coC6cfEQ/w65JHYug0nfsYJkwPuKxI=; b=osfpKfI+3WUSjLJVRIDw75I/eU
	1O3zRcXseCh6QttgPek28utFlR/1f0frlrN5sCXEs9XRa7CmO5sQLMhZ9+dG6TCoJfQEasSNF25gb
	KZwpSn1eqwpCqzmGtJc4mpqZqCM5hP4v2Tbb7PbLLZV3r/9PG+IO+cTh6ZXSZUfPfzuTlbTtqDp0N
	4j4Co2Zw0tDpOQaykn4tiS7RNlgKsYiT/w2CQygadxyjs8V65qPTrhXSuKw62roj2VwbWVbKI3Fw0
	0vbYbKECUZw6M0sefiisg+r5eY3QcyiR/m98ZQeBFQhYGjx07Xem9LzX12slNDOWLcoHnMnrxfK5B
	TZr43l7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQDk-000000097qo-0Hhu;
	Thu, 12 Nov 2026 08:31:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQDO-000000097Zv-404t;
	Thu, 12 Nov 2026 08:31:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B4F3E4790E;
	Thu, 12 Nov 2026 08:31:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472286;
	b=sykIP7xz/xF4w91CA3j7wofCv9cPGilY3JxYY79C6vZNI7mYkh+u5TDHY4qIMrJhLwfz
	 YGyG2TR6EhIFmBLpzXOsscwyGUE1z3RKJknmkfhUD/emEqD0psCxt6g+kD3BC50WlLjbY
	 E242StBUfzvzHsmwjdZPzueL7b2oXpVbuvTMMC91UXePg3OX6RyxcNPucB+0f/zPegg9c
	 Hsix7Xh62gogfB5f/VI5kAqfhYAIB9MvmAfyjdLpNb1HfRWquz+j/b7dVnQ0ivn2dPEfM
	 bwsGlmGHlnJvq+0YQUjwWNNGaVfBZC/mDGKCy/NTd9nJTn5DpMlDj8u1TwpJc72ozcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472286;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T8BMjQzOIvYi6coC6cfEQ/w65JHYug0nfsYJkwPuKxI=;
	b=xVbxy98W1K035EfCJ79qa1AY1N5kIcCbWGYiooHUQ/q44kS69UE/VEKfAch8+Jy+aL49
	 kg6T8bqH1wd2UKwB15Fd3IrAJ/Rd9tqq51m7HbCy0XwujrvrDFMhzTOHP7UHfPhma00gn
	 NrpemFZ335pzIOOzEigVqV4nazTvWG6QBF/7PeR5FHjVXDtwi1TUiM+/5utCn0V3zm1/I
	 XkooTBp4r1lKWaofRXq7ceDyMJfATuz/SsbGzhSGM0RkIgGhjS0uH4nhqdx1ZkXSdf9/i
	 1XtorptmPudhuJ3xCMQFIVjcy8vMb5C6bEWfwJEYljNU1VuQOfqzL83OOQ1itFcMkrg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F1F01F00A0C;
	Thu, 12 Nov 2026 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472286;
	bh=T8BMjQzOIvYi6coC6cfEQ/w65JHYug0nfsYJkwPuKxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HKkoO7elsB94ZGQCYRjco3GYvB1q65UQs/Rl1ywIB9mVO4XFejFJPYhp3qjJ1uB1l
	 YRFAch1cH31SrWK/kuYsZ2Ti7LguoAEmW8bR6PrddBYZGIazXw+KIoHiLTeKLrmgHW
	 y0ln7TwgIWL/1oL22f00NVAyYiy6PyaoYYigtGEJg7G6z7xzwxeLxAHJ0W52xvm8xh
	 V15U2J2ddU2mQwE6WimnmCNwuKKF0C3dMz0yYlrYlzmBUFVN0qkic6um7QCSxg0mcL
	 lHx2BL1Nkbk/xEfUHGUVz8SXBIE2mUBHtmguRIpWaB7JkVh486Bl2In0MBPn2IfMce
	 2KX08+9sHde3A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F0BFA493A6;
	Thu, 12 Nov 2026 08:31:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:31:29 +0000
Subject: [PATCH v2 7/7] media: verisilicon: rockchip: Limit the JPEG
 encoder to 8176x8176
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-hantro-jpeg-enc-fixes-v2-7-de03e643c75d@gmail.com>
References: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
In-Reply-To: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472283; l=2124;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=YcQepcs/kiqGO0VYJKSScKTM3/q57290AfxfFBFuGJE=;
 b=4+pgFAUagU+KX+Vx6sSRS8NEXGm0nyaHI5g/Q8ItH258bV5gY+qzCZoiXColwnKG9bJZ5b+Fj
 WOVflPpuviJBdv73Rij/K3V/U/S4YTCb9BoIHvdyNlyiUjwPjUye+YA
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

The Rockchip JPEG encoders advertise frame sizes up to 8192x8192, but
both register layouts take the picture size in 9-bit macroblock counts:

 - VEPU2 (RK3399, RK3568, PX30, RK3588 VEPU121): enc_width is bits 16:8
   and enc_height bits 28:20 of the encoder start register.
   rockchip_vpu2_jpeg_enc_run() masks the counts with 0x1ff, so an 8192
   pixel (512 macroblock) dimension is programmed as 0 macroblocks.
   Setting the bit above each field on an RK3588 VEPU121 did not give a
   512 macroblock picture either, so the fields really are 9 bits wide.
 - H1 (RK3066, RK3288): the height count starts at bit 10 and the width
   count at bit 19, so a 512 macroblock height runs into the width field.

Limit the shared format table to 511 macroblocks, 8176 pixels, so
userspace gets the largest size the hardware can encode instead of a
corrupt or timed out frame.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..f8079f96c398 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -20,6 +20,13 @@
 
 #define ROCKCHIP_VPU981_MIN_SIZE 64
 
+/*
+ * The H1 and VEPU2 JPEG encoders take the picture size in macroblocks in
+ * 9-bit register fields, so 511 macroblocks (8176 pixels) is the largest
+ * width and height they can encode.
+ */
+#define ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE (511 * MB_DIM)
+
 /*
  * Supported formats.
  */
@@ -52,10 +59,10 @@ static const struct hantro_fmt rockchip_vpu_enc_fmts[] = {
 		.header_size = JPEG_HEADER_SIZE,
 		.frmsize = {
 			.min_width = 96,
-			.max_width = 8192,
+			.max_width = ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE,
 			.step_width = MB_DIM,
 			.min_height = 32,
-			.max_height = 8192,
+			.max_height = ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE,
 			.step_height = MB_DIM,
 		},
 	},

-- 
2.55.0



