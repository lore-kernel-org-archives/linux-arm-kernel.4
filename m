Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7500A606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 21:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eUYuqC0y;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V5UQuZbH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=R8QEb8I4duKxmZR8AB6JmMlZIf9uNP6zUhG8/fqA5I8=; b=eUYuqC0yBtpW4uVuT2uqKZxjVE
	7/YzW36yJMh/m29BV70r9XOSrL/8t2COyoNc3mNxMpHZnLAa7+iuN7o40HJ4MuzD+wcCVBJUUP67/
	H/nGicm8fwbI9aW0DwLu4U0ktxHkwCtTYZIE7eqaKuwBUWK69AatgUiOpoe9iJDBw6lqXHCHbGoAH
	2DEtwQ9qqSXLw2Pm7U2is1GeWzQ+O/vS25usSB3u3R8tecIqOGVxcfYX83XO6TYQbaWRhP1TzlJYZ
	r69Pv8+BN5H6E5PPCIYX2j1ys/Si1VvR37GTvcw/Mf2X7x8WB0OekEobrFHfEEIPHJVS3CCqHFMxo
	bZcX5z4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4EJ-00000003xQf-0IRd;
	Mon, 16 Nov 2026 21:27:11 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4EE-00000003xMh-1YuR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 21:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864426; x=1826400426;
  h=date:from:to:cc:subject:message-id;
  bh=pHcLC6FcI4mP5tycW2+NVkU/6uVu7gnATVvjgzHWAnU=;
  b=V5UQuZbHKFR6/y/PqspFGzVdiDXmRLB8fXtthi/OfMHPS5loBIpN4lpq
   77VO0rYeHsdqRfrraCVyHab5EPMjOrCQN8uP52oK1QK8FO+64xX2+GyEc
   L2dLpeNWmWqgYntWKGxwh+iFYj+SDF9Imx8dWWlJr/aY1w//tD6guX/zA
   U++LehoxhifDbpRKxpw7u2Noe5wekI0mLuKCSR/0LtaQrx8H6kfzCu585
   /heSkdtSSeE/aMZgxlRdNKaxoWb2M39dbzsF3qBmUNS/zYL17xA7JBOp1
   yvHvccQUG3WX7aYu4HU55J4UgATfRUVqMCCRvXUER2lv0ApBX/FNdNFCC
   Q==;
X-CSE-ConnectionGUID: ATwEQKrXSGaw1scFmIR8TA==
X-CSE-MsgGUID: taafU1smTniddTBKY2lonw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3645887"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3645887"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:27:06 -0800
X-CSE-ConnectionGUID: DRFhS5lyR5eSpCOCyNyOTQ==
X-CSE-MsgGUID: L0XKpPoSQNCwUZX7e4aHmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9897182"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Nov 2026 13:27:02 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT4E7-000000019SU-2Fwc;
	Mon, 16 Nov 2026 21:26:59 +0000
Date: Tue, 17 Nov 2026 05:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:pr-soc-v7.5-ux500-defconfig] BUILD SUCCESS
 f908ea8a0f2de52dca6b19ef14885ed6f034fe58
Message-ID: <20261117052607.cBFCHZHh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_132706_892688_C4F8BAE3 
X-CRM114-Status: UNSURE (   5.45  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git pr-soc-v7.5-ux500-defconfig
branch HEAD: f908ea8a0f2de52dca6b19ef14885ed6f034fe58  ARM: configs: u8500: Enable compressed firmware loading

elapsed time: 1474m

configs tested: 91
configs skipped: 273

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                    allnoconfig    gcc-16.2.0
alpha                   allyesconfig    gcc-16.2.0
alpha       randconfig-2200-20261115    gcc-8.5.0  smatch
arc                      allnoconfig    gcc-16.2.0
arc                     allyesconfig    clang-24
arc         randconfig-2000-20261115    gcc-8.5.0
arc         randconfig-2001-20261115    gcc-8.5.0
arc         randconfig-2002-20261115    gcc-8.5.0
arc         randconfig-2003-20261115    gcc-8.5.0
arc         randconfig-2004-20261115    gcc-8.5.0
arc         randconfig-2005-20261115    gcc-8.5.0
arc         randconfig-2200-20261115    gcc-16.2.0 smatch
arm                      allnoconfig    gcc-16.2.0
arm         randconfig-2200-20261115    clang-17   smatch
arm64                   allmodconfig    clang-24
arm64                    allnoconfig    gcc-16.2.0
arm64       randconfig-2200-20261115    gcc-15.3.0 smatch
csky                    allmodconfig    gcc-16.2.0
csky                     allnoconfig    gcc-16.2.0
csky        randconfig-2000-20261115    gcc-14.4.0
csky        randconfig-2001-20261115    gcc-14.4.0
hexagon                 allmodconfig    gcc-16.2.0
hexagon                  allnoconfig    gcc-16.2.0
hexagon     randconfig-2000-20261115    gcc-14.4.0
hexagon     randconfig-2001-20261115    gcc-14.4.0
hexagon     randconfig-2200-20261115    clang-24   smatch
i386                    allmodconfig    clang-22
i386                     allnoconfig    gcc-16.2.0
i386                    allyesconfig    clang-22
i386        randconfig-2200-20261115    gcc-14     smatch
loongarch               allmodconfig    clang-24
loongarch                allnoconfig    gcc-16.2.0
m68k                    allmodconfig    gcc-16.2.0
m68k                     allnoconfig    gcc-16.2.0
m68k        randconfig-2200-20261115    gcc-8.5.0  smatch
microblaze               allnoconfig    gcc-16.2.0
microblaze              allyesconfig    gcc-16.2.0
microblaze  randconfig-2200-20261115    gcc-12.5.0 smatch
mips                     allnoconfig    gcc-16.2.0
mips                    allyesconfig    gcc-16.2.0
mips        randconfig-2000-20261115    gcc-10.5.0
mips        randconfig-2001-20261115    gcc-10.5.0
mips        randconfig-2002-20261115    gcc-10.5.0
mips        randconfig-2200-20261115    clang-24   smatch
nios2                   allmodconfig    clang-20
nios2                    allnoconfig    clang-24
nios2       randconfig-2200-20261115    gcc-11.5.0 smatch
openrisc                allmodconfig    clang-20
openrisc                 allnoconfig    clang-24
openrisc    randconfig-2000-20261115    gcc-10.5.0
openrisc    randconfig-2001-20261115    gcc-10.5.0
openrisc    randconfig-2002-20261115    gcc-10.5.0
parisc                   allnoconfig    clang-24
parisc                  allyesconfig    clang-17
parisc      randconfig-2200-20261115    gcc-10.5.0 smatch
powerpc                  allnoconfig    clang-24
powerpc     randconfig-2200-20261115    clang-17   smatch
riscv                   allmodconfig    clang-24
riscv                    allnoconfig    clang-24
riscv       randconfig-2200-20261115    clang-24   smatch
s390                    allmodconfig    clang-17
s390                     allnoconfig    clang-24
s390        randconfig-2200-20261115    clang-24   smatch
sh                      allmodconfig    gcc-16.2.0
sh                       allnoconfig    clang-24
sh                      allyesconfig    clang-17
sh          randconfig-2200-20261115    gcc-16.2.0 smatch
sparc                    allnoconfig    clang-24
sparc       randconfig-2200-20261115    gcc-16.2.0 smatch
sparc64                 allmodconfig    clang-20
um                      allmodconfig    clang-17
um                       allnoconfig    clang-24
um                      allyesconfig    gcc-16.2.0
um          randconfig-2200-20261115    clang-24   smatch
x86_64                  allmodconfig    clang-22
x86_64                   allnoconfig    clang-24
x86_64                  allyesconfig    clang-22
x86_64                         kexec    clang-22
x86_64      randconfig-2200-20261115    clang-22   smatch
x86_64                      rhel-9.4    clang-22
x86_64                  rhel-9.4-bpf    gcc-14
x86_64                 rhel-9.4-func    clang-22
x86_64           rhel-9.4-kselftests    clang-22
x86_64                rhel-9.4-kunit    gcc-14
x86_64                  rhel-9.4-ltp    gcc-14
x86_64                 rhel-9.4-rust    clang-22
xtensa                   allnoconfig    clang-24
xtensa                  allyesconfig    clang-20
xtensa      randconfig-2000-20261115    gcc-14.4.0
xtensa      randconfig-2001-20261115    gcc-14.4.0
xtensa      randconfig-2200-20261115    gcc-14.4.0 smatch

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

