Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FADF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K5Pmt/K4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmwSKRJT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+ZUVu/y+eVMVk/ARZiUIfyqxxekPSPlM64HaTX+THgs=; b=K5Pmt/K4Yqejxf8+EeKYr9Sgnz
	jHJUQCa8a9K9hYN3R3uflThZS0u3Dq3B+o5wDDfg388yH7z8RbHpsk4FH99WofTIi0dYginsdlN+0
	FKzqItF+1LK5KtAajRatmdcOPsAmwbQ0arMudm3bh0b9B7z88pODecdDZqstfgJlVCLNqCnzQHQs6
	26VfGp6cjMRt/AhFdHEjfOebMGz9HVt63zeI3oYJFxHFkXzHc/wgbEFruJ8vnee32hZzTL6QxqBJs
	B9R3cSn64/Sg94qE9Ss6uTiSEopCa/T5enIXfdQRLQQ+OxNqi5+9zMbLW0G+71itCbXsnw0j4hASK
	uTGojL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUi3e-0000000H0p6-2nSt;
	Sat, 21 Nov 2026 10:10:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUi3d-0000000H0oQ-0shA;
	Sat, 21 Nov 2026 10:10:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0E6845DA2;
	Sat, 21 Nov 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795255856;
	b=aqkzX9Stw3I9lvmKKbRY/ZWHA6pqNnwf7ovYamsCd5zgSwsbh31mG5aQ/fsx5ih/ViVi
	 D2YdO/zUTXIsJqcGooHy7mRoeFDXUN9XpqCpA8kvkGibc06MwFxLkUGryiOfnEtWTlGlr
	 DBVv8ke2dcyquJUq+wKmGA7B7+6ujZTpzj8gTUUNxyckX7/v1FWBUuA9ZKzh4a1xO36pD
	 ztZo2bUZQfpJV5UplGOz8ndrqu1vHTfOWvCjz97nXOWGsWwi23plm7vTG8AhoMQ+yuxY6
	 pQGaQh6bvcxzpXSmxaUZHwGFCqPAmjflScX1pZHD6hAugCsW9XkpESoFpYDPoJ2jDXQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795255856;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+ZUVu/y+eVMVk/ARZiUIfyqxxekPSPlM64HaTX+THgs=;
	b=1C6vwvIUpqsfZAnbOiNAnGkD9DajGtjdVBan2hF5rqSe4BME+sTjfM5H3H1BeK82+Rnz
	 lCkoOA/6cGQTzhSwlOoxw9O6h0QYSvoPF0FJ0sCG4XeClrsS5MZRDCuG52qFdHTjGC4Ay
	 87kjJ5XTExNiKCQRO6tFzKWbcjbLeetfxpQTBMAYURUVnKbTbubM40eGoKnzGCC24QZHm
	 6sEWNysNxb1OqPnHDQ41lLQXG376lfGGxGxGk76eVbKrySA4CI2RyR5ck6gVmE+FXB54c
	 pxGqerEt7byytUzAnIPzbX36cD+F1/C8m5VzSjsnlVYivHTxupEVp1VE5RfIfS2LB0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 357881F000C4;
	Sat, 21 Nov 2026 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795255856;
	bh=+ZUVu/y+eVMVk/ARZiUIfyqxxekPSPlM64HaTX+THgs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DmwSKRJT9qYunfc/6J6pIoy1x3Pl96/BYGsZ7AFY33yb1LgR8Y/h7DBPhPPg8I+KC
	 pmb+dQhx2yFyOp3ti6dNvFB0z3KlZ18ZcN3vLAfzdZo2w0fnBS9c3PGgHCzWUd4toV
	 51f9yFGxqK9vlbVZ4n9JjUKnMUFsW5d9jR5jICTEpbo5NZWBUNSXkGC38CqSoNrS6o
	 vuAg6qujnwETAafVUHZ+LeztH9/NwN8+QLKrTHU5mXxdkEi7mlz7s+LQM45AegByEg
	 4X4sroyhiQXwNMN/sXIgapYRgRfX6qiUKSI3TahJZBygg0SaqPYK/gFMwLTpgiI719
	 YIXsUJPTHiCGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AC6574BBC4;
	Sat, 21 Nov 2026 10:10:54 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 10:10:54 +0000
Subject: [PATCH v2 1/3] media: uapi: mpeg2: add MPEG-1 flags
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-b4-cedrus-mpeg1-v2-1-95e4decf03fa@gmail.com>
References: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
In-Reply-To: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795255854; l=5165;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=yksBdmk3Npzg1iAQRYT2QfTDslkSWSpomxA3ajPshVg=;
 b=zD3hF4yDQP2+FziY10T7J5ajIdxFnwDrZGEPewwBy9KBqn4EnsqL+XI7bKPKjDvN1Cpmx2NmD
 7U5MVYsy/1tBKXuGUofujHtyHmVJBX/GhkxJywxr8SP+DDnEobfHqOe
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

Stateless MPEG-2 decoders can decode MPEG-1, but the uAPI cannot say a
stream is MPEG-1, and decoding it as MPEG-2 is wrong: MPEG-1 has its own
inverse quantisation mismatch control, full pel motion vectors and
D-pictures.

Add V4L2_MPEG2_SEQ_FLAG_MPEG1, V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD and
_BACKWARD, and allow V4L2_MPEG2_PIC_CODING_TYPE_D for MPEG-1. Drivers
that cannot decode MPEG-1 or D-pictures reject them, also in
VIDIOC_TRY_EXT_CTRLS. Kernels without this change accept the flag and
decode the stream as MPEG-2.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../media/v4l/ext-ctrls-codec-stateless.rst        | 34 ++++++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  1 +
 include/uapi/linux/v4l2-controls.h                 |  3 ++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index d7a3b8ef03a7..f51017b5d6f0 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -1317,6 +1317,22 @@ FWHT Flags
       - 0x01
       - Indication that all the frames for the sequence are progressive instead
 	of interlaced.
+    * - ``V4L2_MPEG2_SEQ_FLAG_MPEG1``
+      - 0x02
+      - The sequence is an ISO/IEC 11172-2 (MPEG-1) sequence: the inverse
+	quantisation uses the MPEG-1 mismatch control, motion vectors may be
+	full pel and pictures may be D-pictures. Drivers that cannot decode
+	MPEG-1 reject this flag, also in ``VIDIOC_TRY_EXT_CTRLS``. MPEG-1 has
+	no sequence or picture extensions: applications set the fields that
+	come from them to chroma_format 1, V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE,
+	frame pictures with V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT and
+	V4L2_MPEG2_PIC_FLAG_PROGRESSIVE, intra_dc_precision 0, the flags
+	V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE, V4L2_MPEG2_PIC_FLAG_INTRA_VLC,
+	V4L2_MPEG2_PIC_FLAG_ALT_SCAN, V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV,
+	V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST and
+	V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST cleared, both components of
+	``f_code[0]`` set to forward_f_code and of ``f_code[1]`` to
+	backward_f_code.
 
 .. raw:: latex
 
@@ -1366,8 +1382,12 @@ FWHT Flags
     * - __u8
       - ``picture_coding_type``
       - Picture coding type for the frame covered by the current slice
-	(V4L2_MPEG2_PIC_CODING_TYPE_I, V4L2_MPEG2_PIC_CODING_TYPE_P or
-	V4L2_MPEG2_PIC_CODING_TYPE_B).
+	(V4L2_MPEG2_PIC_CODING_TYPE_I, V4L2_MPEG2_PIC_CODING_TYPE_P,
+	V4L2_MPEG2_PIC_CODING_TYPE_B, or V4L2_MPEG2_PIC_CODING_TYPE_D in MPEG-1
+	sequences). Decoding D-pictures is optional: drivers that cannot
+	decode them reject V4L2_MPEG2_PIC_CODING_TYPE_D, also in
+	``VIDIOC_TRY_EXT_CTRLS``, which applications can use to find out
+	whether D-pictures are supported.
     * - __u8
       - ``picture_structure``
       - Picture structure (1: interlaced top field, 2: interlaced bottom field,
@@ -1415,6 +1435,16 @@ FWHT Flags
     * - ``V4L2_MPEG2_PIC_FLAG_PROGRESSIVE``
       - 0x00000080
       - Indicates whether the current frame is progressive.
+    * - ``V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD``
+      - 0x00000100
+      - full_pel_forward_vector of an MPEG-1 picture header: the forward
+	motion vectors are in full pel units. Only valid with
+	V4L2_MPEG2_SEQ_FLAG_MPEG1.
+    * - ``V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD``
+      - 0x00000200
+      - full_pel_backward_vector of an MPEG-1 picture header: the backward
+	motion vectors are in full pel units. Only valid with
+	V4L2_MPEG2_SEQ_FLAG_MPEG1.
 
 .. raw:: latex
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6e751a043a21..a12359626121 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1049,6 +1049,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		case V4L2_MPEG2_PIC_CODING_TYPE_I:
 		case V4L2_MPEG2_PIC_CODING_TYPE_P:
 		case V4L2_MPEG2_PIC_CODING_TYPE_B:
+		case V4L2_MPEG2_PIC_CODING_TYPE_D:
 			break;
 		default:
 			return -EINVAL;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..e7e6030ac00c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2007,6 +2007,7 @@ struct v4l2_ctrl_vp8_frame {
 /* Stateless MPEG-2 controls */
 
 #define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE	0x01
+#define V4L2_MPEG2_SEQ_FLAG_MPEG1	0x02
 
 #define V4L2_CID_STATELESS_MPEG2_SEQUENCE (V4L2_CID_CODEC_STATELESS_BASE+220)
 /**
@@ -2055,6 +2056,8 @@ struct v4l2_ctrl_mpeg2_sequence {
 #define V4L2_MPEG2_PIC_FLAG_ALT_SCAN			0x0020
 #define V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST		0x0040
 #define V4L2_MPEG2_PIC_FLAG_PROGRESSIVE			0x0080
+#define V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD		0x0100
+#define V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD		0x0200
 
 #define V4L2_CID_STATELESS_MPEG2_PICTURE (V4L2_CID_CODEC_STATELESS_BASE+221)
 /**

-- 
2.55.0



