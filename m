Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D56606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o9JnyJYq;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PtgwddLj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TNdoa3h0o4eQB+z9aBvL9RP3lKFfz1f7C1txhVUju64=; b=o9JnyJYqcgrDdbX0+GgB7YlS4h
	wh/qXuV6wqcHWmr2J+ppdVc+GMc2RyOFtWzBFP2pS15nk2jQZTvQvZ0lJLs3GQPt1155jDo/c8UT2
	xtfCkI+MpuYe3MuFWNwEgGNLNO7SUyiPXFripddzvf1auqWjqMKzY6CajQTPW5o3ZpUh2i8P6Zn71
	B1xPTubynJrnOOa+Jm4HBBjTyAY5CmXN9pOKCpgFZMmyoAN+YXPLp1etl2VvPFgc3DhLVnP5UiEHe
	a0YWuu40TT8u3lbLm2K9z9n+twr5Sp7oRn/Sq7WvQXWs2C97a1/caV9eJzxV4wGBndmKjAnkQZZ78
	8RtDYniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyk9-0000000360Z-0Ywa;
	Mon, 16 Nov 2026 15:35:41 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyk6-000000035zm-1mTE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 15:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794843339; x=1826379339;
  h=date:from:to:cc:subject:message-id;
  bh=lcwsEpc5OdD3v+3epzxg2/g5uGzDG7K4RzXFr9Iwuyo=;
  b=PtgwddLjUtzq/jItj7BjUehu/jh3zT2/tCTYVMhra0ENFEygwPfjC6Rs
   3aY4OSaGn59J8re36jlrjFjAZfFRrygt13gJkqeWAT+7dPwYBqjiyry7C
   LgyLVuEZNLgl8oWsVjUH0iDBPeJCfffSrAsFnP8HYzS9a8UUl7iXqhzWT
   09Ny3+70/d0t8N5h9cD3eS0+VyAGITDdi+ICPtUPYxtdBTR3QLwjX+a8w
   /5d0aPV+rNlgvyDOl8sSQ80YeUPgayTR1ZsHs/erabp4VXPE8lPyWapMf
   SAbDrA9wDG5lGJkNH5gdrCK4abUAIsho0n0kmRqqM95s3ayFdTJ9+w/2P
   A==;
X-CSE-ConnectionGUID: zPRFIFa/RI+TIvpa7on2kg==
X-CSE-MsgGUID: LfPH0eBxQdqRafDrInDvgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3478217"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3478217"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 07:35:38 -0800
X-CSE-ConnectionGUID: cV3g9sn0TmK5NPmTGfbk6A==
X-CSE-MsgGUID: jgzyKXbqRQOOMY/YflRMsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9590580"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2026 07:35:36 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSyk2-000000018qP-0ZKo;
	Mon, 16 Nov 2026 15:35:34 +0000
Date: Mon, 16 Nov 2026 23:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-dma40-powerdomain] BUILD SUCCESS
 9db33f8c4d7357e1cfc3565dd962ae661f920029
Message-ID: <20261116233457.n5mj4qcW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_073538_524025_0A5856D7 
X-CRM114-Status: UNSURE (   5.43  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-dma40-powerdomain
branch HEAD: 9db33f8c4d7357e1cfc3565dd962ae661f920029  dmaengine: ste_dma40: Use power domain for LCLA SRAM

elapsed time: 1087m

configs tested: 486
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261116    gcc-10.5.0
alpha                 randconfig-2000-20261116    gcc-8.5.0
alpha                 randconfig-2001-20261116    gcc-10.5.0
alpha                 randconfig-2001-20261116    gcc-15.3.0
alpha                 randconfig-2200-20261116    gcc-15.3.0 smatch
alpha                randconfig-r2101-20261116    gcc-15.3.0 cocci
alpha                randconfig-r2109-20261116    gcc-9.5.0  cocci
alpha                randconfig-r2311-20261116    gcc-10.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    clang-24
arc                         nsimosci_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261116    gcc-8.5.0
arc                   randconfig-1001-20261116    gcc-8.5.0
arc                   randconfig-2000-20261116    gcc-13.5.0
arc                   randconfig-2001-20261116    gcc-13.5.0
arc                   randconfig-2002-20261116    gcc-13.5.0
arc                   randconfig-2003-20261116    gcc-13.5.0
arc                   randconfig-2004-20261116    gcc-13.5.0
arc                   randconfig-2005-20261116    gcc-13.5.0
arc                   randconfig-2200-20261116    gcc-15.3.0 smatch
arc                  randconfig-r2104-20261116    gcc-14.4.0 cocci
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                          at91_dt_defconfig    gcc-16.2.0
arm                          bcm2835_defconfig    clang-24
arm                      davinci_all_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    clang-17
arm                           gemini_defconfig    clang-24
arm                           moxart_defconfig    clang-24
arm                             mps2_defconfig    clang-24
arm                        multi_v4t_defconfig    clang-24
arm                              mxs_defconfig    clang-17
arm                         neponset_defconfig    gcc-16.2.0
arm                        netwinder_defconfig    gcc-16.2.0
arm                          orion5x_defconfig    clang-17
arm                          orion5x_defconfig    gcc-16.2.0
arm                              pxa_defconfig    gcc-14
arm                   randconfig-1000-20261116    gcc-8.5.0
arm                   randconfig-1001-20261116    gcc-8.5.0
arm                   randconfig-1002-20261116    gcc-8.5.0
arm                   randconfig-1003-20261116    gcc-8.5.0
arm                   randconfig-2000-20261116    gcc-15.3.0
arm                   randconfig-2001-20261116    clang-24
arm                   randconfig-2001-20261116    gcc-15.3.0
arm                   randconfig-2002-20261116    gcc-15.3.0
arm                   randconfig-2002-20261116    gcc-8.5.0
arm                   randconfig-2200-20261116    gcc-13.5.0 smatch
arm                  randconfig-r2108-20261116    clang-17   cocci
arm                  randconfig-r2300-20261116    clang-24   sparse
arm                  randconfig-r2302-20261116    clang-24   sparse
arm                  randconfig-r2303-20261116    gcc-14.4.0 sparse
arm                  randconfig-r2308-20261116    gcc-10.5.0 sparse
arm                         realview_defconfig    clang-17
arm                          s3c6400_defconfig    clang-24
arm                         shmobile_defconfig    clang-24
arm                        spear13xx_defconfig    clang-17
arm                            spitz_defconfig    gcc-16.2.0
arm                            stm32_defconfig    gcc-16.2.0
arm                            tegra_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261116    gcc-10.5.0
arm64                 randconfig-1001-20261116    gcc-10.5.0
arm64                 randconfig-1002-20261116    gcc-10.5.0
arm64                 randconfig-1003-20261116    gcc-10.5.0
arm64                 randconfig-2000-20261116    gcc-15.3.0
arm64                 randconfig-2000-20261116    gcc-8.5.0
arm64                 randconfig-2001-20261116    clang-18
arm64                 randconfig-2001-20261116    gcc-15.3.0
arm64                 randconfig-2002-20261116    gcc-14.4.0
arm64                 randconfig-2002-20261116    gcc-15.3.0
arm64                 randconfig-2200-20261116    gcc-8.5.0  smatch
arm64                randconfig-r2109-20261116    clang-17   cocci
arm64                randconfig-r2309-20261116    gcc-10.5.0 sparse
csky                              alldefconfig    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261116    gcc-10.5.0
csky                  randconfig-1001-20261116    gcc-10.5.0
csky                  randconfig-2000-20261116    gcc-16.2.0
csky                  randconfig-2001-20261116    gcc-15.3.0
csky                  randconfig-2001-20261116    gcc-16.2.0
csky                  randconfig-2200-20261116    gcc-16.2.0 smatch
csky                 randconfig-r2102-20261116    gcc-16.2.0 cocci
csky                 randconfig-r2102-20261116    gcc-8.5.0  cocci
csky                 randconfig-r2105-20261116    gcc-12.5.0 cocci
csky                 randconfig-r2304-20261116    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261116    clang-17
hexagon               randconfig-1001-20261116    clang-17
hexagon               randconfig-2000-20261116    clang-24
hexagon               randconfig-2000-20261116    gcc-16.2.0
hexagon               randconfig-2001-20261116    clang-21
hexagon               randconfig-2001-20261116    gcc-16.2.0
hexagon               randconfig-2200-20261116    clang-17   smatch
hexagon              randconfig-r2106-20261116    clang-24   cocci
hexagon              randconfig-r2110-20261116    clang-17   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261116    gcc-14
i386        buildonly-randconfig-1001-20261116    gcc-14
i386        buildonly-randconfig-1002-20261116    gcc-14
i386        buildonly-randconfig-1003-20261116    gcc-14
i386        buildonly-randconfig-1004-20261116    gcc-14
i386        buildonly-randconfig-1005-20261116    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261116    gcc-14
i386                  randconfig-1001-20261116    gcc-14
i386                  randconfig-1002-20261116    gcc-14
i386                  randconfig-1003-20261116    gcc-14
i386                  randconfig-1004-20261116    gcc-14
i386                  randconfig-1005-20261116    gcc-14
i386                  randconfig-1006-20261116    gcc-14
i386                  randconfig-1007-20261116    gcc-12
i386                  randconfig-1008-20261116    gcc-12
i386                  randconfig-1009-20261116    gcc-12
i386                  randconfig-1010-20261116    gcc-12
i386                  randconfig-1011-20261116    gcc-12
i386                  randconfig-1012-20261116    gcc-12
i386                  randconfig-1013-20261116    gcc-12
i386                  randconfig-2000-20261116    gcc-14
i386                  randconfig-2001-20261116    gcc-14
i386                  randconfig-2002-20261116    gcc-14
i386                  randconfig-2003-20261116    gcc-14
i386                  randconfig-2004-20261116    gcc-14
i386                  randconfig-2005-20261116    gcc-14
i386                  randconfig-2100-20261115    clang-22   cocci
i386                  randconfig-2100-20261116    gcc-14     cocci
i386                  randconfig-2101-20261115    clang-22   cocci
i386                  randconfig-2101-20261116    gcc-14     cocci
i386                  randconfig-2102-20261115    clang-22   cocci
i386                  randconfig-2102-20261116    gcc-14     cocci
i386                  randconfig-2103-20261115    gcc-14     cocci
i386                  randconfig-2103-20261116    gcc-14     cocci
i386                  randconfig-2104-20261115    gcc-14     cocci
i386                  randconfig-2104-20261116    gcc-14     cocci
i386                  randconfig-2105-20261115    gcc-14     cocci
i386                  randconfig-2105-20261116    gcc-14     cocci
i386                  randconfig-2200-20261116    gcc-14     smatch
i386                 randconfig-r2100-20261116    gcc-16.2.0 cocci
i386                 randconfig-r2102-20261116    gcc-16.2.0 cocci
i386                 randconfig-r2103-20261116    gcc-14     cocci
i386                 randconfig-r2304-20261116    clang-22   sparse
loongarch                         alldefconfig    gcc-16.2.0
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261116    clang-17
loongarch             randconfig-1001-20261116    clang-17
loongarch             randconfig-2000-20261116    clang-24
loongarch             randconfig-2000-20261116    gcc-11.5.0
loongarch             randconfig-2001-20261116    clang-24
loongarch             randconfig-2001-20261116    gcc-11.5.0
loongarch             randconfig-2200-20261116    clang-19   smatch
loongarch            randconfig-r2101-20261116    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261116    gcc-14.4.0 cocci
loongarch            randconfig-r2308-20261116    gcc-15.3.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-17
m68k                        m5249evb_defconfig    clang-17
m68k                        m5249evb_defconfig    gcc-14
m68k                         m5272c3_defconfig    gcc-14
m68k                        m5282evb_defconfig    gcc-14
m68k                        m5282evb_defconfig    gcc-16.2.0
m68k                        m5329evb_defconfig    clang-17
m68k                           multi_defconfig    clang-24
m68k                  randconfig-2000-20261116    gcc-10.5.0
m68k                  randconfig-2000-20261116    gcc-12.5.0
m68k                  randconfig-2001-20261116    gcc-10.5.0
m68k                  randconfig-2200-20261116    gcc-14.4.0 smatch
m68k                 randconfig-r2106-20261116    gcc-9.5.0  cocci
m68k                 randconfig-r2108-20261116    gcc-8.5.0  cocci
m68k                 randconfig-r2301-20261116    gcc-8.5.0  sparse
m68k                            virt_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze                       mmu_defconfig    gcc-16.2.0
microblaze            randconfig-2000-20261116    gcc-10.5.0
microblaze            randconfig-2000-20261116    gcc-8.5.0
microblaze            randconfig-2001-20261116    gcc-10.5.0
microblaze            randconfig-2001-20261116    gcc-15.3.0
microblaze            randconfig-2200-20261116    gcc-11.5.0 smatch
microblaze           randconfig-r2101-20261116    gcc-12.5.0 cocci
microblaze           randconfig-r2110-20261116    gcc-9.5.0  cocci
microblaze           randconfig-r2300-20261116    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    clang-17
mips                   cavium_octeon_defconfig    clang-17
mips                            ip27_defconfig    gcc-14
mips                            ip28_defconfig    clang-24
mips                            ip30_defconfig    gcc-16.2.0
mips                            jazz_defconfig    gcc-14
mips                         omega2p_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261115    clang-17
mips                  randconfig-2000-20261116    gcc-13.5.0
mips                  randconfig-2001-20261115    clang-20
mips                  randconfig-2001-20261116    gcc-13.5.0
mips                  randconfig-2002-20261115    clang-24
mips                  randconfig-2002-20261116    gcc-13.5.0
mips                  randconfig-2200-20261116    gcc-8.5.0  smatch
mips                 randconfig-r2103-20261116    gcc-12.5.0 cocci
mips                 randconfig-r2107-20261116    clang-17   cocci
mips                 randconfig-r2108-20261116    gcc-14.4.0 cocci
mips                 randconfig-r2305-20261116    gcc-15.3.0 sparse
mips                 randconfig-r2309-20261116    gcc-16.2.0 sparse
mips                 randconfig-r2310-20261116    gcc-15.3.0 sparse
mips                           rb532_defconfig    clang-24
mips                        rbtx49xx_defconfig    gcc-16.2.0
mips                            rs90_defconfig    clang-17
mips                    sb1250_swarm_defconfig    clang-17
nios2                             alldefconfig    clang-17
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261116    clang-17
nios2                 randconfig-1001-20261116    clang-17
nios2                 randconfig-2000-20261116    gcc-11.5.0
nios2                 randconfig-2001-20261116    gcc-11.5.0
nios2                 randconfig-2200-20261116    gcc-11.5.0 smatch
nios2                randconfig-r2107-20261116    gcc-9.5.0  cocci
nios2                randconfig-r2108-20261116    gcc-9.5.0  cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261115    gcc-10.5.0
openrisc              randconfig-2000-20261116    gcc-13.5.0
openrisc              randconfig-2001-20261115    gcc-12.5.0
openrisc              randconfig-2001-20261116    gcc-13.5.0
openrisc              randconfig-2002-20261115    gcc-10.5.0
openrisc              randconfig-2002-20261116    gcc-13.5.0
openrisc              randconfig-2200-20261116    gcc-15.3.0 smatch
openrisc             randconfig-r2105-20261116    gcc-8.5.0  cocci
openrisc             randconfig-r2109-20261116    gcc-16.2.0 cocci
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261116    gcc-16.2.0
parisc                randconfig-1001-20261116    gcc-16.2.0
parisc                randconfig-2000-20261116    gcc-11.5.0
parisc                randconfig-2000-20261116    gcc-15.3.0
parisc                randconfig-2001-20261116    gcc-11.5.0
parisc                randconfig-2001-20261116    gcc-9.5.0
parisc                randconfig-2200-20261116    gcc-8.5.0  smatch
parisc               randconfig-r2101-20261116    gcc-16.2.0 cocci
parisc               randconfig-r2102-20261116    gcc-12.5.0 cocci
parisc               randconfig-r2305-20261116    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.2.0
powerpc                       bamboo_defconfig    gcc-16.2.0
powerpc                        eiger_defconfig    clang-17
powerpc                   iss476-smp_defconfig    gcc-16.2.0
powerpc                   mpc885_ads_defconfig    clang-24
powerpc                      powernv_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261116    gcc-16.2.0
powerpc               randconfig-1001-20261116    gcc-16.2.0
powerpc               randconfig-2000-20261116    clang-17
powerpc               randconfig-2001-20261116    clang-17
powerpc               randconfig-2002-20261116    clang-17
powerpc               randconfig-2200-20261116    clang-22   smatch
powerpc              randconfig-r2106-20261116    gcc-14.4.0 cocci
powerpc              randconfig-r2306-20261116    gcc-10.5.0 sparse
powerpc                     sam440ep_defconfig    clang-24
powerpc                     socrates_defconfig    gcc-16.2.0
powerpc                      tqm5200_defconfig    gcc-16.2.0
powerpc                      tqm8548_defconfig    clang-24
powerpc64             randconfig-1000-20261116    gcc-16.2.0
powerpc64             randconfig-1001-20261116    gcc-16.2.0
powerpc64             randconfig-2000-20261116    clang-17
powerpc64             randconfig-2001-20261116    clang-17
powerpc64             randconfig-2002-20261116    clang-17
powerpc64             randconfig-2200-20261116    clang-19   smatch
powerpc64            randconfig-r2100-20261116    gcc-16.2.0 cocci
powerpc64            randconfig-r2305-20261116    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261116    clang-17
riscv                 randconfig-1001-20261116    clang-17
riscv                 randconfig-2000-20261116    clang-20
riscv                 randconfig-2001-20261116    clang-20
riscv                 randconfig-2002-20261116    clang-20
riscv                 randconfig-2003-20261116    clang-20
riscv                 randconfig-2004-20261116    clang-20
riscv                 randconfig-2005-20261116    clang-20
riscv                 randconfig-2200-20261116    clang-24   smatch
riscv                randconfig-r2100-20261116    gcc-12.5.0 cocci
riscv                randconfig-r2111-20261116    gcc-9.5.0  cocci
riscv                randconfig-r2304-20261116    gcc-15.3.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261116    clang-17
s390                  randconfig-1001-20261116    clang-17
s390                  randconfig-2000-20261116    clang-17
s390                  randconfig-2001-20261116    clang-17
s390                  randconfig-2001-20261116    clang-24
s390                  randconfig-2002-20261116    clang-17
s390                  randconfig-2002-20261116    gcc-12.5.0
s390                  randconfig-2003-20261116    clang-17
s390                  randconfig-2003-20261116    gcc-8.5.0
s390                  randconfig-2004-20261116    clang-17
s390                  randconfig-2004-20261116    gcc-12.5.0
s390                  randconfig-2005-20261116    clang-17
s390                  randconfig-2200-20261116    gcc-10.5.0 smatch
s390                 randconfig-r2106-20261116    clang-17   cocci
s390                 randconfig-r2303-20261116    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                              espt_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261116    clang-17
sh                    randconfig-1001-20261116    clang-17
sh                    randconfig-2000-20261116    gcc-15.3.0
sh                    randconfig-2000-20261116    gcc-9.5.0
sh                    randconfig-2001-20261116    gcc-11.5.0
sh                    randconfig-2001-20261116    gcc-15.3.0
sh                    randconfig-2002-20261116    gcc-13.5.0
sh                    randconfig-2002-20261116    gcc-15.3.0
sh                    randconfig-2003-20261116    gcc-15.3.0
sh                    randconfig-2004-20261116    gcc-15.3.0
sh                    randconfig-2004-20261116    gcc-16.2.0
sh                    randconfig-2005-20261116    gcc-15.3.0
sh                    randconfig-2200-20261116    gcc-15.3.0 smatch
sh                   randconfig-r2104-20261116    gcc-16.2.0 cocci
sh                   randconfig-r2107-20261116    gcc-16.2.0 cocci
sh                   randconfig-r2300-20261116    gcc-15.3.0 sparse
sh                   randconfig-r2301-20261116    gcc-15.3.0 sparse
sh                   randconfig-r2306-20261116    gcc-15.3.0 sparse
sh                           rsk7201_defconfig    gcc-16.2.0
sh                           sdk7780_defconfig    gcc-16.2.0
sh                           sdk7786_defconfig    clang-17
sh                            se7206_defconfig    clang-17
sh                    sh7724_generic_defconfig    gcc-14
sh                               ul2_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261116    gcc-16.2.0
sparc                 randconfig-1001-20261116    gcc-16.2.0
sparc                 randconfig-2000-20261116    gcc-14
sparc                 randconfig-2001-20261116    gcc-14
sparc                 randconfig-2200-20261116    gcc-15.3.0 smatch
sparc                randconfig-r2103-20261116    gcc-8.5.0  cocci
sparc                randconfig-r2107-20261116    gcc-14.4.0 cocci
sparc                randconfig-r2110-20261116    gcc-14.4.0 cocci
sparc                randconfig-r2111-20261116    gcc-16.2.0 cocci
sparc                randconfig-r2311-20261116    gcc-15.3.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261116    gcc-16.2.0
sparc64               randconfig-1001-20261116    gcc-16.2.0
sparc64               randconfig-2000-20261116    gcc-14
sparc64               randconfig-2001-20261116    gcc-14
sparc64               randconfig-2200-20261116    gcc-8.5.0  smatch
sparc64              randconfig-r2103-20261116    gcc-16.2.0 cocci
sparc64              randconfig-r2104-20261116    gcc-8.5.0  cocci
sparc64              randconfig-r2307-20261116    gcc-15.3.0 sparse
sparc64              randconfig-r2307-20261116    gcc-16.2.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261116    gcc-16.2.0
um                    randconfig-1001-20261116    gcc-16.2.0
um                    randconfig-2000-20261116    gcc-14
um                    randconfig-2001-20261116    gcc-14
um                    randconfig-2200-20261116    gcc-14     smatch
um                   randconfig-r2104-20261116    gcc-12.5.0 cocci
um                   randconfig-r2302-20261116    gcc-8.5.0  sparse
um                   randconfig-r2303-20261116    gcc-15.3.0 sparse
um                   randconfig-r2309-20261116    gcc-15.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261116    gcc-14
x86_64      buildonly-randconfig-1001-20261116    gcc-14
x86_64      buildonly-randconfig-1002-20261116    gcc-14
x86_64      buildonly-randconfig-1003-20261116    gcc-14
x86_64      buildonly-randconfig-1004-20261116    gcc-14
x86_64      buildonly-randconfig-1005-20261116    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261116    gcc-14
x86_64                randconfig-1001-20261116    gcc-14
x86_64                randconfig-1002-20261116    gcc-14
x86_64                randconfig-1003-20261116    gcc-14
x86_64                randconfig-1004-20261116    gcc-14
x86_64                randconfig-1005-20261116    gcc-14
x86_64                randconfig-1006-20261116    clang-22
x86_64                randconfig-1007-20261116    clang-22
x86_64                randconfig-1008-20261116    clang-22
x86_64                randconfig-1009-20261116    clang-22
x86_64                randconfig-1010-20261116    clang-22
x86_64                randconfig-1011-20261116    clang-22
x86_64                randconfig-1012-20261116    clang-22
x86_64                randconfig-1013-20261116    clang-22
x86_64                randconfig-1014-20261116    clang-22
x86_64                randconfig-1015-20261116    clang-22
x86_64                randconfig-1016-20261116    clang-22
x86_64                randconfig-1017-20261116    clang-22
x86_64                randconfig-2000-20261116    gcc-14
x86_64                randconfig-2001-20261116    gcc-14
x86_64                randconfig-2002-20261116    gcc-14
x86_64                randconfig-2003-20261116    gcc-14
x86_64                randconfig-2004-20261116    gcc-14
x86_64                randconfig-2005-20261116    gcc-14
x86_64                randconfig-2100-20261115    clang-22   cocci
x86_64                randconfig-2100-20261116    gcc-14     cocci
x86_64                randconfig-2101-20261115    clang-22   cocci
x86_64                randconfig-2101-20261116    gcc-14     cocci
x86_64                randconfig-2102-20261115    gcc-14     cocci
x86_64                randconfig-2102-20261116    gcc-14     cocci
x86_64                randconfig-2103-20261115    clang-22   cocci
x86_64                randconfig-2103-20261116    gcc-14     cocci
x86_64                randconfig-2104-20261115    gcc-14     cocci
x86_64                randconfig-2104-20261116    gcc-14     cocci
x86_64                randconfig-2105-20261115    gcc-14     cocci
x86_64                randconfig-2105-20261116    gcc-14     cocci
x86_64                randconfig-2200-20261115    clang-22   smatch
x86_64                randconfig-2200-20261116    clang-22   smatch
x86_64               randconfig-r2105-20261116    gcc-16.2.0 cocci
x86_64               randconfig-r2302-20261116    gcc-15.3.0 sparse
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
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                   nommu_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261116    gcc-16.2.0
xtensa                randconfig-1001-20261116    gcc-16.2.0
xtensa                randconfig-2000-20261116    gcc-15.3.0
xtensa                randconfig-2000-20261116    gcc-16.2.0
xtensa                randconfig-2001-20261116    gcc-16.2.0
xtensa                randconfig-2001-20261116    gcc-8.5.0
xtensa                randconfig-2200-20261116    gcc-9.5.0  smatch
xtensa               randconfig-r2100-20261116    gcc-8.5.0  cocci
xtensa               randconfig-r2105-20261116    gcc-8.5.0  cocci
xtensa               randconfig-r2109-20261116    gcc-14.4.0 cocci
xtensa               randconfig-r2110-20261116    gcc-13.5.0 cocci
xtensa               randconfig-r2111-20261116    clang-17   cocci
xtensa               randconfig-r2306-20261116    gcc-16.2.0 sparse
xtensa               randconfig-r2307-20261116    gcc-10.5.0 sparse
xtensa               randconfig-r2308-20261116    gcc-16.2.0 sparse
xtensa               randconfig-r2310-20261116    gcc-10.5.0 sparse
xtensa               randconfig-r2310-20261116    gcc-16.2.0 sparse
xtensa               randconfig-r2311-20261116    gcc-16.2.0 sparse
xtensa                          virt_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

