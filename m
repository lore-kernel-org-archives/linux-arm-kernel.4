Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6890B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 05:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NuCSR6Gd;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a8rZd7cc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G/htg+82caSvwQpCes/2upHgSspm1kzDs/D3FDHUNhY=; b=NuCSR6GdzIqilKik+fdWTbP+rm
	h42YbJ+LsddnZanWyo3vfQjS/GbkgQsQVHVhJEPjdTPNyrgOmMi7US/EjiRfQAkUIH5gtfZWySnpI
	wWMQWYUyA+PZjmNC7coq+zgq8J4ZAKpko5OHnV9rf4GgrujwmG2A5YTSfOtfeoBqMIpSYyoVrUt5T
	CQU3XTBB7hwtGH8H5Uwr0os0QOCpldhxEKHdxOa3YZ1R/iXyMADDTZ1MKcuNzxEwLc8NFM7KGZegC
	MKv1eA7nfed/orYZIfedv2ihAAweU5b/RU0jXzYKvcGgSU5ToJTfeuZ5rrHq3pXq5GBUFAydmACv9
	unLWVCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPvEF-0000000FgLK-2G0x;
	Sun, 08 Nov 2026 05:14:07 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPvEC-0000000FgKz-2Ibb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 05:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794114845; x=1825650845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTaUFugVRZP1qC2U/0ALiQEKDrcWIcToCzjWAKgP0xU=;
  b=a8rZd7ccAiwvmRbBhluolmu/RyT0cwWv5cpMeIRklJjTW8mFpKljx4/W
   C6tmYUyjbTcUh5UzBsLx2nPlCZDxy32xxYgHE8jbtU9B44iFI2Bjqp0OK
   qZAb/6S5Pi7/o5oBIXTOXy81E2F0uaxN8GS0kQ8pubONoVHxZBcwd5Cmk
   F1t2AMzUFEdXYVlesMLHm/jDvF6AX5erTI7S2st1RTSh4FwzmS3Ijk//q
   y7dEzo7RnbSZa266Gc+JIWR9FDU9cCXSe0FeFkSmVk6W+jVlU1xxqI0wV
   RxeTm4TaUCgfTeGzbP3kEHkxJ4QNz0ba5Uy0mb3o91dVHR0e2IXKDsI4s
   w==;
X-CSE-ConnectionGUID: CeECetBKRJSZpOC8QlevOg==
X-CSE-MsgGUID: 8GYmmvrgQPOk53dF4m3LAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2878164"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2878164"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 21:14:02 -0800
X-CSE-ConnectionGUID: 6o0RgvbdS+6kv99plMYIKA==
X-CSE-MsgGUID: llm9UCwsTei6Q0DQQz3frQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7423691"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2026 21:13:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPvE3-00000000s7z-185F;
	Sun, 08 Nov 2026 05:13:55 +0000
Date: Sun, 8 Nov 2026 13:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Michals <tcmichals@gmail.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: Re: [PATCH v3 7/7] remoteproc: sunxi: Add KUnit tests
Message-ID: <202611081239.zlQqllPm-lkp@intel.com>
References: <20261101185735.762559-8-tcmichals@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-8-tcmichals@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_211404_658346_1A8108DF 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Tim,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Michals/dt-bindings-mailbox-Add-Allwinner-A523-message-box/20261101-125729
base:   7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
patch link:    https://lore.kernel.org/r/20261101185735.762559-8-tcmichals%40gmail.com
patch subject: [PATCH v3 7/7] remoteproc: sunxi: Add KUnit tests
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20261108/202611081239.zlQqllPm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081239.zlQqllPm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081239.zlQqllPm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/kunit/device.h:16,
                    from drivers/remoteproc/sunxi_rproc_kunit.c:29:
   drivers/remoteproc/sunxi_rproc_kunit.c: In function 'expect_powered_off':
>> drivers/remoteproc/sunxi_rproc_kunit.c:962:64: error: 'struct dev_pm_info' has no member named 'usage_count'
     962 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
         |                                                                ^
   include/kunit/test.h:840:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:962:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     962 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
         |         ^~~~~~~~~~~~~~~
>> drivers/remoteproc/sunxi_rproc_kunit.c:962:64: error: 'struct dev_pm_info' has no member named 'usage_count'
     962 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
         |                                                                ^
   include/kunit/test.h:840:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:962:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     962 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
         |         ^~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c: In function 'test_prepare_unprepare_order':
   drivers/remoteproc/sunxi_rproc_kunit.c:977:64: error: 'struct dev_pm_info' has no member named 'usage_count'
     977 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 1);
         |                                                                ^
   include/kunit/test.h:840:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:977:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     977 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 1);
         |         ^~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:977:64: error: 'struct dev_pm_info' has no member named 'usage_count'
     977 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 1);
         |                                                                ^
   include/kunit/test.h:840:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:977:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     977 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 1);
         |         ^~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c: In function 'test_prepare_power_up_failure':
   drivers/remoteproc/sunxi_rproc_kunit.c:1107:54: error: 'struct dev_pm_info' has no member named 'usage_count'
    1107 |         KUNIT_EXPECT_EQ(test, atomic_read(&dev->power.usage_count), 0);
         |                                                      ^
   include/kunit/test.h:840:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:1107:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
    1107 |         KUNIT_EXPECT_EQ(test, atomic_read(&dev->power.usage_count), 0);
         |         ^~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:1107:54: error: 'struct dev_pm_info' has no member named 'usage_count'
    1107 |         KUNIT_EXPECT_EQ(test, atomic_read(&dev->power.usage_count), 0);
         |                                                      ^
   include/kunit/test.h:840:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1037:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1037 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1034:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:1107:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
    1107 |         KUNIT_EXPECT_EQ(test, atomic_read(&dev->power.usage_count), 0);
         |         ^~~~~~~~~~~~~~~


vim +962 drivers/remoteproc/sunxi_rproc_kunit.c

   949	
   950	/* Everything as before prepare(): resets asserted, clocks off, no PM reference */
   951	static void expect_powered_off(struct kunit *test, struct test_context *ctx,
   952				       struct mock_providers *mp, bool core_held)
   953	{
   954		int i;
   955	
   956		KUNIT_EXPECT_TRUE(test, mp->asserted[RST_CFG]);
   957		KUNIT_EXPECT_TRUE(test, mp->asserted[RST_SRAM]);
   958		KUNIT_EXPECT_TRUE(test, mp->asserted[RST_DEBUG]);
   959		KUNIT_EXPECT_EQ(test, mp->asserted[RST_CORE], core_held);
   960		for (i = 0; i < NR_CLK; i++)
   961			KUNIT_EXPECT_FALSE_MSG(test, clk_hw_is_prepared(&mp->clk[i].hw), "clock %d", i);
 > 962		KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
   963	}
   964	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

