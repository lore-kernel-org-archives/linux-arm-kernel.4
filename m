Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC2460A2631
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZprBe7Da;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hrTu3hun
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xWvkErvKpWpQ6tbDZIs6ChkIC5jYQvT9Whik9zqI5+o=; b=ZprBe7DadTcP/bk90yxGdrgbYm
	JSd+z79W9xWsn9C0g558kZoguLnBPkFrE6+JO81hn1qWGL1/umu8FijhhbLPdeCk58rlvRferQSf5
	kXaLa7UjYMaMSHBq9HLrY3dNqI0n/4JcQXTEqdbBK2T4yVqjPonD9I8Wbv1VLzKv/ld6htu5OBl8d
	NY1tCqRkQYXBYDVyHEfCdDbDEQk2EMQLnLFFImFnKrsvlyRT/202H3pp0LxXezxPcYxuY5VRuz36Q
	/nrLQURlg8/4J7pBO3SLUN7EIuRi1Af3YQuqwFuf5hEjyzxYWX5ZHTJytQoqRTEjdc/h46pUXdS8X
	1ZXoFSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTwd-0000000G1Bn-002N;
	Fri, 20 Nov 2026 19:06:47 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTwV-0000000G19U-2SOR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795201599; x=1826737599;
  h=date:from:to:cc:subject:message-id;
  bh=a/c6GC0/x28z7E0MkNZuvlagb+dnGdbCuzio77tY2Po=;
  b=hrTu3hunSXfexYrC2lCtk7bGmRRE/Pim97ljbLbQoqoYsZORkPDeJD1q
   7Q484g/znU7LZxOb1vURI79GzXlKyl+Ppivg7kVVOPS9Yz3OBU92UYeBQ
   ZWqAky+lFrmJo5YZiAE03fWt2fCDikibBnARMfxGFTburamxHij3uNNgE
   WT2jo/5ic3lilDoEXO+WbNCi8uN6Lm6h7gSLEEzz1MkxpmDYFZ2X283Y6
   aP6edEB0ZpwHpYbXkzjLVxXXKlQEbTsjRNKRA3ir87dXfxuUn5DkPEwBJ
   oVv08a8sb9shhwv0kx9pOfSfZvo4uL9Ji0ZmiB+xU9wPWGDmkAiyNYhOC
   A==;
X-CSE-ConnectionGUID: CpwnDJM6T/iJKMI9I/6ZKA==
X-CSE-MsgGUID: 8cPLsdxBSlq64yDs66O8fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3970680"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3970680"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 11:06:38 -0800
X-CSE-ConnectionGUID: ufLeaRjKRM28p1T8LqHtQA==
X-CSE-MsgGUID: SHztjj9KQ3a+IoxqycciLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11034211"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2026 11:06:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUTwQ-00000001IMJ-2jEB;
	Fri, 20 Nov 2026 19:06:34 +0000
Date: Sat, 21 Nov 2026 03:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc:dt] BUILD SUCCESS
 bc06179ef97ac540416a6563040c16847b82f39f
Message-ID: <20261121030546.EedSKKyz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_110639_700695_694E21CC 
X-CRM114-Status: UNSURE (   5.15  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: bc06179ef97ac540416a6563040c16847b82f39f  Merge tag 'zx29-dts-7.5' of https://gitlab.com/stefandoesinger/zx297520-kernel into soc/dt

elapsed time: 831m

configs tested: 534
configs skipped: 285

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                 randconfig-2000-20261119    gcc-8.5.0
alpha                 randconfig-2001-20261119    gcc-8.5.0
alpha                 randconfig-2200-20261119    gcc-12.5.0 smatch
alpha                randconfig-r2100-20261119    gcc-10.5.0 cocci
alpha                randconfig-r2102-20261119    gcc-10.5.0 cocci
alpha                randconfig-r2106-20261119    gcc-15.3.0 cocci
alpha                randconfig-r2110-20261119    gcc-8.5.0  cocci
alpha                randconfig-r2301-20261119    clang-22   sparse
alpha                randconfig-r2301-20261119    gcc-16.2.0 sparse
alpha                randconfig-r2305-20261119    gcc-16.2.0 sparse
alpha                randconfig-r2306-20261119    gcc-13.5.0 sparse
alpha                randconfig-r2311-20261119    gcc-13.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                   randconfig-1000-20261120    clang-17
arc                   randconfig-1001-20261120    clang-17
arc                   randconfig-2000-20261119    gcc-14.4.0
arc                   randconfig-2001-20261119    gcc-14.4.0
arc                   randconfig-2002-20261119    gcc-14.4.0
arc                   randconfig-2003-20261119    gcc-14.4.0
arc                   randconfig-2004-20261119    gcc-14.4.0
arc                   randconfig-2005-20261119    gcc-14.4.0
arc                   randconfig-2200-20261119    gcc-16.2.0 smatch
arc                  randconfig-r2104-20261119    clang-22   cocci
arc                  randconfig-r2107-20261119    gcc-15.3.0 cocci
arc                  randconfig-r2109-20261119    gcc-14     cocci
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         multi_v7_defconfig    clang-17
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                           pxa168_defconfig    gcc-16.2.0
arm                           pxa3xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261120    clang-17
arm                   randconfig-1001-20261120    clang-17
arm                   randconfig-1002-20261120    clang-17
arm                   randconfig-1003-20261120    clang-17
arm                   randconfig-2000-20261119    gcc-16.2.0
arm                   randconfig-2000-20261120    gcc-8.5.0
arm                   randconfig-2001-20261119    gcc-16.2.0
arm                   randconfig-2001-20261120    gcc-8.5.0
arm                   randconfig-2002-20261119    gcc-16.2.0
arm                   randconfig-2002-20261120    gcc-8.5.0
arm                   randconfig-2200-20261119    clang-24   smatch
arm                  randconfig-r2100-20261119    clang-22   cocci
arm                  randconfig-r2103-20261119    gcc-10.5.0 cocci
arm                  randconfig-r2105-20261119    gcc-10.5.0 cocci
arm                  randconfig-r2108-20261119    gcc-8.5.0  cocci
arm                  randconfig-r2111-20261119    gcc-11.5.0 cocci
arm                  randconfig-r2300-20261119    clang-24   sparse
arm                  randconfig-r2301-20261119    clang-24   sparse
arm                  randconfig-r2304-20261119    clang-22   sparse
arm                  randconfig-r2304-20261119    clang-24   sparse
arm                  randconfig-r2306-20261119    clang-17   sparse
arm                  randconfig-r2307-20261119    gcc-10.5.0 sparse
arm                  randconfig-r2308-20261119    gcc-10.5.0 sparse
arm                  randconfig-r2309-20261119    clang-24   sparse
arm                  randconfig-r2311-20261119    clang-17   sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                            sama7_defconfig    gcc-16.2.0
arm                         spear3xx_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                 randconfig-1000-20261120    clang-18
arm64                 randconfig-1001-20261120    clang-18
arm64                 randconfig-1002-20261120    clang-18
arm64                 randconfig-1003-20261120    clang-18
arm64                 randconfig-2000-20261119    gcc-16.2.0
arm64                 randconfig-2000-20261120    gcc-8.5.0
arm64                 randconfig-2001-20261119    gcc-16.2.0
arm64                 randconfig-2001-20261120    gcc-8.5.0
arm64                 randconfig-2002-20261119    gcc-16.2.0
arm64                 randconfig-2002-20261120    gcc-8.5.0
arm64                 randconfig-2200-20261119    clang-17   smatch
arm64                randconfig-r2101-20261119    gcc-15.3.0 cocci
arm64                randconfig-r2103-20261119    gcc-10.5.0 cocci
arm64                randconfig-r2104-20261119    gcc-11.5.0 cocci
arm64                randconfig-r2105-20261119    gcc-8.5.0  cocci
arm64                randconfig-r2106-20261119    gcc-14     cocci
arm64                randconfig-r2108-20261119    gcc-16.2.0 cocci
arm64                randconfig-r2110-20261119    clang-24   cocci
arm64                randconfig-r2110-20261119    gcc-14     cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                  randconfig-1000-20261120    clang-18
csky                  randconfig-1001-20261120    clang-18
csky                  randconfig-2000-20261119    gcc-16.2.0
csky                  randconfig-2001-20261119    gcc-16.2.0
csky                  randconfig-2200-20261119    gcc-16.2.0 smatch
csky                 randconfig-r2103-20261119    gcc-13.5.0 cocci
csky                 randconfig-r2105-20261119    gcc-11.5.0 cocci
csky                 randconfig-r2107-20261119    gcc-11.5.0 cocci
csky                 randconfig-r2109-20261119    gcc-11.5.0 cocci
csky                 randconfig-r2302-20261119    gcc-16.2.0 sparse
csky                 randconfig-r2304-20261119    gcc-16.2.0 sparse
csky                 randconfig-r2305-20261119    gcc-16.2.0 sparse
csky                 randconfig-r2308-20261119    gcc-11.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon               randconfig-1000-20261120    gcc-10.5.0
hexagon               randconfig-1001-20261120    gcc-10.5.0
hexagon               randconfig-2000-20261119    gcc-16.2.0
hexagon               randconfig-2001-20261119    gcc-16.2.0
hexagon               randconfig-2200-20261119    clang-17   smatch
hexagon              randconfig-r2101-20261119    gcc-11.5.0 cocci
hexagon              randconfig-r2102-20261119    gcc-10.5.0 cocci
hexagon              randconfig-r2104-20261119    gcc-10.5.0 cocci
hexagon              randconfig-r2107-20261119    gcc-14     cocci
hexagon              randconfig-r2110-20261119    gcc-8.5.0  cocci
hexagon              randconfig-r2301-20261119    clang-24   sparse
hexagon              randconfig-r2309-20261119    clang-24   sparse
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261120    clang-22
i386        buildonly-randconfig-1001-20261120    clang-22
i386        buildonly-randconfig-1002-20261120    clang-22
i386        buildonly-randconfig-1003-20261120    clang-22
i386        buildonly-randconfig-1004-20261120    clang-22
i386        buildonly-randconfig-1005-20261120    clang-22
i386                  randconfig-1000-20261120    clang-22
i386                  randconfig-1001-20261120    clang-22
i386                  randconfig-1002-20261120    clang-22
i386                  randconfig-1003-20261120    clang-22
i386                  randconfig-1004-20261120    clang-22
i386                  randconfig-1005-20261120    clang-22
i386                  randconfig-1006-20261120    clang-22
i386                  randconfig-1007-20261120    clang-22
i386                  randconfig-1008-20261120    clang-22
i386                  randconfig-1009-20261120    clang-22
i386                  randconfig-1010-20261120    clang-22
i386                  randconfig-1011-20261120    clang-22
i386                  randconfig-1012-20261120    clang-22
i386                  randconfig-1013-20261120    clang-22
i386                  randconfig-2000-20261119    gcc-14
i386                  randconfig-2001-20261119    gcc-14
i386                  randconfig-2002-20261119    gcc-14
i386                  randconfig-2003-20261119    gcc-14
i386                  randconfig-2004-20261119    gcc-14
i386                  randconfig-2005-20261119    gcc-14
i386                  randconfig-2100-20261119    clang-22   cocci
i386                  randconfig-2101-20261119    clang-22   cocci
i386                  randconfig-2102-20261119    clang-22   cocci
i386                  randconfig-2103-20261119    clang-22   cocci
i386                  randconfig-2104-20261119    clang-22   cocci
i386                  randconfig-2105-20261119    clang-22   cocci
i386                  randconfig-2200-20261119    gcc-14     smatch
i386                  randconfig-2300-20261119    gcc-14     sparse
i386                  randconfig-2301-20261119    gcc-14     sparse
i386                  randconfig-2302-20261119    gcc-14     sparse
i386                 randconfig-r2100-20261119    gcc-10.5.0 cocci
i386                 randconfig-r2102-20261119    clang-22   cocci
i386                 randconfig-r2104-20261119    gcc-8.5.0  cocci
i386                 randconfig-r2106-20261119    clang-24   cocci
i386                 randconfig-r2109-20261119    gcc-16.2.0 cocci
i386                 randconfig-r2305-20261119    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261120    gcc-10.5.0
loongarch             randconfig-1001-20261120    gcc-10.5.0
loongarch             randconfig-2000-20261119    gcc-8.5.0
loongarch             randconfig-2001-20261119    gcc-8.5.0
loongarch             randconfig-2200-20261119    clang-24   smatch
loongarch            randconfig-r2107-20261119    clang-24   cocci
loongarch            randconfig-r2111-20261119    gcc-14     cocci
loongarch            randconfig-r2111-20261119    gcc-8.5.0  cocci
loongarch            randconfig-r2302-20261119    clang-24   sparse
loongarch            randconfig-r2306-20261119    clang-24   sparse
loongarch            randconfig-r2310-20261119    clang-17   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5275evb_defconfig    clang-17
m68k                        m5275evb_defconfig    gcc-16.2.0
m68k                        m5282evb_defconfig    gcc-16.2.0
m68k                         mvme16x_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261119    gcc-8.5.0
m68k                  randconfig-2001-20261119    gcc-8.5.0
m68k                  randconfig-2200-20261119    gcc-9.5.0  smatch
m68k                 randconfig-r2101-20261119    gcc-13.5.0 cocci
m68k                 randconfig-r2102-20261119    gcc-11.5.0 cocci
m68k                 randconfig-r2102-20261119    gcc-15.3.0 cocci
m68k                 randconfig-r2107-20261119    gcc-8.5.0  cocci
m68k                 randconfig-r2111-20261119    clang-24   cocci
m68k                 randconfig-r2302-20261119    clang-22   sparse
m68k                 randconfig-r2303-20261119    clang-22   sparse
m68k                 randconfig-r2303-20261119    gcc-16.2.0 sparse
m68k                 randconfig-r2304-20261119    clang-24   sparse
m68k                 randconfig-r2308-20261119    gcc-13.5.0 sparse
m68k                 randconfig-r2311-20261119    clang-24   sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261119    gcc-8.5.0
microblaze            randconfig-2001-20261119    gcc-8.5.0
microblaze            randconfig-2200-20261119    gcc-12.5.0 smatch
microblaze           randconfig-r2106-20261119    gcc-16.2.0 cocci
microblaze           randconfig-r2108-20261119    clang-24   cocci
microblaze           randconfig-r2111-20261119    clang-24   cocci
microblaze           randconfig-r2305-20261119    clang-24   sparse
microblaze           randconfig-r2305-20261119    gcc-8.5.0  sparse
microblaze           randconfig-r2306-20261119    gcc-10.5.0 sparse
microblaze           randconfig-r2307-20261119    clang-17   sparse
microblaze           randconfig-r2307-20261119    gcc-11.5.0 sparse
microblaze           randconfig-r2311-20261119    clang-24   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                 econet_en751221_defconfig    clang-17
mips                 econet_en751221_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            ip32_defconfig    clang-17
mips                      loongson2k_defconfig    gcc-16.2.0
mips                         qi_lb60_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261119    gcc-16.2.0
mips                  randconfig-2001-20261119    gcc-16.2.0
mips                  randconfig-2002-20261119    gcc-16.2.0
mips                  randconfig-2200-20261119    clang-24   smatch
mips                 randconfig-r2104-20261119    gcc-15.3.0 cocci
mips                 randconfig-r2107-20261119    clang-24   cocci
mips                 randconfig-r2107-20261119    gcc-8.5.0  cocci
mips                 randconfig-r2108-20261119    gcc-8.5.0  cocci
mips                 randconfig-r2300-20261119    gcc-8.5.0  sparse
mips                 randconfig-r2302-20261119    clang-24   sparse
mips                 randconfig-r2306-20261119    gcc-11.5.0 sparse
mips                 randconfig-r2311-20261119    gcc-10.5.0 sparse
mips                 randconfig-r2311-20261119    gcc-11.5.0 sparse
mips                          rt305x_defconfig    clang-17
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261120    gcc-10.5.0
nios2                 randconfig-1001-20261120    gcc-10.5.0
nios2                 randconfig-2000-20261119    gcc-8.5.0
nios2                 randconfig-2001-20261119    gcc-8.5.0
nios2                 randconfig-2200-20261119    gcc-11.5.0 smatch
nios2                randconfig-r2102-20261119    gcc-10.5.0 cocci
nios2                randconfig-r2109-20261119    clang-24   cocci
nios2                randconfig-r2111-20261119    gcc-8.5.0  cocci
nios2                randconfig-r2302-20261119    gcc-16.2.0 sparse
nios2                randconfig-r2308-20261119    clang-24   sparse
nios2                randconfig-r2309-20261119    gcc-13.5.0 sparse
nios2                randconfig-r2310-20261119    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    clang-17
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261119    gcc-16.2.0
openrisc              randconfig-2001-20261119    gcc-16.2.0
openrisc              randconfig-2002-20261119    gcc-16.2.0
openrisc              randconfig-2200-20261119    gcc-16.2.0 smatch
openrisc             randconfig-r2101-20261119    gcc-10.5.0 cocci
openrisc             randconfig-r2103-20261119    gcc-15.3.0 cocci
openrisc             randconfig-r2110-20261119    clang-24   cocci
openrisc             randconfig-r2302-20261119    clang-22   sparse
openrisc             randconfig-r2303-20261119    clang-24   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-64bit_defconfig    clang-17
parisc                randconfig-1000-20261120    gcc-11.5.0
parisc                randconfig-1000-20261121    gcc-10.5.0
parisc                randconfig-1001-20261120    gcc-11.5.0
parisc                randconfig-1001-20261121    gcc-10.5.0
parisc                randconfig-2000-20261119    gcc-8.5.0
parisc                randconfig-2001-20261119    gcc-8.5.0
parisc                randconfig-2200-20261119    gcc-14.4.0 smatch
parisc                randconfig-2200-20261120    gcc-8.5.0  smatch
parisc               randconfig-r2100-20261119    gcc-13.5.0 cocci
parisc               randconfig-r2101-20261119    clang-22   cocci
parisc               randconfig-r2102-20261119    gcc-15.3.0 cocci
parisc               randconfig-r2108-20261119    gcc-15.3.0 cocci
parisc               randconfig-r2109-20261119    gcc-15.3.0 cocci
parisc               randconfig-r2109-20261119    gcc-8.5.0  cocci
parisc               randconfig-r2302-20261119    gcc-8.5.0  sparse
parisc               randconfig-r2304-20261119    clang-22   sparse
parisc               randconfig-r2309-20261119    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       chrp32_defconfig    gcc-16.2.0
powerpc                       ep88xc_defconfig    gcc-16.2.0
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                      ppa8548_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261120    gcc-11.5.0
powerpc               randconfig-1000-20261121    gcc-10.5.0
powerpc               randconfig-1001-20261120    gcc-11.5.0
powerpc               randconfig-1001-20261121    gcc-10.5.0
powerpc               randconfig-2000-20261119    gcc-15.3.0
powerpc               randconfig-2001-20261119    gcc-15.3.0
powerpc               randconfig-2002-20261119    gcc-15.3.0
powerpc               randconfig-2200-20261119    gcc-13.5.0 smatch
powerpc              randconfig-r2102-20261119    gcc-8.5.0  cocci
powerpc              randconfig-r2105-20261119    clang-22   cocci
powerpc              randconfig-r2105-20261119    gcc-15.3.0 cocci
powerpc              randconfig-r2106-20261119    clang-24   cocci
powerpc              randconfig-r2108-20261119    clang-24   cocci
powerpc              randconfig-r2300-20261119    clang-24   sparse
powerpc              randconfig-r2303-20261119    clang-22   sparse
powerpc              randconfig-r2307-20261119    clang-24   sparse
powerpc              randconfig-r2307-20261119    gcc-13.5.0 sparse
powerpc                      taishan_defconfig    gcc-16.2.0
powerpc                      tqm5200_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261120    gcc-11.5.0
powerpc64             randconfig-1000-20261121    gcc-10.5.0
powerpc64             randconfig-1001-20261120    gcc-11.5.0
powerpc64             randconfig-1001-20261121    gcc-10.5.0
powerpc64             randconfig-2000-20261119    gcc-15.3.0
powerpc64             randconfig-2001-20261119    gcc-15.3.0
powerpc64             randconfig-2002-20261119    gcc-15.3.0
powerpc64             randconfig-2200-20261119    clang-24   smatch
powerpc64            randconfig-r2101-20261119    gcc-10.5.0 cocci
powerpc64            randconfig-r2103-20261119    clang-22   cocci
powerpc64            randconfig-r2103-20261119    gcc-10.5.0 cocci
powerpc64            randconfig-r2105-20261119    gcc-10.5.0 cocci
powerpc64            randconfig-r2109-20261119    clang-24   cocci
powerpc64            randconfig-r2110-20261119    gcc-15.3.0 cocci
powerpc64            randconfig-r2305-20261119    clang-24   sparse
powerpc64            randconfig-r2309-20261119    gcc-10.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261120    gcc-11.5.0
riscv                 randconfig-1001-20261120    gcc-11.5.0
riscv                 randconfig-2000-20261119    clang-24
riscv                 randconfig-2001-20261119    clang-24
riscv                 randconfig-2002-20261119    clang-24
riscv                 randconfig-2003-20261119    clang-24
riscv                 randconfig-2004-20261119    clang-24
riscv                 randconfig-2005-20261119    clang-24
riscv                 randconfig-2200-20261119    clang-24   smatch
riscv                randconfig-r2101-20261119    gcc-8.5.0  cocci
riscv                randconfig-r2104-20261119    gcc-13.5.0 cocci
riscv                randconfig-r2300-20261119    clang-22   sparse
riscv                randconfig-r2305-20261119    clang-24   sparse
riscv                randconfig-r2306-20261119    clang-24   sparse
riscv                randconfig-r2309-20261119    gcc-11.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261120    gcc-11.5.0
s390                  randconfig-1001-20261120    gcc-11.5.0
s390                  randconfig-2000-20261119    clang-20
s390                  randconfig-2001-20261119    clang-20
s390                  randconfig-2002-20261119    clang-20
s390                  randconfig-2003-20261119    clang-20
s390                  randconfig-2004-20261119    clang-20
s390                  randconfig-2005-20261119    clang-20
s390                  randconfig-2200-20261119    clang-24   smatch
s390                 randconfig-r2100-20261119    gcc-15.3.0 cocci
s390                 randconfig-r2101-20261119    gcc-10.5.0 cocci
s390                 randconfig-r2103-20261119    gcc-11.5.0 cocci
s390                 randconfig-r2104-20261119    gcc-11.5.0 cocci
s390                 randconfig-r2104-20261119    gcc-15.3.0 cocci
s390                 randconfig-r2105-20261119    gcc-13.5.0 cocci
s390                 randconfig-r2108-20261119    gcc-8.5.0  cocci
s390                 randconfig-r2110-20261119    gcc-16.2.0 cocci
s390                 randconfig-r2303-20261119    clang-24   sparse
s390                 randconfig-r2304-20261119    clang-24   sparse
s390                 randconfig-r2306-20261119    clang-24   sparse
s390                 randconfig-r2307-20261119    clang-24   sparse
s390                 randconfig-r2309-20261119    clang-17   sparse
s390                 randconfig-r2310-20261119    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                                j2_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261120    gcc-11.5.0
sh                    randconfig-1001-20261120    gcc-11.5.0
sh                    randconfig-2000-20261119    gcc-12.5.0
sh                    randconfig-2001-20261119    gcc-12.5.0
sh                    randconfig-2002-20261119    gcc-12.5.0
sh                    randconfig-2003-20261119    gcc-12.5.0
sh                    randconfig-2004-20261119    gcc-12.5.0
sh                    randconfig-2005-20261119    gcc-12.5.0
sh                    randconfig-2200-20261119    gcc-16.2.0 smatch
sh                   randconfig-r2106-20261119    gcc-8.5.0  cocci
sh                   randconfig-r2107-20261119    gcc-8.5.0  cocci
sh                   randconfig-r2108-20261119    clang-24   cocci
sh                   randconfig-r2110-20261119    gcc-8.5.0  cocci
sh                   randconfig-r2111-20261119    clang-24   cocci
sh                   randconfig-r2300-20261119    gcc-16.2.0 sparse
sh                   randconfig-r2301-20261119    gcc-8.5.0  sparse
sh                   randconfig-r2303-20261119    gcc-16.2.0 sparse
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7780_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261120    clang-24
sparc                 randconfig-1001-20261120    clang-24
sparc                 randconfig-2000-20261119    clang-21
sparc                 randconfig-2001-20261119    clang-21
sparc                 randconfig-2200-20261119    gcc-8.5.0  smatch
sparc                randconfig-r2102-20261119    gcc-11.5.0 cocci
sparc                randconfig-r2103-20261119    gcc-8.5.0  cocci
sparc                randconfig-r2107-20261119    clang-24   cocci
sparc                randconfig-r2111-20261119    gcc-8.5.0  cocci
sparc                randconfig-r2302-20261119    clang-24   sparse
sparc                randconfig-r2304-20261119    gcc-8.5.0  sparse
sparc                randconfig-r2305-20261119    clang-22   sparse
sparc                randconfig-r2310-20261119    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261120    clang-24
sparc64               randconfig-1001-20261120    clang-24
sparc64               randconfig-2000-20261119    clang-21
sparc64               randconfig-2001-20261119    clang-21
sparc64               randconfig-2200-20261119    gcc-13.5.0 smatch
sparc64              randconfig-r2100-20261119    gcc-11.5.0 cocci
sparc64              randconfig-r2102-20261119    gcc-13.5.0 cocci
sparc64              randconfig-r2103-20261119    gcc-11.5.0 cocci
sparc64              randconfig-r2105-20261119    gcc-11.5.0 cocci
sparc64              randconfig-r2106-20261119    gcc-11.5.0 cocci
sparc64              randconfig-r2106-20261119    gcc-8.5.0  cocci
sparc64              randconfig-r2107-20261119    gcc-16.2.0 cocci
sparc64              randconfig-r2300-20261119    clang-24   sparse
sparc64              randconfig-r2301-20261119    clang-24   sparse
sparc64              randconfig-r2308-20261119    clang-24   sparse
sparc64              randconfig-r2310-20261119    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261120    clang-24
um                    randconfig-1001-20261120    clang-24
um                    randconfig-2000-20261119    clang-21
um                    randconfig-2001-20261119    clang-21
um                    randconfig-2200-20261120    clang-24   smatch
um                   randconfig-r2101-20261119    gcc-11.5.0 cocci
um                   randconfig-r2104-20261119    gcc-10.5.0 cocci
um                   randconfig-r2106-20261119    clang-24   cocci
um                   randconfig-r2106-20261119    gcc-8.5.0  cocci
um                   randconfig-r2108-20261119    gcc-14     cocci
um                   randconfig-r2109-20261119    gcc-8.5.0  cocci
um                   randconfig-r2110-20261119    gcc-11.5.0 cocci
um                   randconfig-r2300-20261119    gcc-16.2.0 sparse
um                   randconfig-r2303-20261119    clang-24   sparse
um                   randconfig-r2310-20261119    gcc-10.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.2.0
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261120    clang-22
x86_64      buildonly-randconfig-1001-20261120    clang-22
x86_64      buildonly-randconfig-1002-20261120    clang-22
x86_64      buildonly-randconfig-1003-20261120    clang-22
x86_64      buildonly-randconfig-1004-20261120    clang-22
x86_64      buildonly-randconfig-1005-20261120    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261120    clang-22
x86_64                randconfig-1001-20261120    clang-22
x86_64                randconfig-1002-20261120    clang-22
x86_64                randconfig-1003-20261120    clang-22
x86_64                randconfig-1004-20261120    clang-22
x86_64                randconfig-1005-20261120    clang-22
x86_64                randconfig-1006-20261120    clang-22
x86_64                randconfig-1007-20261120    clang-22
x86_64                randconfig-1008-20261120    clang-22
x86_64                randconfig-1009-20261120    clang-22
x86_64                randconfig-1010-20261120    clang-22
x86_64                randconfig-1011-20261120    clang-22
x86_64                randconfig-1012-20261120    clang-22
x86_64                randconfig-1013-20261120    clang-22
x86_64                randconfig-1014-20261120    clang-22
x86_64                randconfig-1015-20261120    clang-22
x86_64                randconfig-1016-20261120    clang-22
x86_64                randconfig-1017-20261120    clang-22
x86_64                randconfig-2000-20261119    clang-22
x86_64                randconfig-2001-20261119    clang-22
x86_64                randconfig-2002-20261119    clang-22
x86_64                randconfig-2003-20261119    clang-22
x86_64                randconfig-2004-20261119    clang-22
x86_64                randconfig-2005-20261119    clang-22
x86_64                randconfig-2100-20261119    clang-22   cocci
x86_64                randconfig-2101-20261119    clang-22   cocci
x86_64                randconfig-2102-20261119    clang-22   cocci
x86_64                randconfig-2103-20261119    clang-22   cocci
x86_64                randconfig-2104-20261119    clang-22   cocci
x86_64                randconfig-2105-20261119    clang-22   cocci
x86_64                randconfig-2200-20261119    clang-22   smatch
x86_64                randconfig-2300-20261119    gcc-14     sparse
x86_64                randconfig-2301-20261119    gcc-14     sparse
x86_64                randconfig-2302-20261119    gcc-14     sparse
x86_64               randconfig-r2103-20261119    gcc-15.3.0 cocci
x86_64               randconfig-r2105-20261119    gcc-10.5.0 cocci
x86_64               randconfig-r2110-20261119    clang-24   cocci
x86_64               randconfig-r2111-20261119    gcc-15.3.0 cocci
x86_64               randconfig-r2111-20261119    gcc-16.2.0 cocci
x86_64               randconfig-r2300-20261119    clang-22   sparse
x86_64               randconfig-r2304-20261119    gcc-16.2.0 sparse
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
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   cadence_csp_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261120    clang-24
xtensa                randconfig-1001-20261120    clang-24
xtensa                randconfig-2000-20261119    gcc-16.2.0
xtensa                randconfig-2001-20261119    gcc-16.2.0
xtensa                randconfig-2200-20261119    gcc-14.4.0 smatch
xtensa               randconfig-r2100-20261119    gcc-15.3.0 cocci
xtensa               randconfig-r2100-20261119    gcc-8.5.0  cocci
xtensa               randconfig-r2101-20261119    gcc-15.3.0 cocci
xtensa               randconfig-r2105-20261119    gcc-15.3.0 cocci
xtensa               randconfig-r2108-20261119    gcc-11.5.0 cocci
xtensa               randconfig-r2109-20261119    clang-24   cocci
xtensa               randconfig-r2109-20261119    gcc-8.5.0  cocci
xtensa               randconfig-r2301-20261119    clang-22   sparse
xtensa               randconfig-r2301-20261119    gcc-16.2.0 sparse
xtensa               randconfig-r2303-20261119    gcc-8.5.0  sparse
xtensa               randconfig-r2308-20261119    clang-17   sparse
xtensa               randconfig-r2310-20261119    gcc-13.5.0 sparse
xtensa               randconfig-r2311-20261119    clang-24   sparse
xtensa                     xip_kc705_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

