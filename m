Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E68C606A69D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4HKKGq0K;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LSdwfDDd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=riSKeHUv9GCmJJ7aWns9gDv3HeKaBPisHw9X6L2O5UA=; b=4HKKGq0KqbqQDuXXF5yi+CpvB2
	c4TU8pB7Uc6bF3KQkrrP0WG2XSdAPkrTG/rOpC+nSXua1wb70cFRBmCXJcvtpuQtCRBiIfxXZSuSQ
	zVuqs+J1/NPPguiIWd5fbyYIjYHk2lFJSa6J/bXFF0IzjFuFkrykH0yJV9uqjNs1fynNK8CDWJtdw
	NSD++cCzc9AJzZjjWQB+Y2jsNKzaHbUy9zIoVj1UdqU6XqqSUFmx/lElwUMIf/XajPkb0LnwKFUZR
	H6+puh930w4i8ZM+gV7sB//zh8lnCspOZrQT9anfegzrmaoQ7BgcjA0hzEeCkZWOhdTbVTuISC1Is
	PN/X3+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfJW-0000000EMkd-3brR;
	Thu, 26 Nov 2026 19:39:26 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfJN-0000000EMiN-2pyj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795721958; x=1827257958;
  h=date:from:to:cc:subject:message-id;
  bh=xi1AUi+anZSmJCti51p89IkJqLBOss1xjNctqWAwf/Y=;
  b=LSdwfDDdRa+Iag0pDYzVOpwDhflFVI0e0M0hzUF0HNoYGC7gh68ozMpw
   aIZmsVpPNs4i3GokIQqbvUIOotihVNgMXLJ8oZV20gW6lUlMpLbs6EUZf
   +/fIjNA+jaqngsA6XSXwOaaJHkuJX0MBgQ906aeM5Qj58vkQw2isAvJyo
   0AU1qnec24uzh/Vrp/vGTXQ6X8IFEtgu57P1LvisHxLUPzQzArBFvjGyh
   uK0QoYIhARW1h1HZA4EGMbAci7+EJvtYeAvseWBPHE//LMM+Y9DXv1/YI
   XGz2RG7ZJ4BHjaRVMcbfmhRi40AalvHvO0vaaD1+zpaLB49T4DZdIj+Fb
   Q==;
X-CSE-ConnectionGUID: 8stKkMMmQUW9aOgL+gAksA==
X-CSE-MsgGUID: SD5wK2BNRHOZ16u/SN8Reg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4495225"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4495225"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 11:39:16 -0800
X-CSE-ConnectionGUID: AwIwXKMkTWiZjCSpQ6MbTg==
X-CSE-MsgGUID: 6PF/wyu6SbqXV5TmgAEn/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12241356"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2026 11:39:14 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWfJH-00000001Uhy-2Fgi;
	Thu, 26 Nov 2026 19:39:11 +0000
Date: Fri, 27 Nov 2026 03:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 9592e3c9af2c97cd7220c22ecab97e0875a0f51a
Message-ID: <20261127033848.HfDJsSFV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113917_738496_4A64B9AB 
X-CRM114-Status: UNSURE (   5.44  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: 9592e3c9af2c97cd7220c22ecab97e0875a0f51a  soc: document merges

elapsed time: 1479m

configs tested: 532
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-16.2.0
alpha                    allyesconfig    gcc-16.2.0
alpha                       defconfig    gcc-16.2.0
alpha        randconfig-2000-20261125    gcc-12.5.0
alpha        randconfig-2000-20261125    gcc-8.5.0
alpha        randconfig-2000-20261126    gcc-13.5.0
alpha        randconfig-2001-20261125    gcc-8.5.0
alpha        randconfig-2001-20261126    gcc-13.5.0
alpha        randconfig-2200-20261125    gcc-10.5.0 smatch
alpha        randconfig-2200-20261126    gcc-9.5.0  smatch
alpha       randconfig-r2100-20261126    gcc-10.5.0 cocci
alpha       randconfig-r2110-20261126    clang-24   cocci
alpha       randconfig-r2111-20261126    gcc-14.4.0 cocci
alpha       randconfig-r2300-20261125    gcc-10.5.0 sparse
alpha       randconfig-r2306-20261125    gcc-8.5.0  sparse
alpha       randconfig-r2309-20261125    gcc-8.5.0  sparse
alpha       randconfig-r2311-20261125    gcc-8.5.0  sparse
arc                      allmodconfig    clang-24
arc                       allnoconfig    gcc-16.2.0
arc                      allyesconfig    clang-24
arc                         defconfig    gcc-16.2.0
arc          randconfig-2000-20261125    gcc-10.5.0
arc          randconfig-2000-20261125    gcc-8.5.0
arc          randconfig-2000-20261126    gcc-9.5.0
arc          randconfig-2001-20261125    gcc-10.5.0
arc          randconfig-2001-20261126    gcc-9.5.0
arc          randconfig-2002-20261125    gcc-10.5.0
arc          randconfig-2002-20261125    gcc-16.2.0
arc          randconfig-2002-20261126    gcc-9.5.0
arc          randconfig-2003-20261125    gcc-10.5.0
arc          randconfig-2003-20261126    gcc-9.5.0
arc          randconfig-2004-20261125    gcc-10.5.0
arc          randconfig-2004-20261125    gcc-12.5.0
arc          randconfig-2004-20261126    gcc-9.5.0
arc          randconfig-2005-20261125    gcc-10.5.0
arc          randconfig-2005-20261126    gcc-9.5.0
arc          randconfig-2200-20261125    gcc-14.4.0 smatch
arc          randconfig-2200-20261126    gcc-8.5.0  smatch
arc         randconfig-r2103-20261125    gcc-11.5.0 cocci
arc         randconfig-r2106-20261126    gcc-14.4.0 cocci
arc         randconfig-r2111-20261125    gcc-10.5.0 cocci
arc         randconfig-r2303-20261125    gcc-8.5.0  sparse
arc         randconfig-r2306-20261126    clang-18   sparse
arm                       allnoconfig    gcc-16.2.0
arm                      allyesconfig    clang-24
arm                         defconfig    gcc-16.2.0
arm          randconfig-2000-20261125    clang-17
arm          randconfig-2000-20261125    clang-22
arm          randconfig-2000-20261126    gcc-11.5.0
arm          randconfig-2001-20261125    clang-22
arm          randconfig-2001-20261126    gcc-11.5.0
arm          randconfig-2002-20261125    clang-17
arm          randconfig-2002-20261125    clang-22
arm          randconfig-2002-20261126    gcc-11.5.0
arm          randconfig-2200-20261125    clang-21   smatch
arm          randconfig-2200-20261126    gcc-8.5.0  smatch
arm         randconfig-r2105-20261125    gcc-8.5.0  cocci
arm         randconfig-r2110-20261125    gcc-10.5.0 cocci
arm         randconfig-r2301-20261126    clang-24   sparse
arm         randconfig-r2304-20261126    clang-22   sparse
arm         randconfig-r2306-20261125    gcc-8.5.0  sparse
arm64                    allmodconfig    clang-24
arm64                     allnoconfig    gcc-16.2.0
arm64                       defconfig    gcc-16.2.0
arm64        randconfig-1000-20261126    gcc-8.5.0
arm64        randconfig-1001-20261126    gcc-8.5.0
arm64        randconfig-1002-20261126    gcc-8.5.0
arm64        randconfig-1003-20261126    gcc-8.5.0
arm64        randconfig-2000-20261125    clang-22
arm64        randconfig-2000-20261125    clang-24
arm64        randconfig-2000-20261126    gcc-11.5.0
arm64        randconfig-2001-20261125    clang-22
arm64        randconfig-2001-20261125    gcc-8.5.0
arm64        randconfig-2001-20261126    gcc-11.5.0
arm64        randconfig-2002-20261125    clang-17
arm64        randconfig-2002-20261125    clang-22
arm64        randconfig-2002-20261126    gcc-11.5.0
arm64        randconfig-2200-20261125    gcc-13.5.0 smatch
arm64        randconfig-2200-20261126    clang-24   smatch
arm64       randconfig-r2104-20261125    gcc-8.5.0  cocci
arm64       randconfig-r2109-20261126    gcc-14.4.0 cocci
arm64       randconfig-r2301-20261126    clang-22   sparse
arm64       randconfig-r2302-20261126    clang-22   sparse
csky                     allmodconfig    gcc-16.2.0
csky                      allnoconfig    gcc-16.2.0
csky                        defconfig    gcc-16.2.0
csky         randconfig-1000-20261126    gcc-8.5.0
csky         randconfig-1001-20261126    gcc-8.5.0
csky         randconfig-2000-20261125    gcc-14.4.0
csky         randconfig-2000-20261125    gcc-16.2.0
csky         randconfig-2000-20261126    gcc-13.5.0
csky         randconfig-2001-20261125    gcc-14.4.0
csky         randconfig-2001-20261126    gcc-13.5.0
csky         randconfig-2200-20261125    gcc-16.2.0 smatch
csky         randconfig-2200-20261126    gcc-13.5.0 smatch
csky        randconfig-r2102-20261125    gcc-13.5.0 cocci
csky        randconfig-r2103-20261126    clang-18   cocci
csky        randconfig-r2105-20261125    gcc-11.5.0 cocci
csky        randconfig-r2110-20261125    gcc-10.5.0 cocci
csky        randconfig-r2305-20261125    gcc-12     sparse
hexagon                  allmodconfig    gcc-16.2.0
hexagon                   allnoconfig    gcc-16.2.0
hexagon                     defconfig    gcc-16.2.0
hexagon      randconfig-2000-20261125    clang-17
hexagon      randconfig-2000-20261125    gcc-14.4.0
hexagon      randconfig-2000-20261126    gcc-13.5.0
hexagon      randconfig-2001-20261125    clang-24
hexagon      randconfig-2001-20261125    gcc-14.4.0
hexagon      randconfig-2001-20261126    gcc-13.5.0
hexagon      randconfig-2200-20261125    clang-17   smatch
hexagon      randconfig-2200-20261126    clang-17   smatch
hexagon     randconfig-r2103-20261126    gcc-10.5.0 cocci
hexagon     randconfig-r2303-20261126    clang-24   sparse
hexagon     randconfig-r2309-20261126    clang-18   sparse
hexagon     randconfig-r2311-20261126    clang-24   sparse
hexagon     randconfig-r2311-20261126    gcc-10.5.0 sparse
i386                     allmodconfig    clang-22
i386                      allnoconfig    gcc-16.2.0
i386                     allyesconfig    clang-22
i386                        defconfig    gcc-16.2.0
i386         randconfig-1000-20261126    clang-22
i386         randconfig-1001-20261126    clang-22
i386         randconfig-1002-20261126    clang-22
i386         randconfig-1003-20261126    clang-22
i386         randconfig-1004-20261126    clang-22
i386         randconfig-1005-20261126    clang-22
i386         randconfig-1006-20261126    clang-22
i386         randconfig-2000-20261125    clang-22
i386         randconfig-2000-20261125    gcc-14
i386         randconfig-2000-20261126    clang-22
i386         randconfig-2001-20261125    gcc-14
i386         randconfig-2001-20261126    clang-22
i386         randconfig-2002-20261125    gcc-14
i386         randconfig-2002-20261126    clang-22
i386         randconfig-2003-20261125    gcc-14
i386         randconfig-2003-20261126    clang-22
i386         randconfig-2004-20261125    clang-22
i386         randconfig-2004-20261125    gcc-14
i386         randconfig-2004-20261126    clang-22
i386         randconfig-2005-20261125    clang-22
i386         randconfig-2005-20261125    gcc-14
i386         randconfig-2005-20261126    clang-22
i386         randconfig-2100-20261125    clang-22   cocci
i386         randconfig-2100-20261126    clang-22   cocci
i386         randconfig-2101-20261125    clang-22   cocci
i386         randconfig-2101-20261126    clang-22   cocci
i386         randconfig-2102-20261125    clang-22   cocci
i386         randconfig-2102-20261126    clang-22   cocci
i386         randconfig-2103-20261125    clang-22   cocci
i386         randconfig-2103-20261126    clang-22   cocci
i386         randconfig-2104-20261125    clang-22   cocci
i386         randconfig-2104-20261125    gcc-14     cocci
i386         randconfig-2104-20261126    clang-22   cocci
i386         randconfig-2105-20261125    clang-22   cocci
i386         randconfig-2105-20261126    clang-22   cocci
i386         randconfig-2200-20261125    clang-22   smatch
i386         randconfig-2200-20261126    gcc-14     smatch
i386         randconfig-2300-20261125    clang-22   sparse
i386         randconfig-2300-20261126    gcc-14     sparse
i386         randconfig-2301-20261125    clang-22   sparse
i386         randconfig-2301-20261126    gcc-14     sparse
i386         randconfig-2302-20261125    clang-22   sparse
i386         randconfig-2302-20261126    gcc-14     sparse
i386        randconfig-r2102-20261125    gcc-11.5.0 cocci
i386        randconfig-r2106-20261125    gcc-14     cocci
i386        randconfig-r2108-20261125    gcc-10.5.0 cocci
i386        randconfig-r2109-20261126    clang-22   cocci
i386        randconfig-r2301-20261125    gcc-12     sparse
i386        randconfig-r2303-20261125    gcc-12     sparse
i386        randconfig-r2304-20261125    gcc-12     sparse
i386        randconfig-r2305-20261125    clang-22   sparse
i386        randconfig-r2305-20261126    clang-24   sparse
loongarch                allmodconfig    clang-24
loongarch                 allnoconfig    gcc-16.2.0
loongarch                   defconfig    clang-24
loongarch    randconfig-2000-20261125    clang-19
loongarch    randconfig-2000-20261126    gcc-12.5.0
loongarch    randconfig-2001-20261125    clang-19
loongarch    randconfig-2001-20261125    gcc-16.2.0
loongarch    randconfig-2001-20261126    gcc-12.5.0
loongarch    randconfig-2200-20261125    clang-18   smatch
loongarch    randconfig-2200-20261126    gcc-14.4.0 smatch
loongarch   randconfig-r2300-20261126    clang-22   sparse
loongarch   randconfig-r2307-20261126    gcc-10.5.0 sparse
m68k                     allmodconfig    gcc-16.2.0
m68k                      allnoconfig    gcc-16.2.0
m68k                     allyesconfig    clang-24
m68k                        defconfig    clang-24
m68k         randconfig-2000-20261125    gcc-8.5.0
m68k         randconfig-2000-20261126    gcc-13.5.0
m68k         randconfig-2001-20261125    gcc-11.5.0
m68k         randconfig-2001-20261125    gcc-8.5.0
m68k         randconfig-2001-20261126    gcc-13.5.0
m68k         randconfig-2200-20261125    gcc-15.3.0 smatch
m68k        randconfig-r2101-20261125    gcc-11.5.0 cocci
m68k        randconfig-r2104-20261126    gcc-10.5.0 cocci
m68k        randconfig-r2105-20261125    gcc-14.4.0 cocci
m68k        randconfig-r2110-20261126    gcc-14.4.0 cocci
microblaze                allnoconfig    gcc-16.2.0
microblaze               allyesconfig    gcc-16.2.0
microblaze                  defconfig    clang-24
microblaze   randconfig-2000-20261125    gcc-12.5.0
microblaze   randconfig-2000-20261125    gcc-8.5.0
microblaze   randconfig-2000-20261126    gcc-13.5.0
microblaze   randconfig-2001-20261125    gcc-10.5.0
microblaze   randconfig-2001-20261125    gcc-8.5.0
microblaze   randconfig-2001-20261126    gcc-13.5.0
microblaze   randconfig-2200-20261125    gcc-8.5.0  smatch
microblaze   randconfig-2200-20261126    gcc-9.5.0  smatch
microblaze  randconfig-r2100-20261125    gcc-8.5.0  cocci
microblaze  randconfig-r2308-20261125    gcc-10.5.0 sparse
mips                     allmodconfig    gcc-16.2.0
mips                      allnoconfig    gcc-16.2.0
mips                     allyesconfig    gcc-16.2.0
mips         randconfig-2000-20261125    gcc-14.4.0
mips         randconfig-2000-20261125    gcc-16.2.0
mips         randconfig-2000-20261126    gcc-16.2.0
mips         randconfig-2001-20261125    clang-17
mips         randconfig-2001-20261125    gcc-16.2.0
mips         randconfig-2001-20261126    gcc-16.2.0
mips         randconfig-2002-20261125    clang-24
mips         randconfig-2002-20261125    gcc-16.2.0
mips         randconfig-2002-20261126    gcc-16.2.0
mips         randconfig-2200-20261125    clang-24   smatch
mips         randconfig-2200-20261126    gcc-15.3.0 smatch
mips        randconfig-r2106-20261125    gcc-10.5.0 cocci
mips        randconfig-r2106-20261126    clang-24   cocci
mips        randconfig-r2108-20261126    clang-24   cocci
mips        randconfig-r2109-20261125    gcc-14     cocci
mips        randconfig-r2109-20261126    clang-24   cocci
mips        randconfig-r2300-20261125    gcc-12     sparse
nios2                    allmodconfig    clang-20
nios2                     allnoconfig    clang-24
nios2                       defconfig    clang-24
nios2        randconfig-2000-20261125    clang-19
nios2        randconfig-2000-20261125    gcc-8.5.0
nios2        randconfig-2000-20261126    gcc-12.5.0
nios2        randconfig-2001-20261125    clang-19
nios2        randconfig-2001-20261125    gcc-8.5.0
nios2        randconfig-2001-20261126    gcc-12.5.0
nios2        randconfig-2200-20261125    gcc-8.5.0  smatch
nios2        randconfig-2200-20261126    gcc-9.5.0  smatch
nios2       randconfig-r2100-20261125    gcc-8.5.0  cocci
nios2       randconfig-r2103-20261125    gcc-11.5.0 cocci
nios2       randconfig-r2104-20261126    clang-18   cocci
nios2       randconfig-r2108-20261126    gcc-14.4.0 cocci
nios2       randconfig-r2111-20261126    clang-22   cocci
nios2       randconfig-r2302-20261126    clang-24   sparse
nios2       randconfig-r2310-20261126    gcc-10.5.0 sparse
openrisc                 allmodconfig    clang-20
openrisc                  allnoconfig    clang-24
openrisc                    defconfig    gcc-16.2.0
openrisc     randconfig-2000-20261125    gcc-12.5.0
openrisc     randconfig-2000-20261125    gcc-16.2.0
openrisc     randconfig-2000-20261126    gcc-16.2.0
openrisc     randconfig-2001-20261125    gcc-10.5.0
openrisc     randconfig-2001-20261125    gcc-16.2.0
openrisc     randconfig-2001-20261126    gcc-16.2.0
openrisc     randconfig-2002-20261125    gcc-16.2.0
openrisc     randconfig-2002-20261126    gcc-16.2.0
openrisc     randconfig-2200-20261125    gcc-10.5.0 smatch
openrisc     randconfig-2200-20261126    gcc-9.5.0  smatch
openrisc    randconfig-r2102-20261125    gcc-8.5.0  cocci
openrisc    randconfig-r2105-20261126    gcc-10.5.0 cocci
openrisc    randconfig-r2111-20261125    gcc-10.5.0 cocci
parisc                   allmodconfig    gcc-16.2.0
parisc                    allnoconfig    clang-24
parisc                   allyesconfig    clang-17
parisc                      defconfig    gcc-16.2.0
parisc       randconfig-1000-20261126    gcc-13.5.0
parisc       randconfig-1001-20261126    gcc-13.5.0
parisc       randconfig-2000-20261125    clang-19
parisc       randconfig-2000-20261125    gcc-10.5.0
parisc       randconfig-2000-20261126    gcc-12.5.0
parisc       randconfig-2001-20261125    clang-19
parisc       randconfig-2001-20261125    gcc-8.5.0
parisc       randconfig-2001-20261126    gcc-12.5.0
parisc       randconfig-2200-20261125    gcc-12.5.0 smatch
parisc       randconfig-2200-20261126    gcc-15.3.0 smatch
parisc      randconfig-r2107-20261125    gcc-14     cocci
parisc      randconfig-r2109-20261125    gcc-10.5.0 cocci
parisc      randconfig-r2301-20261125    gcc-13.5.0 sparse
parisc      randconfig-r2308-20261126    clang-24   sparse
parisc      randconfig-r2311-20261125    gcc-10.5.0 sparse
parisc64                    defconfig    clang-24
powerpc                  allmodconfig    gcc-16.2.0
powerpc                   allnoconfig    clang-24
powerpc      randconfig-1000-20261126    gcc-13.5.0
powerpc      randconfig-1001-20261126    gcc-13.5.0
powerpc      randconfig-2000-20261125    clang-17
powerpc      randconfig-2000-20261125    gcc-9.5.0
powerpc      randconfig-2000-20261126    clang-24
powerpc      randconfig-2001-20261125    gcc-11.5.0
powerpc      randconfig-2001-20261125    gcc-9.5.0
powerpc      randconfig-2001-20261126    clang-24
powerpc      randconfig-2002-20261125    gcc-9.5.0
powerpc      randconfig-2002-20261126    clang-24
powerpc      randconfig-2200-20261125    gcc-11.5.0 smatch
powerpc      randconfig-2200-20261126    clang-24   smatch
powerpc     randconfig-r2100-20261125    gcc-11.5.0 cocci
powerpc     randconfig-r2109-20261125    clang-24   cocci
powerpc     randconfig-r2111-20261125    gcc-14     cocci
powerpc     randconfig-r2303-20261126    clang-22   sparse
powerpc     randconfig-r2305-20261126    clang-22   sparse
powerpc     randconfig-r2308-20261126    gcc-10.5.0 sparse
powerpc     randconfig-r2310-20261125    gcc-8.5.0  sparse
powerpc64    randconfig-1000-20261126    gcc-13.5.0
powerpc64    randconfig-1001-20261126    gcc-13.5.0
powerpc64    randconfig-2000-20261125    gcc-15.3.0
powerpc64    randconfig-2000-20261125    gcc-9.5.0
powerpc64    randconfig-2000-20261126    clang-24
powerpc64    randconfig-2001-20261125    clang-17
powerpc64    randconfig-2001-20261125    gcc-9.5.0
powerpc64    randconfig-2001-20261126    clang-24
powerpc64    randconfig-2002-20261125    clang-17
powerpc64    randconfig-2002-20261125    gcc-9.5.0
powerpc64    randconfig-2002-20261126    clang-24
powerpc64    randconfig-2200-20261125    gcc-13.5.0 smatch
powerpc64    randconfig-2200-20261126    clang-24   smatch
powerpc64   randconfig-r2101-20261126    clang-18   cocci
powerpc64   randconfig-r2107-20261125    gcc-11.5.0 cocci
powerpc64   randconfig-r2108-20261125    gcc-14     cocci
powerpc64   randconfig-r2300-20261126    clang-24   sparse
powerpc64   randconfig-r2306-20261126    clang-24   sparse
powerpc64   randconfig-r2308-20261126    clang-18   sparse
powerpc64   randconfig-r2309-20261126    gcc-10.5.0 sparse
powerpc64   randconfig-r2311-20261126    clang-18   sparse
riscv                    allmodconfig    clang-24
riscv                     allnoconfig    clang-24
riscv                    allyesconfig    clang-24
riscv                       defconfig    gcc-16.2.0
riscv        randconfig-2000-20261125    gcc-13.5.0
riscv        randconfig-2000-20261126    gcc-10.5.0
riscv        randconfig-2001-20261125    gcc-13.5.0
riscv        randconfig-2001-20261125    gcc-8.5.0
riscv        randconfig-2001-20261126    gcc-10.5.0
riscv        randconfig-2002-20261125    gcc-13.5.0
riscv        randconfig-2002-20261125    gcc-8.5.0
riscv        randconfig-2002-20261126    gcc-10.5.0
riscv        randconfig-2003-20261125    gcc-11.5.0
riscv        randconfig-2003-20261125    gcc-13.5.0
riscv        randconfig-2003-20261126    gcc-10.5.0
riscv        randconfig-2004-20261125    gcc-13.5.0
riscv        randconfig-2004-20261125    gcc-8.5.0
riscv        randconfig-2004-20261126    gcc-10.5.0
riscv        randconfig-2005-20261125    clang-24
riscv        randconfig-2005-20261125    gcc-13.5.0
riscv        randconfig-2005-20261126    gcc-10.5.0
riscv        randconfig-2200-20261125    gcc-8.5.0  smatch
riscv        randconfig-2200-20261126    gcc-8.5.0  smatch
riscv       randconfig-r2101-20261125    clang-24   cocci
riscv       randconfig-r2102-20261126    gcc-10.5.0 cocci
riscv       randconfig-r2103-20261125    gcc-8.5.0  cocci
riscv       randconfig-r2107-20261126    clang-22   cocci
riscv       randconfig-r2110-20261125    gcc-14     cocci
riscv       randconfig-r2302-20261125    gcc-12     sparse
riscv       randconfig-r2310-20261125    gcc-14.4.0 sparse
s390                     allmodconfig    clang-17
s390                      allnoconfig    clang-24
s390                     allyesconfig    gcc-16.2.0
s390                        defconfig    gcc-16.2.0
s390         randconfig-2000-20261125    clang-24
s390         randconfig-2000-20261125    gcc-8.5.0
s390         randconfig-2000-20261126    clang-24
s390         randconfig-2001-20261125    clang-24
s390         randconfig-2001-20261125    gcc-11.5.0
s390         randconfig-2001-20261126    clang-24
s390         randconfig-2002-20261125    clang-24
s390         randconfig-2002-20261126    clang-24
s390         randconfig-2003-20261125    clang-24
s390         randconfig-2003-20261125    gcc-8.5.0
s390         randconfig-2003-20261126    clang-24
s390         randconfig-2004-20261125    clang-24
s390         randconfig-2004-20261126    clang-24
s390         randconfig-2005-20261125    clang-20
s390         randconfig-2005-20261125    clang-24
s390         randconfig-2005-20261126    clang-24
s390         randconfig-2200-20261125    gcc-15.3.0 smatch
s390         randconfig-2200-20261126    gcc-16.2.0 smatch
s390        randconfig-r2107-20261126    gcc-14.4.0 cocci
s390        randconfig-r2108-20261125    gcc-9.5.0  cocci
s390        randconfig-r2310-20261126    clang-24   sparse
sh                       allmodconfig    gcc-16.2.0
sh                        allnoconfig    clang-24
sh                       allyesconfig    clang-17
sh                          defconfig    gcc-14
sh           randconfig-2000-20261125    gcc-14.4.0
sh           randconfig-2000-20261125    gcc-16.2.0
sh           randconfig-2000-20261126    gcc-9.5.0
sh           randconfig-2001-20261125    gcc-14.4.0
sh           randconfig-2001-20261126    gcc-9.5.0
sh           randconfig-2002-20261125    gcc-14.4.0
sh           randconfig-2002-20261125    gcc-16.2.0
sh           randconfig-2002-20261126    gcc-9.5.0
sh           randconfig-2003-20261125    gcc-14.4.0
sh           randconfig-2003-20261126    gcc-9.5.0
sh           randconfig-2004-20261125    gcc-14.4.0
sh           randconfig-2004-20261125    gcc-16.2.0
sh           randconfig-2004-20261126    gcc-9.5.0
sh           randconfig-2005-20261125    gcc-10.5.0
sh           randconfig-2005-20261125    gcc-14.4.0
sh           randconfig-2005-20261126    gcc-9.5.0
sh           randconfig-2200-20261125    gcc-14.4.0 smatch
sh           randconfig-2200-20261126    gcc-16.2.0 smatch
sh          randconfig-r2104-20261125    gcc-11.5.0 cocci
sh          randconfig-r2107-20261125    gcc-10.5.0 cocci
sh          randconfig-r2302-20261125    gcc-10.5.0 sparse
sh          randconfig-r2304-20261125    gcc-10.5.0 sparse
sh          randconfig-r2309-20261125    gcc-16.2.0 sparse
sparc                     allnoconfig    clang-24
sparc                       defconfig    gcc-16.2.0
sparc        randconfig-1000-20261126    clang-17
sparc        randconfig-1001-20261126    clang-17
sparc        randconfig-2000-20261125    gcc-16.2.0
sparc        randconfig-2000-20261125    gcc-8.5.0
sparc        randconfig-2000-20261126    gcc-8.5.0
sparc        randconfig-2001-20261125    gcc-16.2.0
sparc        randconfig-2001-20261125    gcc-8.5.0
sparc        randconfig-2001-20261126    gcc-8.5.0
sparc        randconfig-2200-20261125    gcc-14.4.0 smatch
sparc        randconfig-2200-20261126    gcc-13.5.0 smatch
sparc       randconfig-r2101-20261126    gcc-10.5.0 cocci
sparc       randconfig-r2102-20261126    clang-18   cocci
sparc       randconfig-r2106-20261125    gcc-16.2.0 cocci
sparc       randconfig-r2110-20261126    clang-22   cocci
sparc       randconfig-r2307-20261125    gcc-8.5.0  sparse
sparc       randconfig-r2307-20261126    clang-18   sparse
sparc       randconfig-r2308-20261125    gcc-8.5.0  sparse
sparc64                  allmodconfig    clang-20
sparc64                     defconfig    gcc-14
sparc64      randconfig-1000-20261126    clang-17
sparc64      randconfig-1001-20261126    clang-17
sparc64      randconfig-2000-20261125    clang-24
sparc64      randconfig-2000-20261125    gcc-8.5.0
sparc64      randconfig-2000-20261126    gcc-8.5.0
sparc64      randconfig-2001-20261125    gcc-8.5.0
sparc64      randconfig-2001-20261126    gcc-8.5.0
sparc64      randconfig-2200-20261125    gcc-15.3.0 smatch
sparc64      randconfig-2200-20261126    gcc-12.5.0 smatch
sparc64     randconfig-r2307-20261126    clang-24   sparse
sparc64     randconfig-r2309-20261126    clang-24   sparse
sparc64     randconfig-r2310-20261126    clang-18   sparse
um                       allmodconfig    clang-17
um                        allnoconfig    clang-24
um                       allyesconfig    gcc-16.2.0
um                          defconfig    gcc-14
um                     i386_defconfig    gcc-14
um           randconfig-1000-20261126    clang-17
um           randconfig-1001-20261126    clang-17
um           randconfig-2000-20261125    clang-17
um           randconfig-2000-20261125    gcc-8.5.0
um           randconfig-2000-20261126    gcc-8.5.0
um           randconfig-2001-20261125    clang-22
um           randconfig-2001-20261125    gcc-8.5.0
um           randconfig-2001-20261126    gcc-8.5.0
um           randconfig-2200-20261125    clang-17   smatch
um           randconfig-2200-20261126    gcc-12     smatch
um          randconfig-r2105-20261126    clang-18   cocci
um                   x86_64_defconfig    gcc-14
x86_64                   allmodconfig    clang-22
x86_64                    allnoconfig    clang-24
x86_64                   allyesconfig    clang-22
x86_64                      defconfig    gcc-14
x86_64                          kexec    clang-22
x86_64       randconfig-2000-20261125    gcc-14
x86_64       randconfig-2000-20261126    clang-22
x86_64       randconfig-2001-20261125    gcc-14
x86_64       randconfig-2001-20261126    clang-22
x86_64       randconfig-2002-20261125    gcc-14
x86_64       randconfig-2002-20261126    clang-22
x86_64       randconfig-2003-20261125    gcc-14
x86_64       randconfig-2003-20261126    clang-22
x86_64       randconfig-2004-20261125    gcc-14
x86_64       randconfig-2004-20261126    clang-22
x86_64       randconfig-2005-20261125    gcc-14
x86_64       randconfig-2005-20261126    clang-22
x86_64       randconfig-2100-20261125    clang-22   cocci
x86_64       randconfig-2100-20261125    gcc-13     cocci
x86_64       randconfig-2100-20261126    gcc-14     cocci
x86_64       randconfig-2101-20261125    clang-22   cocci
x86_64       randconfig-2101-20261126    gcc-14     cocci
x86_64       randconfig-2102-20261125    clang-22   cocci
x86_64       randconfig-2102-20261126    gcc-14     cocci
x86_64       randconfig-2103-20261125    clang-22   cocci
x86_64       randconfig-2103-20261126    gcc-14     cocci
x86_64       randconfig-2104-20261125    clang-22   cocci
x86_64       randconfig-2104-20261125    gcc-14     cocci
x86_64       randconfig-2104-20261126    gcc-14     cocci
x86_64       randconfig-2105-20261125    clang-22   cocci
x86_64       randconfig-2105-20261125    gcc-14     cocci
x86_64       randconfig-2105-20261126    gcc-14     cocci
x86_64       randconfig-2200-20261125    gcc-14     smatch
x86_64       randconfig-2200-20261126    clang-22   smatch
x86_64       randconfig-2300-20261125    clang-22   sparse
x86_64       randconfig-2300-20261126    gcc-14     sparse
x86_64       randconfig-2301-20261125    clang-22   sparse
x86_64       randconfig-2301-20261126    gcc-14     sparse
x86_64       randconfig-2302-20261125    clang-22   sparse
x86_64       randconfig-2302-20261126    gcc-14     sparse
x86_64      randconfig-r2106-20261126    clang-22   cocci
x86_64      randconfig-r2108-20261126    clang-22   cocci
x86_64      randconfig-r2304-20261126    clang-24   sparse
x86_64      randconfig-r2307-20261125    gcc-8.5.0  sparse
x86_64                       rhel-9.4    clang-22
x86_64                   rhel-9.4-bpf    clang-22
x86_64                   rhel-9.4-bpf    gcc-14
x86_64                  rhel-9.4-func    clang-22
x86_64            rhel-9.4-kselftests    clang-22
x86_64                 rhel-9.4-kunit    clang-22
x86_64                 rhel-9.4-kunit    gcc-14
x86_64                   rhel-9.4-ltp    clang-22
x86_64                   rhel-9.4-ltp    gcc-14
x86_64                  rhel-9.4-rust    clang-22
x86_64                  rhel-9.4-rust    clang-22
xtensa                    allnoconfig    clang-24
xtensa                   allyesconfig    clang-20
xtensa       randconfig-1000-20261126    clang-17
xtensa       randconfig-1001-20261126    clang-17
xtensa       randconfig-2000-20261125    gcc-10.5.0
xtensa       randconfig-2000-20261125    gcc-14.4.0
xtensa       randconfig-2000-20261126    gcc-13.5.0
xtensa       randconfig-2001-20261125    gcc-12.5.0
xtensa       randconfig-2001-20261125    gcc-14.4.0
xtensa       randconfig-2001-20261126    gcc-13.5.0
xtensa       randconfig-2200-20261125    gcc-16.2.0 smatch
xtensa       randconfig-2200-20261126    gcc-11.5.0 smatch
xtensa      randconfig-r2100-20261126    clang-18   cocci
xtensa      randconfig-r2101-20261125    gcc-8.5.0  cocci
xtensa      randconfig-r2104-20261125    gcc-8.5.0  cocci
xtensa      randconfig-r2107-20261126    clang-24   cocci
xtensa      randconfig-r2111-20261126    clang-24   cocci
xtensa      randconfig-r2306-20261126    gcc-10.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

