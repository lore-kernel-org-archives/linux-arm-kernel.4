Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746EC606A696
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uSJHkNFC;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=rJyocZ4o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xgqLAx5bD2+RAgA4BuQEwiDEQy9uzNE6YfX/QGBHxCg=; b=uSJHkNFC0mCxJetvwjF7rL96hq
	1p9uSZDs+K2uv+X3565uMgDm0dw5K5vMj4z6GQBXw2JB+nZ4gehu2dg2HXWhLJm8ifmR5QwsVAyNN
	3fUApdOjpq3aDAdwZK7Drr1oJS7UDFjm1jFnHO1Gk53rOx6gkePlv38F06rWkQb1UyzrMi8ltwUwv
	bdxP4RssY+CmMwKABFlZ+Tl1Q3+lBKPVB3T5PPbxCQXi/6IuyIwBGgsyl3/8ok+yH8Ci8nQtBoK/m
	j0/c9ctaQChBt3dhfBfSRL9O5Nh71Z7ZKZnCCl10UZw5NkLXLR3Wi7bOGDZnvHTKwnbAMK0przgIx
	CVxpDFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVuQ-0000000CaB9-22xj;
	Thu, 26 Nov 2026 09:36:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVuI-0000000Ca8J-0bHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795685813; x=1827221813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eCS7eB5hOBZ+j439y6Lezu1LtAD7S+jIKLU8MGwR5/o=;
  b=rJyocZ4ov65nYBJDrfBoDBlOwhXAQqBjQPAFB9UUgK6Ka8l8TARCkAKE
   ef6RvLblraTTURPuI9alNZycDUrSpQxjwD5o7ZIunTIbUkJs5BzD/s1uP
   1NOtXtG1g7e9p1xcCwMCwQe0IXM5AXt5HzvtAAPT6kgFvsKib43IeS9rW
   dDugFuNl/mrgd1CCPl6FRUd75dKxwrCgTpqL7oDjB3FhUi2WKZcF2bZ8e
   0FxyXYzP2f6qra8J6Zl0kxFx7k55dCPiro17RXe+fvDzg9/rVRKxs3MWJ
   EPFO5meOae1v5nQ4m7ZhLWCkOWJtblfe+b/6Zde8SdXSr1EeV2O53eeyZ
   g==;
X-CSE-ConnectionGUID: bW45RRidReilWAqpnsZmDw==
X-CSE-MsgGUID: RuGvHXF3RH2QNiWCJLCDXQ==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="234123007"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2026 02:36:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Nov 2026 02:36:45 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:36:42 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mihai Sain
	<mihai.sain@microchip.com>
Subject: [PATCH v2 1/3] clk: at91: sam9x7: Fix GMAC TSU generic clock definition
Date: Thu, 26 Nov 2026 11:36:04 +0200
Message-ID: <20261126093606.13271-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126093606.13271-1-mihai.sain@microchip.com>
References: <20261126093606.13271-1-mihai.sain@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_013646_210675_60F641B7 
X-CRM114-Status: GOOD (  11.52  )
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


