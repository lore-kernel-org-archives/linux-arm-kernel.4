Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CEB606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r/3UkcMr;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iy74NpJE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=52B2iwhAumXwrY1GGEMdcH00uM5ido0v02qysai59gw=; b=r/3UkcMrkp5segmcZBe4MX2Sif
	D0c1Ac9Ua5DJcPB6mSg1zPtvOrfc1gukA6e1+Q4vj5dBU6MqgSf3sdKwXOolV0brGXlQPbLFoKCRS
	8NT718v8AxNEGJeCKWyiOIpz1/dm8I9urhiFr5qWFPJJ3Xu6iXchtm14eV2iV+vB369ZH2eh+5sGq
	NeEncG3q8Ge9isDcHYUHXbQu1Beb65dGc1QxdJ9wemAIncR+iMUqr3zjmF5ICiEBJQheDz2voJD1d
	qFIE7WsLmI9PezCftF7rk6tpiZZhjW1rtFGcnoagdtcunhJSel3p5MDdjPC/qvi1vxDAM8/dG/JNO
	YQZh/8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu5s-00000007JQZ-1Ugk;
	Tue, 24 Nov 2026 17:14:12 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu5p-00000007JPy-3EFw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795540450; x=1827076450;
  h=date:from:to:cc:subject:message-id;
  bh=Qa1zJH/ZdNMsthA77RLk9JiJSUPP5V/A2nE5EVYAK28=;
  b=Iy74NpJE4+c/5SC0ufGa3rhHwLVoAApSu3dciqHYeH6duVjCrgi/Gw4C
   qk8x9rYg1flM2CjaArULfkwQz1B3o+zHjy8F/TyzJvxQuUh4XrKR4LxjE
   Jli/1rtD1asL4AEAhmkp5udLxvv6LVGzlW+7aFIf2kuTP9eLieXwYZlQU
   kvtrAueE63R+FkxbQXZpRq9b7GMR/l10GPvG+dJ2mvYlW9C5ffvMM5X3V
   uDi8YEpjJrLLNFoKHAZxctYdm6D1qnSRGFtSwluIiEqTE+VkPfi0BdP0h
   Yt9wn49M4dTWQoOL4vC7UsuVLeOmr3rBDPczp1cQTrgIU3mfuNZHSUVbC
   w==;
X-CSE-ConnectionGUID: xkoAU/rfQymw6uA+QpGPoA==
X-CSE-MsgGUID: b5pajJeLSD2GJt04exs2bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4303860"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4303860"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:14:09 -0800
X-CSE-ConnectionGUID: iexkkhwfR/SNUaZ5kOjW5A==
X-CSE-MsgGUID: Zma5t31WQEC/lqvI9af51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11971531"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2026 09:14:07 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVu5l-00000001Poy-0Xfb;
	Tue, 24 Nov 2026 17:14:05 +0000
Date: Wed, 25 Nov 2026 01:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-dma40-powerdomain] BUILD SUCCESS
 658d9b4c387ee4ab8d07793898ff0e6ead9ef85a
Message-ID: <20261125011305.SURA2ZFu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_091409_853314_310F220E 
X-CRM114-Status: UNSURE (   6.08  )
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
branch HEAD: 658d9b4c387ee4ab8d07793898ff0e6ead9ef85a  dmaengine: ste_dma40: Use power domain for LCLA SRAM

elapsed time: 1474m

configs tested: 518
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261123    gcc-8.5.0
alpha                 randconfig-2001-20261123    gcc-8.5.0
alpha                 randconfig-2200-20261123    gcc-12.5.0 smatch
alpha                randconfig-r2101-20261123    gcc-8.5.0  cocci
alpha                randconfig-r2103-20261123    clang-24   cocci
alpha                randconfig-r2103-20261123    gcc-14     cocci
alpha                randconfig-r2106-20261123    gcc-14.4.0 cocci
alpha                randconfig-r2109-20261123    gcc-16.2.0 cocci
alpha                randconfig-r2110-20261123    gcc-13.5.0 cocci
alpha                randconfig-r2111-20261123    gcc-8.5.0  cocci
alpha                randconfig-r2301-20261123    gcc-11.5.0 sparse
alpha                randconfig-r2302-20261123    clang-24   sparse
alpha                randconfig-r2304-20261123    clang-24   sparse
alpha                randconfig-r2305-20261123    clang-24   sparse
alpha                randconfig-r2305-20261123    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                           axs103_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261124    clang-24
arc                   randconfig-1001-20261124    clang-24
arc                   randconfig-2000-20261123    gcc-12.5.0
arc                   randconfig-2001-20261123    gcc-12.5.0
arc                   randconfig-2002-20261123    gcc-12.5.0
arc                   randconfig-2003-20261123    gcc-12.5.0
arc                   randconfig-2004-20261123    gcc-12.5.0
arc                   randconfig-2005-20261123    gcc-12.5.0
arc                   randconfig-2200-20261123    gcc-12.5.0 smatch
arc                  randconfig-r2102-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2104-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2106-20261123    gcc-16.2.0 cocci
arc                  randconfig-r2107-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2109-20261123    gcc-15.3.0 cocci
arc                  randconfig-r2109-20261123    gcc-8.5.0  cocci
arc                  randconfig-r2111-20261123    clang-17   cocci
arc                  randconfig-r2300-20261123    gcc-11.5.0 sparse
arc                  randconfig-r2307-20261123    gcc-10.5.0 sparse
arc                  randconfig-r2307-20261123    gcc-8.5.0  sparse
arc                  randconfig-r2308-20261123    gcc-13.5.0 sparse
arc                  randconfig-r2308-20261123    gcc-8.5.0  sparse
arc                  randconfig-r2310-20261123    gcc-13.5.0 sparse
arc                  randconfig-r2310-20261123    gcc-8.5.0  sparse
arc                         vdk_hs38_defconfig    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       jornada720_defconfig    clang-24
arm                         multi_v5_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261124    clang-24
arm                   randconfig-1001-20261124    clang-24
arm                   randconfig-1002-20261124    clang-24
arm                   randconfig-1003-20261124    clang-24
arm                   randconfig-2000-20261123    gcc-8.5.0
arm                   randconfig-2001-20261123    gcc-8.5.0
arm                   randconfig-2002-20261123    gcc-8.5.0
arm                   randconfig-2200-20261123    gcc-8.5.0  smatch
arm                  randconfig-r2100-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2104-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2105-20261123    clang-24   cocci
arm                  randconfig-r2106-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261123    gcc-13.5.0 cocci
arm                  randconfig-r2302-20261123    clang-24   sparse
arm                  randconfig-r2305-20261123    gcc-9.5.0  sparse
arm                  randconfig-r2309-20261123    gcc-8.5.0  sparse
arm                         shmobile_defconfig    clang-24
arm                        spear13xx_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261124    gcc-8.5.0
arm64                 randconfig-1001-20261124    gcc-8.5.0
arm64                 randconfig-1002-20261124    gcc-8.5.0
arm64                 randconfig-1003-20261124    gcc-8.5.0
arm64                 randconfig-2000-20261123    gcc-8.5.0
arm64                 randconfig-2001-20261123    gcc-8.5.0
arm64                 randconfig-2002-20261123    gcc-8.5.0
arm64                 randconfig-2200-20261123    clang-17   smatch
arm64                randconfig-r2100-20261123    gcc-14     cocci
arm64                randconfig-r2105-20261123    gcc-14.4.0 cocci
arm64                randconfig-r2106-20261123    clang-17   cocci
arm64                randconfig-r2108-20261123    gcc-16.2.0 cocci
arm64                randconfig-r2109-20261123    clang-17   cocci
arm64                randconfig-r2300-20261123    clang-24   sparse
arm64                randconfig-r2301-20261123    gcc-14     sparse
arm64                randconfig-r2303-20261123    gcc-13.5.0 sparse
arm64                randconfig-r2309-20261123    gcc-13.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261124    gcc-8.5.0
csky                  randconfig-1001-20261124    gcc-8.5.0
csky                  randconfig-2000-20261123    gcc-12.5.0
csky                  randconfig-2001-20261123    gcc-12.5.0
csky                  randconfig-2200-20261123    gcc-16.2.0 smatch
csky                 randconfig-r2105-20261123    gcc-8.5.0  cocci
csky                 randconfig-r2107-20261123    clang-17   cocci
csky                 randconfig-r2107-20261123    gcc-8.5.0  cocci
csky                 randconfig-r2108-20261123    gcc-16.2.0 cocci
csky                 randconfig-r2111-20261123    gcc-14     cocci
csky                 randconfig-r2300-20261123    gcc-13.5.0 sparse
csky                 randconfig-r2302-20261123    gcc-16.2.0 sparse
csky                 randconfig-r2310-20261123    gcc-10.5.0 sparse
hexagon                           alldefconfig    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261124    gcc-10.5.0
hexagon               randconfig-1001-20261124    gcc-10.5.0
hexagon               randconfig-2000-20261123    gcc-12.5.0
hexagon               randconfig-2001-20261123    gcc-12.5.0
hexagon               randconfig-2200-20261123    clang-24   smatch
hexagon              randconfig-r2100-20261123    gcc-8.5.0  cocci
hexagon              randconfig-r2101-20261123    gcc-8.5.0  cocci
hexagon              randconfig-r2301-20261123    clang-24   sparse
hexagon              randconfig-r2303-20261123    clang-24   sparse
hexagon              randconfig-r2305-20261123    gcc-16.2.0 sparse
hexagon              randconfig-r2309-20261123    gcc-12.5.0 sparse
hexagon              randconfig-r2309-20261123    gcc-15.3.0 sparse
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261124    gcc-12
i386        buildonly-randconfig-1001-20261124    gcc-12
i386        buildonly-randconfig-1002-20261124    gcc-12
i386        buildonly-randconfig-1003-20261124    gcc-12
i386        buildonly-randconfig-1004-20261124    gcc-12
i386        buildonly-randconfig-1005-20261124    gcc-12
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261124    gcc-14
i386                  randconfig-1001-20261124    gcc-14
i386                  randconfig-1002-20261124    gcc-14
i386                  randconfig-1003-20261124    gcc-14
i386                  randconfig-1004-20261124    gcc-14
i386                  randconfig-1005-20261124    gcc-14
i386                  randconfig-1006-20261124    gcc-14
i386                  randconfig-2000-20261123    gcc-14
i386                  randconfig-2001-20261123    gcc-14
i386                  randconfig-2002-20261123    gcc-14
i386                  randconfig-2003-20261123    gcc-14
i386                  randconfig-2004-20261123    gcc-14
i386                  randconfig-2005-20261123    gcc-14
i386                  randconfig-2100-20261123    clang-22   cocci
i386                  randconfig-2101-20261123    clang-22   cocci
i386                  randconfig-2102-20261123    clang-22   cocci
i386                  randconfig-2103-20261123    clang-22   cocci
i386                  randconfig-2104-20261123    clang-22   cocci
i386                  randconfig-2105-20261123    clang-22   cocci
i386                  randconfig-2200-20261123    gcc-14     smatch
i386                  randconfig-2300-20261123    gcc-14     sparse
i386                  randconfig-2301-20261123    gcc-14     sparse
i386                  randconfig-2302-20261123    gcc-14     sparse
i386                 randconfig-r2100-20261123    gcc-14     cocci
i386                 randconfig-r2102-20261123    gcc-8.5.0  cocci
i386                 randconfig-r2103-20261123    gcc-8.5.0  cocci
i386                 randconfig-r2104-20261123    gcc-14     cocci
i386                 randconfig-r2105-20261123    gcc-14     cocci
i386                 randconfig-r2106-20261123    gcc-14     cocci
i386                 randconfig-r2107-20261123    clang-22   cocci
i386                 randconfig-r2107-20261123    gcc-16.2.0 cocci
i386                 randconfig-r2108-20261123    gcc-8.5.0  cocci
i386                 randconfig-r2305-20261123    clang-24   sparse
i386                 randconfig-r2310-20261123    clang-24   sparse
i386                 randconfig-r2311-20261123    gcc-8.5.0  sparse
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261124    gcc-10.5.0
loongarch             randconfig-1001-20261124    gcc-10.5.0
loongarch             randconfig-2000-20261123    gcc-16.2.0
loongarch             randconfig-2001-20261123    gcc-16.2.0
loongarch             randconfig-2200-20261123    clang-24   smatch
loongarch            randconfig-r2100-20261123    gcc-14     cocci
loongarch            randconfig-r2103-20261123    gcc-16.2.0 cocci
loongarch            randconfig-r2105-20261123    gcc-16.2.0 cocci
loongarch            randconfig-r2106-20261123    clang-22   cocci
loongarch            randconfig-r2106-20261123    gcc-13.5.0 cocci
loongarch            randconfig-r2107-20261123    gcc-14     cocci
loongarch            randconfig-r2301-20261123    clang-22   sparse
loongarch            randconfig-r2302-20261123    gcc-11.5.0 sparse
loongarch            randconfig-r2302-20261123    gcc-14     sparse
loongarch            randconfig-r2303-20261123    clang-18   sparse
loongarch            randconfig-r2309-20261123    clang-24   sparse
loongarch            randconfig-r2310-20261123    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261123    gcc-8.5.0
m68k                  randconfig-2001-20261123    gcc-8.5.0
m68k                  randconfig-2200-20261123    gcc-8.5.0  smatch
m68k                 randconfig-r2101-20261123    gcc-16.2.0 cocci
m68k                 randconfig-r2101-20261123    gcc-8.5.0  cocci
m68k                 randconfig-r2105-20261123    gcc-8.5.0  cocci
m68k                 randconfig-r2108-20261123    clang-22   cocci
m68k                 randconfig-r2300-20261123    clang-22   sparse
m68k                 randconfig-r2303-20261123    clang-24   sparse
m68k                 randconfig-r2303-20261123    gcc-14     sparse
m68k                 randconfig-r2305-20261123    gcc-13.5.0 sparse
m68k                 randconfig-r2307-20261123    gcc-8.5.0  sparse
m68k                 randconfig-r2308-20261123    clang-24   sparse
m68k                 randconfig-r2309-20261123    gcc-8.5.0  sparse
m68k                 randconfig-r2310-20261123    gcc-12.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261123    gcc-8.5.0
microblaze            randconfig-2200-20261123    gcc-16.2.0 smatch
microblaze           randconfig-r2103-20261123    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261123    gcc-8.5.0  cocci
microblaze           randconfig-r2109-20261123    clang-22   cocci
microblaze           randconfig-r2301-20261123    clang-24   sparse
microblaze           randconfig-r2302-20261123    clang-24   sparse
microblaze           randconfig-r2304-20261123    clang-24   sparse
microblaze           randconfig-r2306-20261123    gcc-12.5.0 sparse
microblaze           randconfig-r2309-20261123    gcc-10.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                            jazz_defconfig    clang-24
mips                 malta_qemu_32r6_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261123    gcc-10.5.0
mips                  randconfig-2001-20261123    gcc-10.5.0
mips                  randconfig-2002-20261123    gcc-10.5.0
mips                  randconfig-2200-20261123    gcc-14.4.0 smatch
mips                 randconfig-r2100-20261123    clang-24   cocci
mips                 randconfig-r2100-20261123    gcc-8.5.0  cocci
mips                 randconfig-r2101-20261123    gcc-14     cocci
mips                 randconfig-r2102-20261123    gcc-14     cocci
mips                 randconfig-r2103-20261123    gcc-8.5.0  cocci
mips                 randconfig-r2111-20261123    gcc-13.5.0 cocci
mips                 randconfig-r2300-20261123    clang-18   sparse
mips                 randconfig-r2304-20261123    clang-22   sparse
mips                 randconfig-r2304-20261123    gcc-11.5.0 sparse
mips                 randconfig-r2311-20261123    gcc-12.5.0 sparse
mips                 randconfig-r2311-20261123    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261124    gcc-10.5.0
nios2                 randconfig-1001-20261124    gcc-10.5.0
nios2                 randconfig-2000-20261123    gcc-16.2.0
nios2                 randconfig-2001-20261123    gcc-16.2.0
nios2                 randconfig-2200-20261123    gcc-8.5.0  smatch
nios2                randconfig-r2102-20261123    gcc-8.5.0  cocci
nios2                randconfig-r2106-20261123    gcc-15.3.0 cocci
nios2                randconfig-r2108-20261123    clang-17   cocci
nios2                randconfig-r2109-20261123    gcc-8.5.0  cocci
nios2                randconfig-r2110-20261123    clang-17   cocci
nios2                randconfig-r2110-20261123    gcc-16.2.0 cocci
nios2                randconfig-r2300-20261123    gcc-9.5.0  sparse
nios2                randconfig-r2303-20261123    gcc-11.5.0 sparse
nios2                randconfig-r2304-20261123    clang-22   sparse
nios2                randconfig-r2304-20261123    gcc-16.2.0 sparse
nios2                randconfig-r2307-20261123    gcc-13.5.0 sparse
nios2                randconfig-r2308-20261123    gcc-15.3.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261123    gcc-10.5.0
openrisc              randconfig-2001-20261123    gcc-10.5.0
openrisc              randconfig-2002-20261123    gcc-10.5.0
openrisc              randconfig-2200-20261123    gcc-12.5.0 smatch
openrisc             randconfig-r2100-20261123    gcc-8.5.0  cocci
openrisc             randconfig-r2108-20261123    gcc-13.5.0 cocci
openrisc             randconfig-r2301-20261123    clang-18   sparse
openrisc             randconfig-r2303-20261123    gcc-9.5.0  sparse
openrisc             randconfig-r2304-20261123    gcc-14     sparse
openrisc             randconfig-r2305-20261123    clang-22   sparse
openrisc             randconfig-r2308-20261123    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-32bit_defconfig    clang-24
parisc                 generic-64bit_defconfig    clang-24
parisc                randconfig-1000-20261124    clang-24
parisc                randconfig-1001-20261124    clang-24
parisc                randconfig-2000-20261123    gcc-16.2.0
parisc                randconfig-2001-20261123    gcc-16.2.0
parisc                randconfig-2200-20261123    gcc-14.4.0 smatch
parisc               randconfig-r2103-20261123    gcc-8.5.0  cocci
parisc               randconfig-r2104-20261123    gcc-8.5.0  cocci
parisc               randconfig-r2109-20261123    gcc-13.5.0 cocci
parisc               randconfig-r2109-20261123    gcc-14.4.0 cocci
parisc               randconfig-r2110-20261123    gcc-8.5.0  cocci
parisc               randconfig-r2305-20261123    gcc-14     sparse
parisc               randconfig-r2306-20261123    gcc-13.5.0 sparse
parisc               randconfig-r2307-20261123    gcc-12.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                       mgcoge_defconfig    clang-24
powerpc                mpc834x_itxgp_defconfig    clang-24
powerpc                  mpc837x_rdb_defconfig    clang-24
powerpc               randconfig-1000-20261124    clang-24
powerpc               randconfig-1001-20261124    clang-24
powerpc               randconfig-2000-20261123    clang-21
powerpc               randconfig-2001-20261123    clang-21
powerpc               randconfig-2002-20261123    clang-21
powerpc               randconfig-2200-20261123    gcc-9.5.0  smatch
powerpc              randconfig-r2102-20261123    gcc-8.5.0  cocci
powerpc              randconfig-r2104-20261123    clang-24   cocci
powerpc              randconfig-r2110-20261123    gcc-8.5.0  cocci
powerpc              randconfig-r2301-20261123    clang-24   sparse
powerpc              randconfig-r2301-20261123    gcc-9.5.0  sparse
powerpc              randconfig-r2305-20261123    clang-18   sparse
powerpc              randconfig-r2308-20261123    gcc-10.5.0 sparse
powerpc                      tqm5200_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261124    clang-24
powerpc64             randconfig-1001-20261124    clang-24
powerpc64             randconfig-2000-20261123    clang-21
powerpc64             randconfig-2001-20261123    clang-21
powerpc64             randconfig-2002-20261123    clang-21
powerpc64             randconfig-2200-20261123    gcc-15.3.0 smatch
powerpc64            randconfig-r2102-20261123    gcc-8.5.0  cocci
powerpc64            randconfig-r2103-20261123    gcc-14     cocci
powerpc64            randconfig-r2103-20261123    gcc-14.4.0 cocci
powerpc64            randconfig-r2104-20261123    gcc-14.4.0 cocci
powerpc64            randconfig-r2104-20261123    gcc-8.5.0  cocci
powerpc64            randconfig-r2110-20261123    clang-22   cocci
powerpc64            randconfig-r2110-20261123    gcc-16.2.0 cocci
powerpc64            randconfig-r2300-20261123    clang-24   sparse
powerpc64            randconfig-r2300-20261123    gcc-16.2.0 sparse
powerpc64            randconfig-r2302-20261123    gcc-13.5.0 sparse
powerpc64            randconfig-r2306-20261123    gcc-10.5.0 sparse
powerpc64            randconfig-r2306-20261123    gcc-8.5.0  sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261124    gcc-11.5.0
riscv                 randconfig-1001-20261124    gcc-11.5.0
riscv                 randconfig-2000-20261123    gcc-11.5.0
riscv                 randconfig-2001-20261123    gcc-11.5.0
riscv                 randconfig-2002-20261123    gcc-11.5.0
riscv                 randconfig-2003-20261123    gcc-11.5.0
riscv                 randconfig-2004-20261123    gcc-11.5.0
riscv                 randconfig-2005-20261123    gcc-11.5.0
riscv                 randconfig-2200-20261123    clang-17   smatch
riscv                randconfig-r2100-20261123    gcc-16.2.0 cocci
riscv                randconfig-r2101-20261123    clang-24   cocci
riscv                randconfig-r2101-20261123    gcc-8.5.0  cocci
riscv                randconfig-r2105-20261123    gcc-14     cocci
riscv                randconfig-r2108-20261123    gcc-14.4.0 cocci
riscv                randconfig-r2110-20261123    gcc-14.4.0 cocci
riscv                randconfig-r2111-20261123    gcc-14.4.0 cocci
riscv                randconfig-r2301-20261123    gcc-16.2.0 sparse
riscv                randconfig-r2302-20261123    clang-22   sparse
riscv                randconfig-r2306-20261123    gcc-15.3.0 sparse
riscv                randconfig-r2307-20261123    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261124    gcc-11.5.0
s390                  randconfig-1001-20261124    gcc-11.5.0
s390                  randconfig-2000-20261123    clang-20
s390                  randconfig-2001-20261123    clang-20
s390                  randconfig-2002-20261123    clang-20
s390                  randconfig-2003-20261123    clang-20
s390                  randconfig-2004-20261123    clang-20
s390                  randconfig-2005-20261123    clang-20
s390                  randconfig-2200-20261123    clang-24   smatch
s390                 randconfig-r2104-20261123    gcc-16.2.0 cocci
s390                 randconfig-r2104-20261123    gcc-8.5.0  cocci
s390                 randconfig-r2108-20261123    gcc-14     cocci
s390                 randconfig-r2108-20261123    gcc-15.3.0 cocci
s390                 randconfig-r2109-20261123    gcc-14     cocci
s390                 randconfig-r2111-20261123    clang-22   cocci
s390                 randconfig-r2302-20261123    clang-22   sparse
s390                 randconfig-r2303-20261123    clang-22   sparse
s390                 randconfig-r2303-20261123    gcc-16.2.0 sparse
s390                 randconfig-r2304-20261123    clang-18   sparse
s390                 randconfig-r2304-20261123    gcc-13.5.0 sparse
s390                 randconfig-r2311-20261123    gcc-13.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261124    gcc-11.5.0
sh                    randconfig-1001-20261124    gcc-11.5.0
sh                    randconfig-2000-20261123    gcc-16.2.0
sh                    randconfig-2001-20261123    gcc-16.2.0
sh                    randconfig-2002-20261123    gcc-16.2.0
sh                    randconfig-2003-20261123    gcc-16.2.0
sh                    randconfig-2004-20261123    gcc-16.2.0
sh                    randconfig-2005-20261123    gcc-16.2.0
sh                    randconfig-2200-20261123    gcc-16.2.0 smatch
sh                   randconfig-r2102-20261123    gcc-14.4.0 cocci
sh                   randconfig-r2107-20261123    gcc-14.4.0 cocci
sh                   randconfig-r2111-20261123    gcc-15.3.0 cocci
sh                   randconfig-r2302-20261123    gcc-9.5.0  sparse
sh                   randconfig-r2306-20261123    gcc-8.5.0  sparse
sh                   randconfig-r2310-20261123    gcc-15.3.0 sparse
sh                   randconfig-r2311-20261123    gcc-10.5.0 sparse
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7619_defconfig    clang-24
sh                            se7721_defconfig    clang-24
sh                            se7721_defconfig    gcc-16.2.0
sh                    sh7770_generic_defconfig    clang-24
sh                             titan_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261124    clang-24
sparc                 randconfig-1001-20261124    clang-24
sparc                 randconfig-2000-20261123    gcc-9.5.0
sparc                 randconfig-2001-20261123    gcc-9.5.0
sparc                 randconfig-2200-20261123    gcc-12.5.0 smatch
sparc                randconfig-r2102-20261123    gcc-14     cocci
sparc                randconfig-r2107-20261123    gcc-16.2.0 cocci
sparc                randconfig-r2108-20261123    gcc-8.5.0  cocci
sparc                randconfig-r2304-20261123    gcc-9.5.0  sparse
sparc                randconfig-r2306-20261123    gcc-8.5.0  sparse
sparc                randconfig-r2307-20261123    clang-24   sparse
sparc                randconfig-r2307-20261123    gcc-15.3.0 sparse
sparc                randconfig-r2308-20261123    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261123    gcc-8.5.0  sparse
sparc                randconfig-r2311-20261123    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261124    clang-24
sparc64               randconfig-1001-20261124    clang-24
sparc64               randconfig-2000-20261123    gcc-9.5.0
sparc64               randconfig-2001-20261123    gcc-9.5.0
sparc64               randconfig-2200-20261123    clang-22   smatch
sparc64              randconfig-r2102-20261123    clang-24   cocci
sparc64              randconfig-r2103-20261123    gcc-14     cocci
sparc64              randconfig-r2104-20261123    gcc-14     cocci
sparc64              randconfig-r2106-20261123    gcc-16.2.0 cocci
sparc64              randconfig-r2301-20261123    gcc-13.5.0 sparse
sparc64              randconfig-r2311-20261123    gcc-15.3.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261124    clang-24
um                    randconfig-1001-20261124    clang-24
um                    randconfig-2000-20261123    gcc-9.5.0
um                    randconfig-2001-20261123    gcc-9.5.0
um                    randconfig-2200-20261123    clang-21   smatch
um                   randconfig-r2100-20261123    gcc-14.4.0 cocci
um                   randconfig-r2101-20261123    gcc-14.4.0 cocci
um                   randconfig-r2103-20261123    gcc-8.5.0  cocci
um                   randconfig-r2105-20261123    gcc-14     cocci
um                   randconfig-r2105-20261123    gcc-8.5.0  cocci
um                   randconfig-r2300-20261123    gcc-14     sparse
um                   randconfig-r2305-20261123    clang-22   sparse
um                   randconfig-r2306-20261123    clang-24   sparse
um                   randconfig-r2311-20261123    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261124    gcc-14
x86_64      buildonly-randconfig-1001-20261124    gcc-14
x86_64      buildonly-randconfig-1002-20261124    gcc-14
x86_64      buildonly-randconfig-1003-20261124    gcc-14
x86_64      buildonly-randconfig-1004-20261124    gcc-14
x86_64      buildonly-randconfig-1005-20261124    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261124    gcc-12
x86_64                randconfig-1001-20261124    gcc-12
x86_64                randconfig-1002-20261124    gcc-12
x86_64                randconfig-1003-20261124    gcc-12
x86_64                randconfig-1004-20261124    gcc-12
x86_64                randconfig-1005-20261124    gcc-12
x86_64                randconfig-2000-20261123    gcc-14
x86_64                randconfig-2001-20261123    gcc-14
x86_64                randconfig-2002-20261123    gcc-14
x86_64                randconfig-2003-20261123    gcc-14
x86_64                randconfig-2004-20261123    gcc-14
x86_64                randconfig-2005-20261123    gcc-14
x86_64                randconfig-2100-20261123    clang-22   cocci
x86_64                randconfig-2101-20261123    clang-22   cocci
x86_64                randconfig-2102-20261123    clang-22   cocci
x86_64                randconfig-2103-20261123    clang-22   cocci
x86_64                randconfig-2104-20261123    clang-22   cocci
x86_64                randconfig-2105-20261123    clang-22   cocci
x86_64                randconfig-2200-20261123    gcc-14     smatch
x86_64                randconfig-2300-20261123    gcc-14     sparse
x86_64                randconfig-2301-20261123    gcc-14     sparse
x86_64                randconfig-2302-20261123    gcc-14     sparse
x86_64               randconfig-r2101-20261123    gcc-14     cocci
x86_64               randconfig-r2104-20261123    gcc-14     cocci
x86_64               randconfig-r2107-20261123    gcc-15.3.0 cocci
x86_64               randconfig-r2110-20261123    gcc-14     cocci
x86_64               randconfig-r2300-20261123    clang-22   sparse
x86_64               randconfig-r2303-20261123    clang-22   sparse
x86_64               randconfig-r2304-20261123    clang-24   sparse
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
xtensa                randconfig-1000-20261124    clang-24
xtensa                randconfig-1001-20261124    clang-24
xtensa                randconfig-2000-20261123    gcc-12.5.0
xtensa                randconfig-2001-20261123    gcc-12.5.0
xtensa                randconfig-2200-20261123    gcc-8.5.0  smatch
xtensa               randconfig-r2101-20261123    gcc-14     cocci
xtensa               randconfig-r2101-20261123    gcc-8.5.0  cocci
xtensa               randconfig-r2102-20261123    gcc-14     cocci
xtensa               randconfig-r2102-20261123    gcc-16.2.0 cocci
xtensa               randconfig-r2109-20261123    gcc-16.2.0 cocci
xtensa               randconfig-r2110-20261123    gcc-15.3.0 cocci
xtensa               randconfig-r2111-20261123    gcc-16.2.0 cocci
xtensa               randconfig-r2300-20261123    clang-24   sparse
xtensa               randconfig-r2301-20261123    clang-22   sparse
xtensa               randconfig-r2302-20261123    clang-18   sparse
xtensa               randconfig-r2308-20261123    gcc-12.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

