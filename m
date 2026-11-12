Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94F5606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 05:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cq2nf9/Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KDzwtN2O;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SPxREyib
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ynod8qXmuhlfhApQcwxDirfilx/nYjgeDnwYlvGthvA=; b=Cq2nf9/QRWoFsuPwgWluGE7Ajs
	sz3du2G5/zVa0PX3BJUJME/3h5AlN+0OSXpdr80TFp1AI0qhaYPmXOGun2Ezn0ggi7G+k7QP4Z4Hz
	ATnRFTcZKRad+QdJjq9FpmrRP4+1psISmh6C5hq0LjpOmfKlrpwJ1iwbJzc34C0YLMTqk0O9tl2a/
	0z7FQ7OcltFkdgE+B5k8KeYaUiPs4y0JQPY7rqeaepdBqrZv8D/tyBheQv55+Yuz4v1lE5t752fDu
	+hzslSchsmmye7X/KdjySPNQaY7TzX2aQd/Ah3uSvmaYgz4vu+X1YFl82kNMFv2ztE2SZGX/5anmJ
	pdpyldvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNKX-00000008kIN-25Tv;
	Thu, 12 Nov 2026 05:26:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNKU-00000008kAJ-2377;
	Thu, 12 Nov 2026 05:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ynod8qXmuhlfhApQcwxDirfilx/nYjgeDnwYlvGthvA=; b=KDzwtN2O1j2uky9veySwGZN+mX
	IPaG9syj1ALrlEdDqZth5aJpTQ8EHfKUWb3e+KjaEuXm75cY1A8TvHh+jjIvcHSx5Jnz3mgihba5W
	qEZdWeBIwoAdUMP0cMcQiA/F++o0BRUSRCls1SIUzHaeT2uRG2EW4C64qWxRBThdKRFQq6GhWIY7n
	gLdhOIolTuImkGTaalCkGBXO+cx5T9yeLRWZJd636w8/iI5ZrZjuXoW0a822JXQMfwu3kFP0NCXao
	KgF/+1dTc+q7+0DhVphzDDlSkv+tq4lVy801T2IPqTR8QDMfQ2xiVSixiscMwQPNHg5AoZ4BcBSl1
	rtFSG4/w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNKH-00000009vM2-2vnF;
	Thu, 12 Nov 2026 05:26:25 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5PmOlA3459368, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461148; bh=Ynod8qXmuhlfhApQcwxDirfilx/nYjgeDnwYlvGthvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=SPxREyibyBP66+PesrnHmFZOWwFOo4OnO7XgO78xyC3IOnq0DdRyk/pE5xtPI+u1q
	 LSR52obGj6jffHs2boPZisGRv2qCJSzso1fDDCSm9PShuu1WvTBiM2Zh2bbC/by/1/
	 ZDcP1if48ORQtkrJruNejBUarcsRyl3gx/gkadJp/fIUVHl9Nf7pUuGioeoSP+iNJU
	 h5UM6RUkhf+99lL0p3NAgumbuVIXD7DK3H4pJ6zTVaKH3LDVoOzveD/9m03Hdwl4L6
	 aqQ28tBPS/qd+xsq2xiDNGzIJdexGj0+bi7fNHc/lEBf6jM40BgmXBAg/C2rq922E9
	 +19QEs+arFjgQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5PmOlA3459368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:25:48 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:48 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:25:47 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 9/9] arm64: dts: realtek: Add clock support for RTD1625
Date: Thu, 12 Nov 2026 13:25:44 +0800
Message-ID: <20261112052544.555563-10-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112052544.555563-1-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052622_291787_C5D85099 
X-CRM114-Status: GOOD (  10.83  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the clock controller nodes and osc27m fixed clock for the
Realtek RTD1625 SoC.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v16:
- Add 'clock-names = "osc27m"' to the 'cc' and 'iso_s_cc' clock controller nodes.
- Explicitly wire up internal parent clocks from the 'cc' controller to the 'ic'
  clock controller, along with their corresponding 'clock-names'.
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index df0d5ee3b1b9..fdb2bc2b3c79 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2024 Realtek Semiconductor Corp.
  */
 
+#include <dt-bindings/clock/realtek,rtd1625-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -26,6 +27,15 @@ timer {
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	clocks {
+		osc27m: osc {
+			compatible = "fixed-clock";
+			clock-frequency = <27000000>;
+			clock-output-names = "osc27m";
+			#clock-cells = <0>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -141,6 +151,28 @@ rbus: bus@98000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			cc: clock-controller@0 {
+				compatible = "realtek,rtd1625-crt-clk";
+				reg = <0x0 0x900>;
+				clocks = <&osc27m>;
+				clock-names = "osc27m";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			ic: clock-controller@7088 {
+				compatible = "realtek,rtd1625-iso-clk";
+				reg = <0x7088 0x8>;
+				clocks = <&osc27m>, <&cc RTD1625_CRT_CLK_SYS>,
+					 <&cc RTD1625_CRT_CLK_SYSH>,
+					 <&cc RTD1625_CRT_CLK_DDSA_DIV4>,
+					 <&cc RTD1625_CRT_CLK_EN_MISC>;
+				clock-names = "osc27m", "clk_sys", "clk_sysh", "clk_ddsa_div4",
+					      "clk_en_misc";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			uart0: serial@7800 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x7800 0x100>;
@@ -205,6 +237,15 @@ isom_pinctrl: pinctrl@146200 {
 				reg = <0x146200 0x34>;
 			};
 
+			iso_s_cc: clock-controller@146310 {
+				compatible = "realtek,rtd1625-iso-s-clk";
+				reg = <0x146310 0x8>;
+				clocks = <&osc27m>;
+				clock-names = "osc27m";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			ve4_pinctrl: pinctrl@14e000 {
 				compatible = "realtek,rtd1625-ve4-pinctrl";
 				reg = <0x14e000 0x84>;
-- 
2.43.0


