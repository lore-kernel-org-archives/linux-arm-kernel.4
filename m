Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D189606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ePgi9Aab;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CfvOH7Zw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xm3i8ZZDFXdHiTu501SM6Y34RS7EcjmJB7itC3SN0i4=; b=ePgi9AabwG2HZMf+FTJhmIi2BW
	jFtUiDsPBL0KmyVSygZbtq+3nKt6vR4LoIeJLdmcWCLs4+U+sJu50ARcHMP2HWl2V6iJVjYUOoYkM
	VOq8ZjU3NUMJoTsqxLHhz8//+1XbiAPlVV4crHqQAFZIpeRk/shiCBP0nqqYr1ceU8ceAaZUxjU0d
	xXEE1Q1axBTpJs7fNv7GdS08waiqiPrnR0OuQc3iPhQBoLFjNPGAecQyDqdb6RJp5DiA+QfGK1KXz
	pBog/9wsD/3A7gSItWBI35DzvGCo7rblRcHFCkL1vI63IRlSOPdGjcikgKyho3DSnvghd5diTdnsc
	db8M/WDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfVH-0000000EO5i-1KbO;
	Thu, 26 Nov 2026 19:51:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfVF-0000000EO5S-1sRO;
	Thu, 26 Nov 2026 19:51:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9ABF360D72;
	Thu, 26 Nov 2026 19:51:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795722692;
	b=aSQaKEBUegPbCjVx2GmTpPbNydSjMoYdPsfDZFZDL5GNW9FKWvNEMttfx8ujWjXjD/9m
	 VAzYGfulPxNWT+AMwuV6/4hJ2rosa5i5GZrYovacA8wKkxr0lTBQa7FvwzhfcpaZlcyDq
	 zNY3mvhzdUg4Mo6baZpLHWxF976ibLDZSTlAMuf1UA0GvjM609/pvQzVOVyWWPPxs1l3J
	 65QifrM6EfxYRlTKis0Vs/RlYhYCa1tP3Xu+Jlb2qNqIIpHCJu7luE8l3qT/XZ87cneM8
	 q/ClnbGE1gIExNCtGetwkGu/Ksm5MdPDBUncL4kxI3xBFwmaBlI8tYuF5Z+NEEdA8ZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795722692;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=xm3i8ZZDFXdHiTu501SM6Y34RS7EcjmJB7itC3SN0i4=;
	b=Bf+TL7620xJdPuWJdlbAOtPl6+i0nasU7ra3SrWDv357KuLynImc6tz3nfQc/76/T+ER
	 dJ/LEwuQrlacjBGaDnd8NvEKaniIwKMrPpngSf6cgzVADiZVJL86202xy52X1Hy3Mor1I
	 IPTTHoKPqUBHJnIt+pa1x4SQ2njD1V1oHr7hM4DcZjVGb5/vV6Awsr4+k0WMwbPzKsq2m
	 BRPb86XjdWi2Rod9dK63nkbU1Bis+DC08jtn9rV7CezdzTWq/ACCouvb2CoO6Ua+7Hbsi
	 5mxkZNh+30k07busvrGG9v+9SeK0LPXb0nReLs8z0aka0LAu3SzET4HwdUG08MrrDyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7A4D1F000C6;
	Thu, 26 Nov 2026 19:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722692;
	bh=xm3i8ZZDFXdHiTu501SM6Y34RS7EcjmJB7itC3SN0i4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=CfvOH7Zwd7eAAYs6zkHZeBgJNHXKn59MGH4Hd1j0kKmt5MzFyX4pYKJmwqIpMoTxl
	 wz/mYp8LzPXZ25smlMTMMjODJ89oTCBpDpR5ezJ3/Hx7601JpI6f5jjjgyqLm0+6aG
	 iOr5Ct2zjWF8ekA5WPiLoQrdX6CJ3W1QsOfnJAue4FDctq60FxhYpJBU6JdylSC0C1
	 RaDrjwnB6JweboxsFIMFsAWMaEjlZrVLzUAORE837lx1sR9y1w3CgqwyVbiXf1sG9x
	 2PMyhVAkfs0e70FSpNFzM1hmEjqzDim2h9fC4+K62gpNSaIT4RzSFP5TB6W3qOMFp/
	 zoCPAJqmpCG+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 386F94D7C6;
	Thu, 26 Nov 2026 19:51:28 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v5 0/4] media: rockchip: Add the IEP2 deinterlacer of
 RK3568/RK3588
Date: Thu, 26 Nov 2026 19:51:26 +0000
Message-Id: <20261126-iep2-v5-0-3deac0976f10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13Oyw6CMBAF0F8hXVtDhxaoK//DuCjtADXyCMVGQ
 /h3y8OEuLzJPXdmIg4Hi45cookM6K2zXRuCOEVE16qtkFoTMoEYUsZYTC32QAuppE4xyzTnJFT
 7AUv7Xmdu9y27V/FAPS52adTWjd3wWe94tvR+k3yb9IzGVOVoDAoFDNm1apR9nnXXkGXSwxGJH
 UFAickzmWsjlRD/KDkg2J/3SUAoORayTEEa+Ef8iNiOeEBZGusSRJkAFEc0z/MXItBd+UkBAAA
 =
X-Change-ID: 20261110-iep2-b9a9c6e77c44
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Alex Bee <knaerzche@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795722687; l=3049;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=dVuriuFsWIYJJR6FOm+moA+R4Cr1AZjWCwJzDebEMao=;
 b=zPucMdWJlKkneePzNkJIwe10RjrEJn9QLQJ6YaDMIjFjWPipShzWy/uh9Nppa6xt12jMeqG4J
 tKtU+lwvDyYA3FXnFlNRd5aHdPEpeMSYndhcyOaBC/0WyRmwdULdUjl
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a V4L2 mem2mem driver for the IEP2 deinterlacer of the RK3568 and
RK3588, with its binding and the RK3588 DT node. The V4L2 side follows
Alex Bee's IEP driver. 2/4 adds the Rockchip IOMMU helper the driver
uses after a reset. 2/4 needs an ack from the IOMMU maintainers to go
through the media tree.

Tested on an Orange Pi 5 (RK3588S) with a 7.3-based kernel (KASAN,
lockdep); build-tested on media next. The test kernel also carries the
rockchip-iommu fixes 1-4 of
<20261110-iommu-rockchip-faults-v1-0-b1dda574dbb8@gmail.com>.
v4l2-compliance 59/59, FFmpeg deinterlacing (local patches; no
upstream application uses the driver yet), suspend and unbind while
streaming, forced watchdog and IOMMU fault resets. Not tested: RK3568.

Open: a reset that cuts a transfer (seen only with forced 1 ms
watchdogs) can leave the IOMMU with the transfer outstanding: its
stall and reset commands then time out. Jobs fail until PD_VDPU
powers off.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

---
Changes in v5:
- 1/4: clocks before interrupts (Sashiko)
- 2/4: new: rockchip_iommu_restore() (Nicolas)
- 3/4: use it instead of attaching an empty domain (Nicolas)
- 3/4: IRQ saves and clears the status; the thread finishes the job
  only if it cancels the watchdog; no spinlock (Nicolas)
- 3/4: drop the IOMMU fault detection, forced suspend and reset
  retries (Nicolas)
- 3/4: after a failed IOMMU restore, fail jobs until PD_VDPU powers
  off
- 3/4: defines for md_lambda and the default size; comment the motion
  table (Nicolas)
- Link to v4: https://patch.msgid.link/20261121-iep2-v4-0-760cf25f322b@gmail.com

---
Arun Iyengar (4):
      media: dt-bindings: Add Rockchip IEP2 deinterlacer
      iommu/rockchip: Add rockchip_iommu_restore()
      media: rockchip: Add IEP2 deinterlacer driver
      arm64: dts: rockchip: Add IEP2 deinterlacer to RK3588

 Documentation/admin-guide/media/rockchip-iep2.rst  |   32 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/rockchip,rk3568-iep2.yaml       |   95 ++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   22 +
 drivers/iommu/rockchip-iommu.c                     |   36 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/iep2/Kconfig       |   16 +
 drivers/media/platform/rockchip/iep2/Makefile      |    3 +
 drivers/media/platform/rockchip/iep2/iep2-regs.h   |  191 +++
 drivers/media/platform/rockchip/iep2/iep2.c        | 1263 ++++++++++++++++++++
 drivers/media/platform/rockchip/iep2/iep2.h        |  107 ++
 include/soc/rockchip/rockchip_iommu.h              |   17 +
 14 files changed, 1793 insertions(+)
---
base-commit: b4e3c4b6a36fd76f57bf3e48638f68ddecc54ba4
change-id: 20261110-iep2-b9a9c6e77c44

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



