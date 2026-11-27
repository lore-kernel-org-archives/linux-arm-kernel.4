Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEDC606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lyGnfP5J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2cFOwQi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nWJjryyVtq+FaAzNI3kGk19OnO62EvakdwcVei4FTaM=; b=lyGnfP5JtrgnE41mnS3Wb9QSSJ
	9ICITBqeb1du4bx6Kn/BpDgz1/qxQ1oI/pH6uiwMbN4ABuSb/mX2zR2mkfoNX2bF8KZrDUfKyCf0w
	cNXHOK1ZZnYHs0oYO8pSVIrs9ODNOsBDLxaFmbJRT/ANV0ausq9rzlGwUfR2nNhhzhdCNPtyQwMCO
	XWtTBc4mm9/K3C7TLIyFC4oYr2GcWjBDs8Zii4v3HD3x47kdLguIX0hfXPf8cjGnOZ112HzGf3zD3
	TPhhFYiWKpXCAD6pUhodDCaK/m066ZFOWatq2E8hdtq0ycDXZoktdpLGtoXYEqcNEP2DvjgfYOLpV
	XdpsRqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxn4-0000000GkoC-1GS0;
	Fri, 27 Nov 2026 15:23:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxmH-0000000GkRJ-2IBv;
	Fri, 27 Nov 2026 15:22:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45FE4457E6;
	Fri, 27 Nov 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795792941;
	b=LNf4uxceEpr4kBBg+4UA+nxRXa/b2N8sovS+Dw/cc/cHUgGwawmBusKDfqy9v30M7vON
	 PT9ebkJP9kc5atvbFcBgfluD4NbomveiHEzmrQhgHmnmUjo+PnIh0jTQ58AkF16Vfgidr
	 GaW+RXgDstpvWF+nDL2UhtkEJ8Z/gpIC3UseeBAc4k8YH0+xb+M3dx8Y8c1WwpiC7NVv6
	 qWo0l3L0Z+lIxf3CisGsqy1HGO0jf8baqbv14iZ8nTjOKs1Nfdhj7lqaO0sWfVlP54JKg
	 qUGdJ4cDrV516Rgi+07xUojZZ12ig1mq8ohFbg68vGdFwzGhPyT7Qha9Gi/mD7ikDPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792941;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nWJjryyVtq+FaAzNI3kGk19OnO62EvakdwcVei4FTaM=;
	b=VCIRm1x0F6L6VUXiBT1s21083osuZJIxnLn96gOw5AxGYczgBMwqFJhl5zRqwA3vG+2i
	 fbOilbjivoRQIueWvuPtJ6tciovGrZackiaWiWJUSO9dV1Af0fdcoJCI26mheS3rsuTeZ
	 hiEgdTDKYmwMx3fmzdpr0pQKRhfUxIBVqgtP5nczZK7vof8YRbmVm8MTNLETi8e7VQwUb
	 Tcpa/V+PCEUja+NYOp5phOg1FZngSnPpr9hArec5qsM2d3FTS+JxOT00R4LRmhrbATJWK
	 /xOvRA13kjPhb4tzBcctMbXSOOmLcOIpMf+F0K5Y36DblYu7zKp2zqR6GxTz8971Zgg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 019D71F00893;
	Fri, 27 Nov 2026 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792941;
	bh=nWJjryyVtq+FaAzNI3kGk19OnO62EvakdwcVei4FTaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=d2cFOwQiVuxKJLBJ+UcU9nk7Cb9natsyGGYdfBeH3EHOmMkYm75Yu/LkaBTV0c9Ku
	 VU6B1Y38aGHEkGMNFg/A4hV6WYhMIaSy+KlhJL3xsDCh82Pa1KeDMZQApN8bxV3hc4
	 UrnywbU+opk0vKLn5iV8TKwNUTtIbIoRanCXgTKYBpeTi2Wu0m3JhtswWAvDo7jy/l
	 CrNBdeCLlQDEnURey/Yd54XN2HqSmoZioItTlYpxQTUNJVhwNlNq7Hq0/08jurCT4E
	 c8afo2qd7Uq973elNP0l5zyYNCKejdX2PCxZQTTp3dLjsQ0/4W+BAaKphZSOVCD16p
	 ijRMsgw1ZnCYQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 802874D11D;
	Fri, 27 Nov 2026 15:22:09 +0000 (UTC)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD_via_B4_Relay?= <devnull+cleverline1mc.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 16:21:08 +0100
Subject: [PATCH 3/4] ARM: dts: broadcom: bcm2711: Add DMA to i2s
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-bcm2835-spi-dma-v1-3-8b134991ba2e@gmail.com>
References: <20261127-bcm2835-spi-dma-v1-0-8b134991ba2e@gmail.com>
In-Reply-To: <20261127-bcm2835-spi-dma-v1-0-8b134991ba2e@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, 
 Kanak Shilledar <kanakshilledar111@protonmail.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Florian Fanelli <f.fainelli@gmail.com>, 
 Eric Anholt <eric@anholt.net>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Miroslav Ondra <ondra@faster.cz>, 
 =?utf-8?q?Matou=C5=A1_H=C3=BDbl?= <hyblmatous@gmail.com>, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795792928; l=1355;
 i=cleverline1mc@gmail.com; s=20261121; h=from:subject:message-id;
 bh=btPPpOO7EzC2GTVg4V2ShCZQPnjgvV+OMkhhyyjh+9Q=;
 b=l8d0wjig/ng+d2XDHjj1iL8A1oUD0DKMCAGe8OdhNhok7gvQmwrUwtB2du+qBhGkuf7vjsZg9
 MbQ03pmSQI1C+pgbL+v7xuPWC7mXlP+0aONKA/hw0116AeiY5aq90HU
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=2UEUVmQyfsiFZkNS7dkgFg0rUmhbcMIytM6NYhxFt/Y=
X-Endpoint-Received: by B4 Relay for cleverline1mc@gmail.com/20261121 with
 auth_id=1594
X-Original-From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: cleverline1mc@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Kryštof Černý <cleverline1mc@gmail.com>

On BCM2835/6/7, i2s gets its DMA channels from bcm2835-common.dtsi.
Commit 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
added the BCM2711 DMA controller but gave i2s no channels, although the
binding requires them. The driver has no PIO fallback, so on BCM2711
i2s fails to create its PCM and no sound card using it can register:

  bcm2835-i2s fe203000.i2s: Missing dma channel for stream: 0

Add the same dmas as on BCM2835/6/7; the BCM2711 legacy DMA engine uses
the same DREQ numbers.

Tested on a Raspberry Pi 4 B with simple-audio-card and a dummy S/PDIF
codec: 48 kHz/S16 and 192 kHz/S32 stereo play without xruns.

Fixes: 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 8ebf52b20c66..0680a0b1ca67 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -1140,6 +1140,11 @@ &i2c1 {
 	interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&i2s {
+	dmas = <&dma 2>, <&dma 3>;
+	dma-names = "tx", "rx";
+};
+
 &mailbox {
 	interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 };

-- 
2.47.3



