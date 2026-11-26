Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58628606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YR9zKDKV;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=e08gF05Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vhIjg/ZekNm65fFE7IweYQi3AfyZa6hWVIa8jE2c7Tc=; b=YR9zKDKVU70fO0AcheHlYTIamd
	0XK+BU6M/gSXYzZa5hOvDpJ61pyJhuKYuxzHh2DoA4fBtKQwFVfnEe6mtMvRz4dZmlfL6VxZiyj1g
	hCr4Vt4eV/TmYPS5US0WKHK65SAqJQrp780OYilQs+gG3+Z7K0+CpLryEWFGsuIWm2Qf5RGOIilQ8
	7vjqO9+LJho2SImoTuQQ52KBaEbWyk+zIuX9ehcNObVUlOJic70JXsJFgxcXUr91zyosEAwtbW7en
	TnkjWpfEvHVyvLahBJgI0gLWDwjk5vkgNhBALsr9+jIv/nQtT2Qddm6DBvt6o7nfhxQfAY4zzlP/q
	z4uJR7UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVuQ-0000000CaBT-35RE;
	Thu, 26 Nov 2026 09:36:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVuN-0000000Ca8J-3dt2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795685819; x=1827221819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Uae0pBxFFdBQw+W9nIOt6/uannR5PUUSAL1v1lLhsU=;
  b=e08gF05QgSWWLAwxga3iUr21LVsBla0diJudL8k1BUpDyrUV/05MwJGY
   zK4vpSwpqkoEakVhE3JmAIzTfc64kovHktdgsUKiXVl2RvAOHftC4D1xy
   k9DK/28Kg200fs6M6K3u+g5UjHdJvJ3j1MBlogmHP9t5jdVKZyREdy/OG
   qBbmAN0ZEJy3PsG94anCNujl8N81y+/gWRreO7rM9K5YJwPd8UmuQWIzJ
   bEe8ZGWym1UM3m5EL6zsgzjSAa553khTxrfXSsCIFYfpElLlZU4psgPqy
   jyo2fLRFrvmsfcAw4QZfL72MAkLil5Ini3/lW5g6AZNkZznxwpA3hjhId
   w==;
X-CSE-ConnectionGUID: HmqS3CPxQdKh4eWINM651A==
X-CSE-MsgGUID: 4slE2CdITEOLDw8jNJJSPg==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="234123015"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 02:36:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Thu, 26 Nov 2026 02:36:51 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:36:48 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mihai Sain
	<mihai.sain@microchip.com>
Subject: [PATCH v2 3/3] ARM: dts: microchip: sam9x7: Fix GMAC TSU clock frequency
Date: Thu, 26 Nov 2026 11:36:06 +0200
Message-ID: <20261126093606.13271-4-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126093606.13271-1-mihai.sain@microchip.com>
References: <20261126093606.13271-1-mihai.sain@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_013651_941133_03D10FB2 
X-CRM114-Status: GOOD (  11.49  )
X-Spam-Score: -4.4 (----)
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

According to the datasheet (see link section), chapter 64.6.2,
the supported TSU clock frequencies are:
8,10,20,25,40,50,100,125,200,250 MHz.

Set the clock frequency to 200 MHz, allowing the PMC to derive
the required frequency from the parrent PLLs.

Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf
Fixes: 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for SoC")
Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index f400d709901f..e77683162239 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -993,7 +993,7 @@ gmac: ethernet@f802c000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 67>;
 			clock-names = "hclk", "pclk", "tsu_clk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 67>;
-			assigned-clock-rates = <266666666>;
+			assigned-clock-rates = <200000000>;
 			status = "disabled";
 		};
 
-- 
2.56.1


