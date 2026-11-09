Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4C606B56D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oKg4M704;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMMHTV5k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=; b=oKg4M7043pMbJd
	831suAUf5pmlPVKFVpuldvpowmD7wGqrcIWXKnbZnUgZnLkuGFHkXrw1PZhxTE6Mpz1XLN7TgxcQq
	VyyIOAR9CIUQcbLxenaaSC8LubW+/K0fIanHaYNvaCwgeB8VuaTCDIYBePXFeRy4XuHIEs7eDJ9au
	rZ1Okc9bhp1iLP8Vy1LXgDO4XyHH36K6XYjgY2uuKFi27hJydp1oCQH4JsgZTMY5G5hvBuz1TkuaS
	yKZT8V2sBpERhn0Zpm87PN5TMyAY5thKIJnjdOppLsDMa6XFMVVjgJCJKB5ABLBmIKKiU/TNyndWm
	bP8SA6aWIrh54jrxYAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWi-00000001OcJ-3cFo;
	Mon, 09 Nov 2026 17:51:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWW-00000001OPd-2pXG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so14301005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246675; x=1794851475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
        b=KMMHTV5kq/5jXEgFZ4rtBMz/35s+tMY3lPI3F0sFZ9bFxISfnm50tCJz7DUKFYeT7I
         WObO6W5MTMP3vrtxYnwoJ+NmvLz4+I6b8EE7/hsCuVVlLB20yCZcl6FAmBkQcTHQ14XS
         5/Pff4LQOv0gHeNleWEksxkvHCQOC0JoCtbBFIngkEjsObfXOxe5L8yhPtgYpJF/RHqH
         5dQgeKLQqvK5Bn9plklKPa866oLQmorn7+gbVbnPWqKaDOQgKJYv+Omnv8rmmX4KwW03
         LR9vFjFxFENRABVc9SNPbecJJuP4cXajfWIjGaE9APwlYGSWNGqzKI7D6iJd4t6ivxwZ
         b9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246675; x=1794851475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
        b=De2f1OKB3CGbx9uOwG/JTxK4NWzcBRtbW//m+fvxsdCi1AGlK7zexBeKpUJae3/5XJ
         meSisjqYhBCQ2G7jQ4mxGNAqYiZekRkMewYxDARtlf7mJSjVbO8nh0xt7o8IJgqueKDP
         daNwAOVmhjUdVDevPVhLJW0z0vtipIqhFx2DtmQ0EkJbWKeg58ukEK/ERHQyi5haKLwP
         ++Ty/K/8TfZb1jof4gV5jUukvlg5hYH07cocf5YsxcRpAnISaWdzfE52dlaeoriLWZ07
         jX5LCmyuL7DftAwEOWDhL+cojvHhU3CiLJQtjfPnssio6O48dTNPljv4ZJSKZnKif957
         hHxw==
X-Forwarded-Encrypted: i=1; AL+hErH3uBypUdHc03buA9blgBKve0X8w7hPeYOJUZy/jiZvq/loS61OlZwIJGSRIgygmZA2AmiIv3VOihZUAGULXZm3@lists.infradead.org
X-Gm-Message-State: APuU4Z96oBrtx+JnzDFXLSNjCY5XsOuozTFC9KCQDOrVJQjTV1viLRJB
	FA+LEQvLfYQZsVjQfRY9MrwWdEtEHHkIBUwVhlJ7lLAE4TUAi4lHfBJC
X-Gm-Gg: AYBFou3MHFfSP+wR729NlF5IyPFuY6nVTpit1XCSLrWmiwA+x+VaZc0cZr2pbzkEYxh
	k0pUmyGyG1bdrtCzXXgSRoyRW81hQS7gDpRM+vv02lN/z9ZKL2oGhdvGh40XPPb8sFNIcSVOP24
	LOM7dvlTlK/dyFt0pxekeWs/pk+eVL1HCIM2awdIWwnZeTioX5kGAlFv0WCWaTBUikvGpfnikO/
	uGoY5sZmG1zV2JG53vZbNhMAMsYjiwV2a5T1CWc+/Re8JGrWdDhZL5BVThvGC2NG7La5vnteMDm
	6g0p8FSjJeIfq2l4nUPtreDPahabwg7Ky0KgS9Cx41Btf2afoKTfhsM2EkLyLgI52vhKvzjhwFe
	e17QaUWo7qrPTo3+dfxCmzFjHbxakJqORQiUdBrO7Qp2tlrP/ukQBpiXnALvDl9PiOlq06ysw8H
	CnnoYKafaFRN1nvt42lmd9QSuTU2Cbc/OMZwAi0t5lZzbQ2MRoqt6FN5SnuCNWI0zl5h3NLuWqG
	33kBBeJmheqjluJgcfU1AI97t+MNbQnnZ6u57/P78IAGZGOD25FOL9rbChubkp0F0LYHP4UfHwn
	isUJv/R7jE2Ou7WDkHkIahkTNS7cU0Lh94B21eaug8yHLvBKVGcYlWmV4NEcoYhgZhFc8r7ptrB
	jqqL8uRi0K1uRamZa2NFp9+BA3I8Jj/tCFRQG/BOLzXmFjwRitd6f48oQqjHwnTKNt0R46Qgnb0
	MLhWKZtM6d+g1aqhakubRQEedx5QnMbnqzMOj+6DP3EmoDoBRngWkjxD9rjtmgvuRKyQsgpyeeT
	HRP1eMLuVIZq2tkuDcpl89G2VVeqqQdwLcbxY68U10kqooRnNU=
X-Received: by 2002:a05:600c:1d08:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4b963c8156fmr85596545e9.28.1794246674551;
        Mon, 09 Nov 2026 09:51:14 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:14 -0800 (PST)
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
Subject: [PATCH v2 07/11] staging: media: cedrus: validate VP8 frame size
Date: Mon,  9 Nov 2026 18:50:12 +0100
Message-ID: <20261109175016.42061-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095116_785487_16396BFD 
X-CRM114-Status: GOOD (  17.22  )
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

A VP8 key frame can change the frame size. If userspace doesn't
reallocate the capture buffers, the hardware writes and reads past the
buffers, which shows up as IOMMU page faults and decode timeouts.

Like for the H.264 and HEVC SPS, reject frames beyond the hardware
limits in try_ctrl, and fail the job in the setup callback if the frame
doesn't fit the buffers. The VP8 frame size register holds the size in
8-bit macroblock counts, so VP8 frames are limited to 4080 pixels in
width.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c     | 10 ++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 197213911bf7..6c6aa45f5f96 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,6 +28,8 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+#define CEDRUS_VP8_MAX_WIDTH	4080U
+
 /*
  * Reject picture sizes beyond the hardware limits. Whether the picture fits
  * the buffers is checked when a job is set up, see cedrus_check_pic_size().
@@ -54,6 +56,13 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (!cedrus_pic_size_supported(cedrus_h264_sps_width(sps),
 					       cedrus_h264_sps_height(sps)))
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP8_FRAME) {
+		const struct v4l2_ctrl_vp8_frame *frame = ctrl->p_new.p_vp8_frame;
+
+		/* The VP8 frame size register holds 8-bit macroblock counts. */
+		if (!cedrus_pic_size_supported(frame->width, frame->height) ||
+		    frame->width > CEDRUS_VP8_MAX_WIDTH)
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
@@ -248,6 +257,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 969677a3bbf9..fecca343bd92 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -662,6 +662,9 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	int header_size;
 	u32 reg;
 
+	if (cedrus_check_pic_size(ctx, slice->width, slice->height))
+		return -EINVAL;
+
 	cedrus_engine_enable(ctx);
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
-- 
2.43.0


