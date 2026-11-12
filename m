Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70660A2612
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pD7Ur9T7;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YgGom+il
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2zkIwgx7KpVel0dp5RKFUNmPsf0yAK60wdcEswbaqeA=; b=pD7Ur9T7AtEzr+/XLCBax3f+lJ
	YHShfRXxn8cEKvRK2NVfelOPzhJO+dfN3P5tZeKRz7uR0gKQEXrx02i8rYTXthKjnH+zs0GzOn/u8
	8SVv0MHwNCw7HzZSme0yDz5LSYyjFSlPpOwWhjxLmCpNLEj9gvCKWpLDRS4IDcpCjJd0RexEOxEVQ
	E4GrCDhHp8TSr9tXi6j1oHMEgikLgORE62qEZQwPgpet9j53pLri8bIBWKWWBYSEHLkGJfDZMczZH
	j4W3tni7NXOdAd9SseLGqYaDJ0HZYfO+R8guRbXNGYOhfxCn2wieUfuB9tonumau4igz8BMdRQWZA
	1FfRV60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXTU-0000000AZFn-3QaN;
	Thu, 12 Nov 2026 16:16:33 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXTQ-0000000AZFD-3vlX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794500189; x=1826036189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nImn2zfNJCiLqwjUQuwz6k3lP2UNsG9/Llh1rT3KZkw=;
  b=YgGom+iljPxqKf7W9sEvXQkkjioFUA1zW/VV9WPjDVnHv3hv2ohO+mi9
   kN8DTSrBh0MDW99qd3/8FiZGMvfOPLzEazhT2vxpFCOG7Ig9hHq8Dd8lO
   KJHlKPnaYIXAXDrB+hhK9SGSJPYmD8M/jgrh1TrGcIg3FyyjY7ZlxmtSW
   mjjPLpNr7Rnm0BPD0x94nfLZON4WWOTPOhRWxH3tYJy8Ht7QyIFeDxQ4s
   FE4qvteYw70INqLnb5lLzMniQ8RnekdaIDWi+3UeIYPATrjY9WNbNS0Qm
   hu0VY1gub8P3+tAF8iElQxy4KZLe14Hl+F/YjJ16xwuou30TiW75c+ifZ
   g==;
X-CSE-ConnectionGUID: xEtSSe6NT8a7GtP1UBPrCg==
X-CSE-MsgGUID: KIYlEcVjTKmHM8FAJk2vVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3324060"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3324060"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:16:28 -0800
X-CSE-ConnectionGUID: ssVOz9eyRmyhYzMROW3lrQ==
X-CSE-MsgGUID: jwX6ZGn2TLKhc7tFueDCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8862437"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2026 08:16:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRXTK-000000011i7-0aXn;
	Thu, 12 Nov 2026 16:16:22 +0000
Date: Fri, 13 Nov 2026 00:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: Moteen Shah <m-shah@ti.com>, conor+dt@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, u-kumar1@ti.com, gehariprasath@ti.com,
	m-shah@ti.com, vigneshr@ti.com, afd@ti.com, a-limaye@ti.com,
	y-abhilashchandra@ti.com, johan@kernel.org, kees@kernel.org,
	jm@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/4] soc: ti: Add TDA54 SCM configuration syscon
 support
Message-ID: <202611130001.dmwqpc05-lkp@intel.com>
References: <20261112081047.1550471-5-m-shah@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112081047.1550471-5-m-shah@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_081629_090084_9BC600A0 
X-CRM114-Status: GOOD (  12.38  )
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

Hi Moteen,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.4-rc2 next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Moteen-Shah/dt-bindings-soc-ti-Document-the-ti-tda54-mcu-scm-conf/20261112-134044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261112081047.1550471-5-m-shah%40ti.com
patch subject: [PATCH v3 4/4] soc: ti: Add TDA54 SCM configuration syscon support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261113/202611130001.dmwqpc05-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130001.dmwqpc05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130001.dmwqpc05-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/ti/tda54-mcu-sysconf.c:14:10: fatal error: linux/soc/ti/k3-socinfo.h: No such file or directory
      14 | #include <linux/soc/ti/k3-socinfo.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +14 drivers/soc/ti/tda54-mcu-sysconf.c

  > 14	#include <linux/soc/ti/k3-socinfo.h>
    15	#include <linux/types.h>
    16	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

