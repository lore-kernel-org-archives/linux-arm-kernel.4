Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAF6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwhHBlvS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jgn2YCCi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fW3fLuV6AYBNo+1+NsPV3NuNvPOuvM4541C3Z2tQ3FE=; b=rwhHBlvSpxHwLo6g9y5ZZFSWrl
	QFxJYi/pvb8nc+1B6FTEhq7oIyI80mhyE6gBMwiNmGTLu7Wh0FJgVl2f3YY5g5oBCsPhi//fuY5SS
	juFWl41+Gu9y5JV+/PGGnvCbK+ykL5Z8lUhDF8awhqZ8hSjTrI5U9ivzEXHnhJhDsmoQjMj+tdFzA
	kczxbZYB2JYsjcGzk82RfN1Fu4gOTDJB4buMiOMLupW2Wg/YzX2BV47fXOoKSz0jA01sGpIAwq1NQ
	yiIMyENQiHgQt6ngZvENstUx5iH95RjsfOJQBboQK+grrBKiF/V39FZ4V81+l6sy3q2FxKSSeIQmM
	ORiBMT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxmt-0000000GkiN-0dIn;
	Fri, 27 Nov 2026 15:22:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxmK-0000000GkS3-2Vnn;
	Fri, 27 Nov 2026 15:22:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 087A76111E;
	Fri, 27 Nov 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795792943;
	b=oA23ru9VpMGwJeHgQTgGh14BLwexGbHp04fqbCiAI95dyb0tj8/Hp+Lj7jx+pPrZATR8
	 lQidwj2zaGR5mnhRq5jlncvMGxR1vBfWbUkpWGe4V2SSWMgr5dAk0a9XyNDr//aK2qOnA
	 wNt1HjZJU+HjP81visbEn66vw8WTjzPLdoEE9hoYYTgbNPLShKmTjxjJ6FzFsAlPBgiGW
	 AqvrZs2TZt7kEAKoX71bhcCemMQoQjXWZh/hCzwxSTFcV47UaJ+jhO7iDyHMU60WKehT0
	 xltYZsOxlscZLMKs5RUQ/Yx2+FIUEZcjLLHMB17qzFQZcISO+Ke+1KcAfEcsw+lN/Dw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792943;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fW3fLuV6AYBNo+1+NsPV3NuNvPOuvM4541C3Z2tQ3FE=;
	b=uqkqp9zTvvdD/KCXdZrXqUpIJcZj1NxC0uu8Hm9RwRVYXlQl3TNtYnO5VZFPOd470bn2
	 noQYp9V48w5lTlchJbboNn1ovhJx61HL3N0OY12PV+QPDR1GEHJ1wKPAkSD3rh6ZGE4xq
	 BeVxEfPXSA3p6s3MeBHE/ZTakFIc4hwFBptnVM1sgiyi44IbkuBsYr02thvcu4GpTYuo6
	 E5dBVQTPINJAoecocoEX6harMxfsDo8F2M/7JYJ4tPX5VUCGEB3EWW7PHs23I5pclL236
	 gQBkF/8pcZ0d7d+DDJksDAdoZ7XjHEMkwTQP/IMY9NVUL1TEJvBREIFW5hmlDwHYsCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 212541F00898;
	Fri, 27 Nov 2026 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792943;
	bh=fW3fLuV6AYBNo+1+NsPV3NuNvPOuvM4541C3Z2tQ3FE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Jgn2YCCiuvRvk7hWoKQ1tb0DVpg3GbCNKOkJhrMfl5RN6GrQiPu9EAmfjm2eVBxBk
	 gq3Fysq1USeqyM8DQnc0DcFS8fLkUURh0ML6HNEhMnyYgrIj9DEsAKnOzE9frTyFRo
	 ftQ496aGGl5mr59f9e+BQ2CpM5Fw9GI4RbzQFYupZasCE1q+TghD8w/kvgsK/7nooc
	 MIqWXCvyjq2nqOV9LcsyG6/bhUePnNnYLGd5EbPYteabXgaJvlhciWVCD3RomK+iQT
	 IrT24azqk7S9EYVDG9YDL4UnTwlVHfHegZ5Ko/fBrkprRvFNEW7jVYgA609B54UIZK
	 wFdAzOZ2ryL0w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A263D4D853;
	Fri, 27 Nov 2026 15:22:09 +0000 (UTC)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD_via_B4_Relay?= <devnull+cleverline1mc.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 16:21:09 +0100
Subject: [PATCH 4/4] ARM: dts: broadcom: bcm2711: Add DMA to sdhost
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-bcm2835-spi-dma-v1-4-8b134991ba2e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795792928; l=1245;
 i=cleverline1mc@gmail.com; s=20261121; h=from:subject:message-id;
 bh=/3A1iVIGEOw8HTcWNipf4TWXImmbOVBsqjUojsiUWt4=;
 b=VCfdHD94pBgq/9ZwoeVithEmUptRa44rd0G0LBgq5ZCYGee/qKBnsr7Q5Dnues8r6YQKBlxjj
 cXOmfx7dOBlDojaQA6Cz4l1rfPKOkeQM0VWyJuqBez2grlZjLIv0At8
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

On BCM2835/6/7, sdhost gets its DMA channel from bcm2835-common.dtsi.
Commit 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
added the BCM2711 DMA controller but gave sdhost no channel, so a
BCM2711 board that enables sdhost runs it in PIO mode:

  sdhost-bcm2835 fe202000.mmc: unable to initialise DMA channel. Falling back to PIO

Add the same dmas as on BCM2835/6/7; the BCM2711 legacy DMA engine uses
the same DREQ number.

Tested on a Raspberry Pi 4 B: the driver gets its channel and reports
"DMA enabled". Nothing on that board is wired to the sdhost pins, so
transfers are untested.

Fixes: 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 0680a0b1ca67..e18f11fb7f00 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -1155,6 +1155,8 @@ &sdhci {
 
 &sdhost {
 	interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+	dmas = <&dma 13>;
+	dma-names = "rx-tx";
 };
 
 &spi {

-- 
2.47.3



