Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2543F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SGg+DwtB;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EnfvlOi6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bSKNeRhoYj51dd326u4b+S/qwJ1yJgRLl0Pp5aorhH0=; b=SGg+DwtBu58vgC3zCkYZgrTG7e
	ji+IU827+R+IXMGZpQyiNJvFxn8FAoqI8wLiKU5D+PbDBOISpTNN8sj6jmHeoODf665NcM5IqLOij
	IGbAfNFrU8q25w+Latf8iRJEaOcZUfX45E9EwSLd+oPNY9F63z0g0OWG1pIZeGmrtCQI26FQH4ahz
	ZDqupIDrFUlx8lQ8wNbI+Tp7QF8GyyyPJ2jVapd2rpEM5hNGPOBVphIzXCFcZeF33lyT81CTjieEL
	hAr0Yq3NJI4CJZXJG10WYksrl5BMqN/EqFBeSnirzOSaYn2t7YYRO2GLpRxI4AMBGkRcevbvig7dL
	mXczdBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPwFL-0000000Fhyk-13pb;
	Sun, 08 Nov 2026 06:19:19 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPwFI-0000000FhyP-1ATZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 06:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794118756; x=1825654756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pLWtdzulAJWXAefk0jF40+RB4tS7wf4qyhp071KtEyw=;
  b=EnfvlOi6WKms+1JMjugYx47Ek9PFqlC+Yu+KI+XFxSIb6xmXuru07AVJ
   Lwav+Gje/okQMQcUORrQ7lyWZUhi615/pf+T+wn8wokc329iAqTqfwgmo
   0GuTOlU/I0GRW7pLZEWPD/PBk68JaUau1Uy8zdCnIsBqWviSzT76mCnzv
   uZNnDMQx4z+ABIcgXP+CNg5hWPBhodBcYRZydxvmJxH8RJKqYdAa1iGfV
   dTuUbUwNyWiZAwN+Qj28ix/xL+yYXsLeQgtNpvPdTphRY3+QEJ42taCxI
   r7A+37BWNbtgsevdxFjtv5tOnd2BsrI1CqitW6avLSRyZ9uwqhhqXrFiw
   Q==;
X-CSE-ConnectionGUID: FS5iJFakRoeYdYT1DI5BjA==
X-CSE-MsgGUID: PfxjYP15Tm29GmrJWEo40A==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2779946"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2779946"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 22:19:13 -0800
X-CSE-ConnectionGUID: f4exIxHnQQ2lp12beg0EPg==
X-CSE-MsgGUID: 38M9y+PyQvqsqXa8cqYT4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7738434"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Nov 2026 22:19:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPwF9-00000000sGZ-0Dno;
	Sun, 08 Nov 2026 06:19:07 +0000
Date: Sun, 8 Nov 2026 14:18:39 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Tim Michals <tcmichals@gmail.com>
Subject: Re: [PATCH v3 7/7] remoteproc: sunxi: Add KUnit tests
Message-ID: <202611081401.aakRznh0-lkp@intel.com>
References: <20261101185735.762559-8-tcmichals@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-8-tcmichals@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_221916_367257_344E547F 
X-CRM114-Status: GOOD (  12.34  )
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261108/202611081401.aakRznh0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081401.aakRznh0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081401.aakRznh0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/remoteproc/sunxi_rproc_kunit.c:962:58: error: no member named 'usage_count' in 'struct dev_pm_info'
     962 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
         |                                            ~~~~~~~~~~~~~~~~~~~~ ^
   include/kunit/test.h:1034:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1039:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1039 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:874:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     874 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:840:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
>> drivers/remoteproc/sunxi_rproc_kunit.c:962:58: error: no member named 'usage_count' in 'struct dev_pm_info'
     962 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 0);
         |                                            ~~~~~~~~~~~~~~~~~~~~ ^
   include/kunit/test.h:1034:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1039:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1039 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:874:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     874 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:840:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:977:58: error: no member named 'usage_count' in 'struct dev_pm_info'
     977 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 1);
         |                                            ~~~~~~~~~~~~~~~~~~~~ ^
   include/kunit/test.h:1034:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1039:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1039 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:874:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     874 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:840:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:977:58: error: no member named 'usage_count' in 'struct dev_pm_info'
     977 |         KUNIT_EXPECT_EQ(test, atomic_read(&ctx->priv.dev->power.usage_count), 1);
         |                                            ~~~~~~~~~~~~~~~~~~~~ ^
   include/kunit/test.h:1034:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1039:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1039 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:874:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     874 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:840:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:1107:48: error: no member named 'usage_count' in 'struct dev_pm_info'
    1107 |         KUNIT_EXPECT_EQ(test, atomic_read(&dev->power.usage_count), 0);
         |                                            ~~~~~~~~~~ ^
   include/kunit/test.h:1034:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1039:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1039 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:874:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     874 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:840:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   drivers/remoteproc/sunxi_rproc_kunit.c:1107:48: error: no member named 'usage_count' in 'struct dev_pm_info'
    1107 |         KUNIT_EXPECT_EQ(test, atomic_read(&dev->power.usage_count), 0);
         |                                            ~~~~~~~~~~ ^
   include/kunit/test.h:1034:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1034 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1039:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1039 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:874:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     874 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:840:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   6 errors generated.


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

