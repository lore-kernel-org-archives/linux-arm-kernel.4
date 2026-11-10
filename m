Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D5C606B41E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZuYYMDBm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ennfD2TT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CXcWjb7Nzc+RNDNk2ZDTJ59JBkPVPgLcutR3s53+teE=; b=ZuYYMDBmS5ItI3GP03wt/gbX+D
	dzOR5zTeIzVWeNUGcHvQtg5aQ7O2qM16UoMb4iPCEtOtw66l98CadIEFe7uF4XcgXJZ0X/gEm3hA4
	Lekw0IYEg9rNDgSQBn48PV6dY6EBP6OhM2vnHiHaI1SXtA6CQVB15HUQQ7mwyGH37rMn66RqqNugx
	/OmvH5jOsklf2s6n0z+u0euYfkuMbIAE06vX28g6Lrcs8exI1akYpGTxou5M7S+0/JuFZLePWh1WL
	CIRUUMBw8q7e3zUSCPGEuujP2TfFLq5zbt5Nz2LxlT9hOfDIit/QroCZl4DjyYJosJkjDDoRbeYOJ
	ief73vYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg8E-00000002qU3-2MxK;
	Tue, 10 Nov 2026 07:19:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7j-00000002pla-3K9B;
	Tue, 10 Nov 2026 07:18:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D521411CF;
	Tue, 10 Nov 2026 07:18:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295111;
	b=c3bwBFdvJihoE3uK253J/ZgYQHs13MDojSWvLIKs3wQ1VAUMyvapUAag9VN39HJTFsRt
	 DD15aGd1xvpJCX9nCGuzCtdNFz1qmEH6fGeQXl/f/dof9qMjoFRcVIGuHODJKM1488ft0
	 FNpD+HkG0qs26U6UsOMOYFbo35lbMVZvK88wwdlntfn/go1ZRa85DdE05TMCBC+o6jU6P
	 8EaMj15I0hDPGmhk6+Og1f1jID+e2GV+9lFNj/RKhiJcUkswnJh97+u30S+saqnAcFHFj
	 KR0w/DevEJ8fLfJsendZH1QX2RnYiL+bX9567+FPXhh9FKjo5n8nWtW6aTPXw7HXkZg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295111;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CXcWjb7Nzc+RNDNk2ZDTJ59JBkPVPgLcutR3s53+teE=;
	b=Fqpm0Wg4NbrFSmmEspeThQfoW62o5veiUdKWS9U3W1LM3mYiAoPfZKM3AbeuhXBEFXB+
	 ABLKBtxf3/uzK/yqK03ue2fy6I1CUhM/wro1bKjfJC88gkNrVruZhvZ/2kahXMwPlTodL
	 IRewTYn+6n2aLeuNWz7qWjbfAM0QXXXlP8Qix1fqTX1RQAjk1n5To0k59dN671dYHS2o3
	 XDEaCekpr4w2yNwdOVButwJIRg7XTcinqG3oL5GZHZgGv1EH5UbGvyswe8BjJLIoloNog
	 ALQH0l0PDCiGhXyECmj40B1FEGz4KbkZna+yxxut4sff6QjwGZBUFq+cTpv/HDRJYLQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D55871F00930;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295111;
	bh=CXcWjb7Nzc+RNDNk2ZDTJ59JBkPVPgLcutR3s53+teE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ennfD2TTAsOfpeAlqcSaIQwU/x56IET8kytZAIprxiDaX11qufathM7zeLyymBjfx
	 zPmsDHE0Mzg8ABWqvqPbWqo+g7I2hYsXejl0+8hNMADCMVOGrwBurwJjA2O/aY9CYD
	 BOmVx2eWxbgVrbpDKKoG5Yiw5rtz573/VYrx1OisTn8+KXqvbS33OiuTuLmub1Ms8F
	 UelErpSYwZ81kai6J/Xbm3foGQ03QZ/3rDtELDMN9wv7pOAy3F/EZK4EU4vi0C2BJg
	 Ff+XBB11mlSqlYsdPzNyRXxfJCw4prfzcBxSc4CzStKHrped9MD1L4ChHtcrREHdD8
	 FXATjt1hTGBQA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 69174489AD;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:30 +0000
Subject: [PATCH 1/2] media: rkvdec: vdpu381: Compress the co-located motion
 vectors of H.264
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-rkvdec-colmv-v1-1-012b84ea43f7@gmail.com>
References: <20261110-rkvdec-colmv-v1-0-012b84ea43f7@gmail.com>
In-Reply-To: <20261110-rkvdec-colmv-v1-0-012b84ea43f7@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295110; l=4313;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ybXnDgp5I8D2JJsP+6qloNGqCzU5IJqFRabb2XdAB/Y=;
 b=HaXOWx//OEJFbzyvP1ryFMhNtoiX9Vl9j4SpdcMcbIXsZVkjTKblV4ft4iZDUIWhKlkZfVL8g
 r7a8M1zPurnDz3MSOd9OlUMaQ5ZmLQqgXZBtyrM4c2dWQNi5YLlegx/
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

The VDPU381 can store the co-located motion vectors of a frame
compressed (reg012 colmv_compress_en). The vendor code (MPP,
hal_h264d_vdpu34x.c) enables it for H.264 streams without field
pictures or MBAFF, and for HEVC. Mainline never does.

B-frames are what limits H.264 decoding at 4K: the core is 99% busy,
and a B-frame of a 48 Mbit/s 4K stream takes 16 ms of hardware time
against 10.8 ms for a P-frame and 7.0 ms for an I-frame. Storing the
motion vectors compressed cuts that memory traffic. Decoding the same
240 frames to fakevideosink on RK3588 goes from 65.4 to 68.4 fps at
3840x2160 (+4.7%) and from 214 to 234 fps at 1920x1080 (+9%). The
decoded frames are identical (same checksum for all 240 frames, and
bit-exact with FFmpeg).

The compressed layout is made of 64x16-pixel segments, each with a
header and up to 1 KiB of payload. How much of that is used depends on
the content and can exceed the uncompressed layout: the hardware wrote
up to 556128 bytes compressed against 522240 uncompressed for the
motion vectors of a 4K HEVC stream. So reserve what the vendor code
reserves for the compressed layout on VDPU381, which is twice the
current 128 bytes per macroblock: 8.3 MB instead of 4.1 MB per 4K
CAPTURE buffer.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 10 ++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c        | 18 +++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
index b961fddc8583..06d83a6ed617 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
@@ -237,6 +237,16 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	regs->common.reg011_important_en.dec_timeout_e = 1;
 	regs->common.reg011_important_en.pix_range_det_e = 1;
 
+	/*
+	 * Store the co-located motion vectors compressed, as the vendor code
+	 * does for frame-only streams. This cuts the memory traffic of
+	 * B-frames and the hardware time of 4K streams by about 5%. The
+	 * compressed data fits the space reserved for the uncompressed
+	 * layout. Field and MBAFF streams use the uncompressed layout.
+	 */
+	regs->common.reg012_secondary_en.colmv_compress_en =
+		!!(run->sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
+
 	/*
 	 * Even though the scan list address can be set in RPS,
 	 * with some frames, it will try to use the address set in the register.
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index fbcd0f175ad3..5f7e876da6eb 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
@@ -93,6 +94,21 @@ static u32 rkvdec_colmv_size(u16 width, u16 height)
 	return 128 * DIV_ROUND_UP(width, 16) * DIV_ROUND_UP(height, 16);
 }
 
+/*
+ * The VDPU381 stores co-located motion vectors compressed, in segments of
+ * 64x16 pixels, with a segment header (rows padded to 16 headers)
+ * and up to 1 KiB of payload. That's the bound the vendor code allocates;
+ * how much is used depends on the content, and can be more than the
+ * uncompressed layout of rkvdec_colmv_size() takes.
+ */
+static u32 vdpu381_colmv_size(u16 width, u16 height)
+{
+	u32 seg_w = DIV_ROUND_UP(width, 64);
+	u32 seg_h = DIV_ROUND_UP(height, 16);
+
+	return ALIGN(ALIGN(seg_w, 16) * seg_h + seg_w * seg_h * SZ_1K, 128);
+}
+
 static u32 vdpu383_colmv_size(u16 width, u16 height)
 {
 	return ALIGN(width, 64) * ALIGN(height, 16);
@@ -1700,7 +1716,7 @@ static const struct rcb_size_info vdpu381_rcb_sizes[] = {
 
 static const struct rkvdec_variant_ops vdpu381_variant_ops = {
 	.irq_handler = vdpu381_irq_handler,
-	.colmv_size = rkvdec_colmv_size,
+	.colmv_size = vdpu381_colmv_size,
 	.flatten_matrices = transpose_and_flatten_matrices,
 };
 

-- 
2.55.0



