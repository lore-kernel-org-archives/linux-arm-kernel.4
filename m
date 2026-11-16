Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31233606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pLHRiGRD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHXSRHZR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=; b=pLHRiGRD2JV7OZ
	vZHlsurxmGZLyd/YFTFdQ8u2UpdfyX4QxeUnPuQtLMLWVJjSMOPuostliIKvNYuV0+RbXEYRuy0zk
	VORJIOMcLX9aEm0+lg6mHvbCBItaDSjNEW7s8Fxl3vykIJ/gjhtY73jxa55JXWQABJfo1yy7JG9YG
	51QB2YDOB2uIFjMT7I9De3/nbNQTPM6CJEsO6JIFVjvKEKAo9+w/Ur1f0M/lWg3LpB2wI00IjhALM
	CSRtyB7b/rhNG9Hk4Qbhy0ulLfbpdf5ACtz5uhLRaiBNYBPhGltrJLqVH6qfbngGoT+KSR1VOLM/q
	mizCszJj87jfxYLTd7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvZ4-00000002JP0-09af;
	Mon, 16 Nov 2026 12:12:02 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvYy-00000002JMQ-3oJt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:11:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so37590965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831115; x=1795435915; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
        b=pHXSRHZRe0uqtOCzJwmFRq9ZqMxrcGFR2t2B/lOW0GS/rXdB8RFKJBRpHOjsAeN+Oo
         7Mp6iPv18/oe6nQIcaof+DOt2WFVfxFiv9mDCf5yggnlpDsXQ+EfTznvc6sihpzMGH+j
         Fug1ijoAlfVStBd0C83dQ4z2h0ThiHIZc023VaXzSLC4bZSR3CP93hUy5SMKYFS9zbNK
         SQItXfcmQFpToLc6CnPLPHouxahhadK6uZo2kE5mt5x8RxYus+8OI/aVbXFvSLGnB9SM
         s8kgPMWV2JRKci+zYDhy+9MZHFEBMr4LjpY/c+LPdSh0BIUfeEWig3CboWkWPmWcr8Sb
         dO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831115; x=1795435915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
        b=QaJLdDO+LVV4wYMJSrOm5yZpjR/Vm6NFu5ho6w95i4Dt0h3yF5msPWzhzn6AY5146j
         Ly5bwWncqEJKbhXwGR68XEedbfWxjOO1hOJKrnbFZVqYMSQMCWOh/knL0qAZ8Qdbtcci
         +H6u6ufMpH0h8JltDGoG2LwPoCRQlBNU26lvMUhIAON0eFxBzXRvMM2GZtvPSGXC0nxS
         4MDVRj7MPIpr8tIFvc5ASrvO7BozTxiWiVoQ6X6tSTV5QDmzg8PBs+EuwesTbUPPL6+m
         8dqOzuJdJwSKvDiq8s1//oQqOgBEp6jYykaqr/OMbIU275xRtXEWTfoDiPKGdcDeXKTg
         OEgw==
X-Forwarded-Encrypted: i=1; AL+hErGGzB1TkLP2UQ8YGSji0SuAdrdf98w7/gr5vV7LAi1haMw133Tkgubhs2Q1K4tgwVp4dVIxfZcAXDhE492qogXA@lists.infradead.org
X-Gm-Message-State: APuU4Z8awepJWdolDYeupzGYiqmiFLjzhRIGubDWl4fYCGySrBqs587x
	F271vkMMJjGe7PMsbJIJSBjaYAoqCF7mHCx/Fns3gP7XTcb3n/SvUHto
X-Gm-Gg: AYBFou0Gn/4BhPadoCFNzx9ucPkQQdiU040TJjR2Q8L7pdycbmpE9f3enYRfIYJ5y6Z
	lDL1mZTXC2+OC7wneSvzII9VEwQKzIk2U8eDZlEj8IuNIPu4hYIu00TaaTTw75wqkV1JuscNs8z
	MliONOFnMKN9vi2Ojy0JJa4DkQehfYFi4FHsHmQeVD/CNLUeqcRUp7wL/SL3VlLEeYeEhqpAaAW
	Xj2N13RxZ371SQ4lp2mo6tmfP+GMumd/7ZIoFVw8q2HvuqrtMiSjQuk6yLQomRz+VfTziw2fv1u
	b1k71ZBD+AVX4t3ML8NXL+N/ko14zAaqXdzHDOQifkxYaoH7fMRVXUJM5P/uuzh7X6BT9yrNimr
	Sqag3Bw3vB7Nv3LCn7tIQXLwGSIPPEiEqtR1noAWo63KcdgQWq5e6ba2fGtd/7QHc9vQZIRh8XN
	t7BkVSkDxSFgCVKpwtrJR0DtMza3LlZLmrN0ToJmSzGOUY/0JMV5p4HnLDMkSIw7cnfFCtbfe+t
	eH8jQx+0vW8n/QTiqrnJQdMVwFyvgkH0rXWBM6FxWFdG3IhmFwOtotaNQeZ3cPMpwWLZsoSI1Ap
	Qf7gTb8UE6E4h+6cNkRYJA3gVnnAJa1aVGEG0eoCVC++QB1vSnYp9WMjT2DNq2InBxa6pOQMRm7
	DNFXRSx+DJY9q5aYOLoFkclZzqvUjvN9bdCZSZsQtONVaBWanVjY=
X-Received: by 2002:a05:600d:41c9:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb60bd5507mr142579815e9.10.1794831114708;
        Mon, 16 Nov 2026 04:11:54 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:53 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 16 Nov 2026 13:11:49 +0100
Subject: [PATCH 2/2] arm64: dts: imx8mq-mnt-reform2: Drive the internal
 panel from DCSS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-reform2-internal-panel-v1-2-765cf8d5ff4f@igalia.com>
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_041156_981838_BFA708F9 
X-CRM114-Status: GOOD (  14.23  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Gmeiner <cgmeiner@igalia.com>

The panel is driven by LCDIF through the NWL MIPI-DSI host and a
SN65DSI86 eDP bridge. LCDIF underflows at 1920x1080. The picture shows
horizontal streaks and the underflow flag in LCDIF_CTRL1 is set several
times per second, even when idle.

DCSS does not have this problem. Connect it to the MIPI-DSI host and
leave LCDIF disabled.

Use IMX8MQ_CLK_DC_PIXEL as pixel clock, with the video PLL at four
times the panel pixel clock. The DCSS binding only allows three
assigned-clocks, so the PLL setup is in the MIPI-DSI node.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      | 52 ++++++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
index 3ae3824be027..31c7428f0386 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
@@ -171,17 +171,61 @@ edp_bridge_out: endpoint {
 	};
 };
 
-&lcdif {
-	assigned-clocks = <&clk IMX8MQ_CLK_LCDIF_PIXEL>;
-	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>;
-	/delete-property/assigned-clock-rates;
+&dcss {
+	clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
+		 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+		 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
+		 <&clk IMX8MQ_CLK_DC_PIXEL>,
+		 <&clk IMX8MQ_CLK_DISP_DTRC>;
+	assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+			  <&clk IMX8MQ_CLK_DISP_RTRM>,
+			  <&clk IMX8MQ_VIDEO_PLL1_REF_SEL>;
+	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+				 <&clk IMX8MQ_SYS1_PLL_800M>,
+				 <&clk IMX8MQ_CLK_25M>;
 	status = "okay";
+
+	port {
+		dcss_dsi_out: endpoint {
+			remote-endpoint = <&mipi_dsi_dcss_in>;
+		};
+	};
+};
+
+&lcdif {
+	/delete-node/ port;
 };
 
 &mipi_dsi {
+	/*
+	 * DCSS takes the pixel clock from the video PLL. The PLL runs at four
+	 * times the 138.78 MHz panel pixel clock.
+	 */
+	assigned-clocks = <&clk IMX8MQ_CLK_DSI_AHB>,
+			  <&clk IMX8MQ_CLK_DSI_CORE>,
+			  <&clk IMX8MQ_CLK_DSI_IPG_DIV>,
+			  <&clk IMX8MQ_VIDEO_PLL1_BYPASS>,
+			  <&clk IMX8MQ_CLK_DC_PIXEL>,
+			  <&clk IMX8MQ_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_80M>,
+				 <&clk IMX8MQ_SYS1_PLL_266M>,
+				 <0>,
+				 <&clk IMX8MQ_VIDEO_PLL1>,
+				 <&clk IMX8MQ_VIDEO_PLL1_OUT>;
+	assigned-clock-rates = <80000000>, <266000000>, <20000000>, <0>, <0>,
+			       <555120000>;
 	status = "okay";
 
 	ports {
+		port@0 {
+			/delete-node/ endpoint@0;
+
+			mipi_dsi_dcss_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dcss_dsi_out>;
+			};
+		};
+
 		port@1 {
 			reg = <1>;
 

-- 
2.56.0


