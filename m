Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE79606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M+0PIaat;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1QhQHj/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=; b=M+0PIaatfzSzXy
	Mfa3HUpYtmvcmxx2IZcQ6lySQDCAUtcT2THBrsVIEqkKDT6WHy8Z450FCMRWB/9tA37QdLQsnRILB
	HOqMkhOu4N9UgjnHp+12bvbZQsIPJ139Zhijhc8TIaryflTKao6EsN5CmXhLWu1D1ZsU1S4n8WjJF
	N06P7xM31z4UNfivy38Zp2Gm1/SHGzOFD/Km4RDxNeKqMwGt0Z/Kf1LcAEh3tHs/2IvUfJWbTkNx7
	QSKUjgorkwVmA+xA8VHGmQfVAG6Fui1PpEgCY3Y3xrxAcMul4lyyfjNO74A8siybe3Ocwu6TNt7g+
	+ppdChsFH6avWHxfS8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqhV-0000000FCd6-1PdT;
	Fri, 27 Nov 2026 07:48:57 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqgy-0000000FC6a-2ktg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:48:28 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-386d36ac055so367296eec.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 23:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765703; x=1796370503; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
        b=T1QhQHj/CGkmqQHTDiH98eM6JIn0gcJLteR1VZKL6yYDnedTMt6vXZCzSvxaKHjTfF
         DEJjYuPsIaSBsyw1yE9thy1L7Dh89VaA4+B4g4KYNUQPDP4q/1Lm/Mp/lMIuJoLMGo6T
         9YdGXCNTncy49YpMpsWggCWOt2UvV4nrmo64056BqQX5VSWovw+yPUJjD6M7+evBdx9u
         P7vmo4M9yGcB0cp1cnNxLi6yfJLRYsjzoI3MWaxv7Y+gVDuMqXulWAPOc5nsXFvO//QF
         ety0RoCjmVzahCIKhIG9NMUh7FABcBWCpvt0HBYr2xhSaN5DcA/AK0g6OFiKGAKJarn2
         mIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765703; x=1796370503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQwtBGptsppIiSD2EEtPZn/sWs62aWDTih2dvDjWrWg=;
        b=mTCbE5HSc7rPQgAhmO94haaVg1wN9uWW+IhmgbarFTsEWc3o4yDBFQp0skmRKxjZ9v
         ZlFiUpK3Iap1aFsWXiOjDNmKQckn2SldF5D+L3UApIKUQBxYpapHOwFRtVseMOZ9IJbc
         qfu9fUoGnAy2ke33B4XX2phaaOXfpz42eNVplh2c65+q3UGFeOb1mgPm1/RNxw2+Mqsw
         +CHb8kZbaNWqP2SIMI3Da4hN3gsI2iTnel3LCQ1ApgsG3havMkkKqyL1q6emTldEcv4T
         vBM+Pe9J2R83Sz/1SdWgdwm2uAMgz1tb1JNCDtBhUoEo1bfiS93vD974xB+T+G8orGc1
         4pmA==
X-Forwarded-Encrypted: i=1; AL+hErHXc9gx5WkK2W7CwmoZxFmyCQ0GEECInYzruaYIxxmvWH3yYH7P1dR2ACp/RgdHkjX5wEIKaIb0W5m3BxkGHAw/@lists.infradead.org
X-Gm-Message-State: APuU4Z9E2b7mWr/5nlZ/qj8Og6rNiEiI/H5H21HcNle6l7xe8kI/eU+p
	DITpngG5RGjdwhndxOiN1VJ8XFFXluknu64QQFLb4bWgnIqm6dfe+8OC
X-Gm-Gg: AZFdTZelg0kuLMWWdNU6rOmmkjl91UTRN40lb1UGJSf4qPbBF5+CNjT8Dd1ciJ12tAw
	zEF4H9sdlZ66wdKmRcfm6NftQcGpznRS7DhmcuSVTGA7TJ7hb6LqKXk0wPGyQaHR7jvW5cLgnmR
	5Xs7EAvS4YZ1mXmPU5qGEnyJt5v+3mLNskCfAm/LCq/1YMRaJ1PNOCgf27L8n1ad2m5MsMzknir
	A4Ut6PfjajssKOsCSXIZn9Kso+qL7GjSD4jFLK+Wri6lHvbOXe7Rlnd76ime3QixpfHtIz6bs7f
	qq6488vNxqPrYoRMYbAVtYJSoUFzViZCFBc55JmpKg7fPPtaZaGIwpUrXDbafU5lPqinRty/b7r
	6sVvagwTM/LNdEStbG2aiLcCOqgKkX5slXUHfRvKowim4NUmf3ELer48x4NEGQ0IPQI45IAh9qR
	ru7cK7B29CtiQtQraNJm7bwEKpBfAcKE6V+0sCJTp2EOEtaQKz6sgVadwh/MtGCWlwyLqdG4vtf
	e9nM8/hP1/ceElVPlPo/i7lZwioQmda2I6bwFCLuhaGaQZhGTgsMXJCVHXDlpJqcz+tmBU+rySf
	hgT4Nr8+yCJ6Jobg+J/JTDMab1Bandzrz9oeyLlCz1NzRI+kCLrjYzKZiYg3MjQbbta6Q2Y7Xyy
	ccfderVhMNxA9RpMhbQxS
X-Received: by 2002:a05:7301:2624:b0:385:1a45:47b3 with SMTP id 5a478bee46e88-3856e24682amr38262478eec.1.1795765703177;
        Thu, 26 Nov 2026 23:48:23 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:48:22 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:45 +0800
Subject: [PATCH v8 9/9] arm64: dts: rockchip: add the dcphy mipi csi-2
 receiver nodes to rk3588
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-dcphy-rx-v1-v8-9-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=3591;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=wHYitdr9DGtZWdI+e6LvB71Er0urXzEmjuek2OzfqCA=;
 b=x0Eoz4Ybdy9c1XvKnjo/yqIl9hqyaAcBUU0jRw3PI7nE/mnUYSWZQHERZwCA7q+BJ+79/HpZd
 lElzx8f/wgEClUUQIs5L3e8ZodSwC3V6x4ufyRlZ8cSnMgr5Oku67mf
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234824_704386_4310C100 
X-CRM114-Status: GOOD (  12.32  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MIPI0 and MIPI1 receiver units are connected to MIPI DCPHY0 and
MIPI DCPHY1, whose receiver side is now supported. Add the two nodes and
wire them to the VICAP ports.

The csi nodes select the PHY receiver with the new PHY_DIRECTION_RX from
the dt-bindings header. The phy nodes need no phy-type: the DSI host and
the CSI-2 host both run the block in D-PHY mode, the default.

PHY_DIRECTION_RX is an ABI change: an older kernel takes any cell value
as the mode of the block. The csi nodes are disabled, so an older kernel
is not affected until a board enables csi0 or csi1.

Before v7.0, there is no CSI-2 host driver, so enabling csi0 or csi1
changes nothing. Since v7.0, a CSI-2 host driver probes the enabled csi
nodes. An older PHY driver then gives the CSI-2 host the PHY transmitter
that drives the display. The camera gets no frames, and the display can
stop working as well.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 68 +++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..c7174c2f15c3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1516,10 +1516,18 @@ vicap_dvp: port@0 {
 
 			vicap_mipi0: port@1 {
 				reg = <0x1>;
+
+				vicap_mipi0_input: endpoint {
+					remote-endpoint = <&csi0_output>;
+				};
 			};
 
 			vicap_mipi1: port@2 {
 				reg = <0x2>;
+
+				vicap_mipi1_input: endpoint {
+					remote-endpoint = <&csi1_output>;
+				};
 			};
 
 			vicap_mipi2: port@3 {
@@ -1568,6 +1576,66 @@ vicap_mmu: iommu@fdce0800 {
 		status = "disabled";
 	};
 
+	csi0: csi@fdd10000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd10000 0x0 0x10000>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_0>;
+		phys = <&mipidcphy0 PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi0_in: port@0 {
+				reg = <0>;
+			};
+
+			csi0_out: port@1 {
+				reg = <1>;
+
+				csi0_output: endpoint {
+					remote-endpoint = <&vicap_mipi0_input>;
+				};
+			};
+		};
+	};
+
+	csi1: csi@fdd20000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd20000 0x0 0x10000>;
+		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_1>;
+		phys = <&mipidcphy1 PHY_DIRECTION_RX>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi1_in: port@0 {
+				reg = <0>;
+			};
+
+			csi1_out: port@1 {
+				reg = <1>;
+
+				csi1_output: endpoint {
+					remote-endpoint = <&vicap_mipi1_input>;
+				};
+			};
+		};
+	};
+
 	csi2: csi@fdd30000 {
 		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
 		reg = <0x0 0xfdd30000 0x0 0x10000>;

-- 
2.43.0


