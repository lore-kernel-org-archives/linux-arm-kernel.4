Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AD2606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fHbG0n6c;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JhIn4Kli
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2NkX2a/ySqtcLh5p9DVxhuC1W48MiU8YioZwLVbrLXo=; b=fHbG0n6c22VAF5blspUzgf8AuA
	G9zwTZKDCrE7fXNwGIIhbSX0NAcrp5GCN/AZjzUfCzcrSXnMBtlL2zH2v7W+KXtLN7NAVmWsIVFUm
	oPAnPitN5bhtoizF1wtqZUH0x5JVpZzUfKqHRfBlEejq/JAoI1seI+k/mutjh+bXs4iyFbaP5whmw
	PpWLzzBCkuiVp2H3gG8AFNkGFGvU/VEjdbUntXOVV+6fddwBESGbiv1vmLHprQt++RVOjjBDcvZ9G
	Nuae1v9n9FePByGnFAZzDqR35jIFxChDzbM7vkasoz65WM7djYIacRtjQ77ybTukPf3OGh36rj7v0
	hbo4x8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxeF-00000005P8M-3g2x;
	Wed, 11 Nov 2026 02:01:16 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxeB-00000005P7R-2qwk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794362472; x=1825898472;
  h=date:from:to:cc:subject:message-id;
  bh=/sixiwCt3AQBtM+p0VfRV9uxMqpV6UkaIq8jrwaNBd8=;
  b=JhIn4KliQJub2PJIxUa/fD/TpDDT4RgAeLnNuiCaFMrrIdgY1AeU9FbA
   2oDi2qwjg8T7+6qbk+2ZDSCTVwd/X0+25auV3zVoRb5VOPoKHqL5aaFKk
   uCVlWn0pGdpq22CuEA374DkrPPmIfSG2npVnOpXuvU1u/LP543rpotSRU
   wYr+w+gMcNTbQJgZr/vZezV2FCgPrS5iaod7nWlH1TO4eMLNuu/ShsUka
   FL0PFbzufJMr0jq1X3Rt0vMjoM9HT6pYGsuoLoMSK92mYHkz8H0uFvpCY
   NbBs355Utw6cGNRm0ulmhO57wAyrCb3AhBrSt77oM1UYtRAzJNJ17bsmH
   w==;
X-CSE-ConnectionGUID: sh/qINNNRNerjmCkPtKTlw==
X-CSE-MsgGUID: jzeOciIORha3jm1hzDAyTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3166155"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3166155"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 18:01:11 -0800
X-CSE-ConnectionGUID: W4K9+wZdQMaFH0TkR/jh0w==
X-CSE-MsgGUID: 4ZbMn/R5SpGsSq7d34ezFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8175698"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 18:01:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQxe7-00000000xrr-1uhR;
	Wed, 11 Nov 2026 02:01:07 +0000
Date: Wed, 11 Nov 2026 10:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-pinctrl-bindings] BUILD SUCCESS
 345e3710e27f07b8bf32763de6d29466418e3ac9
Message-ID: <20261111100007.blc5a046-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_180111_832067_E75489CF 
X-CRM114-Status: UNSURE (   5.39  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-pinctrl-bindings
branch HEAD: 345e3710e27f07b8bf32763de6d29466418e3ac9  dt-bindings: pinctrl: nomadik: Convert to DT schema

elapsed time: 958m

configs tested: 254
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261110    gcc-10.5.0
arc                   randconfig-1000-20261111    gcc-15.3.0
arc                   randconfig-1001-20261110    gcc-10.5.0
arc                   randconfig-1001-20261111    gcc-15.3.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    gcc-16.2.0
arm                         mvebu_v7_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261110    gcc-10.5.0
arm                   randconfig-1000-20261111    gcc-15.3.0
arm                   randconfig-1001-20261110    gcc-10.5.0
arm                   randconfig-1001-20261111    gcc-15.3.0
arm                   randconfig-1002-20261110    gcc-10.5.0
arm                   randconfig-1002-20261111    gcc-15.3.0
arm                   randconfig-1003-20261110    gcc-10.5.0
arm                   randconfig-1003-20261111    gcc-15.3.0
arm                            spitz_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261110    gcc-12.5.0
arm64                 randconfig-1000-20261111    gcc-13.5.0
arm64                 randconfig-1001-20261110    gcc-12.5.0
arm64                 randconfig-1001-20261111    gcc-13.5.0
arm64                 randconfig-1002-20261110    gcc-12.5.0
arm64                 randconfig-1002-20261111    gcc-13.5.0
arm64                 randconfig-1003-20261110    gcc-12.5.0
arm64                 randconfig-1003-20261111    gcc-13.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261110    gcc-12.5.0
csky                  randconfig-1000-20261111    gcc-13.5.0
csky                  randconfig-1001-20261110    gcc-12.5.0
csky                  randconfig-1001-20261111    gcc-13.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261110    clang-17
hexagon               randconfig-1000-20261111    clang-17
hexagon               randconfig-1001-20261110    clang-17
hexagon               randconfig-1001-20261111    clang-17
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261110    clang-22
i386        buildonly-randconfig-1000-20261111    clang-22
i386        buildonly-randconfig-1001-20261110    clang-22
i386        buildonly-randconfig-1001-20261111    clang-22
i386        buildonly-randconfig-1002-20261110    clang-22
i386        buildonly-randconfig-1002-20261111    clang-22
i386        buildonly-randconfig-1003-20261110    clang-22
i386        buildonly-randconfig-1003-20261111    clang-22
i386        buildonly-randconfig-1004-20261110    clang-22
i386        buildonly-randconfig-1004-20261111    clang-22
i386        buildonly-randconfig-1005-20261110    clang-22
i386        buildonly-randconfig-1005-20261111    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261110    gcc-14
i386                  randconfig-1000-20261111    gcc-13
i386                  randconfig-1001-20261110    gcc-14
i386                  randconfig-1001-20261111    gcc-13
i386                  randconfig-1002-20261110    gcc-14
i386                  randconfig-1002-20261111    gcc-13
i386                  randconfig-1003-20261110    gcc-14
i386                  randconfig-1003-20261111    gcc-13
i386                  randconfig-1004-20261110    gcc-14
i386                  randconfig-1004-20261111    gcc-13
i386                  randconfig-1005-20261110    gcc-14
i386                  randconfig-1005-20261111    gcc-13
i386                  randconfig-1006-20261110    gcc-14
i386                  randconfig-1006-20261111    gcc-13
i386                  randconfig-1007-20261110    clang-22
i386                  randconfig-1007-20261111    clang-22
i386                  randconfig-1008-20261110    clang-22
i386                  randconfig-1008-20261111    clang-22
i386                  randconfig-1009-20261110    clang-22
i386                  randconfig-1009-20261111    clang-22
i386                  randconfig-1010-20261110    clang-22
i386                  randconfig-1010-20261111    clang-22
i386                  randconfig-1011-20261110    clang-22
i386                  randconfig-1011-20261111    clang-22
i386                  randconfig-1012-20261110    clang-22
i386                  randconfig-1012-20261111    clang-22
i386                  randconfig-1013-20261110    clang-22
i386                  randconfig-1013-20261111    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261110    clang-17
loongarch             randconfig-1000-20261111    clang-17
loongarch             randconfig-1001-20261110    clang-17
loongarch             randconfig-1001-20261111    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                            ip22_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261110    clang-17
nios2                 randconfig-1000-20261111    clang-17
nios2                 randconfig-1001-20261110    clang-17
nios2                 randconfig-1001-20261111    clang-17
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            alldefconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1000-20261111    gcc-15.3.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc                randconfig-1001-20261111    gcc-15.3.0
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.2.0
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    gcc-16.2.0
powerpc                    microwatt_defconfig    gcc-16.2.0
powerpc                      mpc83xx_defconfig    gcc-16.2.0
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1000-20261111    gcc-15.3.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261111    gcc-15.3.0
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64                         alldefconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1000-20261111    gcc-15.3.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261111    gcc-15.3.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261110    clang-24
riscv                 randconfig-1000-20261111    clang-17
riscv                 randconfig-1001-20261110    clang-24
riscv                 randconfig-1001-20261111    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261110    clang-24
s390                  randconfig-1000-20261111    clang-17
s390                  randconfig-1001-20261110    clang-24
s390                  randconfig-1001-20261111    clang-17
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                         apsh4ad0a_defconfig    gcc-16.2.0
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261110    clang-24
sh                    randconfig-1000-20261111    clang-17
sh                    randconfig-1001-20261110    clang-24
sh                    randconfig-1001-20261111    clang-17
sh                            se7722_defconfig    gcc-16.2.0
sh                            se7751_defconfig    gcc-16.2.0
sh                    secureedge5410_defconfig    gcc-16.2.0
sh                   sh7785lcr_32bit_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1000-20261111    gcc-14
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261111    gcc-14
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261111    gcc-14
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261111    gcc-14
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261111    gcc-14
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261111    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261110    gcc-14
x86_64                randconfig-1000-20261111    clang-22
x86_64                randconfig-1001-20261110    gcc-14
x86_64                randconfig-1001-20261111    clang-22
x86_64                randconfig-1002-20261110    gcc-14
x86_64                randconfig-1002-20261111    clang-22
x86_64                randconfig-1003-20261110    gcc-14
x86_64                randconfig-1003-20261111    clang-22
x86_64                randconfig-1004-20261110    gcc-14
x86_64                randconfig-1004-20261111    clang-22
x86_64                randconfig-1005-20261110    gcc-14
x86_64                randconfig-1005-20261111    clang-22
x86_64                randconfig-1006-20261110    gcc-14
x86_64                randconfig-1006-20261111    clang-22
x86_64                randconfig-1007-20261110    gcc-14
x86_64                randconfig-1007-20261111    clang-22
x86_64                randconfig-1008-20261110    gcc-14
x86_64                randconfig-1008-20261111    clang-22
x86_64                randconfig-1009-20261110    gcc-14
x86_64                randconfig-1009-20261111    clang-22
x86_64                randconfig-1010-20261110    gcc-14
x86_64                randconfig-1010-20261111    clang-22
x86_64                randconfig-1011-20261110    gcc-14
x86_64                randconfig-1011-20261111    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261110    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

