Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDE2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=toRVi4Bl;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=xFrXOg7X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uICpPy46156Qop/jp3ZmypF9lqZQuvSym7JHzzWuGSk=; b=toRVi4Blu+0H79
	b1YRlIihl322LL1RFykBXq/Ivn5NQVod/ursdpMFt5c1NmGLQrMhkDm2nzhn+BElpHfX9Qm0+O3/4
	yR45oTP3WNYY2l6X4/2KK7dlWArlsyPIRAr0wqyav4a+Ab35gQOfomM2ldNu51zPSU7os/Bd7iaQU
	gfzbMmkOA7Je9iXF+yOiCVshKZCujgZW7l5JbQEPTGs9tMnej4tvlArOL2+LJ4siFg5rU04bZtYe+
	p7FMSMnCtTVufniL/KtpH82/FBHA7pSgays4oa5Mlacq0R2oHjoJaC6qBExIuZ8949pctQGxHQoc+
	7pogPJ8ccjZr6MH2Ci0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqTJ-0000000F8Fc-2BOM;
	Fri, 27 Nov 2026 07:34:17 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqT1-0000000F82o-0LDx;
	Fri, 27 Nov 2026 07:34:01 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id A17C64C968;
	Fri, 27 Nov 2026 18:33:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uICpPy46156Qop/jp3ZmypF9lqZQuvSym7JHzzWuGSk=;
	b=xFrXOg7XFV5pfjadYpUmmqSCviTxRZjgootD8kxfuAITcYPsVDbcWTe3Z3ksj+YIh6Bzij
	h4tUcN/L71K/BVlFhXl2FfCg/Vjmhdh7+Ke9J6igrFPJNm+gjLH6pQONwB9W2H4/uu/c8U
	Caavbq4sNx8FXkbWntruQzYOlVUaQ861RwSGcXQsT7Or1ZSJUV75CFLX/G4ZYluG5ZA4Q1
	jBPtY4wjZKHJrU/Y3TZzGbBP/32a9o0diGK1csNgGfxIt3o0lvf9X2IxYUT3RF2klGM6E7
	1Estur7p+Nz8ru/2pZ9/o9A2B0VvTjJlUm5QpcpIFM91B0LYmLcvHlUSduD25Q==
X-GPT-Reason: legitimate; this is a technical patch submission
	(likely for a Linux kernel or firmware project) that perfectly
	aligns with the personal/professional mailbox of the recipient
	(alastair@d-silva.org) and the sender (alastair@d-silva.org); the
	From domain matches the recipient domain, there are no external
	links or phishing tactics, and the content is specific, technical,
	and non-promotional.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 11/11] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable USB 3.0
Date: Fri, 27 Nov 2026 18:32:31 +1100
Message-ID: <20261127073231.1776847-12-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_233359_313096_CF3D2B9D 
X-CRM114-Status: UNSURE (   8.97  )
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

Enable dwc3, u2phy, combophy0, and VBUS regulator on Orange Pi 4 Pro.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
index 374287d962a8..0e66e4761454 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -21,6 +21,33 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_serdes1v8: regulator-serdes1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "serdes1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpios = <&pio 1 7 GPIO_ACTIVE_LOW>; /* PB7 */
+	};
+};
+
+&combophy0 {
+	phy-supply = <&reg_serdes1v8>;
+	status = "okay";
+};
+
+&dwc3 {
+	vbus-supply = <&reg_usb1_vbus>;
+	dr_mode = "host";
+	status = "okay";
 };
 
 &hosc {
@@ -68,6 +95,10 @@ reg_dldo1: dldo1 {
 	};
 };
 
+&u2phy {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.53.0


