Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5B9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 06:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x+/lXBUC;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PMfGhx9P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zZZ65C25dIxquJUBLPI4RDq7KPvi9Hyx2wMPl6Yc1wU=; b=x+/lXBUCRUz0rZYxIPBgM+0i2F
	rmL+LcE1ZWvSTFkstsZtmfsQ7QHQLlpxdw70dbKSoZB4BTXA1jVfBdnwpjhHvWm6YExKE/QzqELET
	/8q0lTcCa6559aRKL1lVNuI3XIQJwXKmKAOfZpByBE4syWxCpPmr1ItipQ11pI3qEYWB7/N2uvT/l
	APj9mKz0zHEogtQsxghQWpAvXV7aB2k5O4bSl1RkxEE3bv1sSen8e4SOvHeBQBEPu+clcN+ufUKOr
	40M3jxw8/qaJp8eRLSMZlv1kE24UnaNO4z3LhPYc4T5iiklHDeLwOecOmXyTEvnubuahHeRIFZfFr
	/iMrkI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNE7-00000002MKp-2mQu;
	Mon, 23 Nov 2026 06:08:31 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNE4-00000002MKW-1Siu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 06:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795414109; x=1826950109;
  h=date:from:to:cc:subject:message-id;
  bh=CjluWOau2Rg0ByoOPBMm/oBLvfvFdPg0MOXXHNSKo70=;
  b=PMfGhx9PcPv5tn1RtaA8D9f8HHJdO+YvCHA434U5j/T1CXmgPSSzPZ0J
   pKgq9H3DgK125UBWezAy91X6KIsJugfDJ28GUoWTNXzj3xUvnwThxpatP
   SgQoVga+iLOi/cAcq9JtVi3nRDiwqEx3zGpGylsevHijkAJ8feVRPi8x6
   KNRNwd/ivoS6f16HaMQVJC+iVv0EBtVPaGbeFvmYmMOk+hKIujsEl46nc
   eivcHR5a/VZjRSO8AZoIHjtxiDjpVfKcaIzm/R9gYTcAD6XhArpjpzb8v
   GIT5kIZFjGm3e3YK0IeKjQXUsV5+RBV4YQL43Ogcy913B8K4Gg0zpfQo1
   A==;
X-CSE-ConnectionGUID: AtQLZc0MRaWZAXXzTEoYgQ==
X-CSE-MsgGUID: j8nz0/PwSJ+qrWFPEAha6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4105484"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4105484"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 22:08:27 -0800
X-CSE-ConnectionGUID: vKrCFBB4SY2wEisLCSkX4w==
X-CSE-MsgGUID: MhUPqQKOSB6p96M4/rpMhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11780192"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2026 22:08:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVNDy-00000001MgE-31iu;
	Mon, 23 Nov 2026 06:08:22 +0000
Date: Mon, 23 Nov 2026 14:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:for-next] BUILD SUCCESS
 8d354fe6facff246e8a7e513a57f1ffb83a19d3b
Message-ID: <20261123140757.5L55hn8M-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_220828_502128_855BC87F 
X-CRM114-Status: UNSURE (   5.42  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git for-next
branch HEAD: 8d354fe6facff246e8a7e513a57f1ffb83a19d3b  Merge branch 'pr-soc-v7.5-ux500-powerdomains' into for-next

elapsed time: 768m

configs tested: 523
configs skipped: 266

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261122    gcc-8.5.0
alpha                 randconfig-2001-20261122    gcc-8.5.0
alpha                 randconfig-2200-20261122    gcc-8.5.0  smatch
alpha                randconfig-r2100-20261122    gcc-15.3.0 cocci
alpha                randconfig-r2102-20261122    gcc-15.3.0 cocci
alpha                randconfig-r2104-20261122    gcc-8.5.0  cocci
alpha                randconfig-r2106-20261122    clang-24   cocci
alpha                randconfig-r2109-20261122    gcc-9.5.0  cocci
alpha                randconfig-r2310-20261122    clang-17   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                          haps_hs_defconfig    gcc-16.2.0
arc                         nsim_700_defconfig    clang-24
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261123    clang-17
arc                   randconfig-1001-20261123    clang-17
arc                   randconfig-2000-20261122    gcc-9.5.0
arc                   randconfig-2001-20261122    gcc-9.5.0
arc                   randconfig-2002-20261122    gcc-9.5.0
arc                   randconfig-2003-20261122    gcc-9.5.0
arc                   randconfig-2004-20261122    gcc-9.5.0
arc                   randconfig-2005-20261122    gcc-9.5.0
arc                   randconfig-2200-20261122    gcc-9.5.0  smatch
arc                  randconfig-r2105-20261122    gcc-14.4.0 cocci
arc                  randconfig-r2106-20261122    clang-22   cocci
arc                  randconfig-r2107-20261122    gcc-9.5.0  cocci
arc                  randconfig-r2111-20261122    clang-22   cocci
arc                  randconfig-r2304-20261122    clang-24   sparse
arc                  randconfig-r2307-20261122    clang-17   sparse
arc                  randconfig-r2308-20261122    gcc-14.4.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                        aspeed_g4_defconfig    gcc-16.2.0
arm                          at91_dt_defconfig    gcc-16.2.0
arm                      davinci_all_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    clang-24
arm                        imx_v4_v5_defconfig    gcc-16.2.0
arm                       jornada720_defconfig    clang-24
arm                             mmp2_defconfig    clang-24
arm                        multi_v4t_defconfig    clang-24
arm                         mvebu_v5_defconfig    clang-24
arm                   randconfig-1000-20261123    clang-17
arm                   randconfig-1001-20261123    clang-17
arm                   randconfig-1002-20261123    clang-17
arm                   randconfig-1003-20261123    clang-17
arm                   randconfig-2000-20261122    gcc-15.3.0
arm                   randconfig-2001-20261122    gcc-15.3.0
arm                   randconfig-2002-20261122    gcc-15.3.0
arm                   randconfig-2200-20261122    clang-19   smatch
arm                  randconfig-r2100-20261122    gcc-14     cocci
arm                  randconfig-r2100-20261122    gcc-16.2.0 cocci
arm                  randconfig-r2105-20261122    gcc-15.3.0 cocci
arm                  randconfig-r2105-20261122    gcc-16.2.0 cocci
arm                  randconfig-r2303-20261122    clang-24   sparse
arm                  randconfig-r2311-20261122    gcc-15.3.0 sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                         spear3xx_defconfig    gcc-16.2.0
arm                            spitz_defconfig    gcc-16.2.0
arm                            stm32_defconfig    clang-24
arm                          wpcm450_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261123    clang-17
arm64                 randconfig-1001-20261123    clang-17
arm64                 randconfig-1002-20261123    clang-17
arm64                 randconfig-1003-20261123    clang-17
arm64                 randconfig-2000-20261122    gcc-15.3.0
arm64                 randconfig-2001-20261122    gcc-15.3.0
arm64                 randconfig-2002-20261122    gcc-15.3.0
arm64                 randconfig-2200-20261122    gcc-10.5.0 smatch
arm64                randconfig-r2100-20261122    gcc-16.2.0 cocci
arm64                randconfig-r2100-20261122    gcc-8.5.0  cocci
arm64                randconfig-r2102-20261122    gcc-8.5.0  cocci
arm64                randconfig-r2104-20261122    gcc-14.4.0 cocci
arm64                randconfig-r2302-20261122    clang-24   sparse
arm64                randconfig-r2303-20261122    clang-24   sparse
arm64                randconfig-r2303-20261122    gcc-13.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261123    clang-17
csky                  randconfig-1001-20261123    clang-17
csky                  randconfig-2000-20261122    gcc-9.5.0
csky                  randconfig-2000-20261123    gcc-12.5.0
csky                  randconfig-2001-20261122    gcc-9.5.0
csky                  randconfig-2001-20261123    gcc-12.5.0
csky                  randconfig-2200-20261122    gcc-9.5.0  smatch
csky                 randconfig-r2101-20261122    gcc-8.5.0  cocci
csky                 randconfig-r2107-20261122    gcc-11.5.0 cocci
csky                 randconfig-r2306-20261122    clang-17   sparse
csky                 randconfig-r2307-20261122    gcc-11.5.0 sparse
csky                 randconfig-r2309-20261122    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261123    gcc-8.5.0
hexagon               randconfig-1001-20261123    gcc-8.5.0
hexagon               randconfig-2000-20261122    gcc-9.5.0
hexagon               randconfig-2000-20261123    gcc-12.5.0
hexagon               randconfig-2001-20261122    gcc-9.5.0
hexagon               randconfig-2001-20261123    gcc-12.5.0
hexagon               randconfig-2200-20261122    clang-24   smatch
hexagon              randconfig-r2100-20261122    gcc-16.2.0 cocci
hexagon              randconfig-r2102-20261122    gcc-14.4.0 cocci
hexagon              randconfig-r2102-20261122    gcc-16.2.0 cocci
hexagon              randconfig-r2103-20261122    gcc-8.5.0  cocci
hexagon              randconfig-r2106-20261122    gcc-10.5.0 cocci
hexagon              randconfig-r2111-20261122    clang-24   cocci
hexagon              randconfig-r2300-20261122    clang-17   sparse
hexagon              randconfig-r2300-20261122    clang-24   sparse
hexagon              randconfig-r2302-20261122    clang-17   sparse
hexagon              randconfig-r2302-20261122    gcc-13.5.0 sparse
hexagon              randconfig-r2305-20261122    clang-24   sparse
hexagon              randconfig-r2305-20261122    gcc-13.5.0 sparse
hexagon              randconfig-r2311-20261122    gcc-12.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261123    clang-22
i386                  randconfig-1001-20261123    clang-22
i386                  randconfig-1002-20261123    clang-22
i386                  randconfig-1003-20261123    clang-22
i386                  randconfig-1004-20261123    clang-22
i386                  randconfig-1005-20261123    clang-22
i386                  randconfig-1006-20261123    clang-22
i386                  randconfig-1007-20261123    clang-22
i386                  randconfig-1008-20261123    clang-22
i386                  randconfig-1009-20261123    clang-22
i386                  randconfig-1010-20261123    clang-22
i386                  randconfig-1011-20261123    clang-22
i386                  randconfig-1012-20261123    clang-22
i386                  randconfig-1013-20261123    clang-22
i386                  randconfig-2000-20261122    clang-22
i386                  randconfig-2001-20261122    clang-22
i386                  randconfig-2002-20261122    clang-22
i386                  randconfig-2003-20261122    clang-22
i386                  randconfig-2004-20261122    clang-22
i386                  randconfig-2005-20261122    clang-22
i386                  randconfig-2100-20261122    clang-22   cocci
i386                  randconfig-2101-20261122    clang-22   cocci
i386                  randconfig-2102-20261122    clang-22   cocci
i386                  randconfig-2103-20261122    clang-22   cocci
i386                  randconfig-2104-20261122    clang-22   cocci
i386                  randconfig-2105-20261122    clang-22   cocci
i386                  randconfig-2200-20261122    gcc-14     smatch
i386                  randconfig-2300-20261122    clang-22   sparse
i386                  randconfig-2301-20261122    clang-22   sparse
i386                  randconfig-2302-20261122    clang-22   sparse
i386                 randconfig-r2100-20261122    gcc-8.5.0  cocci
i386                 randconfig-r2101-20261122    gcc-16.2.0 cocci
i386                 randconfig-r2105-20261122    gcc-16.2.0 cocci
i386                 randconfig-r2109-20261122    clang-22   cocci
i386                 randconfig-r2302-20261122    clang-24   sparse
i386                 randconfig-r2306-20261122    gcc-14.4.0 sparse
i386                 randconfig-r2308-20261122    gcc-15.3.0 sparse
i386                 randconfig-r2310-20261122    gcc-12.5.0 sparse
i386                 randconfig-r2310-20261122    gcc-14.4.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261123    gcc-8.5.0
loongarch             randconfig-1001-20261123    gcc-8.5.0
loongarch             randconfig-2000-20261122    clang-24
loongarch             randconfig-2001-20261122    clang-24
loongarch             randconfig-2200-20261122    clang-24   smatch
loongarch            randconfig-r2109-20261122    gcc-16.2.0 cocci
loongarch            randconfig-r2111-20261122    gcc-8.5.0  cocci
loongarch            randconfig-r2300-20261122    gcc-13.5.0 sparse
loongarch            randconfig-r2301-20261122    clang-17   sparse
loongarch            randconfig-r2303-20261122    clang-24   sparse
loongarch            randconfig-r2309-20261122    gcc-14     sparse
loongarch            randconfig-r2310-20261122    gcc-14     sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           atari_defconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261122    gcc-8.5.0
m68k                  randconfig-2001-20261122    gcc-8.5.0
m68k                  randconfig-2200-20261122    gcc-12.5.0 smatch
m68k                 randconfig-r2104-20261122    gcc-14     cocci
m68k                 randconfig-r2107-20261122    gcc-8.5.0  cocci
m68k                 randconfig-r2108-20261122    gcc-11.5.0 cocci
m68k                 randconfig-r2110-20261122    gcc-8.5.0  cocci
m68k                 randconfig-r2111-20261122    gcc-16.2.0 cocci
m68k                 randconfig-r2304-20261122    gcc-13.5.0 sparse
m68k                 randconfig-r2305-20261122    clang-24   sparse
m68k                            sun3_defconfig    clang-24
m68k                            virt_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261122    gcc-8.5.0
microblaze            randconfig-2001-20261122    gcc-8.5.0
microblaze            randconfig-2200-20261122    gcc-8.5.0  smatch
microblaze           randconfig-r2101-20261122    gcc-14.4.0 cocci
microblaze           randconfig-r2101-20261122    gcc-8.5.0  cocci
microblaze           randconfig-r2102-20261122    gcc-14.4.0 cocci
microblaze           randconfig-r2104-20261122    gcc-16.2.0 cocci
microblaze           randconfig-r2104-20261122    gcc-8.5.0  cocci
microblaze           randconfig-r2301-20261122    gcc-13.5.0 sparse
microblaze           randconfig-r2308-20261122    gcc-16.2.0 sparse
microblaze           randconfig-r2309-20261122    gcc-15.3.0 sparse
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath25_defconfig    gcc-16.2.0
mips                           ath79_defconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    gcc-16.2.0
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    clang-24
mips                  randconfig-2000-20261122    gcc-15.3.0
mips                  randconfig-2001-20261122    gcc-15.3.0
mips                  randconfig-2002-20261122    gcc-15.3.0
mips                  randconfig-2200-20261122    gcc-11.5.0 smatch
mips                 randconfig-r2102-20261122    gcc-16.2.0 cocci
mips                 randconfig-r2102-20261122    gcc-8.5.0  cocci
mips                 randconfig-r2104-20261122    gcc-16.2.0 cocci
mips                 randconfig-r2107-20261122    clang-24   cocci
mips                 randconfig-r2110-20261122    clang-24   cocci
mips                 randconfig-r2303-20261122    clang-17   sparse
mips                 randconfig-r2306-20261122    gcc-14     sparse
mips                 randconfig-r2306-20261122    gcc-16.2.0 sparse
mips                 randconfig-r2310-20261122    clang-17   sparse
mips                 randconfig-r2311-20261122    gcc-16.2.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261123    gcc-8.5.0
nios2                 randconfig-1001-20261123    gcc-8.5.0
nios2                 randconfig-2000-20261122    clang-24
nios2                 randconfig-2001-20261122    clang-24
nios2                 randconfig-2200-20261122    gcc-11.5.0 smatch
nios2                randconfig-r2102-20261122    gcc-8.5.0  cocci
nios2                randconfig-r2103-20261122    gcc-8.5.0  cocci
nios2                randconfig-r2105-20261122    gcc-8.5.0  cocci
nios2                randconfig-r2108-20261122    gcc-16.2.0 cocci
nios2                randconfig-r2304-20261122    clang-24   sparse
nios2                randconfig-r2305-20261122    gcc-13.5.0 sparse
nios2                randconfig-r2307-20261122    gcc-14.4.0 sparse
nios2                randconfig-r2309-20261122    clang-17   sparse
nios2                randconfig-r2311-20261122    clang-17   sparse
nios2                randconfig-r2311-20261122    gcc-14.4.0 sparse
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc              randconfig-2000-20261122    gcc-15.3.0
openrisc              randconfig-2001-20261122    gcc-15.3.0
openrisc              randconfig-2002-20261122    gcc-15.3.0
openrisc              randconfig-2200-20261122    gcc-16.2.0 smatch
openrisc             randconfig-r2100-20261122    gcc-8.5.0  cocci
openrisc             randconfig-r2101-20261122    gcc-14.4.0 cocci
openrisc             randconfig-r2103-20261122    gcc-8.5.0  cocci
openrisc             randconfig-r2104-20261122    gcc-16.2.0 cocci
openrisc             randconfig-r2111-20261122    gcc-9.5.0  cocci
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                 generic-32bit_defconfig    gcc-16.2.0
parisc                randconfig-1000-20261123    clang-24
parisc                randconfig-1001-20261123    clang-24
parisc                randconfig-2000-20261122    clang-24
parisc                randconfig-2001-20261122    clang-24
parisc                randconfig-2200-20261122    gcc-8.5.0  smatch
parisc               randconfig-r2101-20261122    gcc-15.3.0 cocci
parisc               randconfig-r2103-20261122    gcc-14.4.0 cocci
parisc               randconfig-r2103-20261122    gcc-15.3.0 cocci
parisc               randconfig-r2104-20261122    gcc-15.3.0 cocci
parisc               randconfig-r2105-20261122    gcc-14.4.0 cocci
parisc               randconfig-r2108-20261122    gcc-8.5.0  cocci
parisc               randconfig-r2110-20261122    gcc-9.5.0  cocci
parisc               randconfig-r2304-20261122    clang-24   sparse
parisc               randconfig-r2305-20261122    clang-17   sparse
parisc               randconfig-r2306-20261122    gcc-11.5.0 sparse
parisc               randconfig-r2310-20261122    gcc-16.2.0 sparse
parisc               randconfig-r2311-20261122    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.2.0
powerpc                       bamboo_defconfig    gcc-16.2.0
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                    motionpro_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                     mvme5100_defconfig    clang-24
powerpc               randconfig-1000-20261123    clang-24
powerpc               randconfig-1001-20261123    clang-24
powerpc               randconfig-2000-20261122    clang-24
powerpc               randconfig-2001-20261122    clang-24
powerpc               randconfig-2002-20261122    clang-24
powerpc               randconfig-2200-20261122    gcc-16.2.0 smatch
powerpc              randconfig-r2108-20261122    gcc-10.5.0 cocci
powerpc              randconfig-r2300-20261122    gcc-15.3.0 sparse
powerpc              randconfig-r2304-20261122    clang-17   sparse
powerpc              randconfig-r2307-20261122    clang-17   sparse
powerpc              randconfig-r2309-20261122    clang-17   sparse
powerpc                     sam440ep_defconfig    clang-24
powerpc                      tqm8560_defconfig    gcc-16.2.0
powerpc64                         alldefconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261123    clang-24
powerpc64             randconfig-1001-20261123    clang-24
powerpc64             randconfig-2000-20261122    clang-24
powerpc64             randconfig-2001-20261122    clang-24
powerpc64             randconfig-2002-20261122    clang-24
powerpc64             randconfig-2200-20261122    clang-24   smatch
powerpc64             randconfig-2200-20261123    gcc-15.3.0 smatch
powerpc64            randconfig-r2100-20261122    gcc-14.4.0 cocci
powerpc64            randconfig-r2101-20261122    gcc-8.5.0  cocci
powerpc64            randconfig-r2102-20261122    gcc-14.4.0 cocci
powerpc64            randconfig-r2103-20261122    gcc-16.2.0 cocci
powerpc64            randconfig-r2300-20261122    gcc-13.5.0 sparse
powerpc64            randconfig-r2301-20261122    clang-24   sparse
powerpc64            randconfig-r2303-20261122    gcc-13.5.0 sparse
powerpc64            randconfig-r2305-20261122    clang-24   sparse
powerpc64            randconfig-r2306-20261122    clang-17   sparse
powerpc64            randconfig-r2308-20261122    clang-17   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                 randconfig-1000-20261123    clang-17
riscv                 randconfig-1001-20261123    clang-17
riscv                 randconfig-2000-20261122    gcc-14.4.0
riscv                 randconfig-2001-20261122    gcc-14.4.0
riscv                 randconfig-2002-20261122    gcc-14.4.0
riscv                 randconfig-2003-20261122    gcc-14.4.0
riscv                 randconfig-2004-20261122    gcc-14.4.0
riscv                 randconfig-2005-20261122    gcc-14.4.0
riscv                 randconfig-2200-20261122    gcc-8.5.0  smatch
riscv                randconfig-r2106-20261122    gcc-11.5.0 cocci
riscv                randconfig-r2106-20261122    gcc-8.5.0  cocci
riscv                randconfig-r2108-20261122    clang-22   cocci
riscv                randconfig-r2307-20261122    gcc-15.3.0 sparse
riscv                randconfig-r2307-20261122    gcc-16.2.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                  randconfig-1000-20261123    clang-17
s390                  randconfig-1001-20261123    clang-17
s390                  randconfig-2000-20261122    clang-17
s390                  randconfig-2001-20261122    clang-17
s390                  randconfig-2002-20261122    clang-17
s390                  randconfig-2003-20261122    clang-17
s390                  randconfig-2004-20261122    clang-17
s390                  randconfig-2005-20261122    clang-17
s390                  randconfig-2200-20261122    gcc-8.5.0  smatch
s390                 randconfig-r2105-20261122    gcc-14.4.0 cocci
s390                 randconfig-r2106-20261122    gcc-9.5.0  cocci
s390                 randconfig-r2110-20261122    clang-22   cocci
s390                 randconfig-r2302-20261122    clang-24   sparse
s390                 randconfig-r2308-20261122    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                      magicpanelr2_defconfig    gcc-16.2.0
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261123    clang-17
sh                    randconfig-1001-20261123    clang-17
sh                    randconfig-2000-20261122    gcc-13.5.0
sh                    randconfig-2001-20261122    gcc-13.5.0
sh                    randconfig-2002-20261122    gcc-13.5.0
sh                    randconfig-2003-20261122    gcc-13.5.0
sh                    randconfig-2004-20261122    gcc-13.5.0
sh                    randconfig-2005-20261122    gcc-13.5.0
sh                    randconfig-2200-20261122    gcc-13.5.0 smatch
sh                   randconfig-r2101-20261122    gcc-16.2.0 cocci
sh                   randconfig-r2102-20261122    gcc-16.2.0 cocci
sh                   randconfig-r2103-20261122    gcc-16.2.0 cocci
sh                   randconfig-r2104-20261122    gcc-14.4.0 cocci
sh                   randconfig-r2106-20261122    gcc-16.2.0 cocci
sh                   randconfig-r2109-20261122    gcc-8.5.0  cocci
sh                   randconfig-r2110-20261122    gcc-10.5.0 cocci
sh                   randconfig-r2300-20261122    clang-24   sparse
sh                   randconfig-r2301-20261122    clang-24   sparse
sh                   randconfig-r2301-20261122    gcc-15.3.0 sparse
sh                   randconfig-r2302-20261122    gcc-13.5.0 sparse
sh                   randconfig-r2303-20261122    gcc-15.3.0 sparse
sh                   randconfig-r2304-20261122    gcc-15.3.0 sparse
sh                   randconfig-r2305-20261122    gcc-15.3.0 sparse
sh                   randconfig-r2309-20261122    gcc-11.5.0 sparse
sh                           rsk7269_defconfig    clang-24
sh                            se7705_defconfig    gcc-16.2.0
sh                              sh03_defconfig    gcc-16.2.0
sh                            sh2007_defconfig    gcc-16.2.0
sh                    sh7724_generic_defconfig    gcc-16.2.0
sh                    sh7770_generic_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                 randconfig-1000-20261123    gcc-14
sparc                 randconfig-1001-20261123    gcc-14
sparc                 randconfig-2000-20261122    clang-21
sparc                 randconfig-2001-20261122    clang-21
sparc                 randconfig-2200-20261122    gcc-16.2.0 smatch
sparc                 randconfig-2200-20261123    gcc-12.5.0 smatch
sparc                randconfig-r2102-20261122    gcc-14     cocci
sparc                randconfig-r2103-20261122    gcc-14.4.0 cocci
sparc                randconfig-r2103-20261122    gcc-16.2.0 cocci
sparc                randconfig-r2105-20261122    gcc-16.2.0 cocci
sparc                randconfig-r2107-20261122    gcc-16.2.0 cocci
sparc                randconfig-r2108-20261122    clang-24   cocci
sparc                randconfig-r2110-20261122    gcc-11.5.0 cocci
sparc                randconfig-r2111-20261122    gcc-10.5.0 cocci
sparc                randconfig-r2301-20261122    clang-24   sparse
sparc                randconfig-r2306-20261122    gcc-12.5.0 sparse
sparc                randconfig-r2306-20261122    gcc-15.3.0 sparse
sparc                randconfig-r2307-20261122    gcc-14     sparse
sparc                randconfig-r2308-20261122    gcc-12.5.0 sparse
sparc                randconfig-r2310-20261122    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261123    gcc-14
sparc64               randconfig-1001-20261123    gcc-14
sparc64               randconfig-2000-20261122    clang-21
sparc64               randconfig-2001-20261122    clang-21
sparc64               randconfig-2200-20261122    clang-20   smatch
sparc64              randconfig-r2101-20261122    gcc-14     cocci
sparc64              randconfig-r2103-20261122    gcc-14     cocci
sparc64              randconfig-r2105-20261122    gcc-8.5.0  cocci
sparc64              randconfig-r2107-20261122    clang-22   cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261123    gcc-14
um                    randconfig-1001-20261123    gcc-14
um                    randconfig-2000-20261122    clang-21
um                    randconfig-2001-20261122    clang-21
um                    randconfig-2200-20261122    gcc-14     smatch
um                   randconfig-r2101-20261122    gcc-14.4.0 cocci
um                   randconfig-r2104-20261122    gcc-14.4.0 cocci
um                   randconfig-r2109-20261122    clang-24   cocci
um                   randconfig-r2111-20261122    gcc-11.5.0 cocci
um                   randconfig-r2301-20261122    gcc-13.5.0 sparse
um                   randconfig-r2311-20261122    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261123    clang-22
x86_64      buildonly-randconfig-1001-20261123    clang-22
x86_64      buildonly-randconfig-1002-20261123    clang-22
x86_64      buildonly-randconfig-1003-20261123    clang-22
x86_64      buildonly-randconfig-1004-20261123    clang-22
x86_64      buildonly-randconfig-1005-20261123    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261123    gcc-14
x86_64                randconfig-1001-20261123    gcc-14
x86_64                randconfig-1002-20261123    gcc-14
x86_64                randconfig-1003-20261123    gcc-14
x86_64                randconfig-1004-20261123    gcc-14
x86_64                randconfig-1005-20261123    gcc-14
x86_64                randconfig-1012-20261123    gcc-14
x86_64                randconfig-1013-20261123    gcc-14
x86_64                randconfig-1014-20261123    gcc-14
x86_64                randconfig-1015-20261123    gcc-14
x86_64                randconfig-1016-20261123    gcc-14
x86_64                randconfig-1017-20261123    gcc-14
x86_64                randconfig-2000-20261122    clang-22
x86_64                randconfig-2001-20261122    clang-22
x86_64                randconfig-2002-20261122    clang-22
x86_64                randconfig-2003-20261122    clang-22
x86_64                randconfig-2004-20261122    clang-22
x86_64                randconfig-2005-20261122    clang-22
x86_64                randconfig-2100-20261122    gcc-14     cocci
x86_64                randconfig-2101-20261122    gcc-14     cocci
x86_64                randconfig-2102-20261122    gcc-14     cocci
x86_64                randconfig-2103-20261122    gcc-14     cocci
x86_64                randconfig-2104-20261122    gcc-14     cocci
x86_64                randconfig-2105-20261122    gcc-14     cocci
x86_64                randconfig-2200-20261122    clang-22   smatch
x86_64                randconfig-2300-20261122    clang-22   sparse
x86_64                randconfig-2301-20261122    clang-22   sparse
x86_64                randconfig-2302-20261122    clang-22   sparse
x86_64               randconfig-r2105-20261122    gcc-14     cocci
x86_64               randconfig-r2109-20261122    gcc-10.5.0 cocci
x86_64               randconfig-r2109-20261122    gcc-11.5.0 cocci
x86_64               randconfig-r2302-20261122    gcc-15.3.0 sparse
x86_64               randconfig-r2309-20261122    gcc-12.5.0 sparse
x86_64               randconfig-r2310-20261122    gcc-15.3.0 sparse
x86_64               randconfig-r2311-20261122    clang-17   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                        common_defconfig    clang-24
xtensa                randconfig-1000-20261123    gcc-14
xtensa                randconfig-1001-20261123    gcc-14
xtensa                randconfig-2000-20261122    gcc-9.5.0
xtensa                randconfig-2000-20261123    gcc-12.5.0
xtensa                randconfig-2001-20261122    gcc-9.5.0
xtensa                randconfig-2001-20261123    gcc-12.5.0
xtensa                randconfig-2200-20261122    gcc-11.5.0 smatch
xtensa               randconfig-r2107-20261122    gcc-10.5.0 cocci
xtensa               randconfig-r2108-20261122    gcc-9.5.0  cocci
xtensa               randconfig-r2110-20261122    gcc-16.2.0 cocci
xtensa               randconfig-r2300-20261122    clang-24   sparse
xtensa               randconfig-r2307-20261122    gcc-12.5.0 sparse
xtensa               randconfig-r2308-20261122    gcc-14     sparse
xtensa               randconfig-r2309-20261122    gcc-14.4.0 sparse
xtensa                     smp_lx200_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

