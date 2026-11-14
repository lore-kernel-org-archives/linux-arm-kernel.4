Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBB9606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 14:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xu/1MYT5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gz37XyZx72Rdv6G3EZXgKHiqk5BLFb3U4GXcq8oitTI=; b=Xu/1MYT56hTtLb1F4dI+tMiB+U
	vBkuSPcBIqJQ3kTp2gnJofpLR59gZPvI5LchyBqFm27wCZO8FIrXL5njHkKoe9ycHWsmBaUnYgndy
	MUJpCuvFgx7EUDSNwC8xJ1hkmNYVW7mBY4hexXFBb+pxmDvU5WhnW96sfxA9T4Oj6yEDd6dZ3XDOJ
	j72yi4qYBA7472x07vz3ihYFKmsyAvQEKIqEAJIziaWr81qniE6QyDi4qTqTwiW5nEQMisMFHlDRJ
	UiYVvTQclbYCAXzxhaOwhxHG5lDRbJ1pfnego9t9LLIIv5UWDReg0g2CF3+z9jyfqQQZnuRux39Is
	ShUEtUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSFAF-0000000GJyo-2Ikc;
	Sat, 14 Nov 2026 14:55:35 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSFAA-0000000GJr5-0C8r;
	Sat, 14 Nov 2026 14:55:32 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSFA1-000000005Il-07Wg;
	Sat, 14 Nov 2026 14:55:21 +0000
Date: Sat, 14 Nov 2026 14:55:17 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: nicolas.dufresne@collabora.com, detlev.casanova@collabora.com,
	paulk@sys-base.io, ezequiel@vanguardiasur.com.ar
Subject: [RFC PATCH 6/6] ARM: dts: rockchip: Add RKVENC operating points to
 RV1126
Message-ID: <13212e28d26fde53f49c1838bb099f1f6b419dfd.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794666330.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_065530_103541_DA8C79CA 
X-CRM114-Status: GOOD (  11.07  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the four core clock rates of the encoder, 297, 396, 500 and 594
MHz, which the clock tree provides as GPLL/4, GPLL/3, CPLL and GPLL/2,
with the voltages of 725, 725, 750 and 825 mV that the vendor device
tree gives them. The voltages apply on boards that describe the supply
of the encoder as venc-supply. Make the encoder a cooling device so
that thermal zones can use it.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm/boot/dts/rockchip/rv1126.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index 63705291dd3ce..7e37fd89609a7 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -104,6 +104,30 @@ xin24m: oscillator {
 		#clock-cells = <0>;
 	};
 
+	venc_opp_table: opp-table-venc {
+		compatible = "operating-points-v2";
+
+		opp-297000000 {
+			opp-hz = /bits/ 64 <297000000>;
+			opp-microvolt = <725000 725000 1000000>;
+		};
+
+		opp-396000000 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-microvolt = <725000 725000 1000000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <750000 750000 1000000>;
+		};
+
+		opp-594000000 {
+			opp-hz = /bits/ 64 <594000000>;
+			opp-microvolt = <825000 825000 1000000>;
+		};
+	};
+
 	grf: syscon@fe000000 {
 		compatible = "rockchip,rv1126-grf", "syscon", "simple-mfd";
 		reg = <0xfe000000 0x20000>;
@@ -665,6 +689,8 @@ venc: video-codec@ffbb0000 {
 		clock-names = "axi", "ahb", "core";
 		assigned-clocks = <&cru ACLK_VENC>, <&cru CLK_VENC_CORE>;
 		assigned-clock-rates = <297000000>, <396000000>;
+		operating-points-v2 = <&venc_opp_table>;
+		#cooling-cells = <2>;
 		resets = <&cru SRST_VENC_A>, <&cru SRST_VENC_H>,
 			 <&cru SRST_VENC_CORE>;
 		reset-names = "axi", "ahb", "core";
-- 
2.56.0

