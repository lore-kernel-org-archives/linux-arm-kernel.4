Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0DD606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11k3IhVa;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qz06QtqX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hxSefBfUDE5H76wsNqoXn2Ry4DBGDXioabY9jbecasY=; b=11k3IhVaY+5AHIQp7zDg82msFl
	cKhNtvpIk0CY82vw2v0GBwgshj9R5G6dUPlKijmP3XgjMCmv0YrWLKoUNRiM/k2VZQ/7Y+5Aw0nXR
	ZyJbw7WPlEONjJ3+KwUodbQJ3wzqCbygd1LAMPGCOFNxVO3498c2u51FeRkfp7yZa43SFEr9zixfi
	Rp/I53ADS3IwrrwUOPIwYZKWREomNyPfaP2vXwWikOl1qgQPd8wgXPxzVQQdoxCfUGXNHfxa2dSWj
	o+VTqvckIb7+leEzM7VvGdYDNSrdFAe5miGRy4jmYB39OoryWTBsUgPDpXbZUYpL11UnMHXlQYubE
	IvgsbCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlAf-00000003tFB-2aC0;
	Tue, 10 Nov 2026 12:41:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlAb-00000003tDD-3t79;
	Tue, 10 Nov 2026 12:41:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32D0A63492;
	Tue, 10 Nov 2026 12:41:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794314508;
	b=HGHjY9g5zpN0yX3XgvI7+YDR0EQO+tWJ3qCjZIov4Jc7x8QVFOI/wRqyOQxYRk/90YyU
	 vbn0zWMbEcHuqX7h0A6Yt0ZDuWfKpgpctUwqG66J/QOTfXe+yApfuHuhIPBXymFD4AE8E
	 GlervCz9qHJvISsd070DmpZsfqgYe/Xz/+p4L2C3SPFFYaeDELsfa/eFbHVaMM4oaq/r4
	 ga/YOzUg2AWTdj1Rm6pCd5mGFWAR504A3Xf3U2ALhhCjXNmrwqEicKzeW5MQTNNfWz1hH
	 1DySaZxfesRPCSuKmdVzkONtDgR8H1v1HDWWfWPPJ+LLr4pdyXMciIpOidd3+CNRSqw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794314508;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hxSefBfUDE5H76wsNqoXn2Ry4DBGDXioabY9jbecasY=;
	b=QxB8lbIIwBRjCRTmO/Kw6szNidYxm/QOjB7mbS8ptdzkgsVKzrLK04WP9fiJSApqL8dY
	 hURI2W0axKAguFWMvvttSD2K4jQYm5Y9obltv0uE7UjEC8bmvvwG0MRoIPKsp2snUTMSD
	 AaUav03eRgytLdsrQeF/hzBggP0dMRym3SYH5oPDRpbJqr5kMzgghvCQrCdr6h1WaD0+5
	 CfBrBtGI9mOE7BgbeiVHLDXqi8CPYiE8c/yfsUW0tRWtrLB9Sj0Mcm6JFHk4LsZi2Ta5O
	 37K0OMdi7zV2WyDQ1O8AzLe7r4i8ZtCQDKdPiw2GeMPj9/Zr2gWJfIHBJwaYo3P21Ig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D21E81F008A1;
	Tue, 10 Nov 2026 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314508;
	bh=hxSefBfUDE5H76wsNqoXn2Ry4DBGDXioabY9jbecasY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Qz06QtqXA6HRgkNs9nl/u4i3CiuZiy5mIDBtEquw3tvIo4Lb5Iopdwt8q+l1QUPtw
	 9VfZP4RWwyncDz3qI942nOaJ4mU8RXiEifCy/770Gfj520qP9xNHb79NO8JI285pGD
	 y76OiuGgIpEoGJPKxDOSaYfgCgWWvJi68sm0Zry0M2kb4bQeFM0rmSxJWsGs6Rvx5d
	 URLFkchnaNKxRlWAP3fcCCDEjy/08Sbv1TYAznqKfiq50YTLw3zLcxA3/8C8U5PK0M
	 lR8aVj7dkeJ1jP2/GjLKhlLeEeAIkIMJADJY+G4SF1sUUffid/ChHl4mL11RKkqmmN
	 uumGbv4Aqw/dA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3565048B4E;
	Tue, 10 Nov 2026 12:41:47 +0000 (UTC)
From: Sergei Khomenkov via B4 Relay <devnull+shomenkow.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] media: verisilicon: fix VEPU1 JPEG encoder writes
 past the CAPTURE buffer
Date: Tue, 10 Nov 2026 15:41:43 +0300
Message-Id: <20261110-hantro-buflimit-v2-0-ff7790def9fc@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNwQrDIBAFfyXsuRa1RJKe+h8hh2jXZCHGolZag
 v9eG+ipxxl483aIGAgjXJsdAmaK5LcK8tSAWaZtRkb3yiC5VEJwxapMwTP9tCs5Soy3LXZc9hr
 lBerqEdDS6ygOY+WFYvLhfRxk8bW/Vv/XyoJxZrnulEElUKnb7CZaz8Y7GEspHxsD73quAAAA
X-Change-ID: 20261106-hantro-buflimit-055e8029be23
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794314506; l=2924;
 i=shomenkow@gmail.com; s=20261104; h=from:subject:message-id;
 bh=Au9m2ZyJsM3rdkYmqexDG3q3feqvM6j21m3H6c6K1c0=;
 b=vmeArtTiWleE0liax4kfCT491w/QAjEfFTub6oVHTQqfEiqvH9AVODBQI7koxcvGyZdbFrIdp
 inI0naDjH4tA5WgSDPPtmKjthKVj4CqHjnIVuwKy3olsRRsJJQOp54U
X-Developer-Key: i=shomenkow@gmail.com; a=ed25519;
 pk=FwuHDVe7aiISDMLmQEcMC+RflEIJ6kEp/ekwznWXmI8=
X-Endpoint-Received: by B4 Relay for shomenkow@gmail.com/20261104 with
 auth_id=1409
X-Original-From: Sergei Khomenkov <shomenkow@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shomenkow@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H1 JPEG encoder is given its stream buffer limit in bytes, but the
register counts 64-bit words, so a stream that does not fit the CAPTURE
buffer is written past its end, up to eight times the buffer size. A
quality 100 frame of noise does not fit the default sizeimage, and
userspace can also set a smaller one.

Patch 1 stops the VEPU1 encoder after a buffer-full interrupt, which
leaves it paused. Patch 2 programs the limit in 64-bit words, rounded
down to whole 64-byte bursts. Patch 3 makes the smallest CAPTURE
sizeimage the 624-byte header plus one burst.

Testing, on an RK3026 (VEPU1) only: without the series the encoder
wrote 230 KB past a default-sized 640x480 buffer and 1.6 MB past a
1920x1088 one. With it, 17 overflowing frames, four of them queued back
to back, stopped at the programmed limit without writing past the plane
and came back with the ERROR flag, one interrupt each and no timeout;
the jobs after them completed, and frames that fit are byte for byte the
same as before. A sizeimage of 1 or 600 now reads back 688.
v4l2-compliance 1.30.1 on the encoder node shows no new failures.

The VEPU2 JPEG encoder writes its limit in bytes the same way, but I
cannot test it, so its limit and interrupt handler are unchanged; the
common patch 3 applies to it as well. The STM32MP25 VENC runs the H1
code of patch 2 and gets patch 3, but not the stop of patch 1. Neither
is tested.

The bugs were found and the patches drafted with an LLM coding
assistant while porting mainline Linux to an RK3026 board.

---
Changes in v2:
- Trim the commit messages and code comments (Nicolas).
- 1/3: clear only the enable bit of H1_REG_ENC_CTRL instead of writing
  0 to the register, and add a rate-limited warning per fault bit, as
  hantro_g2_irq() does; add the H1_REG_INTERRUPT_* fault bits (Nicolas).
- 3/3: keep max(): it is a floor of header + one burst, the 64-byte
  rounding is on the stream limit in 2/3 (Nicolas).
- Move the test numbers from the commit messages to this cover letter.
- Link to v1: https://lore.kernel.org/r/20261109-hantro-buflimit-v1-0-f0b86ce61e66@gmail.com

---
Sergei Khomenkov (3):
      media: verisilicon: stop the VEPU1 JPEG encoder after an unfinished frame
      media: verisilicon: program the H1 JPEG stream limit in 64-bit words
      media: verisilicon: leave room for the JPEG header and one stream burst

 .../media/platform/verisilicon/hantro_h1_jpeg_enc.c    |  7 ++++++-
 drivers/media/platform/verisilicon/hantro_h1_regs.h    |  4 ++++
 drivers/media/platform/verisilicon/hantro_v4l2.c       |  9 +++++++++
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c   | 18 ++++++++++++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261106-hantro-buflimit-055e8029be23

Best regards,
-- 
Sergei Khomenkov <shomenkow@gmail.com>



