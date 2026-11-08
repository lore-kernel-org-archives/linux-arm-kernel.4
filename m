Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB09606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PAELjsB/;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gNtdwvxs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uhVqLbfyLXDEoo+nGg3B4gzN+ZBZTp0o6+BrUhDsqM8=; b=PAELjsB/dbABgjzfYaLG/V3Nle
	JDRvpOTicZstSrAlxmTqzZsFOAHJa88zQzPJjtHgQwT/YuXq75nS9G8gCuEIqvH/zopmkXIxt1h1D
	R/xf9HcGtLBMB49mj2KdG5UcZ38sTXuhu4QyOFL15FJJXNWFcqfGrG/t3ELM0ohU5NTUk6gVVVVZq
	AJ9rko/miV832pF5rgg6N2Eja8zyZRUcougKEtvXZfdr4XTPq0+GZVPqTu+4O6njw1uSE0nKnZkTp
	oTNnN7Aau+CSZm92kniF8gTpOQEuHkIeBXiODJaUoa7rRlIB6nS5c1JjJcAbpzqVp4NfeG2oEoeG0
	4gaoxDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ25l-0000000GAOS-0vOJ;
	Sun, 08 Nov 2026 12:33:49 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ25i-0000000GANz-0vGC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 12:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794141227; x=1825677227;
  h=date:from:to:cc:subject:message-id;
  bh=uEbPs2mqhd1rSlOjq8iMmobHrI7hxpcGB5ucKP27QJs=;
  b=gNtdwvxsInC8BU9ohODR08DJ8bUmUIx1vtpCuw4fzbA36gvaagYOu/Mx
   kW3wZEcOZhTUK5sGxmwqGQSyXsCHGPaQ9ZPO4WEJGHcRyRz8p0QLQWHGU
   QY/KhHVFotvTqX75mPH2IsCCjsKkVCKKXwUe8A/18ojOVXLagEmSC+/iM
   vsZ2aYXzhwFKl61vWLffNGEz+UjrfA6PO56MmCIaHOY32OwkKQ8ePhJSt
   OUfktB0WHHhmI1/Ihl7Vp9QOZajYPaxHcfWsp+MD8LQTAc8ECsXzrLfvn
   P/FL2oz/6Kp510AWDLSEloQCgkn3AIiIeoJuzZeqdLcY7g6lRubZVydEv
   Q==;
X-CSE-ConnectionGUID: IffzEoKvTkuTKIvSsPOiNg==
X-CSE-MsgGUID: lawjJ+dHT1+qoD9izzstLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2788539"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2788539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 04:33:46 -0800
X-CSE-ConnectionGUID: czrn0QbbQjaipixWBYCDtg==
X-CSE-MsgGUID: +5qRAEdpQ9eaixAJr9VeLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7785761"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2026 04:33:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ25d-00000000swZ-2bXV;
	Sun, 08 Nov 2026 12:33:41 +0000
Date: Sun, 08 Nov 2026 20:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:gp2ap030] BUILD SUCCESS
 68669d537410b2216c86b63ff1cbe3b6701acdb9
Message-ID: <20261108203324.1WYkaDep-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_043346_340976_802291AB 
X-CRM114-Status: UNSURE (   5.24  )
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
branch HEAD: 68669d537410b2216c86b63ff1cbe3b6701acdb9  iio: light: gp2ap020a00f: Add GP2AP030A00F support

elapsed time: 780m

configs tested: 192
configs skipped: 3

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
arc                             hsdk_defconfig    clang-24
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261108    gcc-11.5.0
arc                   randconfig-1001-20261108    gcc-11.5.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                           ep93xx_defconfig    clang-24
arm                         multi_v7_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261108    gcc-11.5.0
arm                   randconfig-1001-20261108    gcc-11.5.0
arm                   randconfig-1002-20261108    gcc-11.5.0
arm                   randconfig-1003-20261108    gcc-11.5.0
arm                         realview_defconfig    clang-19
arm                            stm32_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                       quartz64_defconfig    clang-24
arm64                       quartz64_defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261108    clang-24
arm64                 randconfig-1001-20261108    clang-24
arm64                 randconfig-1002-20261108    clang-24
arm64                 randconfig-1003-20261108    clang-24
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261108    clang-24
csky                  randconfig-1001-20261108    clang-24
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261108    gcc-16.2.0
hexagon               randconfig-1001-20261108    gcc-16.2.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261108    clang-22
i386        buildonly-randconfig-1001-20261108    clang-22
i386        buildonly-randconfig-1002-20261108    clang-22
i386        buildonly-randconfig-1003-20261108    clang-22
i386        buildonly-randconfig-1004-20261108    clang-22
i386        buildonly-randconfig-1005-20261108    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261108    gcc-14
i386                  randconfig-1001-20261108    gcc-14
i386                  randconfig-1002-20261108    gcc-14
i386                  randconfig-1003-20261108    gcc-14
i386                  randconfig-1004-20261108    gcc-14
i386                  randconfig-1005-20261108    gcc-14
i386                  randconfig-1006-20261108    gcc-14
i386                  randconfig-1007-20261108    clang-22
i386                  randconfig-1008-20261108    clang-22
i386                  randconfig-1009-20261108    clang-22
i386                  randconfig-1010-20261108    clang-22
i386                  randconfig-1011-20261108    clang-22
i386                  randconfig-1012-20261108    clang-22
i386                  randconfig-1013-20261108    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261108    gcc-16.2.0
loongarch             randconfig-1001-20261108    gcc-16.2.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           sun3x_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                            gcw0_defconfig    clang-19
mips                         qi_lb60_defconfig    gcc-16.2.0
mips                            xway_defconfig    clang-19
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261108    gcc-16.2.0
nios2                 randconfig-1001-20261108    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                     or1ksim_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-32bit_defconfig    clang-24
parisc                randconfig-1000-20261108    clang-24
parisc                randconfig-1001-20261108    clang-24
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                      akebono_defconfig    clang-19
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       bamboo_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261108    clang-24
powerpc               randconfig-1001-20261108    clang-24
powerpc                      taishan_defconfig    clang-19
powerpc                  xes_mpc85xx_defconfig    gcc-16.2.0
powerpc64                         alldefconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261108    clang-24
powerpc64             randconfig-1001-20261108    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.2.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                         apsh4ad0a_defconfig    clang-19
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sh                           r7785rp_defconfig    clang-19
sh                           rsk7269_defconfig    clang-24
sh                            se7750_defconfig    clang-24
sh                         sh7763rdp_defconfig    clang-19
sh                             shmin_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261108    gcc-8.5.0
sparc                 randconfig-1001-20261108    gcc-8.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261108    gcc-8.5.0
sparc64               randconfig-1001-20261108    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261108    gcc-8.5.0
um                    randconfig-1001-20261108    gcc-8.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261108    gcc-14
x86_64      buildonly-randconfig-1001-20261108    gcc-14
x86_64      buildonly-randconfig-1002-20261108    gcc-14
x86_64      buildonly-randconfig-1003-20261108    gcc-14
x86_64      buildonly-randconfig-1004-20261108    gcc-14
x86_64      buildonly-randconfig-1005-20261108    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261108    gcc-14
x86_64                randconfig-1001-20261108    gcc-14
x86_64                randconfig-1002-20261108    gcc-14
x86_64                randconfig-1003-20261108    gcc-14
x86_64                randconfig-1004-20261108    gcc-14
x86_64                randconfig-1005-20261108    gcc-14
x86_64                randconfig-1006-20261108    clang-22
x86_64                randconfig-1007-20261108    clang-22
x86_64                randconfig-1008-20261108    clang-22
x86_64                randconfig-1009-20261108    clang-22
x86_64                randconfig-1010-20261108    clang-22
x86_64                randconfig-1011-20261108    clang-22
x86_64                randconfig-1012-20261108    clang-22
x86_64                randconfig-1013-20261108    clang-22
x86_64                randconfig-1014-20261108    clang-22
x86_64                randconfig-1015-20261108    clang-22
x86_64                randconfig-1016-20261108    clang-22
x86_64                randconfig-1017-20261108    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261108    gcc-8.5.0
xtensa                randconfig-1001-20261108    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

