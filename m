Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D46606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 20:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pYO6Uo1g;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gQjDjpka
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W0saEwQytD3uvCkQrs8M5XfLBUu7dlyain/D1tXVcKY=; b=pYO6Uo1gi/jAwq3bF5KKo9FNOG
	QRZLTcrDFPDjI/W6xv4XOmEzCL0kFDSdenPlqBUINKWWjgcK1lF8Ek77Dmz+ruhotam8yistzCi2l
	ODneV34XQjvVItpknRtw1HeRKb1c3WVRUllIDYun30Y0VpLI4VcXxibf4DRXPuuDGQbHm63rr7+TS
	K29KgxLsq5SjQsMbVoAwvAY6iIhALU5mQeOkda4nle3Fokck4YOgLFbGlseEaOXinUkMk9cwgAOqx
	NSKcc20BVkGM8FaS8f7jyl0fXe/s6m8UStP5KmFRUqgrOoWNUOUJpMKhiCqD2pYUMEHzEtY2nRElR
	tfnAXStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVE6y-00000001hmw-1Let;
	Sun, 22 Nov 2026 20:24:32 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVE6v-00000001hmM-49YJ;
	Sun, 22 Nov 2026 20:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795379070; x=1826915070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rcgeMoxIEWePPJAz1f4GqmHb62WxQrALOVeHJzO0yU=;
  b=gQjDjpkaLN5NAyAinXMu9uhzHC49filWOiyRDWYUuDHoDAEFiZ7WbANt
   V8SDWjqajQAjHBosQ/3kCV1k5/wNms23mhDDu+apVr3MT0lJXvz9w2sZj
   KGuSyLO3yiKiusEq2rHdwokBqBs89JBxYbebF2UejmO3zz5Yvbe6v6461
   hP+K9erw7/uS133M5Jm3Cp9RBchNK+91r16z6AfzQNEusbp1Npdom4W1y
   fVwHwYLRZkXnrgR4n3NRbbw+V75aea4kMqb7EQhes/Nmo1ciSp6nYFtmY
   PPeQzFU/sNtXZO127cTKcsoSP7sqB9wfALZ5SazkyY6SrxTk/E7DCTleh
   g==;
X-CSE-ConnectionGUID: xVsqcbToRAmuHfj65JfGUg==
X-CSE-MsgGUID: i0o/kuT2S9yHxO5ay1lQRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4185924"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4185924"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 12:24:28 -0800
X-CSE-ConnectionGUID: yO1d1dXORbWAun2YOPiApQ==
X-CSE-MsgGUID: olybKecSQRakBg0RJAb4vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11392727"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2026 12:24:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVE6n-00000001M34-0rot;
	Sun, 22 Nov 2026 20:24:21 +0000
Date: Mon, 23 Nov 2026 04:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH v2 5/5] phy: apple: atc: Split generation-specific code
Message-ID: <202611230426.XGazeYTu-lkp@intel.com>
References: <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_122430_105612_181797F3 
X-CRM114-Status: UNSURE (   8.87  )
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
config: x86_64-buildonly-randconfig-1005-20261122 (https://download.01.org/0day-ci/archive/20261123/202611230426.XGazeYTu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/202611230426.XGazeYTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611230426.XGazeYTu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/apple/atc-t8103.c: In function 'atcphy_configure_pipehandler_usb3_host_t8103':
>> drivers/phy/apple/atc-t8103.c:33:21: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      33 |                     FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
         |                     ^~~~~~~~~~
--
   drivers/phy/apple/atc-t8122.c: In function 'atcphy_configure_pipehandler_usb3_host_t8122':
>> drivers/phy/apple/atc-t8122.c:78:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      78 |                FIELD_PREP(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV, 2),
         |                ^~~~~~~~~~


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

