Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZoOPnC+J;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=PaJhxzGc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3gWjlCw2QTfox0g3HZN4BoH2IX2GuKXUdK1WzuqrVMY=; b=ZoOPnC+J3qmmVW
	k7nBvYmIjxJsEZ7xK5sj+BWOq2jligClNwIk2L2QF4Bya3Hk524QbeJP5R/COfzJf3OxoS4iKGmHZ
	0mXPcThDdZIZVdenrUugAQLXK+RPeZkxJwGSGliJ0wbSdBPd/ceM4THxF7d7Y72enZgSmJCNl+N1W
	BMTyzT7O6ERp2KYipPp5fWoYEadUDG1IRNxSbLB0cTWUUuTFEPTCiWp8JFdnmopOsuEZj1TEXM6ml
	IO4SasG0bGq1clqd/jnF57tQWXaojQ/rVzs3uZisjrB4G+LqBhnRyD/uHsBqbPTEVdVqO9YG/7yEz
	6/2hwvdz3OcvJaTS1/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKC0-0000000BLQ3-1u9L;
	Wed, 25 Nov 2026 21:06:16 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKBj-0000000BLIa-39Ty
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:06:01 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 152E34C963;
	Thu, 26 Nov 2026 08:05:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795640751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3gWjlCw2QTfox0g3HZN4BoH2IX2GuKXUdK1WzuqrVMY=;
	b=PaJhxzGcXr8Ch81hdMGSPnW0TTTgkQsuIC0uqpn3u2c+fTVO3jgQoCJPEgB/zBra8B7YRH
	eNHCICrA9VYJRyl7dQDR5An3UE/VK3xkTGJjIOsGZ3PkVB2okGVqOMVsDqW5ScvWwmXSUf
	v/Gk86i2r2twKLRkOIkdZew3Y4ymLNo0CJpUw7rZY+zIzSgMfbvnxv7Anlm6y+ggtU0e1I
	32r/KBLiRhu4zOsK4ty+P5OT9Yg9K9SuqEScUY3gro7zGZazZ2YIY1nheX5e+oFe4qzXCa
	6OOdKdl3CKAyrozG1blmJUyquqVIYjscwBggTSVm7HW/Kqi578kHrJ2PsxA4sw==
X-GPT-Reason: legitimate personal/technical communication. The
	message is a technical patch description for a Linux kernel or
	hardware driver update, which aligns perfectly with the personal
	mailbox (alastair@d-silva.org) and the sender's identity
	(alastair@d-silva.org). There are no indicators of spam, such as
	urgency, marketing, or phishing, and the content is highly specific
	to software development (ARM64, dts, Allwinner SoC).
From: Alastair D'Silva <alastair@d-silva.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 3/4] arm64: dts: allwinner: sun60i-a733: Add Crypto Engine node
Date: Thu, 26 Nov 2026 08:05:31 +1100
Message-ID: <20261125210532.695823-4-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125210532.695823-1-alastair@d-silva.org>
References: <20261125210532.695823-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_130600_179527_83171DEB 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Add the Crypto Engine v5 node to the Allwinner A733 SoC dtsi.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index f4fff495e234..c15899ee0eec 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -241,6 +241,18 @@ mmc2: mmc@4022000 {
 			status = "disabled";
 		};
 
+		ce: crypto@4603000 {
+			compatible = "allwinner,sun60i-a733-crypto",
+				     "allwinner,sun55i-a523-crypto";
+			reg = <0x04603000 0x1000>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>,
+				 <&ccu CLK_MBUS_CE>, <&osc24M>;
+			clock-names = "bus", "mod", "ram", "trng";
+			resets = <&ccu RST_BUS_CE>;
+			status = "disabled";
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun60i-a733-r-ccu";
 			reg = <0x07010000 0x1000>;
-- 
2.53.0


