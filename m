Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QsE3y2PS;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=ijplhANk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dml2oES2r99mzv0WDYILS7xwOmKhPiDAhWdrvCj8oJQ=; b=QsE3y2PSwcM5O4bO7+nID+fKoI
	+1bOhwP9rhoeDQ5ShDKjAm53KxA9FP9H50SD1DmMjsKL1hIH0/ROjMFmoAVkDnY4kzi6bRttUZmGM
	yX8jA9iLV2pcJKgTE+kS9WxsbRSeN3bWpKUx5/QQhhZK/X5Nz4CNTyz8KBtj/6eWG7W6pWcMZABo0
	34T5G7eE6vo9ZbL6tSOCLHBRCW15qfcLv91TgPXN4A1QXuDLdFUokrukV1ix18wN05ThwVMmmo6gv
	DJvrYHrUWW8ISFmkrBi8x6nBvw8WdLoPvS0GOIoKx63c2khiYzzCeL4JjEn2E1l3F2QPuOJcgIT6H
	9gOXdoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVdB-0000000CW1N-1lfs;
	Thu, 26 Nov 2026 09:19:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVcr-0000000CVvi-0Amr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795684724; x=1827220724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=65Ljyrys+GP8qJ5zbm/Fc5Hox9VUPZjJrPiVH570RXQ=;
  b=ijplhANkxkcQB9BbtI1ewAWSgdn28RAbRUQFWqSJ3NpUb1+qlIaUfJ7i
   50cyLxq3DiAX7nFCPxS1/GmmdeNhglLDJ6HCCK9v2PcZ0EppK7kelOKhj
   MwQ+bq4FHB4zkBIv32sIgOEXiOpcN2IJhj9gImi/pTY2spm0hJgWcTzat
   GcH5Nrdg2vrFZANgd5wPZ1D8+1ogsvsUrqp4FQFNTSkK3cuj1j1neClJv
   L+OGqR9tbQm6w/gh/nv19wcN1/mxVqMv285BJrAUKWrj7358DgtNZ7KTG
   aoj22WhEzOyfvCYzq4C2NyQBPeATnKLNu3Anlym/e5uwJGbHgs+4us7Ig
   g==;
X-CSE-ConnectionGUID: fKU50kOATSme+N/jMfNPvg==
X-CSE-MsgGUID: kY7Q2SWJSsSVi/KXXgyt+Q==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="77906060"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2026 02:18:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Nov 2026 02:18:43 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:18:40 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 3/3] ARM: dts: microchip: sam9x7: Fix GMAC TSU clock frequency
Date: Thu, 26 Nov 2026 11:18:09 +0200
Message-ID: <20261126091809.13012-4-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126091809.13012-1-mihai.sain@microchip.com>
References: <20261126091809.13012-1-mihai.sain@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_011845_084299_5982FCC0 
X-CRM114-Status: GOOD (  10.97  )
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


