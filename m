Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577DC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=axeDP+x1;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aMnqlLwj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=; b=axeDP+x1nVSxXN
	rWS8soA7827hdqHF2k0QBoo3bg1Q6NbtLppMMFWVczoSFKfjpMW96ApGQU1Veovw4o5am2pFAnYmE
	j/ZUbafuRmO5XW2H2UYtd1Eo8R5PhLmQMmMiB/rMdA/mRaBGH4xbCeRzRDPeBl5aIYFaT2VmTQJcc
	/9TJoG48FUqGKfYizt8D43lFYNHwtEM3FvoloQFNi6D1wQVwVFMvI7klvXUqxsy4Gi+reYLZG056m
	knL7Q6JlhZh+KPlRtxxUMeimNR6J5EN+bDpR6JqndJe1GWmn2MRqhqDVTHYmJTneSeJoMBwLu9yeG
	94D4PEpmYRQ0iN0ACTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3SK-000000060eC-0lMH;
	Wed, 11 Nov 2026 08:13:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3SC-000000060ah-12AM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:13:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so30923675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384791; x=1794989591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=aMnqlLwjiBYYDhV793NIH61oMy+3/0ZiSbXVax7B4MdfC6ew0bZV+plm0Ep2S+aVwL
         MCHCsa+MaHNHUb8kN8rIPaFviqfH5ZnT/1RqzwbagplAsMFCnJyfhwPsPDMIjFoAh2hn
         ZJaZFBqC0Iwcjfz1G6fMdstrcVsnriEXgt7bJtQnTiiAGznmRkyrBesBfPAR/bb2vPd4
         iBQaTiTzifWWlAXwlgMlfef8EPGK34d7IqliLWL9SmpzGLzpoEhu/Pz9t75rY87UtCKN
         YVhN9pVtEhDPkudDFB8g8ErJ4oqEiK61sqkt4eaC7z7ysG8a6ij76FHeUKFnK+VH4oKs
         ayVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384791; x=1794989591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=bkCtHE5L3Ba8uxfR1n2CUfP97T4Jm5D4e+CxoPCNjyhWRu2rsVCl3uPFi8ioxVRD6U
         EgshC9/0sEPcwGeIOuMC3yd58xTn89h9M2NLZeisPc1di0YCXIdIFvCKlVgF1BQT/oE2
         yZ3Du6Eoe+Vkb1TGkOU5GFP/OZS9xLYeszyE8FdDx7+kHG8vQtk83xbS4wd3wPK/Zg+q
         n0m96+9zWdkgg+NbCnR+2ryeLXxi5v8ihh9uGAvgwMznT9cuRhtP/TSxL8Dh4gYsmvgG
         Nq53LzDKq98WLCqZ2I4QpPBF1VDC0I46HBndpJpdOCPKN+qB+OQwQKrbPydMiagsEdM5
         +bOw==
X-Forwarded-Encrypted: i=1; AL+hErGjg6qy3bYsp1ZxoxLu6uYRR+ysWctjY8slQn7TcoKW6RmVcCrmx7Eet6no8bHGff6vuhPHSXTBIskZe05NONoj@lists.infradead.org
X-Gm-Message-State: APuU4Z/NF1m3WEhF1dn2H3q5qykkGnaQnDawxtzT55/hcPrgsNN3evl1
	TwSwN3S2dNnMNciErYQmVhe5j3EUADddNfOwHJoUy1Pl3Rz6fgH3ZvfeGdD4rMn0iaM=
X-Gm-Gg: AYBFou2UCefCzsrJiHzDb9mZTP64cRNgBtsz0Mvrr1Sg0PZX/g+0y5VbNaqXOo3kev+
	E97ApLLSNqRZTqfnaX0MlqpW7ku36JoU8N0I7oHFiFThfu8DbMQTChVAEcxx40mdGRwvav6Z7fV
	hWg0i69cE95YuBpSMgedp/bhEV4kXA/zlIV60trjufds4mthRwLjF86dlazrY4QTkvw9mjmlMZP
	8UImbbVfSiI/9YRBkGriRrAZfSs/jiWS1KeyyWwZ7j4uBddjC7rfdugt8/JIkAolzNu8yrKPqo8
	gF/e0DcMg8jBqa7FijcBOlb7ISjxg1F+LVJLLEWDJ3+Yvf0oT9AlucTXcaCMObUxWGAhaeoWg4q
	FHfhqCe15c64EVVk4+10/sZsOgn1RGJn92mFJuU6HRH4K3+j5wogfl6EIlgcNPPliqTvs0AT0j+
	dTXPpWNRju7bGTklNURN+Ac2m/c+mgZ/mSQM+HAo0MRp6E3gF0EoECT60BnRtAwr5lUayrUDrEB
	6TFxGin+aPGART8Pt2lKnaA03rzSTlz/EuSWRdCF37dmC70WRUtqnT1yvMxS5NbFd/PFk5fohkq
	/oZ+DgWOgjLbCIj4UVw0kJuAppj0f7sj/nUb49B0ZtnysQpw9tKgASUEm2XecL59jLCa79AHX4S
	qbrQTTvafyEg=
X-Received: by 2002:a05:600c:4704:b0:4b3:8529:eb27 with SMTP id 5b1f17b1804b1-4ba09389f82mr26248335e9.27.1794384790692;
        Wed, 11 Nov 2026 00:13:10 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:10 -0800 (PST)
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
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Wed, 11 Nov 2026 09:11:48 +0100
Message-ID: <20261111081150.950272-4-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_001312_320545_50651D6A 
X-CRM114-Status: GOOD (  10.34  )
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


