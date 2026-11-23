Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE499606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PUs6Not0;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=a/ra4Oxi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Jh1FAcyIFxWBHDTEoMkBkVWCay9xDRHExguDM+g3k4s=; b=PUs6Not0psEKz6/Bs83OwvIW6q
	4EZV/STHQIdmQITA/nLHffEHWOQXiFJX/fI/tz2NIfG8TYGTqQ97P6Gv5h9dM8H3ASFdhPSkQTQ/n
	/JqnB1CHY56SlATz0dpQtV35sTO0G10rkRyNhmayFkw0JAMm1U5ImKTDownvSPw7p1l9LVips5ezA
	bjH4tkDkIbn+Mfeu7fIsQEpLL/iTCqsTyK5pM6lhoVymPConWEItTHbuDx+TFeo+G/j/ItftK3e2x
	jSSU2WS9KnGTzbCgsRWGAGDCOMtLO2lQh/g1D8Zofn5O8ou4rScJuHu0Jq/Ru+eQGdkGImQE1yOZO
	wT5ES7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVvC-00000003xz5-0NUI;
	Mon, 23 Nov 2026 15:25:34 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVv6-00000003xxW-0kho;
	Mon, 23 Nov 2026 15:25:32 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5c0a:3200:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BC92F2004FC;
	Mon, 23 Nov 2026 16:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jh1FAcyIFxWBHDTEoMkBkVWCay9xDRHExguDM+g3k4s=;
	b=a/ra4Oxi5RsqC2frbeatoZnBPDf5yAZDYJ7vKmhKyuEcHgZeRtZUvjrWqduh3emYY0yG0E
	yllsZtRgM/AXkNlsE5rEyC5NaHcmalIZJx3UfeA7IWWmRL4FjmcCTqrmgh99XGLSZ8hSDK
	J+A6aMokzEJsAG8r83mDzoG+a77JjOfTJz9YCL7Tc0gxNgzp3vxThq+58EsWZZF8je/79U
	ZqbWhIgg9i66CVNwmRTW105HuKe5FOlYH2Gb3y2lHySVnLMF/iu7hHiqQN9dEFG5gkeDyH
	5kU9b/DC96fMrchTZLaJ1pDOol9iDKxX/UEIHUXPzVmNnMbpV1XwmptKSUpkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jh1FAcyIFxWBHDTEoMkBkVWCay9xDRHExguDM+g3k4s=;
	b=Rx57CHe2FGy1EN30pT9Ubv0PqdSFwY2iXarXp77oiXSfjiFHP6zBwq9ra3KNvpOvaMQMsx
	3LjrTjgDP7zzwOENIrbc4no+4ZHtuVN/3dooPfqa4YyGh4+HmUGj2i3PUwsbJk6dKG7NcK
	D1Wc5OnigGnnAJ7N5VRKal/E0234Hts78POtnTHlZuXmtZbLt0EIDsskv9iEz4Ii7GoN/9
	0Qrzqr4V/UQeaXvX41yJyD+vhZpZ8JDvX3fIuor4EO/xxTsh3c/SDDwXq0mtrNV1FlCwz2
	p08SFjhNOd8RHrFGsPQTeoIIM5TfFWMXHXHQFuo9Ib2UhscDyhutwsFThTzb1g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795447521; a=rsa-sha256;
	cv=none;
	b=gjMPppAsIYrfJ82PM9SS8o2gvMzcdtBhd6Po+pA9xjWArvimmnLBptkCLvNOwlOt81zSul
	T+xxBrkOr2+HqTTsXQQtCDZwbzVQEhtURSxwLinbB8sjmI7UMgCFiSXLXdwG4+RQF8pEH0
	+m3P07En62fP/Wa1c/U0ZfjL/UBS/mtPGVD3YIv0MVzymG6C/P/HMue0yLlBQv7rpmXMhz
	BQLdQ77UyJ/1NLWFPNJ0DCD6Tc2GxpUf3nDy6k1qyIjbOXa7FCKKBp9Ny5M2Lynq2M5+18
	VYPzBUJyMhDK9tISrG90QMZ7EwpvDs04M8Rz/vi0ja5TfgmJGPmwboG9zaYNWQ==
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v8 0/4] media: rockchip: Add JPEG decoder driver
Date: Mon, 23 Nov 2026 16:25:19 +0100
Message-Id: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9aBGsC/23PwWrDMAwG4FcpPs9DlmPZ2WnvMXZILDv1Bklwu
 tBR8u5zCtsC9fEX6NOvm1hCTmERL6ebyGFNS5rGEtzTSfhzNw5BJi5ZICCBQyXz5D/9Oc3yYw4
 DBy+ByTnwkQx5UdbmHGK63sm395LPablM+ft+YVX79BdrHrFVSZAOlHKIfTQAr3MYh69LnsZ0f
 eYgdnHFo2IqCu4KddGZttNIVFX0v9KqWhddFG2c9toSA2NVaY6KqyhNUYC5tRwb2/V9VTEHpfq
 R2bsAGee09j25qkJ/igKoKVQUNFERh05Ra6uKPSiIFcXuXSJbZmNiA49dtm37AYG7FeFZAgAA
X-Change-ID: 20260821-rockchip-jpegdec-0d6880cf656c
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795447521; l=8565;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=rbKUoeFc1Zv6Eaoh7f4mgSkA6iWDdk7Y4gMxMnD33EY=;
 b=RefEf2UcSCLdPUJkGh1GnzGzfbrcdLGMLCxYmtPU55bSEeOLKS+SqDZA3icHn17u8/cjdUY/d
 j9juXb6IgKHBnvLoMvPq6SAjWPpCmqFsu4lzA951NF1L0thiI4TWm/R
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072528_380765_7D04D57C 
X-CRM114-Status: GOOD (  30.29  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the Rockchip JPEG decoder hardware. The JPEG decoder
is an in-house IP which is integrated into various Rockchip SoCs. The driver is
tested on a RK3588 board but reportedly works on RK3568 as well.

An earlier version of this driver was posted as part of the Hantro
driver [1]. That turned out to be the wrong abstraction, so it was split
up into a series with the Hantro fixes [2] and this series with a
standalone driver, which started over at v1.

[1] https://lore.kernel.org/r/20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de
[2] https://lore.kernel.org/r/20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de

An LLM (Claude) was used throughout the development of this series:
for parts of the driver code, for reviewing it and working through
review comments, and for debugging on the hardware and with
GStreamer.  I have reviewed and tested all of it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v8:
- Decode 4:2:2 frames to NV16, or to NV12 on request.  ENUM_FMT on the
  capture queue lists the formats the current frame can decode to
  (Philipp)
- Report the coded frame sizes as continuous up to 65535.  Frames whose
  size is not a multiple of 8, e.g. 1366x768, failed to negotiate in
  GStreamer (Philipp)
- Size coded buffers for at least 3 bytes per pixel, also when userspace
  asks for less (Sergei)
- Don't resume the m2m queue when runtime PM resume fails (Philipp),
  drop a dead error path from suspend
- Use one RKJPEGD_MIN_SIZE for both dimensions, inline
  rkjpegd_irq_done() (Philipp)
- Link to v7: https://lore.kernel.org/r/20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de

Changes in v7:
- Don't set a capture payload larger than the buffer when a job fails
  because the buffer is too small (sashiko)
- Drop the Assisted-by tags, upstream removed them in favour of a
  note in the cover letter
- Drop the review questions and answers from the driver patch
- Link to v6: https://lore.kernel.org/r/20261005-rockchip-jpegdec-v6-0-25f16dea1697@pengutronix.de

Changes in v6:
- Rework dynamic resolution change: a changed frame is marked when it
  is queued, the decoder stops in front of it, and only the ioctls that
  resume change the capture format, so fmt_lock is gone
- Keep a drain going across the capture restart of a resolution change
- Decode grayscale frames to GREY instead of filling the NV12 chroma
  plane from the CPU, and allocate capture buffers without a kernel
  mapping
- Leave cache maintenance of coded buffers to videobuf2, drop the
  dma-buf CPU access calls
- Drop the EOI scan, a truncated frame fails through BUF_EMPTY, and log
  all hardware errors
- Drop the runtime PM check in the interrupt handler
- Drop the interrupt masking around the watchdog reset
- Drop the hard reset fallback
- Drop the media device
- Drop the EOS event on STREAMOFF(OUTPUT)
- Allow up to 65535 pixels per side, limited by the size of the decoded
  frame instead of 16384 per side
- Report sRGB colorimetry on the capture queue, keep what is set on the
  coded queue and default it to V4L2_COLORSPACE_JPEG
- Return a failed frame with its full payload, GStreamer takes an empty
  capture buffer for the end of the stream
- Return errors from the header parse instead of setting a flag
- Use guard() and __free(), drop NULL checks the core rules out
- Name the VDPU720 in the Kconfig help
- Use Assisted-by: LLM
- Link to v5: https://lore.kernel.org/r/20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de

Changes in v5:
- Keep the device until both the binding and the last file handle are
  gone, devres freed it under an open file
- Let a job still running in rkjpegd_remove() finish and start no more,
  close() waited forever
- Reset the block after a job that ended in error
- Reset the block after a frame that left SOFT_RST_RDY clear
- Skip trailing padding of any length when looking for the EOI, 63 bytes
  of padding hid the marker, and search only the entropy coded data
- Annotate the DMA side buffer as little-endian
- Return -EINVAL from enum_framesizes() for an unsupported format
- Drop most of the in-function comments
- Drop the review note on rkjpegd_remove(), the code is fixed instead
- Bound the Huffman value copy by the table length parsed at queue time
- Fall back to the standard Huffman tables for frames without a DHT
- Resume decoding on V4L2_DEC_CMD_START after a drain or resolution change
- Do not re-arm a drain that already completed
- Report no resolution change for a corrupt frame past the first one
- Send no EOS event for the LAST buffer of a resolution change
- Correct the IRQ clear and Huffman table set comments
- Keep a resolution change out of the mem2mem drain state, a STOP sent
  before the capture queue was restarted ended the stream at once
- Look for a mid-stream resolution change only in device_run(), buf_queue()
  raced the interrupt handler for the capture buffer
- Set the field on every capture buffer and the sequence on every LAST
  buffer the driver returns itself
- Report the first resolution after CREATE_BUFS on the OUTPUT queue too
- Report the capture colorimetry from the OUTPUT format rather than echoing
  what userspace passed, and stop S_FMT(CAPTURE) changing the OUTPUT format
- Refuse RGB coded frames, Adobe APP14 transform 0, instead of decoding them
  as YCbCr
- Drop the 4:4:0 mode, the JPEG parser never lets such a frame through
- Depend on V4L_MEM2MEM_DRIVERS
- Correct the downstream clock rate in the rk356x DT commit message
- Serialise V4L2_DEC_CMD_STOP/START with the job completion, a drain
  racing the last job's interrupt never finished
- Forget a drain that STREAMOFF(CAPTURE) aborted, a later resolution
  change re-armed it
- Bracket CPU reads of imported coded buffers with
  dma_buf_begin_cpu_access()
- Wait for a running job when probe fails after registering the video
  device
- Add an SPDX line to the Makefile
- Link to v4: https://lore.kernel.org/r/20260918-rockchip-jpegdec-v4-0-0dd97df47abb@pengutronix.de

Changes in v4:
- Set and read the source change flags under fmt_lock
- Check the runtime PM state in the interrupt handler
- Use dma-buf CPU access around the grayscale chroma fill
- Update the review notes in the driver patch
- Link to v3: https://lore.kernel.org/r/20260914-rockchip-jpegdec-v3-0-3583c376d0d2@pengutronix.de

Changes in v3:
- Rename binding to rockchip,rk3568-jpegd.yaml to match the compatible
- Link the earlier Hantro based series in the cover letter
- Enable clocks from the runtime PM callbacks, use pm_ptr()
- Protect capture format and crop with a mutex
- Clear bytesused on capture buffers returned without a picture
- Revert padding the capture buffer to the MCU width, it broke 4:1:1
- Add notes on review questions to the driver patch
- Link to v2: https://lore.kernel.org/r/20260825-rockchip-jpegdec-v2-0-86af859a3266@pengutronix.de

Changes in v2:
- rename clocks from aclk/hclk to axi/ahb
- Add missing Signed-off-by
- Fix suspend/resume path
- Pad the capture buffer to the mode's MCU width, not to a macroblock
- Reject a frame header picture size outside the supported range
- Set the capture payload at decode time, not at queue time
- Trim comments in the driver
- Link to v1: https://lore.kernel.org/r/20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de

---
Sascha Hauer (4):
      media: dt-bindings: Add Rockchip JPEG decoder
      media: rockchip: Add JPEG decoder driver
      arm64: dts: rockchip: rk3588: Add JPEG decoder node
      arm64: dts: rockchip: rk356x: Add JPEG decoder node

 .../bindings/media/rockchip,rk3568-jpegd.yaml      |   92 +
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   22 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   24 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkjpegd/Kconfig    |   16 +
 drivers/media/platform/rockchip/rkjpegd/Makefile   |    4 +
 .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  235 ++
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2332 ++++++++++++++++++++
 10 files changed, 2736 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260821-rockchip-jpegdec-0d6880cf656c

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


