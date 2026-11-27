Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843DE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dvvat05A;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Rix4Na17
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uP2T9+mEzaneJvWG+hF9U3aolWC4k7dp9+khY3E2Xds=; b=dvvat05AoUEiMJ
	V6AHnRpsCocI0G3XvwaJCWNdaxGqRHKwpkNfjmFgIMjQRyrNgmI0eRBArcxbeaOb9QW4BUbqhx2xH
	Sjqk2zCQO2Y2rclICiNlLGzIT58x8tW3YQFBjI3v4kqlcy0yxp8vjd/pNPg9Wk4idGKEWO6rg/UTe
	wNKnrVGIcCKyofjt9UZlInW+zuX8KLwlDeml8tXoherlHQCk+aWDpx6Gq43rUon20msoXdgiT/1aw
	ZICjKkE6P/pqOdRyRyrVCEdHseNQutI1gV7jVKbksgBHnAwcNzAacPWUz0DM0IzrXaDKPCC+MMRg+
	uHbtaHHfuEhzhAzrdEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqzR-0000000FEGi-1O1t;
	Fri, 27 Nov 2026 08:07:29 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqzE-0000000FEC1-3Qkj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:07:18 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id C68B94C97A;
	Fri, 27 Nov 2026 19:07:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795766828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uP2T9+mEzaneJvWG+hF9U3aolWC4k7dp9+khY3E2Xds=;
	b=Rix4Na17urkRnqUM/sP+h41j5Yjmqu/7rkE9IuJLrl0v6kQ1CKEGwb7ZUllKZZ3eR0IC41
	GcoDm8bh4lWKB3Vy6nDn6olt36+0OTZMRTYXrXS2FUiW+RZhXeYJCNOujeIAOjSvXmNWlJ
	csfrhv3+3XF9JyP8GWt5MI24oNoPxm0wh0/KSS1uqYF19jUmpNf0R/U2A9glIhZukFgBXf
	ZQrM4D4FeOENAmWVlX6TNmucqYTa1IkDRYgC47MQiX2XTa86JhNTDa93GGSKjiXg8zueSp
	dA0Q7FA4FSHQS5T/Sy2IzMdUejs85aLA8Gwt93HCxZmOc8ISqP+C4c9xAX1aiw==
X-GPT-Reason: This is a legitimate personal/technical correspondence.
	The email content is a technical patch description for a Linux
	kernel (arm64: dts: allwinner), which aligns perfectly with the
	sender's domain (alastair@d-silva.org) and the recipient's personal
	mailbox (alastair@d-silva.org). There are no phishing indicators,
	no marketing content, and the sender identity is consistent across
	the From and Reply-To headers.
From: Alastair D'Silva <alastair@d-silva.org>
To: Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 3/3] arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI node
Date: Fri, 27 Nov 2026 19:06:49 +1100
Message-ID: <20261127080649.1982883-4-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127080649.1982883-1-alastair@d-silva.org>
References: <20261127080649.1982883-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_000717_009383_090FB11B 
X-CRM114-Status: UNSURE (   9.00  )
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

Add a disabled simple-framebuffer HDMI node under /chosen.
List the DE3.5, TCON, and HDMI clocks and power domains so Linux
keeps them active.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index 509d0cfea160..46418fc60529 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -13,6 +13,34 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		simplefb_hdmi: framebuffer-hdmi {
+			compatible = "allwinner,simple-framebuffer",
+				     "simple-framebuffer";
+			allwinner,pipeline = "de0-tcon-tv0-hdmi";
+			clocks = <&ccu CLK_PLL_DE>,
+				 <&ccu CLK_AHB_DE>,
+				 <&ccu CLK_AHB_VID_COUT0>,
+				 <&ccu CLK_AHB_VID_COUT1>,
+				 <&ccu CLK_MBUS_DESYS>,
+				 <&ccu CLK_BUS_DE0>,
+				 <&ccu CLK_DE0>,
+				 <&ccu CLK_BUS_DPSS_TOP1>,
+				 <&ccu CLK_BUS_TCON_TV0>,
+				 <&ccu CLK_HDMI_TV>,
+				 <&ccu CLK_BUS_HDMI_TV>,
+				 <&ccu CLK_HDMI_SFR>;
+			power-domains = <&pck600 PD_DE_SYS>,
+					<&pck600 PD_VO>,
+					<&pck600 PD_VO1>;
+			status = "disabled";
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.53.0


