Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24A6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x7PTsPdf;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=NG2ESuhg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+WBC7MDi0ocp1UUde/a/DTjxd2HuXWCXxnYR4WW7ncc=; b=x7PTsPdfFLFhGMLmbmRkCbu8sJ
	b1JRSkl+aXl5SLn9pEDkurBaL6zaSqIi+xS5Mtb6Jj9OZqwh9Oz+e6Eyc/pcH2qX/1w9VnrP/naVL
	5pMiv3R6eD0NlCYuSyPqUGWikYk++CjzGZ/grWMLxT9Isrq7wzZvlyqg1N8r/sz5yFYQwxYvqgXXH
	ih5jXerc5ZRYY4BBNpswa0Yn/pO50CwD8jEardugdnjQdcXex5AJnvr+geLO8ScjytHHzPEzmMo5x
	xkpd1YUqWkUGk7FTtRLTaV+P9L3pa255N/dnquKXEiUNjFYrmH7hmEST3X+x2hzcrSyHn415XCnZy
	oHEcFvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVuH-0000000Ca7v-1M8S;
	Thu, 26 Nov 2026 09:36:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVuF-0000000Ca7X-0bkc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795685802; x=1827221802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2MtqUnZ5qT621k4FFoy4jHeQztMHO7R/bs+SYayBC4o=;
  b=NG2ESuhgsNuCRF/klN2AINcRZk1F4Q6TD+OlLWeYwnSugFST0DSQlxGt
   Nj6s2hHRMmG84G8zmbPx9/auJMhvOl6/jwCWB27r4RGBQEDCU23m2Fm/o
   m3tPHoO+kMQKgUKRbfEm0apgxgKuQf9HVaY7r0zEUpsfAQ5/BvQK99K5h
   lK2Mpar5OiNcpM7YZkuIUxfmUVQxi4P7O1MV2GsrOffsnMP4k8R0iLD0F
   4zCcKIHKwZmWFvze+aNTPAhe8YXyrycc+8V1pOu2iKZbTeMPn5e/84oIn
   U+99Z9srs+BPmAKh7lF/XC2drrwfMgepYT1QM29yiVsGleufwECo0oSxT
   w==;
X-CSE-ConnectionGUID: SnxyTJEcRC6a/y6k/vmACw==
X-CSE-MsgGUID: DiUC24p+RE6zqJ+ro3GdsQ==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="66104118"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2026 02:36:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Nov 2026 02:36:41 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:36:39 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mihai Sain
	<mihai.sain@microchip.com>
Subject: [PATCH v2 0/3] clk: at91: sam9x7: Fix GMAC TSU clock configuration
Date: Thu, 26 Nov 2026 11:36:03 +0200
Message-ID: <20261126093606.13271-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_013643_222364_64E1B74C 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes the GMAC Time Stamp Unit (TSU) clock configuration for
the Microchip SAM9X7 SoC.

The fixes cover the TSU generic clock definition in the clock driver and
the corresponding clock ID and frequency in the device tree.

Mismatches in these definitions can result in an incorrect clock configuration
for the GMAC TSU.

Changelog:

v1 -> v2:
- Add the correct fixes tag

Mihai Sain (3):
  clk: at91: sam9x7: Fix GMAC TSU generic clock definition
  ARM: dts: microchip: sam9x7: Fix GMAC TSU clock ID
  ARM: dts: microchip: sam9x7: Fix GMAC TSU clock frequency

 arch/arm/boot/dts/microchip/sam9x7.dtsi |  6 +++---
 drivers/clk/at91/sam9x7.c               | 10 ++++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

base-commit: 25faec9ce61c01fb45abf812a222c5b43c3cd5c5
-- 
2.56.1


