Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EC8606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 03:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JdLydAjq;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YgBFc99g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gR1qLIaMHhI3YBZAln/1xyLff0Ct3bEmnohy1kd4w4Q=; b=JdLydAjqsFt9m/PinCW4b3bl0O
	Ul51uRnIK3onPu36dZTcV1f4ryA3+9fKDTwpmE7gGJsA54RwwnWI9eOWnqjSHCEzV0G76dUMDEV8m
	IukdcRdvjm6HzVE/SZp1u2L2UJa8JdpuGFkIb/AbZZfHoJgEVLpEx9A6IGnfQA9URMaekIFT/pM3j
	GhAK7K5/5wsvQ4OimKrcRG+BS1Gxu1XifhJ5+0kVHa66Glg040OmIQW+EaYswqdjJH91g2vssA3io
	oyyNaPbnti5yjblncCIcOIjPWlhB9USpjKxzEFFMwEqHCbsxqQ8682vGSQKz2Hc6eorBcHUElNyKL
	4EoHA5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsTx-0000000AkPV-23Qe;
	Thu, 19 Nov 2026 03:06:41 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsTt-0000000AkP3-4AGZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 03:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795057598; x=1826593598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EfvJartN0GQTYOS8WukorNhnfCAqMp3jN6Awhu42mQU=;
  b=YgBFc99g8/l5ijzZsatR81z5IRdQhtcT9N2fsU6wAqEZKBdXDEm+QBD9
   AWkw+2OEFdSt61GjMOhd2p0GuJMG4mT4jYBrlSIWGoKS9p889zAElPBV3
   wjRcAPnD+wUnjw7K1UbDWjgaLPINgNknfwVhPcdnRrQJnK9Enh4C9Yivw
   lxTVpnGIUmBCoBMuJYkVR0HIR2tVtqqXc1eiNoB9xfL7gcUyHLibISi1h
   tg9nCVusw3Cu6KdnYNMV3A/uinWMnSzBoZIXtvusHdgALwwUUrPljBRZ/
   VlMKZ0eh7mxt2Dky7VT2B5e3EgWUwPzsny6Yav4dfOPOwGC0v/bD+pL8t
   w==;
X-CSE-ConnectionGUID: Qy7qIlKYTY+8zaIoGj52mQ==
X-CSE-MsgGUID: 6lHqwYfZS16xTvbB7ATlFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3906183"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3906183"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 19:06:36 -0800
X-CSE-ConnectionGUID: t+eZmWpVQtWw0a8Ltad/lg==
X-CSE-MsgGUID: cTqBNtlNTRSr8YPa6eNoPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10190438"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Nov 2026 19:06:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTsTn-00000001Ev8-1pXM;
	Thu, 19 Nov 2026 03:06:31 +0000
Date: Thu, 19 Nov 2026 11:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, git@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
Message-ID: <202611191027.Md4LUs3M-lkp@intel.com>
References: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_190638_067925_2264E61D 
X-CRM114-Status: GOOD (  13.19  )
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

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.4-rc3]
[also build test ERROR on linus/master next-20261116]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Simek/media-xilinx-vip-Make-use-of-the-devm_clk_get_enabled/20261118-103132
base:   v7.4-rc3
patch link:    https://lore.kernel.org/r/abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek%40amd.com
patch subject: [PATCH] media: xilinx: vip: Make use of the devm_clk_get_enabled()
config: loongarch-randconfig-1001-20261119 (https://download.01.org/0day-ci/archive/20261119/202611191027.Md4LUs3M-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 67ab6538dff0ed2593b90166214d93e992c74905)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611191027.Md4LUs3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611191027.Md4LUs3M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-vip.c:215:14: error: call to undeclared function 'devm_clk_get_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     215 |         xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
         |                     ^
   drivers/media/platform/xilinx/xilinx-vip.c:215:14: note: did you mean 'devm_clk_get_enabled'?
   include/linux/clk.h:632:13: note: 'devm_clk_get_enabled' declared here
     632 | struct clk *devm_clk_get_enabled(struct device *dev, const char *id);
         |             ^
>> drivers/media/platform/xilinx/xilinx-vip.c:215:12: error: incompatible integer to pointer conversion assigning to 'struct clk *' from 'int' [-Wint-conversion]
     215 |         xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
         |                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_clk_get_enable +215 drivers/media/platform/xilinx/xilinx-vip.c

   206	
   207	int xvip_init_resources(struct xvip_device *xvip)
   208	{
   209		struct platform_device *pdev = to_platform_device(xvip->dev);
   210	
   211		xvip->iomem = devm_platform_ioremap_resource(pdev, 0);
   212		if (IS_ERR(xvip->iomem))
   213			return PTR_ERR(xvip->iomem);
   214	
 > 215		xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
   216		if (IS_ERR(xvip->clk))
   217			return PTR_ERR(xvip->clk);
   218	
   219		return 0;
   220	}
   221	EXPORT_SYMBOL_GPL(xvip_init_resources);
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

