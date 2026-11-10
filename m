Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D07A60A2622
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n5/JB72s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHWoaG74
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t3KOisCqUVJUs+RV54kK7ue0orheXjsx8TJE3H/kvoE=; b=n5/JB72sEW0w0ge8hPf6Lc5zRE
	DprUj5IQVAWMbQxAlZ/Ew1bwMJvkB1nrBwkQR4BcB0E1kHUi/xaK86QnU0vU9euVxCsP8eftTrH5F
	nD6YHS2NFNImXWin7fuHYVXvHUFicpHU33hLnbNvEO62902+imIa9/ax2mr3q321HmYd+FDrPI/gl
	HI0AMWf0gimnXfAVg/R09QeNDeMwjNwq0YG/1xFt7Bu1XQz9rrv+g5PUhaIJlK3J/EWO5BzIFM5SF
	Z4VB5lOUHUGSaILlA5Daa2fKOUd4Ema/ykFKOaYd/N9yz2eP2tJVig7ksCalYq+sS09M4L43KYXt7
	72gzdnsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg6t-00000002orJ-27iC;
	Tue, 10 Nov 2026 07:17:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg6m-00000002ond-48yz;
	Tue, 10 Nov 2026 07:17:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D0414012C;
	Tue, 10 Nov 2026 07:17:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295052;
	b=xJgNzm2AOdk6bpkMN8DptoFAglFV7s+CzPl2PoBB/b4EBt0vq1aAJISNunqeO0tJxjB+
	 TgeOgSJogQh9qW9puHC/zB9Brk3mGFX6ZMKQ6VFMWAlLL2x4HFaqB++j5/yFtNfOB/TGR
	 hxRrKpye74uGThKQgsM4Ln31VcdiQyvrd0u4wH3C0iIuZCXL3dx8furTjgPecWR9MJfgl
	 wzU1nQQZI5DbGvZBC/dY40ch1oxxUs7Mdn8lvZcF6/+6o+yEJowwPzKvRb/eMyTh6udSC
	 wNiG7Iu6MxUNa05pX2g8MUtd09mEd5o6u/rgHS7qHbSq/IJnUfO/gQrRXcXlwUU/pDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295052;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=t3KOisCqUVJUs+RV54kK7ue0orheXjsx8TJE3H/kvoE=;
	b=aEnwmlrj6prNvisFsfcrBU+BmrC4gXuw0B4ZXYnO0ow7v7GZ+I5TE7LJlDPb6lN4EM1t
	 OD90zKbDDxIkEoRRbpYrX1D46WHJjIVfApEvNIFRuMDTgWAF4U4H/SOpmTjvi9FolUXln
	 bx/8/9Tg4xWoeRBXIeGJjgMJoTMljR8e72rvac7COpzYzcBnVez4lsAK4LYJR5SptMarK
	 tYDT7/7eTx4g67niYGs5ruo7pqsLT1qs6LXjPhWNsYa2wPqbCoLaGWNSFqApV5bYmXXq6
	 0BXa0G96Yy+PDGhA67f6m5XL17FZiYCQCTfDax8Fjfgu17bstxWzVsAllks12/0waBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B201A1F0089F;
	Tue, 10 Nov 2026 07:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295052;
	bh=t3KOisCqUVJUs+RV54kK7ue0orheXjsx8TJE3H/kvoE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=fHWoaG74iYmcDbM4kCrJP9ayrphbEZVsE0rTu8t1hk6BY0rGzsQkt5wmSI28k6Q2g
	 os+M7owV5tV2SKEMzNnQmEgeJ35007WzEK7sjO6GSKsWLMgE327ZD02rHgwtd+pzCk
	 V+VXTG5slVrt4dk2oKFQ/aaNAkXca+Jz+PdVZxHPJSPXrD6j/aPP2qVSkWyLHTUlmp
	 +Lbt5OJE8KVNlzvqPMpkm15o3aE8Oe2KjBaEgLV6z8T2QvXAt7upYRznUTb0FRTWjy
	 cBtdrIEUNBfGFU8SKVZyt7kJtOuhHTzeieva0RIhjB1M/SY1bH3XTy1+H5WAanjbuH
	 g3IHazBGaPtfQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3A6414896C;
	Tue, 10 Nov 2026 07:17:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/5] media: verisilicon: Recover the Rockchip VPUs from
 faults and timeouts
Date: Tue, 10 Nov 2026 07:17:30 +0000
Message-Id: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBM0QqKrRIu0qaZFxoxFIN09q
 +X34P0JBJlQoC0SMJ4kFLYMUxbgl2GbUdGYDZWurDFGqzxGDoqDOyQqO1jf1BM6py3kz8440fX
 1uv63HG5FH98I3PcD4e6x4nEAAAA=
X-Change-ID: 20261110-hantro-robust-6a6c84febb06
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295050; l=3200;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=wAHE9TDB5EG/9Ciyb0qAJrepsYx4Tb9hG3yp7P255Ic=;
 b=145Zthse/3N7R1g8+D/6hOlCSMrtdtj1ta8EQGhHIpXiRPZt2zdJm7WbMxu2+bgoy3WgIDM/E
 gXyzQ9AKt+vCDIO+YXjJqRbZ980WvBuiiqR62ih0aZZnwqxaADOYfr1
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

This series makes the Hantro driver recover from a job that times out
on the Rockchip VPUs, and fixes a panic on module unload on the RK3588.

On the RK3588, a VEPU121 JPEG encoder core that reads an unmapped IOVA
faults in its IOMMU and never becomes idle again: the register-level
stop in the encoder reset operation isn't enough, the IOMMU can't be
stalled anymore ("Enable stall request timed out"), every later job
times out and unbinding the driver can lock up the system. Patches 3
and 4 pulse the reset lines of the core on a timeout and reinitialize
the IOMMU afterwards, the way rkvdec does. Patches 1 and 5 describe the
AXI/AHB reset lines of the four VEPU121 cores in the binding and in the
RK3588 device tree; the driver already handles optional resets, so
device trees without them keep working.

Patch 2 fixes a panic on module unload: the AV1 decoder resets of the
RK3588 also cover the bus interface of its IOMMU, and holding them
asserted after remove makes the IOMMU driver's runtime suspend hit
registers in reset (SError).

Patch 5 touches arch/arm64 only and can go through the Rockchip tree
independently of the driver patches; it is only useful together with
patch 3.

Tested on an Orange Pi 5 (RK3588S). Patch 2 was verified by unloading
and reloading the module with the AV1 decoder bound and a 1 s gap, which
panicked before the change and is clean with it. Patches 3 and 4 ran on
every encoder timeout since: a trace of a wedged VEPU121 job shows
hantro_watchdog() -> rockchip_vpu2_enc_reset() -> the IOMMU re-attach
with no stall or paging timeout, the next jobs on the same core succeed,
and the IOMMU runtime-suspends cleanly afterwards; later, ten JPEG
encode jobs with an unmapped input address were each reset by the
timeout and the following jobs encoded normally. The reset lines of
patches 1 and 5 are present on all four VEPU121 nodes of the live
device tree, dt_binding_check and CHECK_DTBS are clean, and the encoder
keeps working with them.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit messages, and I reviewed and tested
every change as described above.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (5):
      dt-bindings: media: rockchip,rk3568-vepu: Add the reset lines
      media: verisilicon: Don't hold a VPU behind an IOMMU in reset after remove
      media: verisilicon: Reset the Rockchip encoder cores on timeout
      media: verisilicon: Reinitialize the IOMMU after a timeout
      arm64: dts: rockchip: Add the reset lines of the RK3588 VEPU121 cores

 .../bindings/media/rockchip,rk3568-vepu.yaml       | 10 +++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  8 +++
 drivers/media/platform/verisilicon/hantro.h        |  3 +
 drivers/media/platform/verisilicon/hantro_drv.c    | 77 +++++++++++++++++++++-
 .../media/platform/verisilicon/rockchip_vpu_hw.c   | 30 +++++++++
 5 files changed, 126 insertions(+), 2 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-hantro-robust-6a6c84febb06

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



