Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A73606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dnlSsFeW;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=G1Z0ogMn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xgqLAx5bD2+RAgA4BuQEwiDEQy9uzNE6YfX/QGBHxCg=; b=dnlSsFeWcHJJyiUZB2/KktDH1R
	v1SPBZq8ymeMb+ihRuVREnasNH2Cbb+Mt6VoQDIH9+ZZ8SN1+qAXRpFnumbjFOjWbyO9IEgmR1e0T
	DQsy51ALuf28wjH2NntUfvMaHv62k7n8/dYWcdoYh8byC40thlydfTaAV1N3eoBz2bigOFzNZgZwA
	hZqF2H5JXDyjVA4VX97RV2lW0b0HrDiJkGXGnzmJVMRiP9WKNsoWoxDFE+1f6ruXlUrB0F/COYMjk
	nwcuzNcHAzsWefHIrCwu8U9I76WCAosQe82kI9Cz2gUCxfZfhfRhvuxUnBHD0DujO4hCW9VlFrwdD
	6p5XaETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVdB-0000000CW14-00zb;
	Thu, 26 Nov 2026 09:19:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVck-0000000CVtR-3UL8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795684726; x=1827220726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eCS7eB5hOBZ+j439y6Lezu1LtAD7S+jIKLU8MGwR5/o=;
  b=G1Z0ogMnEpCn3gszyutf4G+y4rY8RjiAOv2UApM4GGkgC3X4wv4IhHWA
   /2Q3Fm/M4uHlp91FncIAHuBmfPLxunc8qEQEaRXDGeUBAcFMqZ99d7q4J
   CjEAfAENMvHu6ohyKHGA45EZaVKNkznSQYr2LkBdLLj/OqS4lNcO2q/gB
   ZD3RDcJddiQQYpKxrDIb7xAL/XlmA+S0zeRe4ysQHLhuydg0qaWV+as3a
   edBrzdiN67TfQmGruQZBSED7yGmFl2WJLeh/sWmuK0Iz3MJtUWvXRS4oQ
   1+JfjS4LkWkCVtZxogyinQGCKUxuQWDbKjlsGcb+sr757Yxu7XxSLMxIn
   A==;
X-CSE-ConnectionGUID: da7ATrOBRlCvHiPlFO5S8Q==
X-CSE-MsgGUID: jDsc1SXRQWmQW5IwQ5A0bw==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="234121996"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2026 02:18:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Nov 2026 02:18:37 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:18:35 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/3] clk: at91: sam9x7: Fix GMAC TSU generic clock definition
Date: Thu, 26 Nov 2026 11:18:07 +0200
Message-ID: <20261126091809.13012-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126091809.13012-1-mihai.sain@microchip.com>
References: <20261126091809.13012-1-mihai.sain@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_011838_900027_4B352276 
X-CRM114-Status: GOOD (  10.82  )
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

According to the latest datasheet (see link section), table 12.1,
the instance ID 67 is used for the GMAC TSU generic clock.

Add the gmac_tsu_gclk clock to the SAM9X7 PMC clock configuration.
Configure the clock with a maximum frequency of 400 MHz and
support two possible parents: audiopll and plladiv2ck,
using the corresponding PMC mux selections.

This enables proper parent clock selection for the
GMAC Time Stamp Unit (TSU).

Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf
Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 946aa54dd2e8..80e9ee154b97 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -710,6 +710,16 @@ static const struct {
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
 	},
+
+	{
+		.n = "gmac_tsu_gclk",
+		.id = 67,
+		.r = { .max = 400000000 },
+		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp_mux_table = { 6, 8, },
+		.pp_count = 2,
+		.pp_chg_id = INT_MIN,
+	},
 };
 
 static void __init sam9x7_pmc_setup(struct device_node *np)
-- 
2.56.1


