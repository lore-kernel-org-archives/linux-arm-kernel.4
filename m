Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85D7606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e8hV5Gtn;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jWT4vuTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VYvjRCH3b9bRrK2MlSdUcx9nvL4xHfMFRtRavGOqXNE=; b=e8hV5GtnaeO3r/kFnxRnuEAhRy
	yAsTWILKJKZfCZh/+eUmp5eT0cpwiKknkpxXc6BdBbWuBLFXqJtFFPDqNG/lwxmdSvj1V0Z3KQpLv
	WiplGpMxQTEJW46A6Us7S+a3fE5QIvgZlFsa3yUPyAeyX8/IeCgcTxUjlkrCXXyE2UYYHdzLAW+ew
	w05l+3DlWbu4AkbH4QmRj3DDMFBuC2sLGOC6SfCBclOqyjJHOWYVx2qpFYjy+cLbVdBNPbDRzT6/9
	3Cwdkr1bFQTd31uFeCn1rXoyXu5f4de77RR+xzmxZf4lI/ocCsGb8jBKNmmTF55/meJfTFWRCKhiT
	GdJoQEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCv5-00000009y7w-16By;
	Wed, 25 Nov 2026 13:20:19 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCuy-00000009y7D-2pE0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795612812; x=1827148812;
  h=date:from:to:cc:subject:message-id;
  bh=yLfs9e2KEuF1Ggvry1nBJZtnaeBPjVN4OI4oF5+SQnk=;
  b=jWT4vuTRkpdvo30QBIxr61jwojUTdVC7gins82SLSbLJS5TLbHzzMDsv
   d3W3wFIW3kkHfpYmIY8DqFDO8Vx3+EHVsmyPL8j6J5+9TH21OWizl4mTC
   SXLh1WSpWLTaAZelTT3qxdfmAqvyujpDolSgINRz6gZbadv0q/m58Hf02
   PILqCiF2zwltjcivVBkXsI7JZZtxkvnciCZxnNKvcCQ/h+rJqOqBiUgBz
   Nn8P9NnrXtZ2rq6IKsR4hfG55ZvWFf02Zi0wyE+foSYZCtxrqbbjorf12
   KcIVW4uK4tmIxznau97BnM4rN+P9AjgB6aaPHpKUktzMAiusyxGFnv91v
   A==;
X-CSE-ConnectionGUID: wXco8TDyTdmeBUGLOSuzDg==
X-CSE-MsgGUID: fN1eBPtmSwqyHqIWnieoJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4403094"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4403094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:20:08 -0800
X-CSE-ConnectionGUID: 4bH7VCuzTimHQbdP4pZagw==
X-CSE-MsgGUID: OrEY8GyfQTaXap4L1wGwPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12456910"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Nov 2026 05:20:07 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWCup-00000001RiG-1oaI;
	Wed, 25 Nov 2026 13:20:03 +0000
Date: Wed, 25 Nov 2026 21:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm:fixes] BUILD SUCCESS
 30275e284469c6f8bb2e1bf7a666b065a81b46c9
Message-ID: <20261125211944.143BVNgb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_052016_035845_B875F1E2 
X-CRM114-Status: UNSURE (   6.04  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: 30275e284469c6f8bb2e1bf7a666b065a81b46c9  Merge tag 'stm32-dt-for-v7.4-fixes-1' of git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into arm/fixes

elapsed time: 991m

configs tested: 542
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261124    gcc-11.5.0
alpha                 randconfig-2000-20261125    gcc-8.5.0
alpha                 randconfig-2001-20261124    gcc-11.5.0
alpha                 randconfig-2001-20261125    gcc-8.5.0
alpha                 randconfig-2200-20261124    gcc-8.5.0  smatch
alpha                 randconfig-2200-20261125    gcc-10.5.0 smatch
alpha                randconfig-r2111-20261125    gcc-13.5.0 cocci
alpha                randconfig-r2302-20261124    clang-17   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                           axs101_defconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                          haps_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261125    gcc-8.5.0
arc                   randconfig-1001-20261125    gcc-8.5.0
arc                   randconfig-2000-20261124    gcc-11.5.0
arc                   randconfig-2000-20261125    gcc-10.5.0
arc                   randconfig-2001-20261124    gcc-11.5.0
arc                   randconfig-2001-20261125    gcc-10.5.0
arc                   randconfig-2002-20261124    gcc-11.5.0
arc                   randconfig-2002-20261125    gcc-10.5.0
arc                   randconfig-2003-20261124    gcc-11.5.0
arc                   randconfig-2003-20261125    gcc-10.5.0
arc                   randconfig-2004-20261124    gcc-11.5.0
arc                   randconfig-2004-20261125    gcc-10.5.0
arc                   randconfig-2005-20261124    gcc-11.5.0
arc                   randconfig-2005-20261125    gcc-10.5.0
arc                   randconfig-2200-20261124    gcc-8.5.0  smatch
arc                   randconfig-2200-20261125    gcc-14.4.0 smatch
arc                  randconfig-r2106-20261124    clang-24   cocci
arc                  randconfig-r2107-20261125    gcc-13.5.0 cocci
arc                  randconfig-r2108-20261125    gcc-11.5.0 cocci
arc                  randconfig-r2110-20261124    clang-24   cocci
arc                  randconfig-r2110-20261125    gcc-9.5.0  cocci
arc                  randconfig-r2300-20261124    clang-17   sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.2.0
arm                          axm55xx_defconfig    gcc-16.2.0
arm                          bcm2835_defconfig    clang-17
arm                          bcm2835_defconfig    clang-24
arm                         clps711x_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       jornada720_defconfig    clang-24
arm                          lpc18xx_defconfig    clang-17
arm                          lpc18xx_defconfig    clang-24
arm                          lpc32xx_defconfig    clang-17
arm                           moxart_defconfig    clang-24
arm                         multi_v5_defconfig    clang-24
arm                          mv78xx0_defconfig    clang-17
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                           pxa168_defconfig    gcc-16.2.0
arm                           pxa3xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261125    gcc-8.5.0
arm                   randconfig-1001-20261125    gcc-8.5.0
arm                   randconfig-1002-20261125    gcc-8.5.0
arm                   randconfig-1003-20261125    gcc-8.5.0
arm                   randconfig-2000-20261124    clang-17
arm                   randconfig-2000-20261125    clang-22
arm                   randconfig-2001-20261124    clang-17
arm                   randconfig-2001-20261125    clang-22
arm                   randconfig-2002-20261124    clang-17
arm                   randconfig-2002-20261125    clang-22
arm                   randconfig-2200-20261124    clang-17   smatch
arm                   randconfig-2200-20261125    clang-21   smatch
arm                  randconfig-r2103-20261124    gcc-16.2.0 cocci
arm                  randconfig-r2104-20261125    clang-24   cocci
arm                  randconfig-r2106-20261125    gcc-11.5.0 cocci
arm                  randconfig-r2110-20261124    clang-24   cocci
arm                  randconfig-r2111-20261125    gcc-11.5.0 cocci
arm                  randconfig-r2305-20261125    gcc-10.5.0 sparse
arm                  randconfig-r2305-20261125    gcc-8.5.0  sparse
arm                  randconfig-r2307-20261124    gcc-9.5.0  sparse
arm                  randconfig-r2307-20261125    gcc-8.5.0  sparse
arm                  randconfig-r2308-20261125    gcc-8.5.0  sparse
arm                  randconfig-r2309-20261125    gcc-14     sparse
arm                          s3c6400_defconfig    clang-24
arm                            sama7_defconfig    clang-17
arm                           sp7021_defconfig    clang-24
arm                           sp7021_defconfig    gcc-16.2.0
arm                            u8500_defconfig    gcc-16.2.0
arm64                             alldefconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261125    clang-24
arm64                 randconfig-1001-20261125    clang-24
arm64                 randconfig-1002-20261125    clang-24
arm64                 randconfig-1003-20261125    clang-24
arm64                 randconfig-2000-20261124    clang-17
arm64                 randconfig-2000-20261125    clang-22
arm64                 randconfig-2001-20261124    clang-17
arm64                 randconfig-2001-20261125    clang-22
arm64                 randconfig-2002-20261124    clang-17
arm64                 randconfig-2002-20261125    clang-22
arm64                 randconfig-2200-20261124    gcc-16.2.0 smatch
arm64                 randconfig-2200-20261125    gcc-13.5.0 smatch
arm64                randconfig-r2107-20261124    clang-24   cocci
arm64                randconfig-r2306-20261125    gcc-13.5.0 sparse
arm64                randconfig-r2307-20261125    gcc-14     sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261125    clang-24
csky                  randconfig-1001-20261125    clang-24
csky                  randconfig-2000-20261124    gcc-16.2.0
csky                  randconfig-2000-20261125    gcc-14.4.0
csky                  randconfig-2001-20261124    gcc-16.2.0
csky                  randconfig-2001-20261125    gcc-14.4.0
csky                  randconfig-2200-20261124    gcc-15.3.0 smatch
csky                  randconfig-2200-20261125    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261124    gcc-8.5.0  cocci
csky                 randconfig-r2102-20261125    clang-24   cocci
csky                 randconfig-r2102-20261125    gcc-14     cocci
csky                 randconfig-r2104-20261124    gcc-8.5.0  cocci
csky                 randconfig-r2303-20261125    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261125    gcc-11.5.0
hexagon               randconfig-1001-20261125    gcc-11.5.0
hexagon               randconfig-2000-20261124    gcc-16.2.0
hexagon               randconfig-2000-20261125    gcc-14.4.0
hexagon               randconfig-2001-20261124    gcc-16.2.0
hexagon               randconfig-2001-20261125    gcc-14.4.0
hexagon               randconfig-2200-20261125    clang-17   smatch
hexagon              randconfig-r2107-20261124    clang-24   cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261125    clang-22
i386        buildonly-randconfig-1001-20261125    clang-22
i386        buildonly-randconfig-1002-20261125    clang-22
i386        buildonly-randconfig-1003-20261125    clang-22
i386        buildonly-randconfig-1004-20261125    clang-22
i386        buildonly-randconfig-1005-20261125    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261125    clang-22
i386                  randconfig-1001-20261125    clang-22
i386                  randconfig-1002-20261125    clang-22
i386                  randconfig-1003-20261125    clang-22
i386                  randconfig-1004-20261125    clang-22
i386                  randconfig-1005-20261125    clang-22
i386                  randconfig-1006-20261125    clang-22
i386                  randconfig-2000-20261124    gcc-14
i386                  randconfig-2000-20261125    gcc-14
i386                  randconfig-2001-20261124    gcc-14
i386                  randconfig-2001-20261125    gcc-14
i386                  randconfig-2002-20261124    gcc-14
i386                  randconfig-2002-20261125    gcc-14
i386                  randconfig-2003-20261124    gcc-14
i386                  randconfig-2003-20261125    gcc-14
i386                  randconfig-2004-20261124    gcc-14
i386                  randconfig-2004-20261125    gcc-14
i386                  randconfig-2005-20261124    gcc-14
i386                  randconfig-2005-20261125    gcc-14
i386                  randconfig-2100-20261124    gcc-14     cocci
i386                  randconfig-2100-20261125    clang-22   cocci
i386                  randconfig-2101-20261124    gcc-14     cocci
i386                  randconfig-2101-20261125    clang-22   cocci
i386                  randconfig-2102-20261124    gcc-14     cocci
i386                  randconfig-2102-20261125    clang-22   cocci
i386                  randconfig-2103-20261124    gcc-14     cocci
i386                  randconfig-2103-20261125    clang-22   cocci
i386                  randconfig-2104-20261124    gcc-14     cocci
i386                  randconfig-2104-20261125    clang-22   cocci
i386                  randconfig-2105-20261124    gcc-14     cocci
i386                  randconfig-2105-20261125    clang-22   cocci
i386                  randconfig-2200-20261124    clang-22   smatch
i386                  randconfig-2200-20261125    clang-22   smatch
i386                  randconfig-2300-20261124    gcc-14     sparse
i386                  randconfig-2301-20261124    gcc-14     sparse
i386                  randconfig-2302-20261124    gcc-14     sparse
i386                 randconfig-r2106-20261125    gcc-9.5.0  cocci
i386                 randconfig-r2308-20261125    gcc-14     sparse
i386                 randconfig-r2310-20261125    gcc-14     sparse
i386                 randconfig-r2310-20261125    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261125    gcc-11.5.0
loongarch             randconfig-1001-20261125    gcc-11.5.0
loongarch             randconfig-2000-20261124    clang-18
loongarch             randconfig-2000-20261125    clang-19
loongarch             randconfig-2001-20261124    clang-18
loongarch             randconfig-2001-20261125    clang-19
loongarch             randconfig-2200-20261124    gcc-16.2.0 smatch
loongarch             randconfig-2200-20261125    clang-18   smatch
loongarch            randconfig-r2100-20261124    gcc-16.2.0 cocci
loongarch            randconfig-r2300-20261125    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261124    gcc-11.5.0
m68k                  randconfig-2000-20261125    gcc-8.5.0
m68k                  randconfig-2001-20261124    gcc-11.5.0
m68k                  randconfig-2001-20261125    gcc-8.5.0
m68k                  randconfig-2200-20261124    gcc-10.5.0 smatch
m68k                  randconfig-2200-20261125    gcc-15.3.0 smatch
m68k                 randconfig-r2300-20261124    gcc-15.3.0 sparse
m68k                 randconfig-r2304-20261125    gcc-8.5.0  sparse
m68k                 randconfig-r2308-20261124    gcc-9.5.0  sparse
m68k                           sun3x_defconfig    clang-17
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261124    gcc-11.5.0
microblaze            randconfig-2000-20261125    gcc-8.5.0
microblaze            randconfig-2001-20261124    gcc-11.5.0
microblaze            randconfig-2001-20261125    gcc-8.5.0
microblaze            randconfig-2200-20261124    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261125    gcc-8.5.0  smatch
microblaze           randconfig-r2105-20261124    gcc-8.5.0  cocci
microblaze           randconfig-r2106-20261125    gcc-13.5.0 cocci
microblaze           randconfig-r2107-20261125    gcc-11.5.0 cocci
microblaze           randconfig-r2108-20261125    gcc-13.5.0 cocci
microblaze           randconfig-r2108-20261125    gcc-9.5.0  cocci
microblaze           randconfig-r2301-20261125    gcc-10.5.0 sparse
microblaze           randconfig-r2305-20261124    clang-17   sparse
microblaze           randconfig-r2309-20261124    gcc-9.5.0  sparse
microblaze           randconfig-r2310-20261125    gcc-13.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                 econet_en751221_defconfig    clang-24
mips                            gcw0_defconfig    clang-24
mips                            ip30_defconfig    clang-17
mips                            ip30_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                       pic32mzda_defconfig    clang-24
mips                         qi_lb60_defconfig    clang-24
mips                  randconfig-2000-20261124    gcc-16.2.0
mips                  randconfig-2000-20261125    gcc-16.2.0
mips                  randconfig-2001-20261124    gcc-16.2.0
mips                  randconfig-2001-20261125    gcc-16.2.0
mips                  randconfig-2002-20261124    gcc-16.2.0
mips                  randconfig-2002-20261125    gcc-16.2.0
mips                  randconfig-2200-20261124    clang-20   smatch
mips                  randconfig-2200-20261125    clang-24   smatch
mips                 randconfig-r2101-20261124    gcc-16.2.0 cocci
mips                 randconfig-r2104-20261125    gcc-14     cocci
mips                 randconfig-r2105-20261125    clang-24   cocci
mips                          rt305x_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261125    gcc-11.5.0
nios2                 randconfig-1001-20261125    gcc-11.5.0
nios2                 randconfig-2000-20261124    clang-18
nios2                 randconfig-2000-20261125    clang-19
nios2                 randconfig-2001-20261124    clang-18
nios2                 randconfig-2001-20261125    clang-19
nios2                 randconfig-2200-20261124    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261125    gcc-8.5.0  smatch
nios2                randconfig-r2103-20261125    gcc-14     cocci
nios2                randconfig-r2104-20261124    gcc-16.2.0 cocci
nios2                randconfig-r2109-20261125    gcc-13.5.0 cocci
nios2                randconfig-r2111-20261124    clang-24   cocci
nios2                randconfig-r2111-20261125    gcc-9.5.0  cocci
nios2                randconfig-r2305-20261124    gcc-15.3.0 sparse
nios2                randconfig-r2306-20261124    gcc-9.5.0  sparse
nios2                randconfig-r2307-20261125    gcc-13.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261124    gcc-16.2.0
openrisc              randconfig-2000-20261125    gcc-16.2.0
openrisc              randconfig-2001-20261124    gcc-16.2.0
openrisc              randconfig-2001-20261125    gcc-16.2.0
openrisc              randconfig-2002-20261124    gcc-16.2.0
openrisc              randconfig-2002-20261125    gcc-16.2.0
openrisc              randconfig-2200-20261124    gcc-11.5.0 smatch
openrisc              randconfig-2200-20261125    gcc-10.5.0 smatch
openrisc             randconfig-r2101-20261125    gcc-14     cocci
openrisc             randconfig-r2103-20261124    gcc-8.5.0  cocci
openrisc             randconfig-r2105-20261124    gcc-16.2.0 cocci
openrisc             randconfig-r2111-20261124    clang-24   cocci
openrisc             randconfig-r2304-20261124    clang-17   sparse
openrisc             randconfig-r2311-20261125    gcc-14     sparse
openrisc             randconfig-r2311-20261125    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261125    clang-24
parisc                randconfig-1001-20261125    clang-24
parisc                randconfig-2000-20261124    clang-18
parisc                randconfig-2000-20261125    clang-19
parisc                randconfig-2001-20261124    clang-18
parisc                randconfig-2001-20261125    clang-19
parisc                randconfig-2200-20261124    gcc-9.5.0  smatch
parisc                randconfig-2200-20261125    gcc-12.5.0 smatch
parisc               randconfig-r2300-20261125    gcc-10.5.0 sparse
parisc               randconfig-r2301-20261124    gcc-15.3.0 sparse
parisc               randconfig-r2302-20261125    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.2.0
powerpc                       mgcoge_defconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    gcc-16.2.0
powerpc                          ps3_defconfig    clang-24
powerpc               randconfig-1000-20261125    clang-24
powerpc               randconfig-1001-20261125    clang-24
powerpc               randconfig-2000-20261124    clang-24
powerpc               randconfig-2000-20261125    gcc-9.5.0
powerpc               randconfig-2001-20261124    clang-24
powerpc               randconfig-2001-20261125    gcc-9.5.0
powerpc               randconfig-2002-20261124    clang-24
powerpc               randconfig-2002-20261125    gcc-9.5.0
powerpc               randconfig-2200-20261124    clang-21   smatch
powerpc               randconfig-2200-20261125    gcc-11.5.0 smatch
powerpc              randconfig-r2100-20261124    gcc-8.5.0  cocci
powerpc              randconfig-r2304-20261124    gcc-15.3.0 sparse
powerpc              randconfig-r2311-20261125    gcc-13.5.0 sparse
powerpc                      tqm8555_defconfig    clang-17
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261125    clang-24
powerpc64             randconfig-1001-20261125    clang-24
powerpc64             randconfig-2000-20261124    clang-24
powerpc64             randconfig-2000-20261125    gcc-9.5.0
powerpc64             randconfig-2001-20261124    clang-24
powerpc64             randconfig-2001-20261125    gcc-9.5.0
powerpc64             randconfig-2002-20261124    clang-24
powerpc64             randconfig-2002-20261125    gcc-9.5.0
powerpc64             randconfig-2200-20261124    gcc-12.5.0 smatch
powerpc64             randconfig-2200-20261125    gcc-13.5.0 smatch
powerpc64            randconfig-r2102-20261124    gcc-8.5.0  cocci
powerpc64            randconfig-r2108-20261124    clang-24   cocci
powerpc64            randconfig-r2303-20261124    clang-17   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261125    gcc-8.5.0
riscv                 randconfig-1001-20261125    gcc-8.5.0
riscv                 randconfig-2000-20261124    gcc-16.2.0
riscv                 randconfig-2000-20261125    gcc-13.5.0
riscv                 randconfig-2001-20261124    gcc-16.2.0
riscv                 randconfig-2001-20261125    gcc-13.5.0
riscv                 randconfig-2002-20261124    gcc-16.2.0
riscv                 randconfig-2002-20261125    gcc-13.5.0
riscv                 randconfig-2003-20261124    gcc-16.2.0
riscv                 randconfig-2003-20261125    gcc-13.5.0
riscv                 randconfig-2004-20261124    gcc-16.2.0
riscv                 randconfig-2004-20261125    gcc-13.5.0
riscv                 randconfig-2005-20261124    gcc-16.2.0
riscv                 randconfig-2005-20261125    gcc-13.5.0
riscv                 randconfig-2200-20261124    gcc-14.4.0 smatch
riscv                 randconfig-2200-20261125    gcc-8.5.0  smatch
riscv                randconfig-r2106-20261124    clang-24   cocci
riscv                randconfig-r2109-20261125    gcc-9.5.0  cocci
riscv                randconfig-r2301-20261125    gcc-8.5.0  sparse
riscv                randconfig-r2303-20261124    gcc-15.3.0 sparse
riscv                randconfig-r2311-20261124    gcc-9.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261125    gcc-8.5.0
s390                  randconfig-1001-20261125    gcc-8.5.0
s390                  randconfig-2000-20261124    clang-24
s390                  randconfig-2000-20261125    clang-24
s390                  randconfig-2001-20261124    clang-24
s390                  randconfig-2001-20261125    clang-24
s390                  randconfig-2002-20261124    clang-24
s390                  randconfig-2002-20261125    clang-24
s390                  randconfig-2003-20261124    clang-24
s390                  randconfig-2003-20261125    clang-24
s390                  randconfig-2004-20261124    clang-24
s390                  randconfig-2004-20261125    clang-24
s390                  randconfig-2005-20261124    clang-24
s390                  randconfig-2005-20261125    clang-24
s390                  randconfig-2200-20261124    clang-24   smatch
s390                  randconfig-2200-20261125    gcc-15.3.0 smatch
s390                 randconfig-r2101-20261125    clang-24   cocci
s390                 randconfig-r2105-20261125    gcc-14     cocci
s390                 randconfig-r2110-20261125    gcc-11.5.0 cocci
s390                 randconfig-r2308-20261125    gcc-13.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    clang-24
sh                    randconfig-1000-20261125    gcc-8.5.0
sh                    randconfig-1001-20261125    gcc-8.5.0
sh                    randconfig-2000-20261124    gcc-11.5.0
sh                    randconfig-2000-20261125    gcc-14.4.0
sh                    randconfig-2001-20261124    gcc-11.5.0
sh                    randconfig-2001-20261125    gcc-14.4.0
sh                    randconfig-2002-20261124    gcc-11.5.0
sh                    randconfig-2002-20261125    gcc-14.4.0
sh                    randconfig-2003-20261124    gcc-11.5.0
sh                    randconfig-2003-20261125    gcc-14.4.0
sh                    randconfig-2004-20261124    gcc-11.5.0
sh                    randconfig-2004-20261125    gcc-14.4.0
sh                    randconfig-2005-20261124    gcc-11.5.0
sh                    randconfig-2005-20261125    gcc-14.4.0
sh                    randconfig-2200-20261124    gcc-16.2.0 smatch
sh                    randconfig-2200-20261125    gcc-14.4.0 smatch
sh                   randconfig-r2302-20261124    gcc-15.3.0 sparse
sh                   randconfig-r2302-20261125    gcc-10.5.0 sparse
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7780_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sh                    sh7770_generic_defconfig    clang-24
sh                             shmin_defconfig    gcc-16.2.0
sparc                             alldefconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261125    gcc-12
sparc                 randconfig-1001-20261125    gcc-12
sparc                 randconfig-2000-20261124    gcc-8.5.0
sparc                 randconfig-2000-20261125    gcc-8.5.0
sparc                 randconfig-2001-20261124    gcc-8.5.0
sparc                 randconfig-2001-20261125    gcc-8.5.0
sparc                 randconfig-2200-20261124    gcc-11.5.0 smatch
sparc                 randconfig-2200-20261125    gcc-14.4.0 smatch
sparc                randconfig-r2102-20261124    gcc-16.2.0 cocci
sparc                randconfig-r2109-20261124    clang-24   cocci
sparc                randconfig-r2303-20261125    gcc-10.5.0 sparse
sparc64                           alldefconfig    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261125    gcc-12
sparc64               randconfig-1001-20261125    gcc-12
sparc64               randconfig-2000-20261124    gcc-8.5.0
sparc64               randconfig-2000-20261125    gcc-8.5.0
sparc64               randconfig-2001-20261124    gcc-8.5.0
sparc64               randconfig-2001-20261125    gcc-8.5.0
sparc64               randconfig-2200-20261124    clang-24   smatch
sparc64               randconfig-2200-20261125    gcc-15.3.0 smatch
sparc64              randconfig-r2100-20261125    clang-24   cocci
sparc64              randconfig-r2306-20261125    gcc-8.5.0  sparse
sparc64              randconfig-r2310-20261124    gcc-9.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261125    gcc-12
um                    randconfig-1001-20261125    gcc-12
um                    randconfig-2000-20261124    gcc-8.5.0
um                    randconfig-2000-20261125    gcc-8.5.0
um                    randconfig-2001-20261124    gcc-8.5.0
um                    randconfig-2001-20261125    gcc-8.5.0
um                    randconfig-2200-20261124    gcc-14     smatch
um                    randconfig-2200-20261125    clang-17   smatch
um                   randconfig-r2100-20261125    gcc-14     cocci
um                   randconfig-r2103-20261125    clang-24   cocci
um                   randconfig-r2304-20261125    gcc-10.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261125    clang-22
x86_64      buildonly-randconfig-1001-20261125    clang-22
x86_64      buildonly-randconfig-1002-20261125    clang-22
x86_64      buildonly-randconfig-1003-20261125    clang-22
x86_64      buildonly-randconfig-1004-20261125    clang-22
x86_64      buildonly-randconfig-1005-20261125    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261125    clang-22
x86_64                randconfig-1001-20261125    clang-22
x86_64                randconfig-1002-20261125    clang-22
x86_64                randconfig-1003-20261125    clang-22
x86_64                randconfig-1004-20261125    clang-22
x86_64                randconfig-1005-20261125    clang-22
x86_64                randconfig-2000-20261124    gcc-14
x86_64                randconfig-2000-20261125    gcc-14
x86_64                randconfig-2001-20261124    gcc-14
x86_64                randconfig-2001-20261125    gcc-14
x86_64                randconfig-2002-20261124    gcc-14
x86_64                randconfig-2002-20261125    gcc-14
x86_64                randconfig-2003-20261124    gcc-14
x86_64                randconfig-2003-20261125    gcc-14
x86_64                randconfig-2004-20261124    gcc-14
x86_64                randconfig-2004-20261125    gcc-14
x86_64                randconfig-2005-20261124    gcc-14
x86_64                randconfig-2005-20261125    gcc-14
x86_64                randconfig-2100-20261124    gcc-14     cocci
x86_64                randconfig-2100-20261125    clang-22   cocci
x86_64                randconfig-2101-20261124    gcc-14     cocci
x86_64                randconfig-2101-20261125    clang-22   cocci
x86_64                randconfig-2102-20261124    gcc-14     cocci
x86_64                randconfig-2102-20261125    clang-22   cocci
x86_64                randconfig-2103-20261124    gcc-14     cocci
x86_64                randconfig-2103-20261125    clang-22   cocci
x86_64                randconfig-2104-20261124    gcc-14     cocci
x86_64                randconfig-2104-20261125    clang-22   cocci
x86_64                randconfig-2105-20261124    gcc-14     cocci
x86_64                randconfig-2105-20261125    clang-22   cocci
x86_64                randconfig-2200-20261124    gcc-14     smatch
x86_64                randconfig-2200-20261125    gcc-14     smatch
x86_64                randconfig-2300-20261124    gcc-14     sparse
x86_64                randconfig-2301-20261124    gcc-14     sparse
x86_64                randconfig-2302-20261124    gcc-14     sparse
x86_64               randconfig-r2109-20261124    clang-24   cocci
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
xtensa                   audio_kc705_defconfig    clang-24
xtensa                           iss_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261125    gcc-12
xtensa                randconfig-1001-20261125    gcc-12
xtensa                randconfig-2000-20261124    gcc-16.2.0
xtensa                randconfig-2000-20261125    gcc-14.4.0
xtensa                randconfig-2001-20261124    gcc-16.2.0
xtensa                randconfig-2001-20261125    gcc-14.4.0
xtensa                randconfig-2200-20261124    gcc-9.5.0  smatch
xtensa                randconfig-2200-20261125    gcc-16.2.0 smatch
xtensa               randconfig-r2107-20261125    gcc-9.5.0  cocci
xtensa               randconfig-r2108-20261124    clang-24   cocci
xtensa               randconfig-r2109-20261125    gcc-11.5.0 cocci
xtensa               randconfig-r2110-20261125    gcc-13.5.0 cocci
xtensa               randconfig-r2301-20261124    clang-17   sparse
xtensa               randconfig-r2306-20261125    gcc-14     sparse
xtensa               randconfig-r2309-20261125    gcc-13.5.0 sparse
xtensa               randconfig-r2309-20261125    gcc-8.5.0  sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

