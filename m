Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B40606A693
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 23:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qtYWlxw2;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QVVM3Q2E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=021OSiQjF4XLDoBkszo5Qhb4yjdSbq+kjEQ1vIAZUFg=; b=qtYWlxw2t+C7S2i3vFbvLEISqx
	M3h5zMk2sjRcP4ERPHPYBik3DxuBpEs+XLlGouBdO3zEHId0jc6AG3ZSczXwU0UfjjlnHJ0/deQam
	+MbhYlOcKCc6wPdET85Wz+igdR2DsUJyXUtYCOKUXfatt48zkPlAeW7IQ0IykiC1x0fSbMLWWXHcD
	Ns0NaYbt4LIDDH/WOG+COSxHXPz61vwgQpCuiPH0tPkr9YWxEWM0r4QA99OZjAEGLVUnCpKO+PbaC
	gYp5i/axPW3m3L7VMfL90oZpEAFhhs5MMtqqSB9vL25UddsN603NQKtbdTAUf2TPL4e7TlAfGaX7R
	HDjX7ZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX4xh-00000000Axb-0b6Z;
	Fri, 27 Nov 2026 23:02:37 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX4xK-00000000Ar2-36gZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 23:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795820535; x=1827356535;
  h=date:from:to:cc:subject:message-id;
  bh=WGUlCvg0JQLObjlctN1emUQVfr3aJ1qyV8NGRiBLURw=;
  b=QVVM3Q2ETltAqZbH2NS5n4SaJqaJ+bP5dn0RizECSm4KLn77KQMcuDoB
   M+3jiqNDJNxoHrQalK5Js6rxRQZNUF4dw6sCE75gtThsaOWaQSQk+g7Ij
   nHev9+3HQy7oV+3aas7ujbLtRHmsybrVrJwK6u5xpK5+GXY3Yp98zXM3i
   lf+FOUtD2TusswCP7bEv/Ixw8+7/9tCz72Dnvdc10Lg/rDm22AGhSkW1M
   DsFj6tDLXTMaYEWWTJfEupSbTI/QhzLEiAFmDwDRbYXt1MU5TUgSkcSoN
   /9blvKnC2j8jxMsxWIUtyT07sjOIr1QvMlYCHyIg5rugz/AlVunK91K1G
   Q==;
X-CSE-ConnectionGUID: IAEZrnHWRGyxQL24mOGA4A==
X-CSE-MsgGUID: hn236vLiRLeXCcr3tpZiow==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4795054"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4795054"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 15:01:54 -0800
X-CSE-ConnectionGUID: +VZ02whkSqSBMhRPSYL8/Q==
X-CSE-MsgGUID: BoFhlnFiTEebmZIaku3CKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12799979"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2026 15:01:53 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX4ww-000000000Nm-1UNw;
	Fri, 27 Nov 2026 23:01:50 +0000
Date: Sat, 28 Nov 2026 00:01:15 +0100
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>
Subject: [arm64:for-next/perf 1/2]
 include/clocksource/arm_arch_timer.h:113:13: warning:
 'read_sched_clock_is_arch_counter' defined but not used
Message-ID: <20261127235920.1xBAAn8s-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_150223_567140_2E621FD8 
X-CRM114-Status: UNSURE (   8.43  )
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
X-Archived-By: <archiver.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/perf
head:   caee2c799f896b49f5247db3b2c4bf3926b0738a
commit: 71c11e8be95d2e890b656c9de42459ecd234205c [1/2] clocksource/drivers/arm_arch_timer: Add read_sched_clock_is_arch_counter() predicate
config: parisc-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127235920.1xBAAn8s-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127235920.1xBAAn8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127235920.1xBAAn8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/qcom/rpmh-rsc.c:30:
>> include/clocksource/arm_arch_timer.h:113:13: warning: 'read_sched_clock_is_arch_counter' defined but not used [-Wunused-function]
     113 | static bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/read_sched_clock_is_arch_counter +113 include/clocksource/arm_arch_timer.h

   112	
 > 113	static bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
   114	{
   115		return false;
   116	}
   117	#endif
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

