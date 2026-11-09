Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IlGnknXG;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eR4dzktP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=; b=IlGnknXGCeox0N
	4A2+aHptWScyHakfsp6TuxPKPft6XXfCVWPMmdBadKx6HxwirQdPGl3PsSZC91YQEwaUyvhocLxNv
	hrzIWLVEiJCC9uUmgVCC1DUyLYLtVKkLau/q+2Kl3APmZKdS8pqWP9xnH/EvaGEVErj2udCBxwYEu
	9ozzqsXQYOJA0J3bAEqxhP0Vdz7a+FX0ur0R1PxBr41vSuMWj9LhgHhxR9o5nElkIOsXdZ/D+p9qR
	TL+N6Gq412v2TCoYPQW+48saYxfgYQXjn7DNNF5seT9JKytEWvLDo/XanV8A2rWMsi1lrLi5Dw2LB
	IBU0b0HxQaGqOnPbeyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOPy-00000000f3H-2Mig;
	Mon, 09 Nov 2026 12:24:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOPt-00000000exA-1uZO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:24:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a214af2076so5596935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 04:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227043; x=1794831843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
        b=eR4dzktPoEAomuwXmGvZV72UjzDvcEAbQOUSC6kluOiQvmDH9RiC7ademsNe03IuxR
         aUj/TwvCYG9wZQCbT6mdobfaCi2DsxN2ZUiuNUi/zb9sNiEN3E7hKcXBUeIhUgxPhFY/
         5l8gksbgSeNijbdlvP7bK9LplEJ4hUf2bVlWtk8GPzdIEtWJlUKIqkhR8vJunC+zeBqG
         32Hw8HOCyxdSJOYVYU+SLiWWUc7MOLTdBmt/k49L88JTCdAaaK/PEISfJVhwR8AMYovB
         6cOWmIRSx7+nBjZlrm0FOMHx5GVRuVDQOKw1Npg/Z2QCbqPXesjj4WBOIMr5Kkg191CS
         pL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227043; x=1794831843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
        b=UBa8hN7/SC4p9PYE2bNyK4Ts6BAQLWJTTJN4gVOXt8LnjUtuf5b7zkesZ7l0TiGbJm
         wKACQ1GCBHzVfjZ+NC3nGKpBJT/JxnNz+TlQd+7gHYhfHGyXVzQnAuNxLzQIYI7nkN9K
         narQpKBK6XzFP/dnw+CFutTkg6b6CA37kAsRMdkLyZRujw6cOVI9gQa27Yu9m2yMA28f
         tefSbmODDvlNmrRhy4JmCiokg438MmxYPdVHyKWGTIPeCV3hoB9HgnozAJxcuZUdV+gb
         iSpkSTc6HrhSuQjZNYI1RG9PRSiqpxGE2HZ0RgmQgtPQJqInElXUSDLIaHwKoCjq71qg
         h25A==
X-Forwarded-Encrypted: i=1; AL+hErGgBul1qwMvFBiiSDe6x1LRWkIh1hJxZMC8iHHr6seCUaorQhRJQ5tIgD54TTtdUOhgleJI4jfCJKtFxuy979jJ@lists.infradead.org
X-Gm-Message-State: APuU4Z91GAqel1WOGkmBx7FStTSwPIq4je0HE/PzjowU51Z5ZbvmjWnd
	EYJ3avrTdbkOgjjbo/8q/X7ZMrFlevKZZP6ldHuM/j8j4q+pMxI7Gfw81UkQCRaLsWE=
X-Gm-Gg: AYBFou3jI5pI3aYkHtH1vizlpjI7ftmOYUVgIDyMzW2leLhlcZ+NsSSD4ttP8mJT98T
	kwlqAgVk2vLJgugAqgA5yLvo35q+RzKkofeyYEM1csLSf2u5aS7sgqA13xsJ7+HCDCQveFFyaPQ
	tVXF8oGRduwqdifj82ZWUeLzJh7HGyQDASFxWXdkMjI+dRsynmHk6gKYdXjqX6unnv62IvMWJcn
	Kdow5PqQZmh/8u3iszssV4ekFMFEa5tt+cmlN8RhSfsaqckBsWjziJk8fXKjyHmpN7MbrtsZ1db
	YY9dAcOwSzZ4iG5cAAxKpNU35ptf9qyIE28l8/GdmUPEI+tQ7LwM3KkU3HGWOx69wFtP7KVuRxU
	RZN9VCw3kssR/Lq6KMbTxP5essIUmrs8wV5SLk1fp+KmPZv7aq3v3vPUT66NvlvoyOu1uITsqK1
	RFgPdQnly4HiKzxWi0Fwcs85o6JRxhdGJtZnv9rjInPCXNkHtI2eI1gspK65HshqoVxKCxDOmcM
	Qwq1jQeDw6C7nU4t81lDh+DYRg8WgYdDhg9iExPA443tY1oMu26kHAJ2Y2I8U5QVkHiExjhi7IJ
	QcNgxuDcdp3euJkElsluP3u/2AdvEMtSKbtaaMDqQKSDPtSk11vstOfz/tAQXhJCnvew1FFPOh4
	MN3mBBHlquA==
X-Received: by 2002:a05:600c:8b70:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4b963c73ab1mr72661995e9.12.1794227043509;
        Mon, 09 Nov 2026 04:24:03 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:02 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Mon,  9 Nov 2026 13:22:48 +0100
Message-ID: <20261109122250.720757-4-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_042405_509621_6E2DE714 
X-CRM114-Status: GOOD (  10.92  )
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
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add dsi node to the i.MX93 for support with mipi dsi panels

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index e926b6360a9d..1123e372eb79 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -58,6 +58,39 @@ npu@4a900000 {
 						 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
 			assigned-clock-rates = <800000000>, <133000000>;
 		};
+
+		dsi: dsi@4ae10000 {
+			compatible = "fsl,imx93-mipi-dsi";
+			reg = <0x4ae10000 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX93_CLK_MIPI_DSI_GATE>,
+				 <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+				 <&clk IMX93_CLK_MIPI_PHY_CFG>,
+				 <&clk IMX93_CLK_24M>;
+			clock-names = "pclk", "pix", "phy_cfg", "phy_ref";
+			fsl,media-blk-ctrl = <&media_blk_ctrl>;
+			power-domains = <&media_blk_ctrl 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					dsi_to_lcdif: endpoint {
+						remote-endpoint = <&lcdif_to_dsi>;
+					};
+				};
+
+				dsi_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
 	};
 
 	sram: sram@20480000 {
@@ -183,6 +216,7 @@ lcdif_to_ldb: endpoint@1 {
 
 		lcdif_to_dsi: endpoint@2 {
 			reg = <2>;
+			remote-endpoint = <&dsi_to_lcdif>;
 		};
 	};
 };
-- 
2.47.3


