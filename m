Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38344606A841
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EPN2nbBN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAi+wyB2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9m1iAeouVAj4F1HOa9zNEIXietvCGZ4AUJji/MyAt+Q=; b=EPN2nbBNskJyF6SSSGho91csPL
	5NS1fvzSX08i0uyRGOTtzq22OpLx28ufMU2jo6z1ZDC42QuFQYzpXMNgblH4Omxv5jW3e+AorRKVL
	uJU1tFs9TJq/TCodGaDqxZsduEd9sEHmeHWXx1mdd9kZUdtFjFpznxkEs+qLLCUf4rL+8ng8OzE3L
	Eeg1NsCrtI/dpQcebnIrIrTcWsnE0yJhzukVhXohEx/mf7pjy5lzUvpNWxjrxg56+6rsAH4qyrETz
	gJLEcEwNVMwsnE7Z+X7ELGGri7nKfoSlyk2f/i8pSll9E9DbPeP+8wE/fxuc5guxocjFsI239ALS0
	xI+1fC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg97-00000002sBP-43vL;
	Tue, 10 Nov 2026 07:19:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg8k-00000002rKm-1zuB;
	Tue, 10 Nov 2026 07:19:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D3CE42AF8;
	Tue, 10 Nov 2026 07:19:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295174;
	b=stY7AnjsV5+hxqpQbFWhUAAiPtMkoU88acSi9uH3uhxbMNAYHvyYBUlPKFMyAsv83RmC
	 yiRnCqZ2sUbzawz1xBW4MkoK8M0NOBg53JUm257DCANMNLrATFOKDHusSaEkbACe0vM0M
	 fBBnJbTPveFr8QxVvT9WtrQ7GfbYGggHsoZSrySoNz0zy1tns+Z6DkhI+LaMT+fTX0CqL
	 8DQHh9R3AqjCv0bbowRcOTeUYrTqooGG/o/cQQqnPXwrPJY/IWky4wJfi5RlowFd4B+ZC
	 JZX755h5BPbXczupPGNhbo9gOUbBGSOHy/oFc2AB2+40M893e9gZxD40YKlje5fH20g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295174;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9m1iAeouVAj4F1HOa9zNEIXietvCGZ4AUJji/MyAt+Q=;
	b=NYTO4j0ktZ8/XNOR7vb6/YXcChT04T6EveseBcPlJhUs846t8zSkwuZcLVAJ2X269EOV
	 SJw0FR0W8Lh/VbegY83DBGWThYS9JfsOGuY/8rOUphlX2CnBg3yDd8n4n9qVaVeEwerhL
	 +j5Y0LKPq2sGSm84xH6IWZs0ruKsUKJecG5wTe5NAQzAiFyiKfoJ7zvifZF2JaUNewR0e
	 ZhcCXxYyf1H32F3tmyupA0Je8Kwnzly9Wf9J9HivZCN7r9jAg6Q/EPwoifbgTLpYYFRLF
	 gZnzt/PbnlBUGrLGuvB37n5P6zn9wPLorN6mSIsyrBZpw/oRvKs4cVTVio0HDV5gXuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AFFD1F008A1;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295174;
	bh=9m1iAeouVAj4F1HOa9zNEIXietvCGZ4AUJji/MyAt+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iAi+wyB24SUzRN7Laxt3DST7CGzdlCsf+NpaLeF5Xsce6ksrlS1dpgft2E0vh1R3W
	 lfGAqDds1Y+clTW/eCAR2ayIVPxORVhCq564P+A2FLX9rr88OOSqP54fv06fYvFr3D
	 OcZXas+fqDGYgmydmc5x+Q2UT95SCzAIzOZjKvGyes7C6NFJcEIkdhhGg3gQ8rg8iP
	 w4e6mw1ih5e8jvX1dVjzLVHKPqTmJNCEHJBz/KmhXoEZgG9heRLCiEWv4Xlcd6NZIv
	 6mOeCAc8sJBxakSd+i6onllX/3tB09HWXcd28rrHYiaoxgtKhV7y17Ur6Eb/B9P5SB
	 bLO818GHVfrJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1FF46489BD;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:19:33 +0000
Subject: [PATCH 1/3] arm64: dts: rockchip: use rgmii-id for the Orange Pi
 5/5B ethernet PHY
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-opi5-dts-v1-1-582b63d074be@gmail.com>
References: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
In-Reply-To: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295172; l=1895;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=tvDxnxzJS+qXTLT+S+2SEXSC6rLShYZjDQnh9IALLos=;
 b=KKWIzOxcaNMe8ftleSNYT2RAzatFYKNDsM0hJ+ZT9gzxNp9n6GiVSLnuWoGh6GB7QIT2+iaZ5
 WBWjPYSD2T4BbFAIEdJQJaG+N4pYaqM2vVK9II35mxoc0otEw4FLRuy
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



