Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36029606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AIg1A1WG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VB5QEXKs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9m1iAeouVAj4F1HOa9zNEIXietvCGZ4AUJji/MyAt+Q=; b=AIg1A1WGX7u6Mwdrfzp1OuqvWg
	NF+gYdiFG3ns6jzGf1uFQZ/D20HD0qhao2clydVRhGcmCwuIK5mhYhMwcqMAzD/pvZ9VMbSib0dSa
	5Obx8hJibZ3JhqpsmsKGtVdFokWo7alw2Pw5VjqasszCEwPHyt7XnJR3EsMqP1SvrASy24+V1Dkad
	tY/lmTDTUdH9vuWF9vY5fg/BDTB/4CoNXx5mdq4WOVZ4m4GeVGHwqEk9mvb22JVG1Nf49ttMzkapg
	4nrKv6rDns5VLW+v7eWcH3BZp2KmvClbMVw9TEh1w+Ng+CSRG3skdHWezDdoLF+XyGpkvxFrrC6io
	KxphJ/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2cf-00000005rvx-0nNS;
	Wed, 11 Nov 2026 07:19:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2ca-00000005rsE-1dfb;
	Wed, 11 Nov 2026 07:19:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C47C24593B;
	Wed, 11 Nov 2026 07:19:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794381591;
	b=hTLOgfBKI+lj4I3/tcqoPDViJj50tI3XLTumhxgrXMC/0jIsGaGszHSPmYAGG7SDBSd4
	 SUHGPMA4bLsWv8xGsfywivu1nVPjs9ibDbQOMlxUrG5oucUOa15jR5u0sJYFjPf/xB8DZ
	 2C8HRCCEwYGlw9o69YHPFfYfHn/aUUJUrLwGPl9A+ZMcSjgOuJMSsYd66Jsqi43SrWJlk
	 Nb/lIPGFDrzX063/sGukTGKEK4gW0mL3beO9toLSIA61YhTBsDzGWFak8oITcIUMBCSCy
	 /DjTh3KtIIswKlsRhDUan5pYD/lYNzBpdL7SXWQ969g75GigkvzCaxfkwXy1u0zYvgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794381591;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9m1iAeouVAj4F1HOa9zNEIXietvCGZ4AUJji/MyAt+Q=;
	b=N9aEP1wFYkCb6o/UxbSnoBzFFyYTPM+ee5WXCn23r1q0k+9uzOEbK5QKdAXojYbCi0Ms
	 K0nWh6WTDdUUUfjCsqzphayZ8wP/YMRkB4ezqhhCPTU6aQWTGU+G4PYiKuYp0aEgOFQXs
	 WxmkbGTvg+V9K5w3Vs9arGAdU9jjSYMQr27Jqkf6vDBe6cWQIp3uzKL13QYYI30VlHBbY
	 c9HkKWrXEPz37PAupgM07aXg7qNArfv4bgBa3OhPTD+Nobs1M+GMG94L/dbR/EKPhyp5A
	 FVSwkdIgTHCNCsrYAHvmalC5/xs4gQwGKkGLIrvaRJRodxm73R02EDpvp/Xn/2epp9A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 314E51F00A0A;
	Wed, 11 Nov 2026 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794381591;
	bh=9m1iAeouVAj4F1HOa9zNEIXietvCGZ4AUJji/MyAt+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VB5QEXKstkdY3oOhVT/0RkZEiw9g4doGvD4wKT5eQHUkG5ntpxX4QkYQ6z4BY5CbR
	 oYPDYy9+JyXgQu9Mk+23bT5nrKUTDeXsDki4y76Ooq70kpsAvsYe7/Dxtc3z30jl4i
	 kMdJIRulrcD1A4llznj2rAfI65XA22YHJ1lHee3NQfFG90p2KXafpo9FvPpwfuoXdh
	 j/L8ME6R+ZgO7T3+7MrPcv1U9EXYXk1ezBLAa6btOYqh4TsUmkAZN7SnZzmVaISaJA
	 HDLBFMZ3kEGwNK2L4uQPpVNWBLXiytV7xdh/nesNogv2ShZ/VhiX5Z/xdR0FwQaBdk
	 HnjKbjKzfFU8A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B370248E4B;
	Wed, 11 Nov 2026 07:19:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 07:19:49 +0000
Subject: [PATCH v2 1/3] arm64: dts: rockchip: use rgmii-id for the Orange
 Pi 5/5B ethernet PHY
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-opi5-dts-v2-1-821f666418a6@gmail.com>
References: <20261111-opi5-dts-v2-0-821f666418a6@gmail.com>
In-Reply-To: <20261111-opi5-dts-v2-0-821f666418a6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794381589; l=1895;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=tvDxnxzJS+qXTLT+S+2SEXSC6rLShYZjDQnh9IALLos=;
 b=lnyHB7N/nE5oteOdOo3aGqGL6oboZhpQwUp9nonKn8fssqXvBWA7+1eCQHDJhPHv/LrwnGOhS
 8BhiEf4sKmXCuVUzlTfp83d/CPMhehKxOMkRVKjdX8GmK7ljpdUS6OI
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

The Orange Pi 5 and 5B have a Motorcomm YT8531C RGMII PHY on gmac1
(the PHY driver binds as "YT8531 Gigabit Ethernet"). The board neither
uses extra long clock traces for TX nor for RX, yet the device tree
describes it as "rgmii-rxid", which according to ethernet-controller.yaml
means that the PCB provides the TX delay, and then makes the MAC insert
the TX delay with tx_delay = <0x42>. The setting was copied from the
vendor kernel, which uses the MAC delay lines everywhere.

Describe the PCB correctly as "rgmii-id" and drop tx_delay, so that the
MAC adds no delay and the PHY adds both: motorcomm.c programs its
default 1950 ps for RX (as now) and for TX. This is the setup the
binding recommends, and the one the same vendor's Orange Pi CM5
(rk3588s-orangepi-cm5-base.dts), with a YT8531C on gmac1 of the same
SoC, already uses in mainline.

Besides being the correct description, this removes the MAC from the
timing path for both directions, so no board-specific delay-line value
is needed any more.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index c153e7248727..7c1fd5905553 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -97,14 +97,13 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
-	phy-mode = "rgmii-rxid";
+	phy-mode = "rgmii-id";
 	pinctrl-0 = <&gmac1_miim
 			&gmac1_tx_bus2
 			&gmac1_rx_bus2
 			&gmac1_rgmii_clk
 			&gmac1_rgmii_bus>;
 	pinctrl-names = "default";
-	tx_delay = <0x42>;
 	status = "okay";
 };
 

-- 
2.55.0



