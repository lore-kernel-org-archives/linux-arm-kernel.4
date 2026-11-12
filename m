Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543AD606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ys+0UqWl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAHfxLIm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kq6r0CuFxCBn19I4IcceckREbGZbVzcv9t8pYgp1F2A=; b=ys+0UqWlTQdeQDYoLC/0hqI19K
	vQaTbUmiyt4x6z4RXS/gasRDCHC7OB/Zva4JUsSaCcdjHaeIOrWaaYeq+R/BCZF8vgk0S5SVkwULk
	bwmNVy8uF1han93tiOJSQm+HWn0CECm3jOnhLv6GfKBUJ+QQpMIeQE+MpVl8jEvW7lKsjA5POtHlG
	M01iJrtEUEqiJ3r/2uDDSnbFCCk5Xz2qL37TBxBfP4O7cloqNa+vdFE4lpDL1ihCmOVfOxNp8vIjV
	WPCt0VuxYvjelk6pPP5mSu8sn9fGVJgxS/NqTzTNWwlwtvwpxnVbuyVvPVqv3bQ1UQZZ1sB1gBU9y
	T7aHonFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQJ6-00000009AJD-0T7C;
	Thu, 12 Nov 2026 08:37:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQDW-000000097bx-2tvM;
	Thu, 12 Nov 2026 08:31:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4297D47901;
	Thu, 12 Nov 2026 08:31:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472287;
	b=VZ0utsh1rSurgth5PxlSRAfZYzEiiaZ1n9WfXMMiDDBpdrVtwohoTFXhypSkRZ3h19XO
	 jl6C2wbAkZwqsiNwKzDLT32DeLUTEYVVJKnJJ+t4vF6eYCMVLwk3qnQSH/RqwCkdKfUJr
	 OEB/el6R7N9tdoLdTeZudT1T/RFa26geLgvwkrq4Xoy2ToWk9oTzH9NH21fKHqb6v/k9i
	 cuQZyBeH38Hj4rg+gzjEghfAknp69emgzKc+FytVfMKTzc5v/TddWc21LXdKGXpzCr0El
	 CKZY3r2YMJjZE2DJYHrSIwletFg1JldnltQI/oPYz5XNZnOf8HP7VhNHCpZ5airx78g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472287;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Kq6r0CuFxCBn19I4IcceckREbGZbVzcv9t8pYgp1F2A=;
	b=hhEvkaH0S8FA8QTz15XVbjN6vgCKP6i8N/J5Qf6cm2/dSHgymdWEYKVqQvxFrtZ5n6wY
	 Qfa1LFGzbp1XS3mVp56186r+5awWRz0dOJkGcrXAIh5rN0HrIpJus6adZbXCve9N/FgZk
	 WgUDcydmeVzGlLFnZostb0rzjQ24xsaoVHeXmRxoyqtFVGTr4eivuKEftL/pTIc5EW7OR
	 B9GGeOLU95SiksnnlQbAa2Y2NQzBavz0IDnSw+bV+104sUD3qiCZqcGQq6oV7R8zelhTX
	 9IW9MsjxE56cIgG8QBMbQ+pF67y+EOCEYNwP5elv+9+GIZyEIONa6AHoSpYLaI6+2GQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F97F1F00A05;
	Thu, 12 Nov 2026 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472287;
	bh=Kq6r0CuFxCBn19I4IcceckREbGZbVzcv9t8pYgp1F2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CAHfxLImwm/w6LMZEOQs0vfa++W8YLZM2O84WeRSSfuufSdsq7zFemnOe73A/2Cbn
	 PDVjCl+ZcFggufKtZ02glaXKTmslPZkC3t1/BD2lFThqAoNzshkYh+1wRgSyZ0VLgU
	 c/momqbT5R0j+nvQ5JwbJc/jlN41YeVDC/KPTfOqjBSso0PnqsYjqJ7EprjbH9zxKV
	 RscixNgN0JxFeVDe4ULvXeKrlM+SxprGO5C6XlkWMZExtVd5zx5VhOqmtMt5bV5saj
	 PhD9PiVa+uFRrWtzyYPY25LQ23IzLIDeov2vj2PLsaLGSemfIpD2Gn/zAfmfwzYg8l
	 1njgBydm/FyRA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DD950493A2;
	Thu, 12 Nov 2026 08:31:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:31:28 +0000
Subject: [PATCH v2 6/7] media: verisilicon: Don't reset the encoder raw
 format while OUTPUT buffers exist
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-hantro-jpeg-enc-fixes-v2-6-de03e643c75d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472283; l=5213;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=NvWLsoYjF8H/jW8URNFkSbK/PgqFx88YkKipI7WobH4=;
 b=opKVutUysf8SZuTFjmHZMaBipKT2oJM6M2rbma++cqwWub8gooXWEXSmEj9J4EE6hBgRjLjls
 Xo21081UJWCCzmTqp8pNkXxQziJu+aYdWCvUcAHzyK2+ev4PQvkaPu1
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

For an encoder, hantro_set_fmt_cap() allows S_FMT on the CAPTURE queue
while the OUTPUT queue has buffers as long as the coded pixel format and
size don't change, and then unconditionally resets the raw format through
hantro_reset_raw_fmt(). That helper sets ctx->vpu_src_fmt to the default
raw format before hantro_set_fmt_out() refuses the change with -EBUSY
(the OUTPUT queue is busy). hantro_set_fmt_cap() ignores that error, so
the ioctl succeeds but leaves the context inconsistent: ctx->src_fmt
still describes the negotiated raw format (e.g. NM12, two planes) while
ctx->vpu_src_fmt describes the default one (YM12, three planes).

The next job then programs the hardware with the wrong input format: on
the RK3588 VEPU121 JPEG encoder the third plane address is never written,
the encoder reads the V plane from IOVA 0 and the job ends in an IOMMU
page fault and a watchdog timeout. v4l2-ctl triggers this on every
--stream-mmap run, because it re-applies the CAPTURE format after the
OUTPUT queue has been set up:

  rk_iommu fdba0800.iommu: Page fault at 0x0000000000000000 of type read
  rk_iommu fdba0800.iommu: Page fault at 0x00000000000003c0 of type read
  ...
  hantro_watchdog:208: frame processing timed out!

Skip the raw format reset when OUTPUT buffers exist: the coded format is
unchanged in that case, so the raw format stays valid, and the S_FMT is
accepted as the busy check intends. Also restore ctx->vpu_src_fmt in
hantro_reset_raw_fmt() when hantro_set_fmt_out() fails, so that no other
caller can leave the two descriptors out of sync.

The raw format has been reset under allocated OUTPUT buffers since the
encoder was added. Since commit 14b4bd01f8e5 ("media: verisilicon:
Additional fix for the crash when opening the driver") only the
descriptor is reset, which gives the mismatch described above.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Fixes: 14b4bd01f8e5 ("media: verisilicon: Additional fix for the crash when opening the driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 33 +++++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 11bce0cdf4b3..a40abe2c459f 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -471,7 +471,7 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
 int
 hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 {
-	const struct hantro_fmt *raw_vpu_fmt;
+	const struct hantro_fmt *raw_vpu_fmt, *old_vpu_src_fmt = NULL;
 	struct v4l2_pix_format_mplane raw_fmt, *encoded_fmt;
 	int ret;
 
@@ -481,6 +481,7 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 
 	if (ctx->is_encoder) {
 		encoded_fmt = &ctx->dst_fmt;
+		old_vpu_src_fmt = ctx->vpu_src_fmt;
 		ctx->vpu_src_fmt = raw_vpu_fmt;
 	} else {
 		encoded_fmt = &ctx->src_fmt;
@@ -497,6 +498,12 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 	if (!ret) {
 		ctx->bit_depth = bit_depth;
 		ctx->need_postproc = need_postproc;
+	} else if (ctx->is_encoder) {
+		/*
+		 * hantro_set_fmt_out() refused the new raw format, so the
+		 * OUTPUT format is unchanged: keep its descriptor in sync.
+		 */
+		ctx->vpu_src_fmt = old_vpu_src_fmt;
 	}
 
 	return ret;
@@ -643,6 +650,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 			      struct v4l2_pix_format_mplane *pix_mp)
 {
+	bool reset_raw_fmt = ctx->is_encoder;
 	int ret;
 
 	if (ctx->is_encoder) {
@@ -661,11 +669,22 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 		 */
 		peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
 					  V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		if (vb2_is_busy(peer_vq) &&
-		    (pix_mp->pixelformat != ctx->dst_fmt.pixelformat ||
-		     pix_mp->height != ctx->dst_fmt.height ||
-		     pix_mp->width != ctx->dst_fmt.width))
-			return -EBUSY;
+		if (vb2_is_busy(peer_vq)) {
+			if (pix_mp->pixelformat != ctx->dst_fmt.pixelformat ||
+			    pix_mp->height != ctx->dst_fmt.height ||
+			    pix_mp->width != ctx->dst_fmt.width)
+				return -EBUSY;
+
+			/*
+			 * The coded format is unchanged, so the raw format
+			 * stays valid. It couldn't be reset anyway while
+			 * OUTPUT buffers exist (hantro_set_fmt_out() would
+			 * refuse), and failing here after the coded format
+			 * has been updated would leave the context
+			 * inconsistent.
+			 */
+			reset_raw_fmt = false;
+		}
 	}
 
 	ret = hantro_try_fmt(ctx, pix_mp, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
@@ -687,7 +706,7 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 	 * Note that hantro_reset_raw_fmt() also propagates size
 	 * changes to the raw format.
 	 */
-	if (ctx->is_encoder)
+	if (reset_raw_fmt)
 		hantro_reset_raw_fmt(ctx, HANTRO_DEFAULT_BIT_DEPTH, HANTRO_AUTO_POSTPROC);
 
 	/* Colorimetry information are always propagated. */

-- 
2.55.0



