Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tu2dkxAc;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqwXJyIL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=x5kqnAhRllxOMajkWztCwFVisqPl3ObXb7Cpr5W0XSo=; b=tu2dkxAcdckYSvOatGadz9yN8J
	PVs456mkzOOm0Q7mayxIWHaKnjPfXqq7fyk591MVw8rlckVJckb7boTy8PovOrT3l83QezlBXng4+
	LzcTnEji6UUhI18Q15Ea3W6ZTh5QO9Josjt1PxhtiHeY8rvePW5yZNZxQdrD8KRw/SuAjGehmSU+6
	lmjrBz7S4g3tA4VvZqmIAScsG8rTUV68D+b5y1MGb4gl/OmZve4SBTNWn6z7DRrPgtbbrNnAs+jHc
	n1Hm3tbmeON0eB9tGGfe0u6Y4RO+nC+ZQs/+U0eZnRV382q760MFVTDQC9R5uB2qT4mHMamM/MIzI
	ie4RgIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOi1-00000000is2-1xfj;
	Mon, 09 Nov 2026 12:42:49 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOhz-00000000ire-1Ets
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794228167; x=1825764167;
  h=date:from:to:cc:subject:message-id;
  bh=QGCqdvebJLHQDcwr+FpaiW4AEOidpXWztJsGNwlsUJE=;
  b=cqwXJyIL8smHyXq4FbKhoshY+U4+++rTWFbPRmbOPUy1SfK27buDUWQC
   DRuDcbpJ+XOVWZeEySuCC76zkjwkJYv4ImlrrEMp51lLQIHtcHxM8GBLg
   YQITeklM8YGMk9joAJSaHQ9+tAwCsLXuw0O1PtepWS3LLz5A3O0dEEUmN
   upLrZVULpwxjGCxx0+15Y1GWqAIrmkbhtUslz//XR0B5R0VQJIXiTGaQg
   Ikq9FuPQJNG+qVhVuNlhZgl613K/3Fvdc0ThTISbaQuJozUXEH4S6/417
   sLeSAmw4C+SNniiVUyDDeeCCD9YdDPn5KeEpxM3eCw3I8/BALN7k1yU5t
   Q==;
X-CSE-ConnectionGUID: nfPGPr3RSVCiKe2uxg5mcw==
X-CSE-MsgGUID: FJ+v82pSQ8CliTZ/TCOwjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2974802"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2974802"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:42:46 -0800
X-CSE-ConnectionGUID: Irrh1QU4SrWVRBaLV2OxFg==
X-CSE-MsgGUID: PzWOXzbHRM+1THExUop2HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7995698"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2026 04:42:45 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQOhu-00000000uUx-3L5O;
	Mon, 09 Nov 2026 12:42:42 +0000
Date: Mon, 09 Nov 2026 20:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:gp2ap030] BUILD SUCCESS
 44adff6ff90e8e21ef35fec12a595798312fd1ad
Message-ID: <20261109204238.cWcoM8VQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_044247_393672_3B33040E 
X-CRM114-Status: UNSURE (   5.89  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/gp2ap030
branch HEAD: 44adff6ff90e8e21ef35fec12a595798312fd1ad  iio: light: gp2ap020a00f: Add GP2AP030A00F support

elapsed time: 899m

configs tested: 442
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261109    gcc-11.5.0
alpha                 randconfig-2001-20261109    gcc-9.5.0
alpha                 randconfig-2200-20261109    gcc-13.5.0 smatch
alpha                randconfig-r2102-20261109    gcc-10.5.0 cocci
alpha                randconfig-r2103-20261109    gcc-10.5.0 cocci
alpha                randconfig-r2106-20261109    gcc-8.5.0  cocci
alpha                randconfig-r2301-20261109    clang-18   sparse
alpha                randconfig-r2304-20261109    clang-18   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261109    clang-24
arc                   randconfig-1001-20261109    clang-24
arc                   randconfig-2000-20261109    gcc-8.5.0
arc                   randconfig-2001-20261109    gcc-13.5.0
arc                   randconfig-2001-20261109    gcc-8.5.0
arc                   randconfig-2002-20261109    gcc-15.3.0
arc                   randconfig-2002-20261109    gcc-8.5.0
arc                   randconfig-2003-20261109    gcc-8.5.0
arc                   randconfig-2004-20261109    gcc-15.3.0
arc                   randconfig-2004-20261109    gcc-8.5.0
arc                   randconfig-2005-20261109    gcc-8.5.0
arc                   randconfig-2005-20261109    gcc-9.5.0
arc                   randconfig-2200-20261109    gcc-13.5.0 smatch
arc                  randconfig-r2107-20261109    clang-22   cocci
arc                  randconfig-r2108-20261109    gcc-12.5.0 cocci
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                        aspeed_g5_defconfig    clang-24
arm                          bcm2835_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                        imx_v4_v5_defconfig    gcc-16.2.0
arm                             mps2_defconfig    clang-24
arm                         multi_v7_defconfig    gcc-16.2.0
arm                          orion5x_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261109    clang-24
arm                   randconfig-1001-20261109    clang-24
arm                   randconfig-1002-20261109    clang-24
arm                   randconfig-1003-20261109    clang-24
arm                   randconfig-2000-20261109    gcc-10.5.0
arm                   randconfig-2001-20261109    gcc-10.5.0
arm                   randconfig-2001-20261109    gcc-8.5.0
arm                   randconfig-2002-20261109    clang-24
arm                   randconfig-2002-20261109    gcc-10.5.0
arm                   randconfig-2200-20261109    clang-20   smatch
arm                  randconfig-r2101-20261109    clang-24   cocci
arm                  randconfig-r2108-20261109    clang-22   cocci
arm                  randconfig-r2305-20261109    clang-18   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261109    gcc-13.5.0
arm64                 randconfig-1001-20261109    gcc-13.5.0
arm64                 randconfig-1002-20261109    gcc-13.5.0
arm64                 randconfig-1003-20261109    gcc-13.5.0
arm64                 randconfig-2000-20261109    clang-21
arm64                 randconfig-2000-20261109    gcc-10.5.0
arm64                 randconfig-2001-20261109    gcc-10.5.0
arm64                 randconfig-2002-20261109    clang-24
arm64                 randconfig-2002-20261109    gcc-10.5.0
arm64                 randconfig-2200-20261109    gcc-10.5.0 smatch
arm64                randconfig-r2109-20261109    clang-22   cocci
arm64                randconfig-r2109-20261109    gcc-8.5.0  cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261109    gcc-13.5.0
csky                  randconfig-1001-20261109    gcc-13.5.0
csky                  randconfig-2000-20261109    clang-17
csky                  randconfig-2000-20261109    gcc-11.5.0
csky                  randconfig-2001-20261109    clang-17
csky                  randconfig-2001-20261109    gcc-16.2.0
csky                  randconfig-2200-20261108    gcc-16.2.0 smatch
csky                  randconfig-2200-20261109    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261109    gcc-8.5.0  cocci
csky                 randconfig-r2108-20261109    clang-22   cocci
csky                 randconfig-r2109-20261109    clang-22   cocci
csky                 randconfig-r2303-20261108    gcc-15.3.0 sparse
csky                 randconfig-r2303-20261109    clang-18   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261109    clang-19
hexagon               randconfig-1001-20261109    clang-19
hexagon               randconfig-2000-20261109    clang-17
hexagon               randconfig-2001-20261109    clang-17
hexagon               randconfig-2200-20261109    clang-17   smatch
hexagon              randconfig-r2105-20261109    gcc-8.5.0  cocci
hexagon              randconfig-r2306-20261109    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261109    clang-22
i386        buildonly-randconfig-1001-20261109    clang-22
i386        buildonly-randconfig-1002-20261109    clang-22
i386        buildonly-randconfig-1003-20261109    clang-22
i386        buildonly-randconfig-1004-20261109    clang-22
i386        buildonly-randconfig-1005-20261109    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1007-20261109    gcc-12
i386                  randconfig-1008-20261109    gcc-12
i386                  randconfig-1009-20261109    gcc-12
i386                  randconfig-1010-20261109    gcc-12
i386                  randconfig-1011-20261109    gcc-12
i386                  randconfig-1012-20261109    gcc-12
i386                  randconfig-1013-20261109    gcc-12
i386                  randconfig-2000-20261109    clang-22
i386                  randconfig-2001-20261109    clang-22
i386                  randconfig-2002-20261109    clang-22
i386                  randconfig-2002-20261109    gcc-14
i386                  randconfig-2003-20261109    clang-22
i386                  randconfig-2004-20261109    clang-22
i386                  randconfig-2004-20261109    gcc-14
i386                  randconfig-2005-20261109    clang-22
i386                  randconfig-2105-20261109    gcc-14     cocci
i386                  randconfig-2200-20261109    clang-22   smatch
i386                  randconfig-2300-20261109    clang-22   sparse
i386                  randconfig-2301-20261109    gcc-14     sparse
i386                  randconfig-2302-20261109    gcc-14     sparse
i386                 randconfig-r2100-20261109    gcc-14     cocci
i386                 randconfig-r2102-20261109    gcc-8.5.0  cocci
i386                 randconfig-r2300-20261108    clang-22   sparse
i386                 randconfig-r2300-20261109    clang-18   sparse
i386                 randconfig-r2301-20261108    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261109    clang-19
loongarch             randconfig-1001-20261109    clang-19
loongarch             randconfig-2000-20261109    clang-18
loongarch             randconfig-2001-20261109    clang-18
loongarch             randconfig-2200-20261108    gcc-15.3.0 smatch
loongarch             randconfig-2200-20261109    gcc-16.2.0 smatch
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                        m5475evb_defconfig    gcc-16.2.0
m68k                          nettel_defconfig    clang-24
m68k                          nettel_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261109    gcc-14.4.0
m68k                  randconfig-2001-20261109    gcc-12.5.0
m68k                  randconfig-2200-20261109    gcc-12.5.0 smatch
m68k                 randconfig-r2102-20261109    gcc-15.3.0 cocci
m68k                 randconfig-r2103-20261109    gcc-8.5.0  cocci
m68k                 randconfig-r2105-20261109    gcc-8.5.0  cocci
m68k                 randconfig-r2308-20261109    gcc-9.5.0  sparse
m68k                 randconfig-r2310-20261109    gcc-14.4.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2001-20261109    gcc-13.5.0
microblaze            randconfig-2200-20261109    gcc-9.5.0  smatch
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath79_defconfig    clang-24
mips                       bmips_stb_defconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    gcc-16.2.0
mips                          db1xxx_defconfig    gcc-16.2.0
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                             gpr_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-16.2.0
mips                       loongson3_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261109    gcc-8.5.0
mips                  randconfig-2001-20261109    gcc-8.5.0
mips                  randconfig-2002-20261109    clang-24
mips                  randconfig-2002-20261109    gcc-8.5.0
mips                  randconfig-2200-20261109    gcc-11.5.0 smatch
mips                 randconfig-r2100-20261109    gcc-10.5.0 cocci
mips                 randconfig-r2101-20261109    gcc-10.5.0 cocci
mips                 randconfig-r2304-20261109    gcc-11.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261109    clang-19
nios2                 randconfig-1001-20261109    clang-19
nios2                 randconfig-2000-20261109    clang-18
nios2                 randconfig-2000-20261109    gcc-11.5.0
nios2                 randconfig-2001-20261109    clang-18
nios2                 randconfig-2001-20261109    gcc-8.5.0
nios2                 randconfig-2200-20261109    gcc-11.5.0 smatch
nios2                randconfig-r2104-20261109    gcc-8.5.0  cocci
nios2                randconfig-r2105-20261109    gcc-10.5.0 cocci
nios2                randconfig-r2110-20261109    gcc-11.5.0 cocci
nios2                randconfig-r2111-20261109    clang-22   cocci
nios2                randconfig-r2304-20261108    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                   or1klitex_defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261109    gcc-16.2.0
openrisc              randconfig-2000-20261109    gcc-8.5.0
openrisc              randconfig-2001-20261109    gcc-16.2.0
openrisc              randconfig-2001-20261109    gcc-8.5.0
openrisc              randconfig-2002-20261109    gcc-15.3.0
openrisc              randconfig-2002-20261109    gcc-8.5.0
openrisc              randconfig-2200-20261108    gcc-16.2.0 smatch
openrisc              randconfig-2200-20261109    gcc-13.5.0 smatch
openrisc             randconfig-r2309-20261109    gcc-9.5.0  sparse
openrisc                        virt_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261109    gcc-8.5.0
parisc                randconfig-1001-20261109    gcc-8.5.0
parisc                randconfig-2000-20261109    clang-18
parisc                randconfig-2000-20261109    gcc-9.5.0
parisc                randconfig-2001-20261109    clang-18
parisc                randconfig-2001-20261109    gcc-15.3.0
parisc                randconfig-2200-20261109    gcc-15.3.0 smatch
parisc               randconfig-r2305-20261109    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    clang-24
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                  mpc837x_rdb_defconfig    clang-24
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261109    gcc-8.5.0
powerpc               randconfig-1001-20261109    gcc-8.5.0
powerpc               randconfig-2000-20261109    clang-24
powerpc               randconfig-2001-20261109    clang-24
powerpc               randconfig-2001-20261109    gcc-12.5.0
powerpc               randconfig-2002-20261109    clang-17
powerpc               randconfig-2002-20261109    clang-24
powerpc               randconfig-2200-20261108    clang-24   smatch
powerpc               randconfig-2200-20261109    gcc-8.5.0  smatch
powerpc              randconfig-r2111-20261109    clang-24   cocci
powerpc                      redwood_defconfig    gcc-16.2.0
powerpc                      taishan_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261109    gcc-8.5.0
powerpc64             randconfig-1001-20261109    gcc-8.5.0
powerpc64             randconfig-2000-20261109    clang-17
powerpc64             randconfig-2000-20261109    clang-24
powerpc64             randconfig-2001-20261109    clang-24
powerpc64             randconfig-2001-20261109    gcc-8.5.0
powerpc64             randconfig-2002-20261109    clang-24
powerpc64             randconfig-2200-20261109    gcc-14.4.0 smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261109    gcc-8.5.0
riscv                 randconfig-1001-20261109    gcc-8.5.0
riscv                 randconfig-2000-20261109    gcc-14.4.0
riscv                 randconfig-2001-20261109    clang-24
riscv                 randconfig-2001-20261109    gcc-14.4.0
riscv                 randconfig-2002-20261109    clang-20
riscv                 randconfig-2002-20261109    gcc-14.4.0
riscv                 randconfig-2003-20261109    clang-24
riscv                 randconfig-2003-20261109    gcc-14.4.0
riscv                 randconfig-2004-20261109    gcc-14.4.0
riscv                 randconfig-2005-20261109    clang-24
riscv                 randconfig-2005-20261109    gcc-14.4.0
riscv                 randconfig-2200-20261109    gcc-8.5.0  smatch
riscv                randconfig-r2100-20261109    gcc-8.5.0  cocci
riscv                randconfig-r2106-20261109    clang-22   cocci
riscv                randconfig-r2111-20261109    clang-22   cocci
riscv                randconfig-r2300-20261109    gcc-11.5.0 sparse
riscv                randconfig-r2306-20261109    gcc-9.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261109    gcc-8.5.0
s390                  randconfig-1001-20261109    gcc-8.5.0
s390                  randconfig-2000-20261109    gcc-14.4.0
s390                  randconfig-2000-20261109    gcc-8.5.0
s390                  randconfig-2001-20261109    clang-17
s390                  randconfig-2001-20261109    gcc-8.5.0
s390                  randconfig-2002-20261109    clang-24
s390                  randconfig-2002-20261109    gcc-8.5.0
s390                  randconfig-2003-20261109    gcc-8.5.0
s390                  randconfig-2004-20261109    clang-17
s390                  randconfig-2004-20261109    gcc-8.5.0
s390                  randconfig-2005-20261109    gcc-16.2.0
s390                  randconfig-2005-20261109    gcc-8.5.0
s390                  randconfig-2200-20261109    clang-24   smatch
s390                 randconfig-r2311-20261109    gcc-9.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                           lboxre2_defconfig    gcc-16.2.0
sh                             migor_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261109    gcc-8.5.0
sh                    randconfig-1001-20261109    gcc-8.5.0
sh                    randconfig-2000-20261109    gcc-15.3.0
sh                    randconfig-2000-20261109    gcc-16.2.0
sh                    randconfig-2001-20261109    gcc-13.5.0
sh                    randconfig-2001-20261109    gcc-16.2.0
sh                    randconfig-2002-20261109    gcc-16.2.0
sh                    randconfig-2003-20261109    gcc-16.2.0
sh                    randconfig-2003-20261109    gcc-9.5.0
sh                    randconfig-2004-20261109    gcc-15.3.0
sh                    randconfig-2004-20261109    gcc-16.2.0
sh                    randconfig-2005-20261109    gcc-16.2.0
sh                    randconfig-2005-20261109    gcc-9.5.0
sh                    randconfig-2200-20261108    gcc-12.5.0 smatch
sh                    randconfig-2200-20261109    gcc-9.5.0  smatch
sh                   randconfig-r2308-20261109    gcc-13.5.0 sparse
sh                   randconfig-r2311-20261109    gcc-16.2.0 sparse
sh                       rts7751r2d1_defconfig    gcc-16.2.0
sh                           sdk7780_defconfig    clang-24
sh                           sdk7786_defconfig    gcc-16.2.0
sh                            se7751_defconfig    gcc-16.2.0
sh                              sh03_defconfig    gcc-16.2.0
sh                    sh7770_generic_defconfig    gcc-16.2.0
sparc                             alldefconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261109    gcc-8.5.0
sparc                 randconfig-1001-20261109    gcc-8.5.0
sparc                 randconfig-2000-20261109    gcc-14
sparc                 randconfig-2000-20261109    gcc-15.3.0
sparc                 randconfig-2001-20261109    gcc-14
sparc                 randconfig-2001-20261109    gcc-8.5.0
sparc                 randconfig-2200-20261109    gcc-16.2.0 smatch
sparc                randconfig-r2104-20261109    gcc-11.5.0 cocci
sparc                randconfig-r2106-20261109    clang-22   cocci
sparc                randconfig-r2107-20261109    clang-22   cocci
sparc                randconfig-r2303-20261109    gcc-11.5.0 sparse
sparc                randconfig-r2309-20261109    gcc-11.5.0 sparse
sparc                        sparc32_defconfig    gcc-16.2.0
sparc                        sparc64_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261109    gcc-8.5.0
sparc64               randconfig-1001-20261109    gcc-8.5.0
sparc64               randconfig-2000-20261109    gcc-14
sparc64               randconfig-2000-20261109    gcc-8.5.0
sparc64               randconfig-2001-20261109    gcc-12.5.0
sparc64               randconfig-2001-20261109    gcc-14
sparc64               randconfig-2200-20261109    clang-24   smatch
sparc64              randconfig-r2104-20261109    gcc-10.5.0 cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261109    gcc-8.5.0
um                    randconfig-1001-20261109    gcc-8.5.0
um                    randconfig-2000-20261109    gcc-14
um                    randconfig-2001-20261109    gcc-14
um                    randconfig-2200-20261109    clang-24   smatch
um                   randconfig-r2103-20261109    clang-22   cocci
um                   randconfig-r2110-20261109    clang-22   cocci
um                   randconfig-r2302-20261109    clang-18   sparse
um                   randconfig-r2302-20261109    gcc-11.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261109    clang-22
x86_64      buildonly-randconfig-1001-20261109    clang-22
x86_64      buildonly-randconfig-1002-20261109    clang-22
x86_64      buildonly-randconfig-1003-20261109    clang-22
x86_64      buildonly-randconfig-1004-20261109    clang-22
x86_64      buildonly-randconfig-1005-20261109    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261109    clang-22
x86_64                randconfig-1001-20261109    clang-22
x86_64                randconfig-1002-20261109    clang-22
x86_64                randconfig-1003-20261109    clang-22
x86_64                randconfig-1004-20261109    clang-22
x86_64                randconfig-1005-20261109    clang-22
x86_64                randconfig-1006-20261109    gcc-14
x86_64                randconfig-1007-20261109    gcc-14
x86_64                randconfig-1008-20261109    gcc-14
x86_64                randconfig-1009-20261109    gcc-14
x86_64                randconfig-1010-20261109    gcc-14
x86_64                randconfig-1011-20261109    gcc-14
x86_64                randconfig-1012-20261109    clang-22
x86_64                randconfig-1013-20261109    clang-22
x86_64                randconfig-1014-20261109    clang-22
x86_64                randconfig-1015-20261109    clang-22
x86_64                randconfig-1016-20261109    clang-22
x86_64                randconfig-1017-20261109    clang-22
x86_64                randconfig-2000-20261108    clang-22
x86_64                randconfig-2000-20261109    clang-22
x86_64                randconfig-2001-20261108    clang-22
x86_64                randconfig-2001-20261109    clang-22
x86_64                randconfig-2002-20261108    clang-22
x86_64                randconfig-2002-20261109    clang-22
x86_64                randconfig-2003-20261108    gcc-12
x86_64                randconfig-2003-20261109    clang-22
x86_64                randconfig-2004-20261108    gcc-14
x86_64                randconfig-2004-20261109    clang-22
x86_64                randconfig-2005-20261108    gcc-14
x86_64                randconfig-2005-20261109    clang-22
x86_64                randconfig-2100-20261109    clang-22   cocci
x86_64                randconfig-2101-20261109    clang-22   cocci
x86_64                randconfig-2102-20261109    gcc-14     cocci
x86_64                randconfig-2103-20261109    gcc-14     cocci
x86_64                randconfig-2104-20261109    clang-22   cocci
x86_64                randconfig-2105-20261109    clang-22   cocci
x86_64                randconfig-2200-20261109    clang-22   smatch
x86_64                randconfig-2300-20261109    gcc-14     sparse
x86_64                randconfig-2301-20261109    clang-22   sparse
x86_64                randconfig-2302-20261109    gcc-12     sparse
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
xtensa                   audio_kc705_defconfig    gcc-16.2.0
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261109    gcc-8.5.0
xtensa                randconfig-1001-20261109    gcc-8.5.0
xtensa                randconfig-2000-20261109    clang-17
xtensa                randconfig-2000-20261109    gcc-13.5.0
xtensa                randconfig-2001-20261109    clang-17
xtensa                randconfig-2001-20261109    gcc-8.5.0
xtensa                randconfig-2200-20261109    gcc-8.5.0  smatch
xtensa               randconfig-r2107-20261109    gcc-8.5.0  cocci
xtensa               randconfig-r2301-20261109    gcc-11.5.0 sparse
xtensa               randconfig-r2307-20261109    gcc-8.5.0  sparse
xtensa               randconfig-r2307-20261109    gcc-9.5.0  sparse
xtensa               randconfig-r2310-20261109    gcc-9.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

