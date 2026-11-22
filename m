Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA249606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 21:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q/P5eN+F;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SWXjVI5D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r33Cj4lupPhh24gJePZ1Dl7y1V10m6bSBH32VLKAENo=; b=q/P5eN+FblMsBGweT6dOLS8xDo
	C6XgK00RbWI0lq9HHGjaAzv6JZXFc6BeLti113Olsf6PFOO+emRvomQ+ZqghvDUXKO6Lj7BMeDUOg
	L+qkA53X/3e8PwmQB67tqjr1v1Gb6cRhE3NJpd82thTpC2/BqPL0G97B3q5K+4YJZoWspRWVpUWhs
	0NPFa01xfsFl5mq8kJjqCT1JUY6NtmD7fOnjo7IzGjY6ZjJo+2rffDuZucZu88iumsp1aY4+9RR2Z
	a0UaCPyJEBAelyC3aDACUPzYJUj97O3VJqJdRa/ZNP+YKEowVrYBlA7Mf3L0UkABEBLYPu4WwySGP
	l9u+Wfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFG2-00000001oEF-26YL;
	Sun, 22 Nov 2026 21:37:58 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFFz-00000001oDS-3uVg;
	Sun, 22 Nov 2026 21:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795383476; x=1826919476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=47WiqbuVGJhCQD/UFYev9AOeQxncNO/1VcFLwy5fqR8=;
  b=SWXjVI5DXsceopy6KNyUIyhbbEeHJ7jAhgBTIwh/ZLSSDVrIUpD6q+to
   R00tXGcAgKkCmeZNM35uvVJjWDj9KdCk6ONAqZgWnCUXUUlGsup/er3jq
   5jmwniMoN+uvTIyInflKoC/Dni2AXWvv72ynpJkJugyRDTsLcC9jeBi1G
   328OShbdYew+AvRFMTFHbIAsUafJXs/FH9lfLx7f7smfsK5Eiob7DC3ZL
   jIgNnyMMG6CtWouA0o82uXmo6KjgXrA7rItnQSticTrPjd4vqj1vQNlxo
   Vu9CajUpQ4hN3OYm/P431ABERATGGDUOOBrEaiQnRT9KlIWpvZwSFZAUI
   w==;
X-CSE-ConnectionGUID: Gpymdbi5QEyR2LSFQXAZCA==
X-CSE-MsgGUID: Fe9BGeHGSCuMmCTkE8L9TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4085143"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4085143"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 13:37:54 -0800
X-CSE-ConnectionGUID: a+H/fAZnQ1WSPIPsfJH+bw==
X-CSE-MsgGUID: V9DTBvzdRyOQ6xxQb8LhZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11082364"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2026 13:37:50 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVFFs-00000001M6c-0KH7;
	Sun, 22 Nov 2026 21:37:48 +0000
Date: Mon, 23 Nov 2026 05:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH v2 5/5] phy: apple: atc: Split generation-specific code
Message-ID: <202611230532.xXpnoRHP-lkp@intel.com>
References: <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_133756_044061_4EDC4890 
X-CRM114-Status: UNSURE (   9.04  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sasha,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Finkelstein/dt-bindings-phy-atcphy-Add-M3-series/20261122-132757
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261122-t8122-phy-v2-5-8d5c8fdf31ba%40chaosmail.tech
patch subject: [PATCH v2 5/5] phy: apple: atc: Split generation-specific code
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261123/202611230532.xXpnoRHP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/202611230532.xXpnoRHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611230532.xXpnoRHP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/apple/atc-t8103.c:33:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |                     FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
         |                     ^
   drivers/phy/apple/atc-t8103.c:71:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |                     FIELD_PREP(DPRX_PCLK_SELECT, 1));
         |                     ^
   drivers/phy/apple/atc-t8103.c:146:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     146 |                FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_SMALL_OV, 3));
         |                ^
   3 errors generated.
--
>> drivers/phy/apple/atc-t8122.c:78:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      78 |                FIELD_PREP(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV, 2),
         |                ^
   drivers/phy/apple/atc-t8122.c:158:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     158 |                     FIELD_PREP(AUSPLL_APB_CMD_OVERRIDE_CMD, command) |
         |                     ^
   drivers/phy/apple/atc-t8122.c:173:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |                     FIELD_PREP(DPTX_PCLK1_SELECT, 1) | FIELD_PREP(DPTX_PCLK2_SELECT, 1) |
         |                     ^
   drivers/phy/apple/atc-t8122.c:249:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     249 |                FIELD_PREP(LN_LDOCLK1_VREG_ADJ, 12));
         |                ^
   drivers/phy/apple/atc-t8122.c:307:25: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |                LN_VREF221_EN | FIELD_PREP(LN_VREF221_FILTER_ADJUST, 1));
         |                                ^
   5 errors generated.


vim +/FIELD_PREP +33 drivers/phy/apple/atc-t8103.c

    11	
    12	static void atcphy_configure_pipehandler_usb3_host_t8103(struct apple_atcphy *atcphy)
    13	{
    14		int ret;
    15		u32 reg;
    16	
    17		core_set32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG0,
    18			   ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N);
    19		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG, ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV);
    20		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
    21					 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
    22		if (ret)
    23			dev_warn(atcphy->dev,
    24				 "Timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
    25	
    26		core_set32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
    27			   ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
    28		core_clear32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
    29			     ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
    30	
    31		core_mask32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG1,
    32			    ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN,
  > 33			    FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
    34	
    35		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG,
    36			   ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV);
    37		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    38			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
    39		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    40			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
    41		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_CIOPHY_CFG1);
    42	
    43		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
    44					 (reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK0), 10, 10000);
    45		if (ret)
    46			dev_warn(atcphy->dev,
    47				 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK0\n");
    48	
    49		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
    50					 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
    51		if (ret)
    52			dev_warn(atcphy->dev,
    53				 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
    54	
    55		atcphy_clear_nonselected_phy_reset(atcphy);
    56	
    57		/* More BIST stuff (?) */
    58		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_OV_CFG);
    59		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    60			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
    61		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    62			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

