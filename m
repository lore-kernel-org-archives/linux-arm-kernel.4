Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022BE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rfFmnqlD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aG3jEloV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=norik.com header.i=@norik.com header.a=rsa-sha256 header.s=default header.b=b8vqXXzu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0XWNk6O+PAAYTuKWgmTwOpHOlIhYqI0eh8fUor46d0Q=; b=rfFmnqlDHv35YKnPQOhTMIob2T
	6pzAJBSV6UzW2ufh5/gEixdfYdJO+If6S05IrfUcSiqwHuBxVhGN5gepH8jZj8ABuDnKAy9IE0fKs
	qsiCQ/curp8cpgiOhQp+gSw3Sk2BODcv/2CvNJeN2GzlkioisdFVLQxylLDvzwP9VAwmlP+dlqvUg
	Q6PX7kJhSrQCxDJRhhy9rD++VnMRdul1lm+MbREohuKgA9UGDuePAzTf6gjN+xGsie80uRviCzsmc
	oBArfziwGbVRtJZRnHCIQJ5mZPJe28I68UmGg78OY6LKk3auxOWFFnGc5xOZr/9zX7/9X08D877my
	2jLFVp0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsrp-0000000FVbz-3I9w;
	Fri, 27 Nov 2026 10:07:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsrW-0000000FVXa-2jqs
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 10:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0XWNk6O+PAAYTuKWgmTwOpHOlIhYqI0eh8fUor46d0Q=; b=aG3jEloVo4FLCEy38RuiRJU/OH
	V4Y6xtTXUSa3kG3RgMUuk4zII649zGWvFtED+7k76MqhrsnPBIjNPnKkAQ7QJHYovtL7qMyVGE3Pi
	Ho4heEoojzz/UpCNU/fdDjtF2JBem6pQ1ahHcC7irYlHMScVCtxRwYdJRsNx18njNc8/U95eRuItb
	6sGkjehJ9cl7bc1cZ/5aLLhsa9C/or2Wo9jjMScdON/Y0O80OD9RRWfUTrGjyUvKfBUbJ/7+aFsYT
	m9AGO3aGLzs4pWL7yWGUtQXdv3kRmqHw23ulRxSsKsyopETiW2dYTM+OP2uBlX1Q1dsAXgr3S8WTP
	8YirGfEQ==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsrT-00000007Ycm-1RqH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0XWNk6O+PAAYTuKWgmTwOpHOlIhYqI0eh8fUor46d0Q=; b=b8vqXXzuPo7B7rbk8w4D9tXgvk
	q2i87xhbilNJ5pbRn2rZEMJQ6Yesl+FOG1OV8Z+9tk73LMysNa8YDxQwuImKFHqg2G9lhaRBRHSsq
	tXg6eGAGX0vOtRpBkFR1m5SwqYCTYMiGKkzSD720GjR7b8Im0X+INh/F5fFax/stW1RuQwLdjGPR+
	SKT+6UmpGtEWgZmPxMy1elUsW3+odNBBmbumDs9MndoRDMFN3OEBU2kMgGrFx2KgbXd41Rxp1I98n
	0t0URCclI6pkNnwzp2Io6vgbKpLsFCVsWHtmLIWJOhle4fXHCxkXvQPDTIII0Qb5F0Lue+FuP4oKU
	+lQLW6sw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:44792 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <andrej.picej@norik.com>)
	id 1xWsR4-00000004G7F-2UpA;
	Fri, 27 Nov 2026 10:40:05 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Teresa Remmet <t.remmet@phytec.de>,
	Jan Remmet <j.remmet@phytec.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de,
	Andrej Picej <andrej.picej@norik.com>
Subject: [PATCH] arm64: dts: imx8mm-phyboard-polis-peb-av-10-etml1010g3dra: Fix display glitches
Date: Fri, 27 Nov 2026 10:39:53 +0100
Message-Id: <20261127093953.3541816-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cp2.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_100723_409093_88A7BE60 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SN65DSI83 bridge derives its LVDS clock from the DSI clock. When the
LCDIF pixel clock is exactly the same as that LVDS clock (72.4 MHz),
the panel randomly shows line glitches after a display start. A DSI
clock slightly above the nominal 434.4 MHz makes the glitches appear on
every start.

With the DSI clock at the nominal 434.4 MHz and the pixel clock at
72.375 MHz, no glitches were seen in 50 display starts.

Override the panel timing with a 72.375 MHz pixel clock, which is still
within the range of the EDT ETML1010G3DRA panel (66.3 - 78.9 MHz), and
fix the DSI clock at the nominal rate. Also assign the initial rates of
video_pll1 and the LCDIF pixel clock.

Fixes: 1811697151f9 ("arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10")
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---

Tested on a phyBOARD-Polis i.MX8MM with PEB-AV-10 on v6.18, on PHYTEC's
NXP-based v6.18.37 kernel, and on v7.4-rc2 with commit 4af021a97773
("drm: bridge: ti-sn65dsi83: Remove NO_HFP and NO_HBP mode flags for
LVDS stability") reverted. With that commit applied (v7.3 and later),
the display glitches constantly on this board, also with this patch.
I will report that separately as a regression of 4af021a97773.

---

 ...hyboard-polis-peb-av-10-etml1010g3dra.dtso | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso
index 193fa9dc34d4..0d84578aac75 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso
@@ -23,16 +23,54 @@ &bridge_out {
 };
 
 &lcdif {
+	/*
+	 * Set the initial pixel clock, so that video_pll1 is not changed to
+	 * reach the 24 MHz default.
+	 */
+	assigned-clocks = <&clk IMX8MM_VIDEO_PLL1>,
+			  <&clk IMX8MM_CLK_LCDIF_PIXEL>,
+			  <&clk IMX8MM_CLK_DISP_AXI>,
+			  <&clk IMX8MM_CLK_DISP_APB>;
+	assigned-clock-parents = <0>,
+				 <&clk IMX8MM_VIDEO_PLL1_OUT>,
+				 <&clk IMX8MM_SYS_PLL2_1000M>,
+				 <&clk IMX8MM_SYS_PLL1_800M>;
+	assigned-clock-rates = <144750000>, <72375000>,
+			       <500000000>, <200000000>;
 	status = "okay";
 };
 
 &mipi_dsi {
+	/* Nominal 72.4 MHz pixel clock * 24 bpp / 4 lanes */
+	samsung,burst-clock-frequency = <434400000>;
 	status = "okay";
 };
 
 &panel {
 	compatible = "edt,etml1010g3dra";
 	status = "okay";
+
+	/*
+	 * The SN65DSI83 derives the LVDS clock from the DSI clock. With the
+	 * LCDIF pixel clock equal to that LVDS clock, the panel shows line
+	 * glitches after some display starts. Run the pixel clock slightly
+	 * below the nominal 72.4 MHz, while the DSI clock above stays at the
+	 * nominal rate.
+	 */
+	panel-timing {
+		clock-frequency = <72375000>;
+		hactive = <1280>;
+		vactive = <800>;
+		hfront-porch = <72>;
+		hback-porch = <86>;
+		hsync-len = <2>;
+		vfront-porch = <15>;
+		vback-porch = <21>;
+		vsync-len = <2>;
+		hsync-active = <0>;
+		vsync-active = <0>;
+		de-active = <1>;
+	};
 };
 
 &pwm4 {

base-commit: acba37c2e2df26ad722d470777044fd21620834e
-- 
2.34.1


