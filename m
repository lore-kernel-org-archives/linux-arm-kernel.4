Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807CD606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 06:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aOuPGJtF;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UiOhkEuL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GfR2v1fGSa9v9se/HJxCvFiuQY7pRfOaUALW8dMW5xo=; b=aOuPGJtF9RK+sRI547GCkN7KvO
	yAfhJZG/4y8N8n1YthzjYCoIW9cpP3CYfWCodUSAdCFl7R60K1wWUp6ypqcNLj982jm3htc1wMDf5
	DA2uaUKxruiCM+NNzMGBCxjEXJYzf24pbFnh/ZQU35ZQbVkjqKQjY3Twsd+RKrzmsv8R03+hNK7fW
	wfq0092gByT4rp/Z9Qk0742WudTHDhHoZex/oCSzv76CCVH4erHTTni2wiYTxNqDMPDfnL603P8+g
	6EFEOgo+z/CFqKtBnYA0mAptYMr8KlUOeZ33f9XmJHkzzdNDmHJhChA+PvOq6H9Djrq7FjWd/kluf
	tr2r0ujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUem0-0000000GoLu-1t0U;
	Sat, 21 Nov 2026 06:40:32 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUelx-0000000GoLZ-3ALv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 06:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795243230; x=1826779230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lXqQdPnha4TO9CYwKKw9/ZJtLWkYLbTSMEZ5e1gH13o=;
  b=UiOhkEuLcPdBL+S+Olug1+hCIQukmQvzZWYNXSCDaoYKWFbIYGlGkczy
   66FEfQqEKy7QFHrOCJJ+4ecI7rEOfTiIqJj5Hif0xpiax0mstkFQWRcJN
   y18QuW2vgCp0YQfF/ibvcMqLXnGMkfaaBRNRX7V+WzhxgcHi3u7iXZHvG
   KnbdRJ2LZ4D6PspdJFf8Ozv3onY6Df60mlnCXTV0SiIwEs1Jq6gu2+OgO
   K2NGB5ZzHVjf7QdXoqHz6RrpROncXiz7qRTukEur9lrd39BEFx6NFkFhV
   h42hazezmmuOfod+bXoFAd3b2pGqXJi0MRwgYaLj+V9PCHt1vcUWguFaq
   w==;
X-CSE-ConnectionGUID: 9QJ389zGRZ24en+hbSJkAA==
X-CSE-MsgGUID: VghOdwCDSnSxNGkkFMG3pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4008332"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4008332"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 22:40:28 -0800
X-CSE-ConnectionGUID: rlxJwrqURMesiLu8HC9kqA==
X-CSE-MsgGUID: uUviNHEoS22qRMv20VKWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10948120"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Nov 2026 22:40:26 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUelq-00000001Jel-3uGH;
	Sat, 21 Nov 2026 06:40:22 +0000
Date: Sat, 21 Nov 2026 14:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: tumic@gpxsee.org, Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <monstr@monstr.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Message-ID: <202611211451.jgdt0UvZ-lkp@intel.com>
References: <20261120172356.5858-2-tumic@gpxsee.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120172356.5858-2-tumic@gpxsee.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_224029_835019_9D658198 
X-CRM114-Status: GOOD (  10.07  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 65e4fd942f72a9dba0e4e257290c4fa1aa756854]

url:    https://github.com/intel-lab-lkp/linux/commits/tumic-gpxsee-org/dmaengine-xilinx-xdma-Fix-broken-PM-suspend-resume/20261120-182356
base:   65e4fd942f72a9dba0e4e257290c4fa1aa756854
patch link:    https://lore.kernel.org/r/20261120172356.5858-2-tumic%40gpxsee.org
patch subject: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
config: i386-randconfig-1000-20261121 (https://download.01.org/0day-ci/archive/20261121/202611211451.jgdt0UvZ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611211451.jgdt0UvZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611211451.jgdt0UvZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma/xilinx/xdma.c:410 Excess function parameter 'xdev' description in 'xdma_reconfig_channels'
>> Warning: drivers/dma/xilinx/xdma.c:410 Excess function parameter 'xdev' description in 'xdma_reconfig_channels'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

