Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6EF606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wu6Qm98R;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aJJ3u7dx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iSXMpXOF2YVYOGjRBFe35bdX9i8VBTGHytQEk6yaN6Y=; b=wu6Qm98Rs/Nu3ckL7QaMqfyK7k
	H+Z92pxU4M7dWZwY+i/b0U92riLdTzE1Ruf7CMl11xiZFGKhvY3iGvgPIT3ryCuLlERRbxebGVEVi
	A8wF32c8KjM3PnXrrkyW15ew3iraksEX+p3X7x8ss7BprdEYzHnVS6p93W3dska4CDqlTCn4O8HbR
	4250b0QJmzaRuKqEtoPGlIQgz6un/rVAgwbgXfbbY6ViPAHrCGxQv5O47bMhP+ZJNsxJhk+YIbZDb
	PDsK232wToR3H16jLPDHLF4FzxvtFWoWPeGvP+CrfZl/qXzwzAj7GeZeHVoRdr1P+IXBYeu0+mT7T
	j92ERfXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK3v-000000065vO-3Gsa;
	Tue, 17 Nov 2026 14:21:31 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK3r-000000065ut-438u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794925288; x=1826461288;
  h=date:from:to:cc:subject:message-id;
  bh=L2bf2BlSqbk8EoL19CFeUawBlNDwK5E6VLDH2N7DFTc=;
  b=aJJ3u7dxXOXbtdG8PMKDFz1BtmxvgEoFhe2552kPIqcN5CoFaNw6+l0r
   NdebI0BuxJo1weGSHef4/PYmUcD02DgZ4vtjHQ14O6ydMTjoXN/KPXhK4
   kLJeLc80WoL3pjP7ZNbOyKvN0hGCmc6yp7FWGpiFTTS2e6oHufsrKhAOb
   g7KTUuRRA9REYQskV+qwH2ZYQCbigSosuvH4wDqZZSe1jmv253Jl3EUBY
   eTvr5x16TaNaG34lA3UAwGrJRAiXkeibPUfaVEtFibvKzhv7W9ccaWeoR
   83WysOxGuTOdp/cSeBganyK6EcCv4xyu3mjLQDG/8CPJM+H7lY3V5wqzl
   Q==;
X-CSE-ConnectionGUID: 9734tb8WQIGz5/vv57hCRQ==
X-CSE-MsgGUID: 8Hp7Pn+uSE61yw5+jZ5c9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3713899"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3713899"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 06:21:27 -0800
X-CSE-ConnectionGUID: Nfgva/0dQ06y3nFG93lXYA==
X-CSE-MsgGUID: r5v/Ba6iSEe73O0OOWegJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9814578"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2026 06:21:26 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTK3n-00000001BlZ-1Nxa;
	Tue, 17 Nov 2026 14:21:23 +0000
Date: Tue, 17 Nov 2026 22:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-sram-runtime-pm] BUILD SUCCESS
 2d464135cc48bd60126afacd885da39237edbfa6
Message-ID: <20261117222044.sKp7DN5L-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062128_114105_AD1647D7 
X-CRM114-Status: UNSURE (   5.70  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-sram-runtime-pm
branch HEAD: 2d464135cc48bd60126afacd885da39237edbfa6  misc: sram: Enable runtime PM

elapsed time: 1411m

configs tested: 571
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    clang-24
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261116    gcc-10.5.0
alpha                 randconfig-2001-20261116    gcc-10.5.0
alpha                 randconfig-2200-20261116    gcc-15.3.0 smatch
alpha                randconfig-r2105-20261116    clang-22   cocci
alpha                randconfig-r2107-20261116    clang-24   cocci
alpha                randconfig-r2109-20261116    gcc-9.5.0  cocci
alpha                randconfig-r2307-20261116    gcc-8.5.0  sparse
alpha                randconfig-r2311-20261116    gcc-10.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                          haps_hs_defconfig    gcc-16.2.0
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261117    gcc-13.5.0
arc                   randconfig-1001-20261117    gcc-13.5.0
arc                   randconfig-2000-20261116    gcc-13.5.0
arc                   randconfig-2001-20261116    gcc-13.5.0
arc                   randconfig-2002-20261116    gcc-13.5.0
arc                   randconfig-2003-20261116    gcc-13.5.0
arc                   randconfig-2004-20261116    gcc-13.5.0
arc                   randconfig-2005-20261116    gcc-13.5.0
arc                   randconfig-2200-20261116    gcc-15.3.0 smatch
arc                  randconfig-r2101-20261116    gcc-9.5.0  cocci
arc                  randconfig-r2106-20261116    gcc-16.2.0 cocci
arc                  randconfig-r2108-20261116    clang-24   cocci
arc                  randconfig-r2304-20261116    gcc-8.5.0  sparse
arc                  randconfig-r2307-20261116    gcc-14.4.0 sparse
arc                  randconfig-r2310-20261116    clang-20   sparse
arc                  randconfig-r2311-20261116    gcc-8.5.0  sparse
arc                            tb10x_defconfig    clang-24
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          axm55xx_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                       jornada720_defconfig    clang-24
arm                         neponset_defconfig    gcc-16.2.0
arm                          nhk8815_defconfig    clang-24
arm                          orion5x_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261117    gcc-13.5.0
arm                   randconfig-1001-20261117    gcc-13.5.0
arm                   randconfig-1002-20261117    gcc-13.5.0
arm                   randconfig-1003-20261117    gcc-13.5.0
arm                   randconfig-2000-20261116    gcc-15.3.0
arm                   randconfig-2001-20261116    clang-24
arm                   randconfig-2001-20261116    gcc-15.3.0
arm                   randconfig-2002-20261116    gcc-15.3.0
arm                   randconfig-2002-20261116    gcc-8.5.0
arm                   randconfig-2200-20261116    gcc-13.5.0 smatch
arm                  randconfig-r2101-20261116    gcc-14.4.0 cocci
arm                  randconfig-r2108-20261116    clang-17   cocci
arm                  randconfig-r2108-20261116    clang-24   cocci
arm                  randconfig-r2303-20261116    gcc-16.2.0 sparse
arm                  randconfig-r2308-20261116    gcc-10.5.0 sparse
arm                  randconfig-r2310-20261116    gcc-8.5.0  sparse
arm                            spitz_defconfig    clang-24
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             alldefconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261117    gcc-16.2.0
arm64                 randconfig-1001-20261117    gcc-16.2.0
arm64                 randconfig-1002-20261117    gcc-16.2.0
arm64                 randconfig-1003-20261117    gcc-16.2.0
arm64                 randconfig-2000-20261116    gcc-15.3.0
arm64                 randconfig-2001-20261116    clang-18
arm64                 randconfig-2001-20261116    gcc-15.3.0
arm64                 randconfig-2002-20261116    gcc-14.4.0
arm64                 randconfig-2002-20261116    gcc-15.3.0
arm64                 randconfig-2200-20261116    gcc-8.5.0  smatch
arm64                randconfig-r2100-20261116    clang-22   cocci
arm64                randconfig-r2107-20261116    clang-24   cocci
arm64                randconfig-r2108-20261116    clang-24   cocci
arm64                randconfig-r2109-20261116    clang-17   cocci
arm64                randconfig-r2301-20261116    clang-24   sparse
arm64                randconfig-r2309-20261116    clang-20   sparse
arm64                randconfig-r2309-20261116    gcc-10.5.0 sparse
csky                              alldefconfig    clang-24
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261117    gcc-16.2.0
csky                  randconfig-1001-20261117    gcc-16.2.0
csky                  randconfig-2000-20261116    gcc-16.2.0
csky                  randconfig-2001-20261116    gcc-16.2.0
csky                  randconfig-2200-20261116    gcc-16.2.0 smatch
csky                 randconfig-r2102-20261116    gcc-8.5.0  cocci
csky                 randconfig-r2104-20261116    gcc-14.4.0 cocci
csky                 randconfig-r2105-20261116    gcc-12.5.0 cocci
csky                 randconfig-r2107-20261116    clang-24   cocci
csky                 randconfig-r2109-20261116    clang-24   cocci
csky                 randconfig-r2300-20261116    gcc-16.2.0 sparse
csky                 randconfig-r2304-20261116    gcc-8.5.0  sparse
csky                 randconfig-r2305-20261116    gcc-16.2.0 sparse
csky                 randconfig-r2308-20261116    gcc-14.4.0 sparse
csky                 randconfig-r2311-20261116    clang-20   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261117    clang-17
hexagon               randconfig-1001-20261117    clang-17
hexagon               randconfig-2000-20261116    gcc-16.2.0
hexagon               randconfig-2001-20261116    gcc-16.2.0
hexagon               randconfig-2200-20261116    clang-17   smatch
hexagon              randconfig-r2104-20261116    clang-22   cocci
hexagon              randconfig-r2107-20261116    clang-24   cocci
hexagon              randconfig-r2110-20261116    clang-17   cocci
hexagon              randconfig-r2111-20261116    clang-24   cocci
hexagon              randconfig-r2304-20261116    gcc-9.5.0  sparse
hexagon              randconfig-r2309-20261116    gcc-8.5.0  sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261117    clang-22
i386        buildonly-randconfig-1001-20261117    clang-22
i386        buildonly-randconfig-1002-20261117    clang-22
i386        buildonly-randconfig-1003-20261117    clang-22
i386        buildonly-randconfig-1004-20261117    clang-22
i386        buildonly-randconfig-1005-20261117    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261117    gcc-14
i386                  randconfig-1001-20261117    gcc-14
i386                  randconfig-1002-20261117    gcc-14
i386                  randconfig-1003-20261117    gcc-14
i386                  randconfig-1004-20261117    gcc-14
i386                  randconfig-1005-20261117    gcc-14
i386                  randconfig-1006-20261117    gcc-14
i386                  randconfig-1007-20261117    clang-22
i386                  randconfig-1008-20261117    clang-22
i386                  randconfig-1009-20261117    clang-22
i386                  randconfig-1010-20261117    clang-22
i386                  randconfig-1011-20261117    clang-22
i386                  randconfig-1012-20261117    clang-22
i386                  randconfig-1013-20261117    clang-22
i386                  randconfig-2000-20261116    gcc-14
i386                  randconfig-2001-20261116    gcc-14
i386                  randconfig-2002-20261116    gcc-14
i386                  randconfig-2003-20261116    gcc-14
i386                  randconfig-2004-20261116    gcc-14
i386                  randconfig-2005-20261116    gcc-14
i386                  randconfig-2100-20261116    gcc-14     cocci
i386                  randconfig-2101-20261116    gcc-14     cocci
i386                  randconfig-2102-20261116    gcc-14     cocci
i386                  randconfig-2103-20261116    gcc-14     cocci
i386                  randconfig-2104-20261116    gcc-14     cocci
i386                  randconfig-2105-20261116    gcc-14     cocci
i386                  randconfig-2200-20261116    gcc-14     smatch
i386                  randconfig-2300-20261116    gcc-14     sparse
i386                  randconfig-2301-20261116    gcc-14     sparse
i386                  randconfig-2302-20261116    gcc-14     sparse
i386                 randconfig-r2100-20261116    gcc-16.2.0 cocci
i386                 randconfig-r2102-20261116    clang-22   cocci
i386                 randconfig-r2102-20261116    gcc-16.2.0 cocci
i386                 randconfig-r2103-20261116    gcc-14     cocci
i386                 randconfig-r2103-20261116    gcc-14.4.0 cocci
i386                 randconfig-r2106-20261116    clang-24   cocci
i386                 randconfig-r2109-20261116    gcc-16.2.0 cocci
i386                 randconfig-r2110-20261116    clang-24   cocci
i386                 randconfig-r2304-20261116    gcc-14.4.0 sparse
i386                 randconfig-r2307-20261116    gcc-15.3.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    clang-24
loongarch             randconfig-1000-20261117    clang-17
loongarch             randconfig-1001-20261117    clang-17
loongarch             randconfig-2000-20261116    gcc-11.5.0
loongarch             randconfig-2001-20261116    gcc-11.5.0
loongarch            randconfig-r2101-20261116    clang-22   cocci
loongarch            randconfig-r2101-20261116    gcc-8.5.0  cocci
loongarch            randconfig-r2107-20261116    clang-24   cocci
loongarch            randconfig-r2110-20261116    gcc-16.2.0 cocci
loongarch            randconfig-r2111-20261116    gcc-14.4.0 cocci
loongarch            randconfig-r2300-20261116    gcc-16.2.0 sparse
loongarch            randconfig-r2300-20261116    gcc-9.5.0  sparse
loongarch            randconfig-r2306-20261116    gcc-8.5.0  sparse
loongarch            randconfig-r2308-20261116    gcc-15.3.0 sparse
loongarch            randconfig-r2308-20261116    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                             q40_defconfig    clang-24
m68k                  randconfig-2000-20261116    gcc-10.5.0
m68k                  randconfig-2001-20261116    gcc-10.5.0
m68k                  randconfig-2200-20261116    gcc-14.4.0 smatch
m68k                 randconfig-r2106-20261116    gcc-9.5.0  cocci
m68k                 randconfig-r2108-20261116    clang-24   cocci
m68k                 randconfig-r2110-20261116    gcc-16.2.0 cocci
m68k                 randconfig-r2301-20261116    gcc-8.5.0  sparse
m68k                 randconfig-r2301-20261116    gcc-9.5.0  sparse
m68k                 randconfig-r2302-20261116    gcc-16.2.0 sparse
m68k                 randconfig-r2302-20261116    gcc-9.5.0  sparse
m68k                 randconfig-r2303-20261116    gcc-8.5.0  sparse
m68k                 randconfig-r2305-20261116    gcc-16.2.0 sparse
m68k                 randconfig-r2311-20261116    gcc-8.5.0  sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261116    gcc-10.5.0
microblaze            randconfig-2001-20261116    gcc-10.5.0
microblaze            randconfig-2200-20261116    gcc-11.5.0 smatch
microblaze           randconfig-r2101-20261116    gcc-12.5.0 cocci
microblaze           randconfig-r2102-20261116    gcc-9.5.0  cocci
microblaze           randconfig-r2103-20261116    gcc-12.5.0 cocci
microblaze           randconfig-r2110-20261116    gcc-9.5.0  cocci
microblaze           randconfig-r2300-20261116    gcc-8.5.0  sparse
microblaze           randconfig-r2303-20261116    gcc-9.5.0  sparse
microblaze           randconfig-r2309-20261116    gcc-8.5.0  sparse
microblaze           randconfig-r2310-20261116    gcc-15.3.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          bigsur_defconfig    gcc-16.2.0
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                           eyeq6_defconfig    clang-24
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                       maltaaprp_defconfig    clang-24
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261116    gcc-11.5.0
mips                  randconfig-2000-20261116    gcc-13.5.0
mips                  randconfig-2001-20261116    clang-24
mips                  randconfig-2001-20261116    gcc-13.5.0
mips                  randconfig-2002-20261116    clang-17
mips                  randconfig-2002-20261116    gcc-13.5.0
mips                  randconfig-2200-20261116    gcc-8.5.0  smatch
mips                 randconfig-r2100-20261116    gcc-12.5.0 cocci
mips                 randconfig-r2103-20261116    gcc-12.5.0 cocci
mips                 randconfig-r2103-20261116    gcc-9.5.0  cocci
mips                 randconfig-r2107-20261116    clang-17   cocci
mips                 randconfig-r2108-20261116    gcc-14.4.0 cocci
mips                 randconfig-r2305-20261116    gcc-15.3.0 sparse
mips                 randconfig-r2309-20261116    gcc-16.2.0 sparse
mips                 randconfig-r2310-20261116    gcc-15.3.0 sparse
mips                          rt305x_defconfig    clang-24
mips                            xway_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261117    clang-17
nios2                 randconfig-1001-20261117    clang-17
nios2                 randconfig-2000-20261116    gcc-11.5.0
nios2                 randconfig-2001-20261116    gcc-11.5.0
nios2                 randconfig-2200-20261116    gcc-11.5.0 smatch
nios2                randconfig-r2106-20261116    gcc-16.2.0 cocci
nios2                randconfig-r2107-20261116    gcc-9.5.0  cocci
nios2                randconfig-r2108-20261116    gcc-9.5.0  cocci
nios2                randconfig-r2111-20261116    clang-24   cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261116    gcc-13.5.0
openrisc              randconfig-2001-20261116    gcc-13.5.0
openrisc              randconfig-2001-20261116    gcc-15.3.0
openrisc              randconfig-2002-20261116    gcc-13.5.0
openrisc              randconfig-2002-20261116    gcc-9.5.0
openrisc              randconfig-2200-20261116    gcc-15.3.0 smatch
openrisc             randconfig-r2100-20261116    gcc-12.5.0 cocci
openrisc             randconfig-r2105-20261116    gcc-8.5.0  cocci
openrisc             randconfig-r2106-20261116    clang-24   cocci
openrisc             randconfig-r2302-20261116    gcc-16.2.0 sparse
openrisc             randconfig-r2305-20261116    gcc-9.5.0  sparse
openrisc             randconfig-r2308-20261116    clang-20   sparse
openrisc             randconfig-r2309-20261116    gcc-14.4.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-64bit_defconfig    clang-24
parisc                randconfig-1000-20261117    gcc-9.5.0
parisc                randconfig-1001-20261117    gcc-9.5.0
parisc                randconfig-2000-20261116    gcc-11.5.0
parisc                randconfig-2001-20261116    gcc-11.5.0
parisc                randconfig-2200-20261116    gcc-8.5.0  smatch
parisc               randconfig-r2101-20261116    gcc-14     cocci
parisc               randconfig-r2101-20261116    gcc-16.2.0 cocci
parisc               randconfig-r2102-20261116    gcc-12.5.0 cocci
parisc               randconfig-r2104-20261116    gcc-14     cocci
parisc               randconfig-r2105-20261116    gcc-14.4.0 cocci
parisc               randconfig-r2301-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2302-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2303-20261116    gcc-16.2.0 sparse
parisc               randconfig-r2305-20261116    gcc-8.5.0  sparse
parisc               randconfig-r2306-20261116    clang-20   sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                  canyonlands_defconfig    clang-24
powerpc                       cm5200_defconfig    clang-24
powerpc                       ep88xc_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                mpc834x_itxgp_defconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc                       pasemi_defconfig    gcc-16.2.0
powerpc                       pcm030_defconfig    clang-24
powerpc                       pmac32_defconfig    clang-24
powerpc                      powernv_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261117    gcc-9.5.0
powerpc               randconfig-1001-20261117    gcc-9.5.0
powerpc               randconfig-2000-20261116    clang-17
powerpc               randconfig-2001-20261116    clang-17
powerpc               randconfig-2002-20261116    clang-17
powerpc               randconfig-2200-20261116    clang-22   smatch
powerpc              randconfig-r2100-20261116    gcc-14.4.0 cocci
powerpc              randconfig-r2104-20261116    gcc-12.5.0 cocci
powerpc              randconfig-r2105-20261116    gcc-12.5.0 cocci
powerpc              randconfig-r2106-20261116    gcc-14.4.0 cocci
powerpc              randconfig-r2109-20261116    gcc-16.2.0 cocci
powerpc              randconfig-r2304-20261116    clang-24   sparse
powerpc              randconfig-r2304-20261116    gcc-16.2.0 sparse
powerpc              randconfig-r2306-20261116    gcc-10.5.0 sparse
powerpc              randconfig-r2309-20261116    gcc-15.3.0 sparse
powerpc                      skiroot_defconfig    clang-24
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261117    gcc-9.5.0
powerpc64             randconfig-1001-20261117    gcc-9.5.0
powerpc64             randconfig-2000-20261116    clang-17
powerpc64             randconfig-2001-20261116    clang-17
powerpc64             randconfig-2002-20261116    clang-17
powerpc64             randconfig-2200-20261116    clang-19   smatch
powerpc64            randconfig-r2100-20261116    gcc-9.5.0  cocci
powerpc64            randconfig-r2104-20261116    gcc-12.5.0 cocci
powerpc64            randconfig-r2108-20261116    gcc-16.2.0 cocci
powerpc64            randconfig-r2109-20261116    clang-24   cocci
powerpc64            randconfig-r2110-20261116    clang-24   cocci
powerpc64            randconfig-r2111-20261116    clang-24   cocci
powerpc64            randconfig-r2303-20261116    gcc-16.2.0 sparse
powerpc64            randconfig-r2308-20261116    gcc-8.5.0  sparse
riscv                             alldefconfig    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261117    clang-24
riscv                 randconfig-1001-20261117    clang-24
riscv                 randconfig-2000-20261116    clang-20
riscv                 randconfig-2001-20261116    clang-20
riscv                 randconfig-2002-20261116    clang-20
riscv                 randconfig-2003-20261116    clang-20
riscv                 randconfig-2004-20261116    clang-20
riscv                 randconfig-2005-20261116    clang-20
riscv                 randconfig-2200-20261116    clang-24   smatch
riscv                randconfig-r2100-20261116    gcc-12.5.0 cocci
riscv                randconfig-r2106-20261116    clang-24   cocci
riscv                randconfig-r2107-20261116    gcc-16.2.0 cocci
riscv                randconfig-r2110-20261116    clang-24   cocci
riscv                randconfig-r2111-20261116    gcc-9.5.0  cocci
riscv                randconfig-r2300-20261116    gcc-8.5.0  sparse
riscv                randconfig-r2303-20261116    clang-24   sparse
riscv                randconfig-r2303-20261116    gcc-14.4.0 sparse
riscv                randconfig-r2304-20261116    gcc-15.3.0 sparse
riscv                randconfig-r2304-20261116    gcc-16.2.0 sparse
riscv                randconfig-r2306-20261116    gcc-14.4.0 sparse
riscv                randconfig-r2307-20261116    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261117    clang-24
s390                  randconfig-1001-20261117    clang-24
s390                  randconfig-2000-20261116    clang-17
s390                  randconfig-2001-20261116    clang-17
s390                  randconfig-2002-20261116    clang-17
s390                  randconfig-2003-20261116    clang-17
s390                  randconfig-2004-20261116    clang-17
s390                  randconfig-2005-20261116    clang-17
s390                  randconfig-2200-20261116    gcc-10.5.0 smatch
s390                 randconfig-r2106-20261116    clang-17   cocci
s390                 randconfig-r2109-20261116    clang-24   cocci
s390                 randconfig-r2111-20261116    clang-24   cocci
s390                 randconfig-r2302-20261116    clang-24   sparse
s390                 randconfig-r2302-20261116    gcc-14.4.0 sparse
s390                 randconfig-r2303-20261116    gcc-8.5.0  sparse
s390                 randconfig-r2305-20261116    gcc-14.4.0 sparse
s390                 randconfig-r2305-20261116    gcc-8.5.0  sparse
s390                 randconfig-r2307-20261116    gcc-16.2.0 sparse
s390                 randconfig-r2310-20261116    gcc-16.2.0 sparse
s390                 randconfig-r2311-20261116    gcc-14.4.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261117    clang-24
sh                    randconfig-1001-20261117    clang-24
sh                    randconfig-2000-20261116    gcc-15.3.0
sh                    randconfig-2001-20261116    gcc-15.3.0
sh                    randconfig-2002-20261116    gcc-15.3.0
sh                    randconfig-2003-20261116    gcc-15.3.0
sh                    randconfig-2004-20261116    gcc-15.3.0
sh                    randconfig-2005-20261116    gcc-15.3.0
sh                    randconfig-2200-20261116    gcc-15.3.0 smatch
sh                   randconfig-r2104-20261116    gcc-16.2.0 cocci
sh                   randconfig-r2107-20261116    gcc-16.2.0 cocci
sh                   randconfig-r2109-20261116    clang-24   cocci
sh                   randconfig-r2300-20261116    gcc-15.3.0 sparse
sh                   randconfig-r2301-20261116    gcc-15.3.0 sparse
sh                   randconfig-r2306-20261116    gcc-15.3.0 sparse
sh                   randconfig-r2311-20261116    gcc-15.3.0 sparse
sh                           sdk7780_defconfig    gcc-16.2.0
sh                            se7750_defconfig    clang-24
sh                            sh2007_defconfig    clang-24
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261117    gcc-15.3.0
sparc                 randconfig-1001-20261117    gcc-15.3.0
sparc                 randconfig-2000-20261116    gcc-14
sparc                 randconfig-2001-20261116    gcc-14
sparc                 randconfig-2200-20261116    gcc-15.3.0 smatch
sparc                randconfig-r2101-20261116    gcc-12.5.0 cocci
sparc                randconfig-r2103-20261116    gcc-8.5.0  cocci
sparc                randconfig-r2104-20261116    gcc-9.5.0  cocci
sparc                randconfig-r2106-20261116    clang-24   cocci
sparc                randconfig-r2107-20261116    gcc-14.4.0 cocci
sparc                randconfig-r2110-20261116    gcc-14.4.0 cocci
sparc                randconfig-r2111-20261116    gcc-16.2.0 cocci
sparc                randconfig-r2300-20261116    gcc-14.4.0 sparse
sparc                randconfig-r2301-20261116    gcc-8.5.0  sparse
sparc                randconfig-r2304-20261116    gcc-16.2.0 sparse
sparc                randconfig-r2305-20261116    clang-24   sparse
sparc                randconfig-r2305-20261116    gcc-16.2.0 sparse
sparc                randconfig-r2309-20261116    gcc-16.2.0 sparse
sparc                randconfig-r2311-20261116    gcc-15.3.0 sparse
sparc                        sparc64_defconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261117    gcc-15.3.0
sparc64               randconfig-1001-20261117    gcc-15.3.0
sparc64               randconfig-2000-20261116    gcc-14
sparc64               randconfig-2001-20261116    gcc-14
sparc64               randconfig-2200-20261116    gcc-8.5.0  smatch
sparc64              randconfig-r2100-20261116    gcc-14     cocci
sparc64              randconfig-r2103-20261116    clang-22   cocci
sparc64              randconfig-r2103-20261116    gcc-16.2.0 cocci
sparc64              randconfig-r2104-20261116    gcc-8.5.0  cocci
sparc64              randconfig-r2300-20261116    gcc-16.2.0 sparse
sparc64              randconfig-r2301-20261116    gcc-16.2.0 sparse
sparc64              randconfig-r2306-20261116    gcc-16.2.0 sparse
sparc64              randconfig-r2306-20261116    gcc-8.5.0  sparse
sparc64              randconfig-r2307-20261116    clang-20   sparse
sparc64              randconfig-r2307-20261116    gcc-15.3.0 sparse
sparc64              randconfig-r2307-20261116    gcc-16.2.0 sparse
sparc64              randconfig-r2308-20261116    gcc-16.2.0 sparse
um                                alldefconfig    clang-24
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    clang-24
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261117    gcc-15.3.0
um                    randconfig-1001-20261117    gcc-15.3.0
um                    randconfig-2000-20261116    gcc-14
um                    randconfig-2001-20261116    gcc-14
um                    randconfig-2200-20261116    gcc-14     smatch
um                   randconfig-r2102-20261116    gcc-14.4.0 cocci
um                   randconfig-r2104-20261116    gcc-12.5.0 cocci
um                   randconfig-r2106-20261116    clang-24   cocci
um                   randconfig-r2110-20261116    clang-24   cocci
um                   randconfig-r2111-20261116    clang-24   cocci
um                   randconfig-r2301-20261116    gcc-16.2.0 sparse
um                   randconfig-r2302-20261116    gcc-8.5.0  sparse
um                   randconfig-r2303-20261116    gcc-15.3.0 sparse
um                   randconfig-r2308-20261116    gcc-15.3.0 sparse
um                   randconfig-r2309-20261116    gcc-15.3.0 sparse
um                   randconfig-r2310-20261116    gcc-14.4.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261117    gcc-13
x86_64      buildonly-randconfig-1001-20261117    gcc-13
x86_64      buildonly-randconfig-1002-20261117    gcc-13
x86_64      buildonly-randconfig-1003-20261117    gcc-13
x86_64      buildonly-randconfig-1004-20261117    gcc-13
x86_64      buildonly-randconfig-1005-20261117    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261117    clang-22
x86_64                randconfig-1001-20261117    clang-22
x86_64                randconfig-1002-20261117    clang-22
x86_64                randconfig-1003-20261117    clang-22
x86_64                randconfig-1004-20261117    clang-22
x86_64                randconfig-1005-20261117    clang-22
x86_64                randconfig-1006-20261117    gcc-14
x86_64                randconfig-1007-20261117    gcc-14
x86_64                randconfig-1008-20261117    gcc-14
x86_64                randconfig-1009-20261117    gcc-14
x86_64                randconfig-1010-20261117    gcc-14
x86_64                randconfig-1011-20261117    gcc-14
x86_64                randconfig-1012-20261117    gcc-14
x86_64                randconfig-1013-20261117    gcc-14
x86_64                randconfig-1014-20261117    gcc-14
x86_64                randconfig-1015-20261117    gcc-14
x86_64                randconfig-1016-20261117    gcc-14
x86_64                randconfig-1017-20261117    gcc-14
x86_64                randconfig-2000-20261116    gcc-14
x86_64                randconfig-2001-20261116    gcc-14
x86_64                randconfig-2002-20261116    gcc-14
x86_64                randconfig-2003-20261116    gcc-14
x86_64                randconfig-2004-20261116    gcc-14
x86_64                randconfig-2005-20261116    gcc-14
x86_64                randconfig-2100-20261116    gcc-14     cocci
x86_64                randconfig-2101-20261116    gcc-14     cocci
x86_64                randconfig-2102-20261116    gcc-14     cocci
x86_64                randconfig-2103-20261116    gcc-14     cocci
x86_64                randconfig-2104-20261116    gcc-14     cocci
x86_64                randconfig-2105-20261116    gcc-14     cocci
x86_64                randconfig-2200-20261116    clang-22   smatch
x86_64                randconfig-2300-20261116    gcc-14     sparse
x86_64                randconfig-2301-20261116    gcc-14     sparse
x86_64                randconfig-2302-20261116    gcc-14     sparse
x86_64               randconfig-r2102-20261116    gcc-14     cocci
x86_64               randconfig-r2105-20261116    gcc-12.5.0 cocci
x86_64               randconfig-r2105-20261116    gcc-14     cocci
x86_64               randconfig-r2105-20261116    gcc-16.2.0 cocci
x86_64               randconfig-r2105-20261116    gcc-9.5.0  cocci
x86_64               randconfig-r2108-20261116    clang-24   cocci
x86_64               randconfig-r2111-20261116    gcc-16.2.0 cocci
x86_64               randconfig-r2301-20261116    gcc-14.4.0 sparse
x86_64               randconfig-r2302-20261116    gcc-15.3.0 sparse
x86_64               randconfig-r2302-20261116    gcc-8.5.0  sparse
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
xtensa                           iss_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261117    gcc-15.3.0
xtensa                randconfig-1001-20261117    gcc-15.3.0
xtensa                randconfig-2000-20261116    gcc-16.2.0
xtensa                randconfig-2001-20261116    gcc-16.2.0
xtensa                randconfig-2200-20261116    gcc-9.5.0  smatch
xtensa               randconfig-r2100-20261116    gcc-8.5.0  cocci
xtensa               randconfig-r2101-20261116    gcc-12.5.0 cocci
xtensa               randconfig-r2103-20261116    gcc-12.5.0 cocci
xtensa               randconfig-r2108-20261116    gcc-16.2.0 cocci
xtensa               randconfig-r2109-20261116    clang-24   cocci
xtensa               randconfig-r2109-20261116    gcc-14.4.0 cocci
xtensa               randconfig-r2111-20261116    clang-17   cocci
xtensa               randconfig-r2300-20261116    clang-24   sparse
xtensa               randconfig-r2306-20261116    gcc-16.2.0 sparse
xtensa               randconfig-r2307-20261116    gcc-10.5.0 sparse
xtensa               randconfig-r2308-20261116    gcc-16.2.0 sparse
xtensa               randconfig-r2310-20261116    gcc-10.5.0 sparse
xtensa               randconfig-r2310-20261116    gcc-16.2.0 sparse
xtensa               randconfig-r2310-20261116    gcc-8.5.0  sparse
xtensa               randconfig-r2311-20261116    gcc-16.2.0 sparse
xtensa                     xip_kc705_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

