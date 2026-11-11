Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448BB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G8CTR5XK;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RWo+FAiY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=l229Jymm0hukN4GR9T2QfTJRyTuGRdRT9KRFI6tnxTI=; b=G8CTR5XK1TC8n3ONcdpFYXLBDL
	wZaGBS0C5es0t1DLhqel607Ex/7RvwmBuEYK+JBTN9ebw9tcBrpeqie3ptxp33njtqVAj8nW3Z+RE
	nE9uSDJsoOS1rBjMnVmg7ri9017i89MS5J5qVK8WemlsPjmPaW0s265T3o0otfrn46SDIVVaDkBmo
	y5+AfTe7CzJ7GzLpQqz2sl5V14BUpGKshzBKpmIGc/6BobcIE4/vUEzlCknRk5vnlTZyGS1lz1fve
	XUBK9I5PhlUSj0hge5uvNyyVE4lsn1YoLCo5hBL0GPI13IzmE9ThQO6NEFhqvEDQCZZAVMeneMaWP
	VPIM+JLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxn5-00000005Pus-2phz;
	Wed, 11 Nov 2026 02:10:23 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxn3-00000005PuR-0WKs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794363021; x=1825899021;
  h=date:from:to:cc:subject:message-id;
  bh=hL9vy+/h9D1VlGmqXlZf7y32ETR5h3ulYwdfgWx81gM=;
  b=RWo+FAiYEn8s2q3PaowOPzrHd/wAgsuqfkvvwqFYckYc0xfAfiupxjmD
   ykY0hooIKchBUnlWoopHcN/HbfOjtLHyKNagyrAoeqt7MQjh8tkXMKNIn
   S/bTYbpMBjOh1BJ7YGpqrqi5ACJLppiBpOTXst1RFPP3iFawEW6Fr1FNp
   VbWYivM7KQnNTAMW7u7rJjP9h7VbW/pzj6tiCL0wrg0McBmzW/ZYdgFzA
   Ow+qhaZy2DVb1LRa9DjEU3WUHFwA+IdKraGaKWZuR60ilNSL5BeYrxiZ1
   8u4a/9HRL46ud3QC1t9aE+d79LKPRULDnYEhfhAK7d/DF94EIUfwo3gqx
   A==;
X-CSE-ConnectionGUID: rgeAW4EzQXyFaZRMCmYxJg==
X-CSE-MsgGUID: q7lVMFJpSYWeVZE1u7DkuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3131921"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3131921"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 18:10:19 -0800
X-CSE-ConnectionGUID: ZA5TnXqMTgeah3GaChIQnA==
X-CSE-MsgGUID: p/JEXeeeTl6l2uVYfF8fVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8622961"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Nov 2026 18:10:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQxmu-00000000xt1-0gmj;
	Wed, 11 Nov 2026 02:10:12 +0000
Date: Wed, 11 Nov 2026 10:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:brcm-bcmbt-mac] BUILD SUCCESS
 aa02fda215f12c4e1951223245aa983bc2d5f7bd
Message-ID: <20261111101004.HBDXlRPH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_181021_236006_7BEB84EA 
X-CRM114-Status: UNSURE (   5.48  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/brcm-bcmbt-mac
branch HEAD: aa02fda215f12c4e1951223245aa983bc2d5f7bd  Bluetooth: hci_bcm: Prefer a valid platform BD address

elapsed time: 907m

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

