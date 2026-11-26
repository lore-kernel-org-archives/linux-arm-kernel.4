Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eFHr/jbN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iX4cpx0L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OmYvrk70HOhmdcTLj1sUQ7ohQ8C0dQzLT9pRzuSGOAU=; b=eFHr/jbNq9OA81
	c2AuHTcyOJa2yHa5V4k5guyys/si9gJH0CiMyLNrvMbt7CbmvmI/XJV/Nl9sJnOrdOQYkm4k82o4f
	wI+Xuf7nUjx/AnNQGUpu/lEclEXxwv37X/iLLnDZM4FWyQOyASbchyHqRG+hT9N04zdZ5zHUHG+f7
	A8bjZTQc7jie7EheSFyX4aBOGxYDteUqhL1nbJyozQP0y0CDCiSiyc22wNRP+B9OnQ5U0gYiRmfOf
	9/lVtvKI5/5t+Jo+TO6A7Sj5hNtAeYbdnTNm0yDMpRH04OcDWbaTw8pbCYOF4MnVczF2BrChduRPi
	emv8ToqrRuyv6ZqG2hzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV9-0000000Bg1S-15ND;
	Thu, 26 Nov 2026 00:38:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUm-0000000BfkP-0pRb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A41DD6015B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4C41F000C6;
	Thu, 26 Nov 2026 00:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653471;
	bh=OmYvrk70HOhmdcTLj1sUQ7ohQ8C0dQzLT9pRzuSGOAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iX4cpx0LcdjhSQpTeD2Nb/elqkdSQRXfv/ReZNHItM+zAUl7mgvOOzXokBAuHnaIZ
	 yNdspXUj1EhBaFpS959APk1CsuwCCgS2TXJ6kWJoWqlu9VOyEdjBgaRTcV3cGjNf0Z
	 TgZz9UmqHgl/pSar/fMX8er1OstePpufMRqAUep0l8Dfw+npH627kBnfmm++/o49oO
	 Uc0st9qkS7GuSvOtsRUpknJpKhB77i82bW0hGAExMD5TRYJOLSyGCIh2R/ovYCAND/
	 1gMJalupwqiZ3BQ7dqY6nEQRHVCbCCSribzLZs9L7OTFz3BVGPXNPNQ8G/YCQygj4p
	 9HXNmOVs3soRQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:24 +0100
Subject: [PATCH 20/20] ARM: dts: ux500: Connect the AB8500 ULP PLL supply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-20-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
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

Connect the AB8500 clock controller to its VintCore12 regulator. The
ULP PLL draws power from this rail regardless of which board uses the
PMIC, so describe the connection in the common AB8500 include.

Codex assisted with the device tree update.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ab8500.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/ste-ab8500.dtsi b/arch/arm/boot/dts/st/ste-ab8500.dtsi
index 03cee37ae478..30c3870c6cea 100644
--- a/arch/arm/boot/dts/st/ste-ab8500.dtsi
+++ b/arch/arm/boot/dts/st/ste-ab8500.dtsi
@@ -34,6 +34,7 @@ ab8500 {
 				ab8500_clock: clock-controller {
 					compatible = "stericsson,ab8500-clk";
 					#clock-cells = <1>;
+					vintcore-supply = <&ab8500_ldo_intcore_reg>;
 				};
 
 				ab8500_gpio: gpio {

-- 
2.56.1


