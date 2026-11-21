Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC8E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uMfCYtq0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWo2Meb3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gscuI7w3gU6wnR9QFO0QB6BLM+nklmFZb/eBfq6BMOM=; b=uMfCYtq03evh+smlkCUUosxazD
	iqLO5rWvkFwd7w5v4GcMigqlb9WAILmXTqqOGmQ6fRpbtvqw3umGlQNt3//Mpg7MCGT7is1AhoN4N
	xjH5Ke8E2bGbSpaK22VnepyM9vUwBzgQjmi6c0HUr8XLNEAiJt6sfK2JGGElAw9fHnSggLcs9phQb
	Yuf+UUMey67LvlQQEDEKcJIs9Rp0r0nLFDYxFC8uLx3ks6oav9fhV9a2QkNs3pIEoZTiL3ZQvasxk
	ArYFVfRqLK53U4lCmg3doEwOrHbwumSJ91Xvncejn/JAQiKtDS/yR+TZ6OPc7MLYQmWGBOKD0zNkE
	m4t7UGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUi3e-0000000H0om-1mtP;
	Sat, 21 Nov 2026 10:10:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUi3c-0000000H0o0-3VzS;
	Sat, 21 Nov 2026 10:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ADEE40102;
	Sat, 21 Nov 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795255856;
	b=QVDeOv0O6p8Dy1rAi66j1/hMof3UnzIjjU7dbX7mfhoFnwXu6oyrhEEp3RhtbbKNwZpF
	 hmH2N+McLsUUTcrooCIhu5zCtSUstIsB/SEUfQCichy4lXNZxtjqJpjG8woq4N7bzMVYJ
	 Ps7pqlqBG71E4d6S0mb+YraZx93Y64n1fI80HaYJiP67zL3p2keEWsisbDY1fvIQOBfe8
	 8ULpiQJQWtRXo+5r4w4a3j3kyeJsuIMqpPzuXD/CSGP6it98voY3THEzoKLqYTMMb4K6D
	 L0KV4FynTq0uqbCY/DRSaM3LqnO0BwTuVGhHxX1/J/QJgfCn3hptlIEXL5Gz35G0ysQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795255856;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gscuI7w3gU6wnR9QFO0QB6BLM+nklmFZb/eBfq6BMOM=;
	b=RnQ9nctcTFM8AqB/dhvX6Zhzv4ALhFjM2rD9HgDG5f2C2tB9jRAbMjADu/vIHwd/yYvd
	 iXrab8nInEtxlYoIBvxnINX/xwfHB1QD58mLuxvs17235ZVIDji5psk3J4ls35JFHrVJm
	 8cH4KVpwoov//aKbkGmjqOd8MZPWcW9BnoQxD47U90Ua39dyelri0RpKTNvQ9NxLwsFFc
	 mOZwmmbfQD55Dzo/qyb6KmIHkKiT2Vh1JrJldxWgfR2FQQ8uKBTl9b+5E39+7WL2OyIn4
	 FXGE2XD0krLX7nB7E5Z6vvRdOHdMmadBJ5nD4eQ7ojVqsRIty4GkOY/JcR3pKQwyw6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EBC21F000CA;
	Sat, 21 Nov 2026 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795255856;
	bh=gscuI7w3gU6wnR9QFO0QB6BLM+nklmFZb/eBfq6BMOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QWo2Meb394otORCWBsKCEuIWlu5u5nfty2XBL9ZDJ4pWgZ/cSV5Q+rZ+IzQ7nHN1P
	 y/quNN3jLm/pJs1NGKuK/9aiDq2zDmaYlydlJ72L9Pq58D711wYOjvCxtaO8PTRXin
	 fnSLTDNj0cS8Cm+X0ruLRK2aZ6+33PCx2ty1JkLbL751YoJMlgZm8Y4npnljEyPL4n
	 qH2xJC3Zj+OyTOxJOZm98LladECIyys4JBnkK79xj877c3CmDj+ynZw80s580hvr1N
	 bHz05f72Y6BUJPwkejxo/4MhXmyHDtWmE+2yzrXWjZ4oUeuiqEc/IQKnJLgZs9UzKe
	 nYOtnN7f0o2ig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C4B694BBD0;
	Sat, 21 Nov 2026 10:10:54 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 10:10:55 +0000
Subject: [PATCH v2 2/3] media: verisilicon: reject MPEG-1 controls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-b4-cedrus-mpeg1-v2-2-95e4decf03fa@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795255854; l=1859;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=FQStrbwGL4QdSNvEd7D9LYJAA2FvyeyUQoe74GUu02I=;
 b=ebfDy9i8ixnAvMHvwqGQgQzsroi7ROGjPvbLkfaHAC8Y0OJuixh3Xqnqs0S+QnBtvVKPCd36h
 M8qLiINqHZ/AwFnvbY067aC+w9u1xTsiLqiR9EiSpB609O7zJcwOzfs
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

The driver decodes everything in MPEG-2 mode. Reject
V4L2_MPEG2_SEQ_FLAG_MPEG1, the full pel flags and D-pictures, which it
would otherwise decode as MPEG-2. Compile tested only.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 26e5d5547466..c910a69e8e3c 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -264,6 +264,16 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
 			/* Only 8-bit and 10-bit are supported */
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_MPEG2_SEQUENCE) {
+		if (ctrl->p_new.p_mpeg2_sequence->flags & V4L2_MPEG2_SEQ_FLAG_MPEG1)
+			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_MPEG2_PICTURE) {
+		const struct v4l2_ctrl_mpeg2_picture *pic = ctrl->p_new.p_mpeg2_picture;
+
+		if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_D ||
+		    pic->flags & (V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD |
+				  V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_VP9_FRAME) {
 		const struct v4l2_ctrl_vp9_frame *dec_params = ctrl->p_new.p_vp9_frame;
 
@@ -435,11 +445,13 @@ static const struct hantro_ctrl controls[] = {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_MPEG2_SEQUENCE,
+			.ops = &hantro_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_MPEG2_PICTURE,
+			.ops = &hantro_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,

-- 
2.55.0



