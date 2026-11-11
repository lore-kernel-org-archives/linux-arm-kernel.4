Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FF9606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c74dCYkW;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L1JR5QRb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=; b=c74dCYkW7uSVpT
	51/QEq3EWBSp60CtBJic13EHoGgOZgfLhyl0DHubgY2DeugP/9EXdOC4SDgRRUnHiRUUo6f9P1u6e
	KefpvOf5TU583NL/6jc31jqXQopPKcZ3ZdxIujtzxAqT7kihw6VJed1ZJaztW9fUpSLFPvTiNd9OW
	pIWKREw1V+dKPZRmzrAFlSpxQcCyzCoKogcMgS7A1kwtCsi17j0l6d+rlbOXxgvUVJKpM7HN/bCY9
	ruZTdxNr4etcCspGFRWb4plsJqfcxnvfgOuBshQQfIAbxH/fVZo94fA997dlAu4MNwnd3YQfShQqt
	FZw+2j2rBruuINFIf5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8QZ-00000006or2-1JCl;
	Wed, 11 Nov 2026 13:31:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8QU-00000006ooL-0qD5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:31:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so38424845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403904; x=1795008704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=L1JR5QRboULGx5cHz8W1hrfH4Nsjdnvqxcm0GohAy+qsCym0VLSPyUYlNKq50s8sHf
         XbA2gaS/AKXXmmpMnAvrynrgdAK/ZZM/iydl0okvm1MlxPMy36K0QjfeWM6pIUyLITmT
         EWWrKyBBMFw9gQh8yUSeGUGH5a+9UEVfuVaZ3aMRgBpeZ5n0/3GZatVOqPStCHWBodK4
         M4W02izMfHTIeLAYn8pklqknRBzPMzYWVLplzYLhr/rt4tdq1eazynBCWmZjNOwpcemT
         UjmdbfUYU9BEJhOOLY4q5ytk3Q0CBthQVww4f4utaxxZdFNl/nmYcnDHXRuD8wrf6Uqu
         Z4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403904; x=1795008704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=wM/8yv8VUcX3DgO5fKjG4hQCxCPjRpZd6ZCAxFnaLLPKS5d/IGEsUDn3gKRDqrS3Ld
         Gu0xkpfo2tSUdOk8V6eOpkXb256hOoSCPSDT9cB9Yd90dVAPJQOFn9jq+GZcU/8V9Hzj
         TqSkr/vDWmB7JqxipIgtTjUVXtx70NZpipA7o7ZL2QuPrpvKXtF6d2HR1xHvdqlG2Bcx
         249c/TyCukklSymfXU53rcD13YhUh4dXb/Pln9OfazDkLu4DStpdawYcMvdjeY/lBZFr
         bbAFwGcNDt3Ve6fv8q51/JOQWteLY8cK4UgvFnYJvK6LZhYpQ3Jfd5QUoEXYCv1+bhWo
         RFTA==
X-Forwarded-Encrypted: i=1; AL+hErGgMgme8Yc3eSFfvCYReJgjK1YqeMgeHPCvhT/XaLbdzaCEtgWkk/zV9m3V6kam7bJv9D7KlFVHm0a1DgSZVJ77@lists.infradead.org
X-Gm-Message-State: APuU4Z8FJhGCwVQtKswXv7M68VTmteo2ynRf8rbWB5YkSxzQeTOq1JZ1
	ewVNE7HaWoRRBqorSHq0AW4r4YGylGlrRmVrtYrQwLlVLy1yXmC8BZb8ChCU7Xewyzk=
X-Gm-Gg: AYBFou0KdjehhS2GrGeGsl/3iu4qrShPcC2nX4jxT7heEAGHYAndQdMhzz3yWfcIP22
	/KtgCUYgsc+6OnOrNQ16JUyH/A6IIXRJ5w5TUGiHweqlu8qkz5LFWBU+d/H2UwF5MBDbz6XVi9h
	yVgS01ZVl7Zr9VgZug6MorN63CgxP6clvD2rb5FfXGf+N0wJUsa5gMGobRSU9K+d25K9VQodR6Q
	Fk5vESuAt5SCa4kl294lS/U6TZSrGHgPA9BKnAVx3BYaPHKlyEQuue192gPrd9y9HQfYJNmcbSB
	yKjtw9caocK0y9caxkEpSsgeAYxKDceEE4wfAcS6J/xEgjif+/RHVXOCDX/DvAWFdkyd+iGeK2a
	qdHqRU+w5U21ZCqgdhHvtdk3OAvyGMhi+4mzzg9hOS7OPw7KE5Dp7nJzhv10YNkk4GZwEJf8qaP
	xFVmg5nvevyCe9tK+E4w83Ppcqy8It+zd+i58UezmN6n7hwlfsDWfa/dR8gjOoLvrQGhhoNtaC6
	higF5pHhTtXhatJmqE+Cm/9geLoUYn/uukutRRjMaFJwMnwf8Ib6bGfT1yvkTKRV0VW5UAdYMEc
	BzudK6ocj7rFVdpH81AKBTPdzGe61SfkevCcRu6qXSgH5turdzp7dMuzWe/G0oEi2Rg1Hf6QBzT
	ZhO6yWoapKl4=
X-Received: by 2002:a7b:c342:0:b0:4a2:f58:9a82 with SMTP id 5b1f17b1804b1-4ba08e16f94mr38360965e9.13.1794403904169;
        Wed, 11 Nov 2026 05:31:44 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:43 -0800 (PST)
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Wed, 11 Nov 2026 14:31:17 +0100
Message-ID: <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_053146_253880_6A03489D 
X-CRM114-Status: GOOD (  10.41  )
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

Add dsi node to the i.MX93 for support with mipi dsi panels.

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


