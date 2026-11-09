Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A214606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 18:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ADzEKk3Y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jo52kTCU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PRBCcyxG7vdWjrF56CJga6rW7J1Hfqypo5bq8n0AjVE=; b=ADzEKk3YB130OK
	MajZgRMcNPVYTe+2Vj/7ZTmi4l63TiRGdH4vt1VRrdZzX8/PYHsKqIS1a7fvFf0Mlj5YPd+/7Cqna
	JYUb/qTrwAfADoolpDTlmx0Z9YqL8aoagfcYtFl4Qxy4E2gX6eVvsB12OHNRgVN50cRI8H89Yw0Im
	5Yz4o9EUWu7vakHgql2121PhegfadVyPPOQbWxxX0N81inbr8v1P02/84AOa9WI8izZyHfQ1BztPI
	9BFnS7KliNuNzpBa2oTtyTIB0AFINxgTgUURg/JdO9k6++RnyPHaXfM8Le0BKbq0INSBnr7Z6ldT9
	kS/+v2x/tXPPLU52uzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWT-00000001OM4-2Zgd;
	Mon, 09 Nov 2026 17:51:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWQ-00000001OJS-1oBj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9111625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246668; x=1794851468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRBCcyxG7vdWjrF56CJga6rW7J1Hfqypo5bq8n0AjVE=;
        b=Jo52kTCUEOk3xkOn1Vr4ew3p6r8YRXuM/EHrh0QhZFF86DoutJ5Vcd8AqpMx6aPUgn
         //I9n2wZxjO1SsaLqgoXa57XKix+u+delwHYA4qgdvSUvWY7P8MeB7tPGqz5esmrFDTd
         3UZMN1Fv7bZwdzvWcj2Cr1TkOMLvuyI178eBbynKLPzeSqP4FLePLyAGGwzvLCJs06+Z
         PvsvALj27/HYU+jUgYQ76ARIr/TO5SKwll4Wf3z1j0z9lEhDE1ElkxcU4d3WPenZnoNV
         I1QUgkFWVlKvoWtjzoP5EBtE97KXMN29mrRu6iES+h8gkmAcr3PM8TXa4tPE19Cpp4Gg
         apkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246668; x=1794851468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRBCcyxG7vdWjrF56CJga6rW7J1Hfqypo5bq8n0AjVE=;
        b=gRsZKInDd6YcuZtsID6VJTWYLvD1XGjKq9On7zp8fk/lpLA3JxkKnRRmRwSWiBsh1h
         logAiwaP7iX2h0xyeSxEPfBrRLkfHuWpCBg7BMtm96rvi24rpfONhtrkiBVXk9psaxQo
         gm4B38wQ1+HOoagAdtLuHqsWt7Ke3fkk/40HmWu1KUZFosPGwTzClSsN1dEV3GIbDPyl
         zAvN7/kmO5lNuxffFMoe48ea/6FV5fR28VlMZ5VsetwP4pPOBI9viaYkTjAVVMWxD9JJ
         na6RRBNE2zExk50UomUYXcdc2tZghFTRhXfEgAavnmk6q0EyY3SzJd3zQ8Na344fEGGc
         hpaA==
X-Forwarded-Encrypted: i=1; AL+hErGWiNy1o2uYmoSl9g5HELnlKmjjxwibQb/ff0ePXAAN9gBmlCPUbTrNVZY7VN+NZTBtfbffvuKfoV04gAlwDEX7@lists.infradead.org
X-Gm-Message-State: APuU4Z8zviHjNL+aDv0UhabsmD8B01W3995UTkLZ3zTc0cnRaRqL3Fu7
	OyfEdfpCy9KSEYk9faHhHrzdqkn+yeJXzxceqiFIqlB47PkQWdL875qd
X-Gm-Gg: AYBFou1vZVb1R0FGIPntS5U3ALN5iKDBmL41DywSSQEJhzZOozQc8V/K48wgpQ8Bxa5
	YxPhE/KlhyPkRCNQuLiSMFuM7HwKfjj3rXSnNWTI6IAXtlVvWPUozAuaHYxqC6jjwkJXelPpRI5
	3nu/OEscB6KyALwD2TQOSv9pif2S0L3Ngm0E+VVAle2Kst0oOST/GpbZippS1iLypZ84Apbl7Pv
	vbfcaArjYm2pWx0/+UAr7/WKpBvQ/RB1uf0HGzZqzkggX861cQx6FDexcJMo9z6QsB9jJpw+OVU
	fXJPM8oOarisIqn+RBSD1cYzRM8aqYSua+/O6k7deIXTd5KVjuZLRFNIqX266bBcujkQZk/w1hi
	NXuTQuGEsV2dofn4P6HsbbMMIQvGYI2xHHnrOjkUpsu3/1LHEAwU0EHKWDa67FsnLIxOLfbxNUy
	wJy1Tbiw/GsJWWx1NGXX7zG3giNTRJ/XVHSSTB2VrSOlvwyRoHDduZEB2fnbzqmY1zfhJnn3TLm
	PgfWCugmVvfRRYjiyHucrI7V6VTsTJvq6yBC/RohEnT0bqKqoF5uHKS+v42+W7ncma3vxb5yNqk
	+OM9aROaNLz3tszNIVklKb/Assw6zvpiVeYNmtfGT3Ut89lSwAlPqUff6U6tFtrPD4Qwe4WJPa2
	5F4tL+9dUiLpMEJVezCeI9ThdudLK8BNqEXvfHdRtbW5ooER8DvKac1ssucBkkfkmtbO0i/xBNK
	oAGrtSkuR6nwfRv+I/qtYDLYU8nHCX7F9/i/VCA2wezwpseMdEW4jCV5WwL8TLRSfpIBfwK/cU7
	1N6zNSobSYpPIdkqs5P/fDckZi0d9VrdKE12Tl8iiSKwx5Tgio=
X-Received: by 2002:a05:600c:1906:b0:4af:79ee:f660 with SMTP id 5b1f17b1804b1-4b963c8153cmr86011895e9.31.1794246668365;
        Mon, 09 Nov 2026 09:51:08 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:07 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 02/11] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Mon,  9 Nov 2026 18:50:07 +0100
Message-ID: <20261109175016.42061-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095110_510755_805AB64F 
X-CRM114-Status: GOOD (  25.74  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H.264 decoder takes the picture size from the SPS, and the HEVC
decoder the position of the slices. An SPS beyond CEDRUS_MAX_WIDTH/HEIGHT,
or beyond the capture buffers, makes the hardware overrun memory and
hang. On H616, the JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056,
528x4216 and 4216x528) leave the hardware wedged, so that every
following job times out until reboot.

Reject an SPS beyond the hardware limits in try_ctrl, and move the
limits to cedrus_video.h for that.

Whether the picture fits the buffers can only be checked when a job
runs: the SPS can be set before the buffers are allocated, while the
OUTPUT format they are sized from can still change, and a request
doesn't have to carry an SPS at all. Check it in the setup callbacks,
so that such a job fails with an error buffer instead.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 16 +++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 34 +++++++++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 ++++
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  4 +++
 .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
 6 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c3331b4f3f02..197213911bf7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,6 +28,15 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+/*
+ * Reject picture sizes beyond the hardware limits. Whether the picture fits
+ * the buffers is checked when a job is set up, see cedrus_check_pic_size().
+ */
+static bool cedrus_pic_size_supported(u32 width, u32 height)
+{
+	return width <= CEDRUS_MAX_WIDTH && height <= CEDRUS_MAX_HEIGHT;
+}
+
 static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
@@ -42,6 +51,9 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+		if (!cedrus_pic_size_supported(cedrus_h264_sps_width(sps),
+					       cedrus_h264_sps_height(sps)))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
@@ -52,6 +64,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			/* Only 4:2:0 is supported */
 			return -EINVAL;
 
+		if (!cedrus_pic_size_supported(sps->pic_width_in_luma_samples,
+					       sps->pic_height_in_luma_samples))
+			return -EINVAL;
+
 		bit_depth = max(sps->bit_depth_luma_minus8,
 				sps->bit_depth_chroma_minus8) + 8;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 54f867949fba..c2318521d7e5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -274,6 +274,40 @@ cedrus_is_capable(struct cedrus_ctx *ctx, unsigned int capabilities)
 	return (ctx->dev->capabilities & capabilities) == capabilities;
 }
 
+/*
+ * The decoders take the picture size, or the position of the slices, from
+ * the bitstream headers. Check that the picture fits the buffers, which are
+ * sized from the OUTPUT format and padded to at least 16 pixels in both
+ * directions, so that the hardware doesn't overrun them and hang.
+ */
+static inline int cedrus_check_pic_size(struct cedrus_ctx *ctx,
+					unsigned int width, unsigned int height)
+{
+	if (width > ALIGN(ctx->src_fmt.width, 16) ||
+	    height > ALIGN(ctx->src_fmt.height, 16))
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline unsigned int
+cedrus_h264_sps_width(const struct v4l2_ctrl_h264_sps *sps)
+{
+	return (sps->pic_width_in_mbs_minus1 + 1) * 16;
+}
+
+static inline unsigned int
+cedrus_h264_sps_height(const struct v4l2_ctrl_h264_sps *sps)
+{
+	unsigned int height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+
+	/* Map units are macroblock pairs, unless only frames are coded. */
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+		height *= 2;
+
+	return height;
+}
+
 void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id);
 u32 cedrus_get_num_of_controls(struct cedrus_ctx *ctx, u32 id);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 892193c12b2f..e8229c60d3f5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -518,9 +518,15 @@ static void cedrus_h264_irq_disable(struct cedrus_ctx *ctx)
 
 static int cedrus_h264_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 {
+	const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
 	struct cedrus_dev *dev = ctx->dev;
 	int ret;
 
+	ret = cedrus_check_pic_size(ctx, cedrus_h264_sps_width(sps),
+				    cedrus_h264_sps_height(sps));
+	if (ret)
+		return ret;
+
 	cedrus_engine_enable(ctx);
 
 	cedrus_write(dev, VE_H264_SDROT_CTRL, 0);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 6c643862ab73..aa772a8d71c8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -445,6 +445,10 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	cedrus_buf = vb2_to_cedrus_buffer(&run->dst->vb2_buf);
 	slice_bytes = vb2_get_plane_payload(&run->src->vb2_buf, 0);
 
+	if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
+				  sps->pic_height_in_luma_samples))
+		return -EINVAL;
+
 	/*
 	 * If entry points offsets are present, we should get them
 	 * exactly the right amount.
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index adc7f255d7cf..2521315abdb7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -29,11 +29,6 @@
 #define CEDRUS_DECODE_SRC	BIT(0)
 #define CEDRUS_DECODE_DST	BIT(1)
 
-#define CEDRUS_MIN_WIDTH	16U
-#define CEDRUS_MIN_HEIGHT	16U
-#define CEDRUS_MAX_WIDTH	4096U
-#define CEDRUS_MAX_HEIGHT	2304U
-
 static struct cedrus_format cedrus_formats[] = {
 	{
 		.pixelformat	= V4L2_PIX_FMT_MPEG2_SLICE,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
index 8e1afc16a6a1..367e52158f01 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
@@ -22,6 +22,11 @@ struct cedrus_format {
 	unsigned int	capabilities;
 };
 
+#define CEDRUS_MIN_WIDTH	16U
+#define CEDRUS_MIN_HEIGHT	16U
+#define CEDRUS_MAX_WIDTH	4096U
+#define CEDRUS_MAX_HEIGHT	2304U
+
 extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
 
 int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
-- 
2.43.0


