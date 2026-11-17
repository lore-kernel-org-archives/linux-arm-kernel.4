Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66957606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qAsVzUhb;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mPZ1QrHs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uO1DEpX/Sdk0AbUa13aZ6W/TOYUzfkDuzHxFvUxx8t4=; b=qAsVzUhb6yeXvphNJwVs3dAjFh
	L35ylncc/TJm1Zs7qNYPRDdkTO0OhpvMkkd0OMM3uS4nTkcu4pYXFoRwXFZ5Fb4wpk0qlwgPGF2hh
	Zz9nATrYEwHp38ygT/kAendKpRejVUouTxIhQ6oHa0Su6vvMPkfbv7RGUKY60S3W3jaLvuaymsniS
	gMeoBbdSIBeULXM0Q+QpTnn84L2I2gM5FD2QYWBdcN1IkVVBy51bPoOF2VBaxcSCqQAP5TXD2ymiD
	VILIkrrgHvZDbZVa9uiflguES/LZlao1vBA1OjeZ4x9MhRBiRnmUOnnPnmE6WtiMGYsRZahvYCZlG
	NdjNRFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLU4-00000006MNr-1hJ3;
	Tue, 17 Nov 2026 15:52:36 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLU1-00000006MN3-2M8S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794930753; x=1826466753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3CdFWivnZIGgdKSr6ahNFtljVOdDNHvNk1RCwFrBiFU=;
  b=mPZ1QrHsi0lCvDj7va43dnWuQpdtJGm9RZZfDiJGSO6X1ulOWHs2FHQg
   3QynfCCaxcqPnsiMGKa+y8wbkKv/qwf260FOLZcZaSTBArfac/anMDoyK
   7QRvKA6+w8TrYnrgMYYNFSIt/NWV8YFrIE5J8ZgzxbNhA7VdzGDtygGNk
   1ibF23DAV6D0KyQQZqBY4Yv2mLuvVYYP4tDqJKUNpAi66AaHSuDNT1h6l
   FDojBUI9E7MzYhaWItKJYYPRxApP7vXQo8GXyv95zh/OSZuL3NsOcsNmk
   P2sJvA+BSb0U1LinFNLuNSrpJb5jTDud4u8U7DEggbmjlPFJxz2acfx89
   g==;
X-CSE-ConnectionGUID: ZMtrzbztTqCqFk+p7cUEdQ==
X-CSE-MsgGUID: 4hEOjchHTwW+MHpsZ0hRcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3742665"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3742665"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 07:52:32 -0800
X-CSE-ConnectionGUID: toWrsmohT4m0OWvmH/CRZA==
X-CSE-MsgGUID: sMFT57sMSEOce1NigVoc/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10189662"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Nov 2026 07:52:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTLTu-00000001Bwf-2maE;
	Tue, 17 Nov 2026 15:52:26 +0000
Date: Tue, 17 Nov 2026 23:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Siyuan <hsyysy@163.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: sunxi_wdt: stop the watchdog across system
 suspend
Message-ID: <202611172344.RbQl66xu-lkp@intel.com>
References: <20261117092036.12192-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117092036.12192-1-hsyysy@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_075233_654079_E0116322 
X-CRM114-Status: GOOD (  13.12  )
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

Hi Yang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aebb7274476403040d582c61478df8f4a7bf9cd3]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Siyuan/watchdog-sunxi_wdt-stop-the-watchdog-across-system-suspend/20261117-172036
base:   aebb7274476403040d582c61478df8f4a7bf9cd3
patch link:    https://lore.kernel.org/r/20261117092036.12192-1-hsyysy%40163.com
patch subject: [PATCH] watchdog: sunxi_wdt: stop the watchdog across system suspend
config: csky-randconfig-1001-20261117 (https://download.01.org/0day-ci/archive/20261117/202611172344.RbQl66xu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611172344.RbQl66xu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611172344.RbQl66xu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/sunxi_wdt.c:245:12: warning: 'sunxi_wdt_resume' defined but not used [-Wunused-function]
     245 | static int sunxi_wdt_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/watchdog/sunxi_wdt.c:235:12: warning: 'sunxi_wdt_suspend' defined but not used [-Wunused-function]
     235 | static int sunxi_wdt_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~


vim +/sunxi_wdt_resume +245 drivers/watchdog/sunxi_wdt.c

   228	
   229	/*
   230	 * The hardware watchdog has a maximum timeout of 16 seconds.  A system
   231	 * suspend easily lasts longer than that, and the watchdog core only cancels
   232	 * its ping worker during suspend; it does not stop the timer.  Stop the
   233	 * watchdog explicitly while suspended and re-arm it on resume.
   234	 */
 > 235	static int sunxi_wdt_suspend(struct device *dev)
   236	{
   237		struct sunxi_wdt_dev *sunxi_wdt = dev_get_drvdata(dev);
   238	
   239		sunxi_wdt->running_at_suspend = sunxi_wdt_is_running(&sunxi_wdt->wdt_dev);
   240		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
   241	
   242		return 0;
   243	}
   244	
 > 245	static int sunxi_wdt_resume(struct device *dev)
   246	{
   247		struct sunxi_wdt_dev *sunxi_wdt = dev_get_drvdata(dev);
   248	
   249		if (sunxi_wdt->running_at_suspend)
   250			sunxi_wdt_start(&sunxi_wdt->wdt_dev);
   251	
   252		return 0;
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

