Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ie/nuS3/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=efSqpfjK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Lbb9GO0RuQACRb7gdWTost1eSjyrJVaAi6tV5f/WWsg=; b=Ie/nuS3/liRIIabe6c7bIQqnc/
	DYeDdfBd2PoBICC12E7WsxFakTq17O/TjnHfqxHrIfjJWvW5FqAyL02mEAp2rmhEXDIckY8Jm6cOe
	gR7k6PWt1MHB6kXuZTrPok78f7GYqKhD6NJrW0AzmTSx7q1GsY+Ds5m2u0Wm5QQo0eKotaYa2gdAv
	W+UHxTTFzubHfTxVtoyCjMiVRGLlRpldptnAeYAeULvMl3WnJBJSigXhBC5Xq6GWihiUrWa1KLxa1
	tLdc53mXYGQyGi93e68/CV40FxvrA7NPFbqVyFEUdjR/u/5Sn5h3DSvgdbGLW/iGlsWUCv67ky7gE
	qVIFXszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcqL-0000000Dztp-1uUj;
	Thu, 26 Nov 2026 17:01:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcqB-0000000Dzop-2oWy;
	Thu, 26 Nov 2026 17:00:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E2DF43B09;
	Thu, 26 Nov 2026 17:00:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712459;
	b=rI0lfgH3GfrAMM7DjpIjBDDppxprON13gLNGTU1hSiqpNdF6lWR/j9/KcoSQgfL62oIH
	 1sn6ll7iSt+IxyV6n4UH+MkeMglm0tO3426+FEYCtgZM86fXJ8hF0Tincys2XbSCM47SL
	 EWmNUxhU4SXFQL93VH8GaJjZUh9WT8soMSrAiGOTyrdsboY2qs41IzP3OgjEYj2QC3LyL
	 BQC5om4MmlgY/tImmNUdkxhU3rgHuyMVRZVAlRFZogA+i/6CzHnAJyKF6k+ADiG23Yp4Q
	 hP6SJ6Ywhuu6FLzNOba/hf/MLKfRjTLFGmIRs7QUQuqTcZA4CsJswz2dHhGkOjGB4Ng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712459;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Lbb9GO0RuQACRb7gdWTost1eSjyrJVaAi6tV5f/WWsg=;
	b=E2EtPNzjEdJ5zIkxR/QCqTb6mDdEWDxpspGiFPpr+GX1s9RLxsKvazlIhIIfZPddJt8Y
	 q1Bk7VBwHuEnCUaHINtufCoq0boy0h1bt6rx0Fh5h56mmxq2LHMibwY7eRBlMN20lQYQU
	 5w7iYKkD8CrwMnzJTefkYJU2XkIMcXpKixtfJCm99xw13NY++Z/K/ebWN3/umf7NSyA9h
	 rjLNtJF424S81WOAuP4hioIw+FSu20/y1uWMNJHDDI+sIJt7CEofWBtVsJJofwoqtnT1k
	 L7vPot1daikpIh6QNBfMX4dY7Wky3Ppw5d+533WKFbBVYdgTkoqOxheBB2Dc1JfjH+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC67E1F000C0;
	Thu, 26 Nov 2026 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712459;
	bh=Lbb9GO0RuQACRb7gdWTost1eSjyrJVaAi6tV5f/WWsg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=efSqpfjK7N06MD/IGjv6j8lc9E6gQONiJk6jQyEhaCQTXASoWU47go0UIsOlucGge
	 h5ZFOCnBvUkDuoQ7N/RIzLePBeJgd4c63PSsGJMyQ1QWqXM7B70WdfhSPu1MGCq1/J
	 +MMorbVscnttbkpUK4FhSMnowFt7w+xL0bhHwhYLtPDBuAjub1D8sqdu/HNo/QiGLT
	 gVnVXf5SsQU+CxVicFt6+NA3wWi30+xvhcufsYctPjoMXTK4Sf976sidb762J8TJjS
	 s8QBqA/9Wb8LSMHKOf4yQG8tLhlZSDqTq+3qrkbcVQQvUNcNdMSiuxhfAlbVycTkcF
	 V6miSucLvSZPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 38B194D74B;
	Thu, 26 Nov 2026 17:00:53 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v3 0/5] media: verisilicon: Fix the JPEG encoder format
 handling
Date: Thu, 26 Nov 2026 17:00:52 +0000
Message-Id: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNyw6DIBBFf8Ww7jSA7676H00XCoNiqhiwpI3x3
 wt246bp8s7ce85KHFqNjlySlVj02mkzhZCeEiL6ZuoQtAyZcMoLxhiFcFysgWHGDnASoPQLHdR
 KVa0qmqxmioTtbHF/hOnt/s3u2Q4olgiLjV67xdj3LvYs9v45PAMKSmRSlFhXueTXbmz04yzMS
 KLD8yOF/6LwQJFIUyyyVJS5PFK2bfsAA4/sWBIBAAA=
X-Change-ID: 20261110-hantro-jpeg-enc-fixes-9ff8bf6a491f
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
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795712452; l=2725;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Jk9ltudzLGJ5X0zC94Mk8NkNqBgItiMI3b+1wG84SiM=;
 b=ApY1KF73XXUXDH3C0VEMRV5ZZDNEiArQ47FtiQBbFbzfex+990Kq9Xg/yhEIt/qJ3HFpxFc3m
 RT1jcf93sQHC17hDvk411/FLiBoO6r/BvJJwvlLF4HTnx6B6cj9Jtbf
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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

This series fixes the format handling of the Hantro JPEG encoders, found
with v4l2-ctl, v4l2-compliance and GStreamer on the RK3588 VEPU121.

Patch 1 keeps the coded format while CAPTURE buffers exist. Patch 2 sets
the coded size from the OUTPUT format. Patch 3 reports the fixed JPEG
colorimetry. Patch 4 restores the raw format descriptor when a CAPTURE
S_FMT can't reset it; this was the IOMMU fault at IOVA 0 seen with
v4l2-ctl --stream-mmap. Patch 5 limits the frame size to 8176x8176.

The VEPU2 stream limit in 64-bit words is patch 2 of Sergei Khomenkov's
v3 [1].

[1] https://lore.kernel.org/r/20261124-hantro-buflimit-v3-0-780903970ca0@gmail.com
[2] https://lore.kernel.org/r/20261126-b4-v4l2-enc-sizeimage-v1-1-dd2cb99bd717@gmail.com

Based on v7.4-rc1; on top of [1], patches 3 and 5 need git am -3.

Tested on Orange Pi 5 (RK3588S, VEPU121), v7.3-based KASAN kernel that
also carries the change of [1] 2/3: GStreamer encodes (NV12/I420/YUY2,
720p to 4K) and v4l2-compliance pass. The v2 reproducer no longer
faults; its 8 frames end in buffer full, as the CAPTURE sizeimage stays
at the 96x32 default (6768 bytes). The dev-encoder.rst proposal for
that case is [2]. H1 untested.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Changes in v3:
- Dropped the CAPTURE sizeimage minimum (v2 2/7) and the job-time
  geometry check (v2 4/7) (Nicolas); with [1], a too small CAPTURE
  buffer ends in buffer full
- Spec proposal for the CAPTURE sizeimage sent as [2] (Nicolas)
- Patch 2: only width/height follow OUTPUT; sizeimage and -EBUSY dropped
- Patch 4: only restore the descriptor in hantro_reset_raw_fmt()
- Patch 5: Fixes tag (Sashiko)
- Shorter commit messages and comments
- Link to v2: https://patch.msgid.link/20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com

---
Arun Iyengar (5):
      media: verisilicon: Keep the encoder CAPTURE format while buffers exist
      media: verisilicon: Keep the encoder coded size in sync with OUTPUT
      media: verisilicon: Report fixed JPEG colorimetry on the encoder
      media: verisilicon: Restore the encoder raw format when its reset fails
      media: verisilicon: rockchip: Limit the JPEG encoder to 8176x8176

 drivers/media/platform/verisilicon/hantro_v4l2.c   | 26 ++++++++++++++++++++--
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |  7 ++++--
 2 files changed, 29 insertions(+), 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-hantro-jpeg-enc-fixes-9ff8bf6a491f

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



