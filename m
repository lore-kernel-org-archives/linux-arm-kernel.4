Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88D2606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 04:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OvvfEBm1;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f3NWUnxN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HGoYUoEJLo2pINrnesL8crVvN61TGPT9mU4EfzF0THk=; b=OvvfEBm1ELODrvTN9lbv+l1F1J
	4uRM+r1k39kBAdUUGGaV7eGplLlqpSncIFBIV/rvUKKcdZyAOpL8U+/U1rsSztj+T+ROXrX5sD24O
	J4B2z3HZHFIvHPmjX90X6uH9B21vU6sutCBpljMTkoqgd7GcTUc3dxG6bn0SGR0JMfgYZ4IqOePD9
	amZggxOuD7oAUtxpVCiapYvrxMd2ZzLj63j32/MB62KlGGj1UDYxzG2kuKuYN4QTN5q9f7BupwSv4
	+77Zx36Sdkzkk+Gy+TEXBfrljgsjsFoWiFcK/rcRGvPOClfOzvmvAo9f6ZIoEOqZx1FDY1NAwMGpg
	BNCDIIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtvp-0000000ApyZ-0Gr2;
	Thu, 19 Nov 2026 04:39:33 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtvm-0000000ApyA-0QnD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 04:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795063170; x=1826599170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VBCEgYy/crUpata0T6Lh38Ywa1dQP48mANWtNkE9c5A=;
  b=f3NWUnxN/QdF7jeFhZ0+/Rj9F2Fuu+RcEzEwWBWNqUE2UYLEt/EH/ILK
   PNFggh1pVoaDAyu438zltUmzp6A57CqdWBkXWrOme168l9oNNt3aJ3Kwp
   pEe+u4g4meVuhzm+aqR3m8hnhLFWbmlHDAhOBXPYoM1m5ef+/CuIesld1
   aU7ZoP60j9EuQfa4wgROEb8YNSvnV4ITWIeDex0a9b0IhfuWUc1s9wPhh
   u3dCI/JDj6vtmvOyhv280ZYgaWjC2B7y8mqqXWRPHpWs6VGdccAUOmC7v
   fhRh9Gi64/LAz9qWF4DTdQrxjMU+n3jiiMuBSiwdkmNmDa/IhAWrDVbNA
   Q==;
X-CSE-ConnectionGUID: aJ1G4LL7TVuCOYGpy10FYg==
X-CSE-MsgGUID: gbbbfDDNR0uAiZu2bDUpLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3794306"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3794306"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 20:39:30 -0800
X-CSE-ConnectionGUID: vYsccUheT8694vW4J44aRg==
X-CSE-MsgGUID: 46E1PlnTQwmWvXMi7zO6cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10324470"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2026 20:39:28 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTtvg-00000001F1a-3Cyw;
	Thu, 19 Nov 2026 04:39:24 +0000
Date: Thu, 19 Nov 2026 12:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, git@amd.com
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
Message-ID: <202611191243.pxt5RLKL-lkp@intel.com>
References: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_203930_206344_83A45E89 
X-CRM114-Status: GOOD (  13.61  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.4-rc3]
[also build test WARNING on linus/master next-20261116]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Simek/media-xilinx-vip-Make-use-of-the-devm_clk_get_enabled/20261118-103132
base:   v7.4-rc3
patch link:    https://lore.kernel.org/r/abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek%40amd.com
patch subject: [PATCH] media: xilinx: vip: Make use of the devm_clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261119/202611191243.pxt5RLKL-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611191243.pxt5RLKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611191243.pxt5RLKL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-vip.c: In function 'xvip_init_resources':
   drivers/media/platform/xilinx/xilinx-vip.c:215:21: error: implicit declaration of function 'devm_clk_get_enable'; did you mean 'devm_clk_get_enabled'? [-Werror=implicit-function-declaration]
     215 |         xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     devm_clk_get_enabled
>> drivers/media/platform/xilinx/xilinx-vip.c:215:19: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     215 |         xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
         |                   ^
   cc1: some warnings being treated as errors


vim +215 drivers/media/platform/xilinx/xilinx-vip.c

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

