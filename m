Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302FE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 02:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z4O1Yu8h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=F16iKkT7;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=GfWtOEb+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Gn1iKGRhqTBlJ2TLF/wXgHueVqFg63taAlkjw91Ipws=; b=Z4O1Yu8h5fEZRMxTGKwHboPbad
	cZxtlATG9m4YkUdh7Rg8dYAA2W11wMDL9UL8bS5Cr4yKTyprKIuwjUaY/KRygEVgr4huraq52oTCz
	JMML+iOx6LxIz2pEPVvPAQ98jrpm2zPQU8ICnAj1GfDf7JgZP8ov4VXf2jiU82are83oy/Yn/pqbV
	nKJyJ4UAk71Q/0hoerR2X9rBpSI2cEmWhFlklFv6lKa7B47/kRblXHBXSD8aDVCTetdi5vTSKzTVv
	OxiYF9SsoijKcy7zf60BP8oh9CRWGnmsRx/Cu/V+N7riOmEt9eIw33HXOuV5O9WlNh7NzE/h76u3Q
	BA+xUr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgPc-00000005Nw6-2zdh;
	Tue, 24 Nov 2026 02:37:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgP3-00000005NcG-28wL;
	Tue, 24 Nov 2026 02:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Gn1iKGRhqTBlJ2TLF/wXgHueVqFg63taAlkjw91Ipws=; b=F16iKkT7hMeFRVDl7So3B5ATWd
	WJ4NKQe5eU1MiHInn8rdu/yA8R2JCH3sRPtnbwD83Y3MZA8/83JCoxN8V1QaUAQnJsc6n9idwU+8Y
	NEW4yFn0ykngFq26yVZKNewRpmL4KMO3Tw+S2I8WNMdX8nvRrPplIsnAlpz7rpwrqNR3fIwT4BcHs
	D2ywjVDYzS71ggDTCI8rR+scUbs74v5BDwRP3s7pTX0Vb7WZf/eStvcpjlwSyu8Y+IsN7AxGD4yVR
	7bekNvCyLVCSVWVOUp13T7Vg7SDaW5oJ3zBOmzZzowaYURAjK+5V2aMGR4sftzGMbi9l5dEo6zNY6
	4p1i1Iew==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgOm-00000003lpH-1Hbc;
	Tue, 24 Nov 2026 02:37:02 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2ZwH522160542, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487758; bh=Gn1iKGRhqTBlJ2TLF/wXgHueVqFg63taAlkjw91Ipws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=GfWtOEb+1jLIK66ieIAhsGAtwicq+/EoU0WBEYiYN+jkhQVyEFt8p4pCJqFXyZYVE
	 5Am71dA2ttb3rwwiCG2nbE0yNSLXXrrvU8xk/5x5IqgU0Nchj9SGkKeWQUEGpdewrb
	 e4xrONwokEwYCIFTmqJYkPdL6953lfZCgP0lqx5ZkNluSFSZHbOEI4bq5LCnmibhiA
	 t3JV22XQ4EZR5BQLG04wiCNZ8t5xV5+JaBAZkS9/bKtQ/GTBAx66slx8Eukd1rUKAd
	 A1HeOIEShXz0PZhqEEpTyZqIu8IvoyJSSzzwm6jO4kiBMakZpvBsbdt3dDDhsKo8FW
	 vTxUr+WS0/CAA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2ZwH522160542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 10:35:58 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:35:58 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 10:35:58 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v17 0/9] clk: realtek: Add RTD1625 clock support
Date: Tue, 24 Nov 2026 10:35:48 +0800
Message-ID: <20261124023558.4088635-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_023700_951172_79B6A791 
X-CRM114-Status: GOOD (  17.12  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

This patch series adds the clock controller support for Realtek's
RTD1625 SoC platform.

Because the reset controllers share the same register space with the
clock controllers on this platform, we utilize the Auxiliary Bus framework
to decouple them. The clock controllers act as the primary devices,
registering the reset controllers as auxiliary devices.

The series includes:
1. Device Tree Bindings:
   - Add bindings for the Realtek RTD1625 Clock & Reset Controllers.

2. Clock Subsystem Infrastructure:
   - Introduce a common probe, and add support for basic clocks including
     PLLs, gate clocks, mux clocks, and MMC-tuned PLLs.

3. Clock Platform Drivers:
   - Add the clock controller drivers for RTD1625-CRT and RTD1625-ISO.
   - These drivers provide the clock sources and instantiate the
     corresponding auxiliary reset devices.

Best regards,
Yu-Chun Lin
---
Changes in v17:

Patch 1 (dt-binding):
- Move the 'clocks' and 'clock-names' item descriptions to the top level, and
keep only the item counts in the if/else branches.

Patch 2:
- Make the "Realtek Clock Common" Kconfig symbol a bare tristate and drop its
prompt and help text.
- Change the type of aux_name from 'char *' to 'const char *'.

Patch 3 (PLL):
- Move the power-on sequence from '.enable()' to '.prepare()', and use
'regmap_read_poll_timeout()' instead of the atomic variant: 'wait_freq_ready()'
can take up to 500 us, which is too long to busy-wait in atomic context.
- Drop the spinlock now that '.prepare()', '.unprepare()' and '.set_rate()'
are all serialized by 'prepare_lock'.
- Turn 'ftbl_find_closest_by_rate()' into a macro so that tables other than
'struct rtk_freq_table' can use it.

Patch 4 (GATE):
- Return 0 instead of the error code from '.is_enabled()'.

Patch 6 (MMC PLL):
- Reuse the 'ftbl_find_closest_by_rate()' macro and drop the local duplicate.
- Make 'rate_tbl' optional and add a built-in default table, which also covers
the SPI-NAND operating point at 99,999,206 Hz.
- Add an 'ssc' flag to 'struct rtk_clk_pll_mmc_rate', so that the SSC analog
registers are left untouched in SPI-NAND mode.
- Replace 'shift' with 'phsel_mask' in 'struct rtk_clk_pll_mmc_phase', and use
'field_prep()'/'field_get()'.
- '.recalc_rate()' always computes the rate from the dividers instead of
reverse-matching the rate table.

Patch 7 (CRT):
Add '.suppress_bind_attrs = true'

v16: https://lore.kernel.org/lkml/20261112052544.555563-1-eleanor.lin@realtek.com/
v15: https://lore.kernel.org/lkml/20261002074331.3066919-1-eleanor.lin@realtek.com/
v14: https://lore.kernel.org/lkml/20260901072446.2563145-1-eleanor.lin@realtek.com/
v13: https://lore.kernel.org/lkml/20260812020009.3480538-1-eleanor.lin@realtek.com/
v12: https://lore.kernel.org/lkml/20260804163807.1285869-1-eleanor.lin@realtek.com/
v11: https://lore.kernel.org/lkml/20260728142806.1954638-1-eleanor.lin@realtek.com/
v10: https://lore.kernel.org/lkml/20260713155630.3054636-1-eleanor.lin@realtek.com/
v9: https://lore.kernel.org/lkml/20260624112940.3475605-1-eleanor.lin@realtek.com/
v8: https://lore.kernel.org/lkml/20260610080824.255063-1-eleanor.lin@realtek.com/
v7: https://lore.kernel.org/lkml/20260508111641.3192177-1-eleanor.lin@realtek.com/
v6: https://lore.kernel.org/lkml/20260402073957.2742459-1-eleanor.lin@realtek.com/
v5: https://lore.kernel.org/lkml/20260324025332.3416977-1-eleanor.lin@realtek.com/
v4: https://lore.kernel.org/lkml/20260313081100.596224-1-eleanor.lin@realtek.com/
v3: https://lore.kernel.org/lkml/20260122110857.12995-1-eleanor.lin@realtek.com/
v2: https://lore.kernel.org/lkml/20260113112333.821-1-eleanor.lin@realtek.com/
v1: https://lore.kernel.org/lkml/20251229075313.27254-1-eleanor.lin@realtek.com/

Cheng-Yu Lee (7):
  clk: realtek: Introduce common probe()
  clk: realtek: Add support for phase locked loops (PLLs)
  clk: realtek: Add support for gate clock
  clk: realtek: Add support for mux clock
  clk: realtek: Add support for MMC-tuned PLL clocks
  clk: realtek: Add RTD1625-CRT clock controller driver
  clk: realtek: Add RTD1625-ISO clock controller driver

Yu-Chun Lin (2):
  dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
  arm64: dts: realtek: Add clock support for RTD1625

 .../bindings/clock/realtek,rtd1625-clk.yaml   |  93 ++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  41 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/realtek/Kconfig                   |  39 +
 drivers/clk/realtek/Makefile                  |  12 +
 drivers/clk/realtek/clk-regmap-gate.c         |  59 ++
 drivers/clk/realtek/clk-regmap-gate.h         |  54 ++
 drivers/clk/realtek/clk-regmap-mux.c          |  40 +
 drivers/clk/realtek/clk-regmap-mux.h          |  42 +
 drivers/clk/realtek/clk-regmap-pll-mmc.c      | 443 +++++++++
 drivers/clk/realtek/clk-regmap-pll-mmc.h      |  69 ++
 drivers/clk/realtek/clk-regmap-pll.c          | 177 ++++
 drivers/clk/realtek/clk-regmap-pll.h          |  44 +
 drivers/clk/realtek/clk-rtd1625-crt.c         | 859 ++++++++++++++++++
 drivers/clk/realtek/clk-rtd1625-iso.c         | 140 +++
 drivers/clk/realtek/clk-rtk-common.c          |  84 ++
 drivers/clk/realtek/clk-rtk-common.h          |  37 +
 drivers/clk/realtek/freq_table.c              |  39 +
 drivers/clk/realtek/freq_table.h              |  45 +
 .../dt-bindings/clock/realtek,rtd1625-clk.h   | 166 ++++
 22 files changed, 2492 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
 create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
 create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
 create mode 100644 drivers/clk/realtek/clk-regmap-pll-mmc.c
 create mode 100644 drivers/clk/realtek/clk-regmap-pll-mmc.h
 create mode 100644 drivers/clk/realtek/clk-regmap-pll.c
 create mode 100644 drivers/clk/realtek/clk-regmap-pll.h
 create mode 100644 drivers/clk/realtek/clk-rtd1625-crt.c
 create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.c
 create mode 100644 drivers/clk/realtek/clk-rtk-common.h
 create mode 100644 drivers/clk/realtek/freq_table.c
 create mode 100644 drivers/clk/realtek/freq_table.h
 create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h

-- 
2.43.0


