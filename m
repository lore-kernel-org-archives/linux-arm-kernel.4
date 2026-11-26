Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66934606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GUDT4jIE;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=MDOR3KAA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wvNQx1NXiQyGJrBACF7QW0QjuyjuClcYVEKZhGIr/Nc=; b=GUDT4jIEh+1OTQ5iO14ovW66x8
	EsF2LSEVHV4DT+Qs9WDs057z8Xq8YOMHHSeFlk1rI0AgE0mBHuIoIjyReTqh2JLMHk/OkyauJdcdK
	2xJPVyTjvhd41t/5HfM4jZdWIPxInAZ7j04tb1DUtf8GKOxL6pEgJPa7kryW14ssYdKrmcGQSOZme
	ka3zBhY4DrAY+7mFsKh2NfybIgjbBS7NeyEJmfpf9lkVTgWMn3TRsiHkhwxG2XOyAuX95zqFfsXmS
	g8Z7XshZlFtQTzsq9IGovqAjK/H+ANG0XnYnY2e1VIAFQBNU5ZQEk1rfiXjXhv18e9XzWhgyXtmUV
	DTzgGxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVdA-0000000CW0u-3gd0;
	Thu, 26 Nov 2026 09:19:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVci-0000000CVsi-3Jqf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795684716; x=1827220716;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gOLzHIL0GQIjaNNNM7qZ1IqEql6yXuMHaUjknU/ArWE=;
  b=MDOR3KAAVG39Fe2TnDONonCGKmsKwAWvC3/SGGCgjuZvak9JwPlWMsSS
   R3lh682Mt/UdM9znfJXhQUOdtJwGXSVIN12I04D339HlzZPwlQMutfZPm
   W5dT0wiyS7M0ZHNzKP8HHYGe7DqIDE4KNQRab6DIBqt96epHe7fBtZm+h
   HOvsiHPl+PdCJN4MdYF+JXlNrYvbKb2HmLt0o3dj8Agbi7UI2h+0m92b7
   uWqhsiQJ82JUfgfEEg+WcLHcLf9HjOrTD/Jt/2JNDNal5uQo1ApNIJC4W
   dDKOFGPCje9fx+RygzizPVFsGNs4+ugOKplvct842SzCUfedeVfaespqY
   w==;
X-CSE-ConnectionGUID: GWLb76C1Qw6aglWXaZtdvQ==
X-CSE-MsgGUID: kmXuFq4QQmuF4ScOxmJHaw==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="67088741"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 02:18:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Thu, 26 Nov 2026 02:18:34 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:18:32 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/3] clk: at91: sam9x7: Fix GMAC TSU clock configuration
Date: Thu, 26 Nov 2026 11:18:06 +0200
Message-ID: <20261126091809.13012-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_011837_120221_5078D421 
X-CRM114-Status: UNSURE (   8.28  )
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


