Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D4606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=km929cKh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mNsXUo0L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FlNTZAk5y5930XAFZLZsU7ai7uZRAkodOgG5tS0b+qE=; b=km929cKhycOwX4665bhEcqSPXg
	cZCN/vYbESYuHJxkl5ex+pD0UrDZGyRt5XTWGdqpzKzhrxaD/XuPFttvfyMIfAN2ThZUaFRjy6I5H
	5IDm999gjE+RgiE4l15wErWZHPTIcY8tuxjMhLwyjFb2y8nzMA5JohtOnYb1RAQKkoP5Ec2AHy9sM
	iT94IMqxcw5Xt4yzwOZOYaxqutWdzRTnalylkWCdEbw41AjfWEft6z64GUIOzpXVnF5Ux1hlAgt+m
	sxRobGTgAzgh1da9ngQEnuTFM3o+h1ctx/qNhP3Pv9z35CTHsGeHBYEQm8f1u+iUGkvZlvx2uhY/9
	i9l/1F6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxmY-0000000GkXA-2R2l;
	Fri, 27 Nov 2026 15:22:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxmG-0000000GkQ9-0gt0;
	Fri, 27 Nov 2026 15:22:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AAD914164A;
	Fri, 27 Nov 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795792939;
	b=z7hcMukyHwUSzsvgvxhMWESO8EaIpd3oKPfRsXFfSDi2vMP+llvpUUUPkAZqJgw1sRDu
	 10hL5BQIP76ayS4XbYCRJ372cse0BVGBNmI/anbTU4ymWqnv1pLz2l9YAT5nJVwPhTPIo
	 3iBquG3aoFmIKc4NeTiozPfeci/sPmokBbEMp3YkGVyuql8AvOEPP2rAGE9fKHFr+42wN
	 /82YkcLje2ZD8xCb7BOlI6IQst2x8lsckSZHKaICxzIXNr6x6CVAUuniJQMpi74PQ9XIv
	 vrpRk7yJlh7WxzCvJulxsOXN6r1o3x4zkAi6gd/2wQUagRykVrEh9M+PLkwdVs0LKcw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792939;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FlNTZAk5y5930XAFZLZsU7ai7uZRAkodOgG5tS0b+qE=;
	b=l55Dk7XwVviSNemzHkP2AjQSgAufynqyDuySAKTG8YJOgBbSpR6GqAX72z+Xp7h0c5dE
	 Yll6Ndq7skPYWXXqueGY+R+HxugIC+Lah3ZsTLWpuTfJ+UhETu9StJxW9c80VXUYVl32u
	 Mt9+gF9y20swAlYsywmgOtjnv6yfUZuZ+oBg+5fkRvxaZ6c6WYTtw7FgHwe3Ui0oTA+iE
	 fST0NnOVRkIbxZovMoNaNfSktJd4H8agSeJGSiTzEZG4Gv0nt5AtnjfRLkYO/AW0qpk89
	 /lud4NvvCsqHSg74reSm0KnwQSxLRDkDLrJGCif3KoSnCIxVdDwl9Jaj9oudxRSqZyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC5791F000C1;
	Fri, 27 Nov 2026 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792939;
	bh=FlNTZAk5y5930XAFZLZsU7ai7uZRAkodOgG5tS0b+qE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mNsXUo0LK/FZSfwTZO78ua+mS6OOIlIKIg1BSyHd9x4BlqQ0t9EGeTJmRpWvNdJ1A
	 54ruxbJbx+Z4j5YD+XFwEAaS4trhkyeCaipXbZRQGdOfRXeFesM/TiTtUc7xfOTuIT
	 hmrOUmNacLf2QOvegvKbTDwGqSLehJhM1R/fS9vhTuW7yandrvfjolhd0jHfx5HwlD
	 dah2yRzysECM4x/Skb/95e97WTLK2rOALwO7V46PpsIEJH8EWsB8iOn9qlf6KuEiDD
	 jSXioNy8YPrmMLp+jb+1+anE67yaXQZO4l9kpcPwHKhBJ6O+cvkXzHRXGNSYTOFYBR
	 U6hsvth8P1Pnw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5CA6C4C28E;
	Fri, 27 Nov 2026 15:22:09 +0000 (UTC)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD_via_B4_Relay?= <devnull+cleverline1mc.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 16:21:07 +0100
Subject: [PATCH 2/4] ARM: dts: broadcom: bcm2711: Add DMA to spi0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-bcm2835-spi-dma-v1-2-8b134991ba2e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795792928; l=1485;
 i=cleverline1mc@gmail.com; s=20261121; h=from:subject:message-id;
 bh=3LkYLqDSBIdIHjYVfPnYqCyqSH/Km4Qx6FOxvWDlO2M=;
 b=UMpTdwMyu7XiZ63swbQ4uW4crbOkMqjBmdrn03nR2H+a+YjGOGWQV5WYQFCY4RYCnaDTd3UMF
 Y3ZLYx9k/mRDyxHzsfm+Yvoavka08+8y3q1f7Lqgy7gpgNyLov3T+4W
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

On BCM2835/6/7, spi0 gets its DMA channels from bcm2835-common.dtsi,
where commit 3ce82be9ae3d ("ARM: dts: bcm283x: Move BCM2835/6/7 specific
to bcm2835-common.dtsi") moved them together with the DMA controller.
Commit 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
then added the BCM2711 DMA controller without any of its users, so on
BCM2711 spi0 falls back to PIO and logs an error:

  spi-bcm2835 fe204000.spi: error -ENODEV: no tx-dma configuration found - not using dma mode

The BCM2711 has the same legacy DMA engine and DREQ numbers, and the
/soc dma-ranges already limit spi0 to the lower 1 GiB that the engine
can address. Add the same dmas as on BCM2835/6/7.

On a Raspberry Pi 4 B, 64 KiB transfers at 31.25 MHz go from 26.8 Mbit/s
with 11% of CPU0 left in PIO mode to 32.5 Mbit/s with CPU0 nearly idle.

Fixes: 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 5e3b4bb39396..8ebf52b20c66 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -1154,6 +1154,8 @@ &sdhost {
 
 &spi {
 	interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+	dmas = <&dma 6>, <&dma 7>;
+	dma-names = "tx", "rx";
 };
 
 &spi1 {

-- 
2.47.3



