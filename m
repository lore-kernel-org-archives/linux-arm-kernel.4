Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C8C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OqF8xRRt;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mx6Z8KJZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=djr30kJUbBtNPzdrfTHtPCTmiDBuGUXfM48PhV31p5Q=; b=OqF8xRRtPmrXFnApZJobQAM3fG
	hoJ8yzGd+G2hquREA+QTv0Zc6WUVk0CuAF4z+X8FbFgT71YltVpj6Pr02/k6i6aPN1R5frVFbsYt5
	WtmX7nQTGFy0/CI74cxpErvI20ce3M9E47j9criuoJNzYn9l5DvtOLJSmWo5X0N4m+L79KQ4UdvCy
	MuyOmzO3euifAUb9SbhaVM2hJWj8uzsOFcdn1YOYDJTzpyBNprDmz9kL4joCZdVEbR/abrAH+5ALa
	NeOVzH5qYiMFAILp/x0Qt6RO9o3ekncyw1fOvS+P0A4/Mg+jQs4pOQVAnI8hEy9K+M/psWbxQt0Ob
	gPEkGCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvbe-00000002Jyu-1rtT;
	Mon, 16 Nov 2026 12:14:42 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvbb-00000002JxY-0nZh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794831279; x=1826367279;
  h=date:from:to:cc:subject:message-id;
  bh=95NrJuU2AeV0WJL9OyduErVmSInj4ryNNdW60mauedg=;
  b=Mx6Z8KJZI7pZbpIJRyZ6bndH5GXMb9Wfvdy4gpKUbZ9TMkE5rAzfkxvz
   ZAqlStNxhNnPlhpEhYXHgE/ZznclrfYirhw7k0xK+zTimKrJ6jJlDFSp+
   rEUgEk7wnuMJVilwbMRKVGxCxegL/MRVDNmHIxuoXFnlDecBR411PjCMj
   xs8kZar4DUopz61ILMbGmmvQeW7+JmnW5XxT7+bq6QAVq+PcorNVufXMI
   GgOZutFT6z/5gUSAFokMrmpYgeDB3MPaE4OjsYsoXea2w8YL0mem/+Bwb
   PkB51c1rmssmvWy918vXubuhm9Ksa//vLiwG200coyqaCaO++wuARHDRf
   Q==;
X-CSE-ConnectionGUID: 8EbGCCoqRHurcLbhePq2og==
X-CSE-MsgGUID: FpsKE2fQTeWttrdCYMAz0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3579631"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3579631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:14:39 -0800
X-CSE-ConnectionGUID: /S+gVxp8RvqPGIIqElxiQg==
X-CSE-MsgGUID: sejEfC7uQSOWwJZDG1z+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9380911"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Nov 2026 04:14:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSvbX-000000018Vo-03BD;
	Mon, 16 Nov 2026 12:14:35 +0000
Date: Mon, 16 Nov 2026 20:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-drm-mcde-powerdomain] BUILD SUCCESS
 a5def1da6a996a0ff5de6897408ffd531ac6ed9e
Message-ID: <20261116201425.Fpe03CF3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_041439_326055_8CBCE420 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-drm-mcde-powerdomain
branch HEAD: a5def1da6a996a0ff5de6897408ffd531ac6ed9e  drm/mcde: Use power domain for display power

elapsed time: 922m

configs tested: 205
configs skipped: 4

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
arc                   randconfig-1000-20261116    gcc-8.5.0
arc                   randconfig-1001-20261116    gcc-8.5.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          at91_dt_defconfig    gcc-16.2.0
arm                      davinci_all_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    clang-24
arm                        imx_v4_v5_defconfig    clang-24
arm                           moxart_defconfig    clang-24
arm                             mps2_defconfig    clang-24
arm                        multi_v4t_defconfig    clang-24
arm                              mxs_defconfig    clang-17
arm                         neponset_defconfig    gcc-16.2.0
arm                          orion5x_defconfig    gcc-16.2.0
arm                              pxa_defconfig    gcc-14
arm                   randconfig-1000-20261116    gcc-8.5.0
arm                   randconfig-1001-20261116    gcc-8.5.0
arm                   randconfig-1002-20261116    gcc-8.5.0
arm                   randconfig-1003-20261116    gcc-8.5.0
arm                         realview_defconfig    clang-17
arm                            tegra_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261116    gcc-10.5.0
arm64                 randconfig-1001-20261116    gcc-10.5.0
arm64                 randconfig-1002-20261116    gcc-10.5.0
arm64                 randconfig-1003-20261116    gcc-10.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261116    gcc-10.5.0
csky                  randconfig-1001-20261116    gcc-10.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261116    clang-17
hexagon               randconfig-1001-20261116    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
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
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261116    clang-17
loongarch             randconfig-1001-20261116    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    clang-17
m68k                        m5249evb_defconfig    gcc-14
m68k                         m5272c3_defconfig    gcc-14
m68k                        m5282evb_defconfig    gcc-14
m68k                        m5329evb_defconfig    clang-17
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   cavium_octeon_defconfig    clang-17
mips                            ip27_defconfig    gcc-14
mips                            ip28_defconfig    clang-24
mips                            jazz_defconfig    gcc-14
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261116    clang-17
nios2                 randconfig-1001-20261116    clang-17
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261116    gcc-16.2.0
parisc                randconfig-1001-20261116    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        eiger_defconfig    clang-17
powerpc                       ep88xc_defconfig    clang-24
powerpc                     gamecube_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                   mpc885_ads_defconfig    clang-24
powerpc                     mvme5100_defconfig    clang-24
powerpc                      powernv_defconfig    clang-24
powerpc               randconfig-1000-20261116    gcc-16.2.0
powerpc               randconfig-1001-20261116    gcc-16.2.0
powerpc                     sam440ep_defconfig    clang-24
powerpc                      stx_gp3_defconfig    clang-24
powerpc                      tqm5200_defconfig    gcc-16.2.0
powerpc                         warp_defconfig    clang-24
powerpc64             randconfig-1000-20261116    gcc-16.2.0
powerpc64             randconfig-1001-20261116    gcc-16.2.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261116    clang-17
riscv                 randconfig-1001-20261116    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261116    clang-17
s390                  randconfig-1001-20261116    clang-17
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261116    clang-17
sh                    randconfig-1001-20261116    clang-17
sh                           sdk7786_defconfig    clang-17
sh                            se7206_defconfig    clang-17
sh                    sh7724_generic_defconfig    gcc-14
sh                               ul2_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261116    gcc-16.2.0
sparc                 randconfig-1001-20261116    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261116    gcc-16.2.0
sparc64               randconfig-1001-20261116    gcc-16.2.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261116    gcc-16.2.0
um                    randconfig-1001-20261116    gcc-16.2.0
um                            x86_64_defconfig    gcc-14
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
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261116    gcc-16.2.0
xtensa                randconfig-1001-20261116    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

