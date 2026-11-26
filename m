Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mPKqU5bV;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=imDVrCCf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MDgefthZE7bKqh3y6zzgof17BsFDrA8GE8x2QfonZfA=; b=mPKqU5bVzO8PCaYhzNroJoCeAA
	mK3LevLNps/Wjq3Vync9/iZu7bz70DiDWb8CQlXd8k6c/4B3BUWHHm9TMoMb+zZPlZjB+Rd7ne6ca
	I0p7mA2iRN6WJIDMrg/o2GphkO4m7Flkr/gQGny8Eg+haZrsFLp/CjBzBpuSmNqlVvDZei/B0a+Ku
	ncePHffVJqXvUv0O3ivv50owYPbz0I1RxJAwtwlkgc7YbKpIubGd/yQFsCfAivTBcC0Pz6dkSqQFu
	ds+6jp3PfgZRnavL3rQ0Xqu5geeBxt0K9l3QCiMqWLa52ojGf4UFdfuL2uKJwMvlzU8GRdO3jhm0j
	V46ccLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVDD-0000000CRah-0LyA;
	Thu, 26 Nov 2026 08:52:15 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVDA-0000000CRa5-2Flz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795683132; x=1827219132;
  h=date:from:to:cc:subject:message-id;
  bh=D52vdd4teuLhMPXJ6DkaUvq751lN6OfpYdJ+4Rta0Pg=;
  b=imDVrCCfXnrmXBU9w7P3BHNMhTS84gfB7OU2AxnFqBHwSsvk0yzyaEJv
   2pE0wOtO7Fs40zUUjxlxQMsVZWwEgQjDzQu1VAId4VvJeeHUiiLzyQTZP
   xtSmv4E0Lh3NJKTYwWmzScs98Dr7ZscuJ43Db000DMajswEKToFXdc6pe
   JAxJXa+l4r7R+nAPIII4XUM5zdL5xAT7vdn2x4GYfl2/DQIBpxy5cRAOa
   h88pTGI6Kvucb/nxoBYonCArhHJBbyF2TUD1bwBcKzOHsdeDLBkYimRcZ
   6YxMU+7j8KyLlOMbAVGid3WUSf2ud/8SYaIoBd4kgi4XgC+Dzo403ZaOE
   A==;
X-CSE-ConnectionGUID: l4bKJV0GTXuijmSnOKd8Fw==
X-CSE-MsgGUID: A5ufAIB5QF2I6c5GYsEekw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4633168"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4633168"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 00:52:12 -0800
X-CSE-ConnectionGUID: lrVJ29cvTUaLLohsYJqlyw==
X-CSE-MsgGUID: zlAR8esoSuq5umA6E4Toww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12163590"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Nov 2026 00:52:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWVD5-00000001Tg0-3FsO;
	Thu, 26 Nov 2026 08:52:07 +0000
Date: Thu, 26 Nov 2026 16:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc:dt] BUILD SUCCESS
 6e5f301a5203af7471bb43dca2ea08ae5284f1f4
Message-ID: <20261126165139.DXKolngj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_005212_699189_C51E20A4 
X-CRM114-Status: UNSURE (   5.61  )
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
branch HEAD: 6e5f301a5203af7471bb43dca2ea08ae5284f1f4  Merge tag 'ux500-pd-v7.5' of https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik into soc/dt

elapsed time: 831m

configs tested: 611
configs skipped: 244

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261125    gcc-8.5.0
alpha                 randconfig-2000-20261126    gcc-13.5.0
alpha                 randconfig-2001-20261125    gcc-8.5.0
alpha                 randconfig-2001-20261126    gcc-13.5.0
alpha                 randconfig-2200-20261125    gcc-10.5.0 smatch
alpha                 randconfig-2200-20261126    gcc-9.5.0  smatch
alpha                randconfig-r2100-20261125    gcc-9.5.0  cocci
alpha                randconfig-r2100-20261126    gcc-10.5.0 cocci
alpha                randconfig-r2106-20261125    gcc-16.2.0 cocci
alpha                randconfig-r2110-20261126    clang-24   cocci
alpha                randconfig-r2301-20261125    gcc-11.5.0 sparse
alpha                randconfig-r2305-20261125    gcc-12     sparse
alpha                randconfig-r2305-20261125    gcc-12.5.0 sparse
alpha                randconfig-r2309-20261125    gcc-8.5.0  sparse
alpha                randconfig-r2311-20261125    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      haps_hs_smp_defconfig    gcc-16.2.0
arc                         nsim_700_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261126    gcc-16.2.0
arc                   randconfig-1001-20261126    gcc-16.2.0
arc                   randconfig-2000-20261125    gcc-10.5.0
arc                   randconfig-2000-20261126    gcc-9.5.0
arc                   randconfig-2001-20261125    gcc-10.5.0
arc                   randconfig-2001-20261126    gcc-9.5.0
arc                   randconfig-2002-20261125    gcc-10.5.0
arc                   randconfig-2002-20261126    gcc-9.5.0
arc                   randconfig-2003-20261125    gcc-10.5.0
arc                   randconfig-2003-20261126    gcc-9.5.0
arc                   randconfig-2004-20261125    gcc-10.5.0
arc                   randconfig-2004-20261126    gcc-9.5.0
arc                   randconfig-2005-20261125    gcc-10.5.0
arc                   randconfig-2005-20261126    gcc-9.5.0
arc                   randconfig-2200-20261125    gcc-14.4.0 smatch
arc                   randconfig-2200-20261126    gcc-8.5.0  smatch
arc                  randconfig-r2103-20261125    gcc-11.5.0 cocci
arc                  randconfig-r2103-20261125    gcc-12.5.0 cocci
arc                  randconfig-r2104-20261125    gcc-9.5.0  cocci
arc                  randconfig-r2106-20261125    gcc-15.3.0 cocci
arc                  randconfig-r2110-20261125    gcc-16.2.0 cocci
arc                  randconfig-r2111-20261125    gcc-10.5.0 cocci
arc                  randconfig-r2304-20261125    gcc-11.5.0 sparse
arc                  randconfig-r2305-20261125    clang-24   sparse
arc                  randconfig-r2307-20261125    gcc-14     sparse
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                            omap1_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261126    gcc-16.2.0
arm                   randconfig-1001-20261126    gcc-16.2.0
arm                   randconfig-1002-20261126    gcc-16.2.0
arm                   randconfig-1003-20261126    gcc-16.2.0
arm                   randconfig-2000-20261125    clang-22
arm                   randconfig-2000-20261126    gcc-11.5.0
arm                   randconfig-2001-20261125    clang-22
arm                   randconfig-2001-20261126    gcc-11.5.0
arm                   randconfig-2002-20261125    clang-17
arm                   randconfig-2002-20261125    clang-22
arm                   randconfig-2002-20261126    gcc-11.5.0
arm                   randconfig-2200-20261125    clang-21   smatch
arm                   randconfig-2200-20261126    gcc-8.5.0  smatch
arm                  randconfig-r2105-20261125    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261125    gcc-9.5.0  cocci
arm                  randconfig-r2109-20261125    gcc-11.5.0 cocci
arm                  randconfig-r2110-20261125    gcc-10.5.0 cocci
arm                  randconfig-r2304-20261126    clang-22   sparse
arm                  randconfig-r2306-20261125    gcc-8.5.0  sparse
arm                  randconfig-r2310-20261125    clang-24   sparse
arm                  randconfig-r2311-20261125    gcc-13.5.0 sparse
arm                          s3c6400_defconfig    gcc-16.2.0
arm                         spear6xx_defconfig    gcc-16.2.0
arm                            u8500_defconfig    gcc-16.2.0
arm64                             alldefconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-2000-20261125    clang-22
arm64                 randconfig-2000-20261126    gcc-11.5.0
arm64                 randconfig-2001-20261125    clang-22
arm64                 randconfig-2001-20261126    gcc-11.5.0
arm64                 randconfig-2002-20261125    clang-22
arm64                 randconfig-2002-20261126    gcc-11.5.0
arm64                 randconfig-2200-20261125    gcc-13.5.0 smatch
arm64                 randconfig-2200-20261126    clang-24   smatch
arm64                randconfig-r2104-20261125    gcc-8.5.0  cocci
arm64                randconfig-r2108-20261125    clang-18   cocci
arm64                randconfig-r2110-20261125    clang-18   cocci
arm64                randconfig-r2301-20261125    gcc-12.5.0 sparse
arm64                randconfig-r2301-20261126    clang-22   sparse
arm64                randconfig-r2302-20261126    clang-22   sparse
arm64                randconfig-r2308-20261125    gcc-14     sparse
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-2000-20261125    gcc-14.4.0
csky                  randconfig-2000-20261126    gcc-13.5.0
csky                  randconfig-2001-20261125    gcc-14.4.0
csky                  randconfig-2001-20261126    gcc-13.5.0
csky                  randconfig-2200-20261125    gcc-16.2.0 smatch
csky                  randconfig-2200-20261126    gcc-13.5.0 smatch
csky                 randconfig-r2100-20261125    gcc-9.5.0  cocci
csky                 randconfig-r2102-20261125    gcc-8.5.0  cocci
csky                 randconfig-r2105-20261125    gcc-11.5.0 cocci
csky                 randconfig-r2106-20261125    clang-18   cocci
csky                 randconfig-r2108-20261125    gcc-9.5.0  cocci
csky                 randconfig-r2300-20261125    clang-24   sparse
csky                 randconfig-r2305-20261125    gcc-12     sparse
csky                 randconfig-r2308-20261125    gcc-11.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261126    gcc-11.5.0
hexagon               randconfig-1001-20261126    gcc-11.5.0
hexagon               randconfig-2000-20261125    gcc-14.4.0
hexagon               randconfig-2000-20261126    gcc-13.5.0
hexagon               randconfig-2001-20261125    gcc-14.4.0
hexagon               randconfig-2001-20261126    gcc-13.5.0
hexagon               randconfig-2200-20261125    clang-17   smatch
hexagon               randconfig-2200-20261126    clang-17   smatch
hexagon              randconfig-r2100-20261125    gcc-8.5.0  cocci
hexagon              randconfig-r2103-20261126    gcc-10.5.0 cocci
hexagon              randconfig-r2104-20261125    gcc-9.5.0  cocci
hexagon              randconfig-r2111-20261125    gcc-16.2.0 cocci
hexagon              randconfig-r2303-20261125    clang-24   sparse
hexagon              randconfig-r2304-20261125    clang-24   sparse
hexagon              randconfig-r2311-20261125    gcc-15.3.0 sparse
hexagon              randconfig-r2311-20261126    gcc-10.5.0 sparse
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261126    gcc-14
i386        buildonly-randconfig-1001-20261126    gcc-14
i386        buildonly-randconfig-1002-20261126    gcc-14
i386        buildonly-randconfig-1003-20261126    gcc-14
i386        buildonly-randconfig-1004-20261126    gcc-14
i386        buildonly-randconfig-1005-20261126    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261126    clang-22
i386                  randconfig-1001-20261126    clang-22
i386                  randconfig-1002-20261126    clang-22
i386                  randconfig-1003-20261126    clang-22
i386                  randconfig-1004-20261126    clang-22
i386                  randconfig-1005-20261126    clang-22
i386                  randconfig-1006-20261126    clang-22
i386                  randconfig-2000-20261125    gcc-14
i386                  randconfig-2000-20261126    clang-22
i386                  randconfig-2001-20261125    gcc-14
i386                  randconfig-2001-20261126    clang-22
i386                  randconfig-2002-20261125    gcc-14
i386                  randconfig-2002-20261126    clang-22
i386                  randconfig-2003-20261125    gcc-14
i386                  randconfig-2003-20261126    clang-22
i386                  randconfig-2004-20261125    gcc-14
i386                  randconfig-2004-20261126    clang-22
i386                  randconfig-2005-20261125    gcc-14
i386                  randconfig-2005-20261126    clang-22
i386                  randconfig-2100-20261125    clang-22   cocci
i386                  randconfig-2100-20261126    clang-22   cocci
i386                  randconfig-2101-20261125    clang-22   cocci
i386                  randconfig-2101-20261126    clang-22   cocci
i386                  randconfig-2102-20261125    clang-22   cocci
i386                  randconfig-2102-20261126    clang-22   cocci
i386                  randconfig-2103-20261125    clang-22   cocci
i386                  randconfig-2103-20261126    clang-22   cocci
i386                  randconfig-2104-20261125    clang-22   cocci
i386                  randconfig-2104-20261126    clang-22   cocci
i386                  randconfig-2105-20261125    clang-22   cocci
i386                  randconfig-2105-20261126    clang-22   cocci
i386                  randconfig-2200-20261125    clang-22   smatch
i386                  randconfig-2200-20261126    gcc-14     smatch
i386                  randconfig-2300-20261125    clang-22   sparse
i386                  randconfig-2300-20261126    gcc-14     sparse
i386                  randconfig-2301-20261125    clang-22   sparse
i386                  randconfig-2301-20261126    gcc-14     sparse
i386                  randconfig-2302-20261125    clang-22   sparse
i386                  randconfig-2302-20261126    gcc-14     sparse
i386                 randconfig-r2102-20261125    gcc-11.5.0 cocci
i386                 randconfig-r2106-20261125    gcc-14     cocci
i386                 randconfig-r2108-20261125    gcc-10.5.0 cocci
i386                 randconfig-r2109-20261126    clang-22   cocci
i386                 randconfig-r2301-20261125    clang-24   sparse
i386                 randconfig-r2301-20261125    gcc-12     sparse
i386                 randconfig-r2303-20261125    gcc-12     sparse
i386                 randconfig-r2304-20261125    gcc-12     sparse
i386                 randconfig-r2311-20261125    clang-24   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261126    gcc-11.5.0
loongarch             randconfig-1001-20261126    gcc-11.5.0
loongarch             randconfig-2000-20261125    clang-19
loongarch             randconfig-2000-20261126    gcc-12.5.0
loongarch             randconfig-2001-20261125    clang-19
loongarch             randconfig-2001-20261126    gcc-12.5.0
loongarch             randconfig-2200-20261125    clang-18   smatch
loongarch             randconfig-2200-20261126    gcc-14.4.0 smatch
loongarch            randconfig-r2101-20261125    gcc-12.5.0 cocci
loongarch            randconfig-r2106-20261125    gcc-14     cocci
loongarch            randconfig-r2106-20261125    gcc-9.5.0  cocci
loongarch            randconfig-r2107-20261125    gcc-16.2.0 cocci
loongarch            randconfig-r2110-20261125    gcc-15.3.0 cocci
loongarch            randconfig-r2300-20261125    clang-24   sparse
loongarch            randconfig-r2300-20261126    clang-22   sparse
loongarch            randconfig-r2301-20261125    clang-24   sparse
loongarch            randconfig-r2307-20261126    gcc-10.5.0 sparse
loongarch            randconfig-r2311-20261125    gcc-14     sparse
m68k                              alldefconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261125    gcc-8.5.0
m68k                  randconfig-2000-20261126    gcc-13.5.0
m68k                  randconfig-2001-20261125    gcc-8.5.0
m68k                  randconfig-2001-20261126    gcc-13.5.0
m68k                  randconfig-2200-20261125    gcc-15.3.0 smatch
m68k                 randconfig-r2101-20261125    gcc-11.5.0 cocci
m68k                 randconfig-r2101-20261125    gcc-9.5.0  cocci
m68k                 randconfig-r2104-20261126    gcc-10.5.0 cocci
m68k                 randconfig-r2108-20261125    gcc-16.2.0 cocci
m68k                 randconfig-r2306-20261125    gcc-14     sparse
m68k                 randconfig-r2309-20261125    gcc-15.3.0 sparse
m68k                 randconfig-r2311-20261125    gcc-11.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261125    gcc-8.5.0
microblaze            randconfig-2000-20261126    gcc-13.5.0
microblaze            randconfig-2001-20261125    gcc-8.5.0
microblaze            randconfig-2001-20261126    gcc-13.5.0
microblaze            randconfig-2200-20261125    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261126    gcc-9.5.0  smatch
microblaze           randconfig-r2104-20261125    gcc-8.5.0  cocci
microblaze           randconfig-r2107-20261125    gcc-15.3.0 cocci
microblaze           randconfig-r2109-20261125    gcc-9.5.0  cocci
microblaze           randconfig-r2301-20261125    gcc-12     sparse
microblaze           randconfig-r2302-20261125    clang-24   sparse
microblaze           randconfig-r2307-20261125    gcc-8.5.0  sparse
microblaze           randconfig-r2310-20261125    gcc-13.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                          bigsur_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    clang-20
mips                  randconfig-2000-20261125    gcc-16.2.0
mips                  randconfig-2000-20261126    gcc-16.2.0
mips                  randconfig-2001-20261125    gcc-16.2.0
mips                  randconfig-2001-20261126    gcc-16.2.0
mips                  randconfig-2002-20261125    gcc-16.2.0
mips                  randconfig-2002-20261126    gcc-16.2.0
mips                  randconfig-2200-20261125    clang-24   smatch
mips                  randconfig-2200-20261126    gcc-15.3.0 smatch
mips                 randconfig-r2103-20261125    gcc-9.5.0  cocci
mips                 randconfig-r2106-20261125    gcc-10.5.0 cocci
mips                 randconfig-r2106-20261126    clang-24   cocci
mips                 randconfig-r2107-20261125    clang-18   cocci
mips                 randconfig-r2108-20261125    gcc-11.5.0 cocci
mips                 randconfig-r2108-20261126    clang-24   cocci
mips                 randconfig-r2109-20261125    gcc-14     cocci
mips                 randconfig-r2109-20261126    clang-24   cocci
mips                 randconfig-r2110-20261125    gcc-9.5.0  cocci
mips                 randconfig-r2111-20261125    gcc-11.5.0 cocci
mips                 randconfig-r2111-20261125    gcc-14     cocci
mips                 randconfig-r2300-20261125    gcc-12     sparse
mips                 randconfig-r2302-20261125    gcc-12     sparse
mips                    sb1250_swarm_defconfig    clang-20
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261126    gcc-11.5.0
nios2                 randconfig-1001-20261126    gcc-11.5.0
nios2                 randconfig-2000-20261125    clang-19
nios2                 randconfig-2000-20261126    gcc-12.5.0
nios2                 randconfig-2001-20261125    clang-19
nios2                 randconfig-2001-20261126    gcc-12.5.0
nios2                 randconfig-2200-20261125    gcc-8.5.0  smatch
nios2                 randconfig-2200-20261126    gcc-9.5.0  smatch
nios2                randconfig-r2100-20261125    gcc-8.5.0  cocci
nios2                randconfig-r2109-20261125    gcc-16.2.0 cocci
nios2                randconfig-r2111-20261126    clang-22   cocci
nios2                randconfig-r2300-20261125    clang-24   sparse
nios2                randconfig-r2300-20261125    gcc-11.5.0 sparse
nios2                randconfig-r2306-20261125    gcc-8.5.0  sparse
nios2                randconfig-r2310-20261126    gcc-10.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261125    gcc-16.2.0
openrisc              randconfig-2000-20261126    gcc-16.2.0
openrisc              randconfig-2001-20261125    gcc-16.2.0
openrisc              randconfig-2001-20261126    gcc-16.2.0
openrisc              randconfig-2002-20261125    gcc-16.2.0
openrisc              randconfig-2002-20261126    gcc-16.2.0
openrisc              randconfig-2200-20261125    gcc-10.5.0 smatch
openrisc              randconfig-2200-20261126    gcc-9.5.0  smatch
openrisc             randconfig-r2102-20261125    gcc-8.5.0  cocci
openrisc             randconfig-r2105-20261125    gcc-9.5.0  cocci
openrisc             randconfig-r2105-20261126    gcc-10.5.0 cocci
openrisc             randconfig-r2300-20261125    gcc-12.5.0 sparse
openrisc             randconfig-r2305-20261125    clang-24   sparse
openrisc             randconfig-r2307-20261125    gcc-11.5.0 sparse
openrisc             randconfig-r2310-20261125    gcc-15.3.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261126    gcc-13.5.0
parisc                randconfig-1001-20261126    gcc-13.5.0
parisc                randconfig-2000-20261125    clang-19
parisc                randconfig-2000-20261126    gcc-12.5.0
parisc                randconfig-2001-20261125    clang-19
parisc                randconfig-2001-20261126    gcc-12.5.0
parisc                randconfig-2200-20261125    gcc-12.5.0 smatch
parisc                randconfig-2200-20261126    gcc-15.3.0 smatch
parisc               randconfig-r2101-20261125    gcc-8.5.0  cocci
parisc               randconfig-r2102-20261125    gcc-12.5.0 cocci
parisc               randconfig-r2106-20261125    gcc-11.5.0 cocci
parisc               randconfig-r2107-20261125    gcc-14     cocci
parisc               randconfig-r2109-20261125    gcc-10.5.0 cocci
parisc               randconfig-r2110-20261125    gcc-11.5.0 cocci
parisc               randconfig-r2304-20261125    gcc-12.5.0 sparse
parisc               randconfig-r2305-20261125    clang-24   sparse
parisc               randconfig-r2306-20261125    gcc-15.3.0 sparse
parisc               randconfig-r2310-20261125    gcc-14     sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.2.0
powerpc                       bamboo_defconfig    gcc-16.2.0
powerpc                        ebony_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    clang-20
powerpc                      mpc512x_defconfig    gcc-16.2.0
powerpc                  mpc8315_rdb_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                mpc834x_itxgp_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261126    gcc-13.5.0
powerpc               randconfig-1001-20261126    gcc-13.5.0
powerpc               randconfig-2000-20261125    gcc-9.5.0
powerpc               randconfig-2000-20261126    clang-24
powerpc               randconfig-2001-20261125    gcc-9.5.0
powerpc               randconfig-2001-20261126    clang-24
powerpc               randconfig-2002-20261125    gcc-9.5.0
powerpc               randconfig-2002-20261126    clang-24
powerpc               randconfig-2200-20261125    gcc-11.5.0 smatch
powerpc               randconfig-2200-20261126    clang-24   smatch
powerpc              randconfig-r2100-20261125    gcc-11.5.0 cocci
powerpc              randconfig-r2101-20261125    gcc-8.5.0  cocci
powerpc              randconfig-r2102-20261125    gcc-9.5.0  cocci
powerpc              randconfig-r2108-20261125    gcc-15.3.0 cocci
powerpc              randconfig-r2111-20261125    gcc-14     cocci
powerpc              randconfig-r2111-20261125    gcc-15.3.0 cocci
powerpc              randconfig-r2303-20261125    clang-24   sparse
powerpc              randconfig-r2303-20261126    clang-22   sparse
powerpc              randconfig-r2305-20261126    clang-22   sparse
powerpc              randconfig-r2306-20261125    gcc-13.5.0 sparse
powerpc              randconfig-r2308-20261126    gcc-10.5.0 sparse
powerpc              randconfig-r2310-20261125    gcc-8.5.0  sparse
powerpc                      tqm5200_defconfig    clang-20
powerpc                       tqm8xx_defconfig    clang-20
powerpc                          wii_defconfig    gcc-16.2.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261126    gcc-13.5.0
powerpc64             randconfig-1001-20261126    gcc-13.5.0
powerpc64             randconfig-2000-20261125    gcc-9.5.0
powerpc64             randconfig-2000-20261126    clang-24
powerpc64             randconfig-2001-20261125    gcc-9.5.0
powerpc64             randconfig-2001-20261126    clang-24
powerpc64             randconfig-2002-20261125    gcc-9.5.0
powerpc64             randconfig-2002-20261126    clang-24
powerpc64             randconfig-2200-20261125    gcc-13.5.0 smatch
powerpc64             randconfig-2200-20261126    clang-24   smatch
powerpc64            randconfig-r2101-20261125    gcc-9.5.0  cocci
powerpc64            randconfig-r2107-20261125    gcc-11.5.0 cocci
powerpc64            randconfig-r2108-20261125    gcc-14     cocci
powerpc64            randconfig-r2303-20261125    clang-24   sparse
powerpc64            randconfig-r2307-20261125    gcc-13.5.0 sparse
powerpc64            randconfig-r2309-20261126    gcc-10.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-2000-20261125    gcc-13.5.0
riscv                 randconfig-2000-20261126    gcc-10.5.0
riscv                 randconfig-2001-20261125    gcc-13.5.0
riscv                 randconfig-2001-20261126    gcc-10.5.0
riscv                 randconfig-2002-20261125    gcc-13.5.0
riscv                 randconfig-2002-20261126    gcc-10.5.0
riscv                 randconfig-2003-20261125    gcc-13.5.0
riscv                 randconfig-2003-20261126    gcc-10.5.0
riscv                 randconfig-2004-20261125    gcc-13.5.0
riscv                 randconfig-2004-20261126    gcc-10.5.0
riscv                 randconfig-2005-20261125    gcc-13.5.0
riscv                 randconfig-2005-20261126    gcc-10.5.0
riscv                 randconfig-2200-20261125    gcc-8.5.0  smatch
riscv                 randconfig-2200-20261126    gcc-8.5.0  smatch
riscv                randconfig-r2102-20261125    gcc-8.5.0  cocci
riscv                randconfig-r2102-20261125    gcc-9.5.0  cocci
riscv                randconfig-r2102-20261126    gcc-10.5.0 cocci
riscv                randconfig-r2103-20261125    gcc-8.5.0  cocci
riscv                randconfig-r2104-20261125    gcc-8.5.0  cocci
riscv                randconfig-r2107-20261126    clang-22   cocci
riscv                randconfig-r2110-20261125    gcc-14     cocci
riscv                randconfig-r2302-20261125    clang-24   sparse
riscv                randconfig-r2302-20261125    gcc-12     sparse
riscv                randconfig-r2304-20261125    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-2000-20261125    clang-24
s390                  randconfig-2000-20261126    clang-24
s390                  randconfig-2001-20261125    clang-24
s390                  randconfig-2001-20261126    clang-24
s390                  randconfig-2002-20261125    clang-24
s390                  randconfig-2002-20261126    clang-24
s390                  randconfig-2003-20261125    clang-24
s390                  randconfig-2003-20261126    clang-24
s390                  randconfig-2004-20261125    clang-24
s390                  randconfig-2004-20261126    clang-24
s390                  randconfig-2005-20261125    clang-24
s390                  randconfig-2005-20261126    clang-24
s390                  randconfig-2200-20261125    gcc-15.3.0 smatch
s390                  randconfig-2200-20261126    gcc-16.2.0 smatch
s390                 randconfig-r2103-20261125    gcc-9.5.0  cocci
s390                 randconfig-r2105-20261125    gcc-12.5.0 cocci
s390                 randconfig-r2105-20261125    gcc-8.5.0  cocci
s390                 randconfig-r2109-20261125    clang-18   cocci
s390                 randconfig-r2303-20261125    gcc-11.5.0 sparse
s390                 randconfig-r2304-20261125    clang-24   sparse
s390                 randconfig-r2305-20261125    gcc-11.5.0 sparse
s390                 randconfig-r2307-20261125    clang-24   sparse
s390                 randconfig-r2308-20261125    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    clang-20
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-2000-20261125    gcc-14.4.0
sh                    randconfig-2000-20261126    gcc-9.5.0
sh                    randconfig-2001-20261125    gcc-14.4.0
sh                    randconfig-2001-20261126    gcc-9.5.0
sh                    randconfig-2002-20261125    gcc-14.4.0
sh                    randconfig-2002-20261126    gcc-9.5.0
sh                    randconfig-2003-20261125    gcc-14.4.0
sh                    randconfig-2003-20261126    gcc-9.5.0
sh                    randconfig-2004-20261125    gcc-14.4.0
sh                    randconfig-2004-20261126    gcc-9.5.0
sh                    randconfig-2005-20261125    gcc-14.4.0
sh                    randconfig-2005-20261126    gcc-9.5.0
sh                    randconfig-2200-20261125    gcc-14.4.0 smatch
sh                    randconfig-2200-20261126    gcc-16.2.0 smatch
sh                   randconfig-r2104-20261125    gcc-11.5.0 cocci
sh                   randconfig-r2107-20261125    gcc-10.5.0 cocci
sh                   randconfig-r2109-20261125    gcc-14     cocci
sh                   randconfig-r2110-20261125    gcc-14     cocci
sh                   randconfig-r2111-20261125    clang-18   cocci
sh                   randconfig-r2308-20261125    gcc-15.3.0 sparse
sh                   randconfig-r2309-20261125    gcc-13.5.0 sparse
sh                    rts7751r2dplus_defconfig    clang-20
sh                            se7619_defconfig    gcc-16.2.0
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261126    clang-17
sparc                 randconfig-1001-20261126    clang-17
sparc                 randconfig-2000-20261125    gcc-8.5.0
sparc                 randconfig-2000-20261126    gcc-8.5.0
sparc                 randconfig-2001-20261125    gcc-8.5.0
sparc                 randconfig-2001-20261126    gcc-8.5.0
sparc                 randconfig-2200-20261125    gcc-14.4.0 smatch
sparc                 randconfig-2200-20261126    gcc-13.5.0 smatch
sparc                randconfig-r2100-20261125    gcc-8.5.0  cocci
sparc                randconfig-r2101-20261126    gcc-10.5.0 cocci
sparc                randconfig-r2104-20261125    gcc-12.5.0 cocci
sparc                randconfig-r2110-20261126    clang-22   cocci
sparc                randconfig-r2111-20261125    gcc-9.5.0  cocci
sparc                randconfig-r2307-20261125    gcc-15.3.0 sparse
sparc                randconfig-r2308-20261125    gcc-13.5.0 sparse
sparc                randconfig-r2308-20261125    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261125    clang-24   sparse
sparc                randconfig-r2309-20261125    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261126    clang-17
sparc64               randconfig-1001-20261126    clang-17
sparc64               randconfig-2000-20261125    gcc-8.5.0
sparc64               randconfig-2000-20261126    gcc-8.5.0
sparc64               randconfig-2001-20261125    gcc-8.5.0
sparc64               randconfig-2001-20261126    gcc-8.5.0
sparc64               randconfig-2200-20261125    gcc-15.3.0 smatch
sparc64               randconfig-2200-20261126    gcc-12.5.0 smatch
sparc64              randconfig-r2109-20261125    gcc-15.3.0 cocci
sparc64              randconfig-r2300-20261125    gcc-12     sparse
sparc64              randconfig-r2303-20261125    gcc-12     sparse
sparc64              randconfig-r2303-20261125    gcc-12.5.0 sparse
sparc64              randconfig-r2309-20261125    gcc-8.5.0  sparse
sparc64              randconfig-r2310-20261125    gcc-11.5.0 sparse
sparc64              randconfig-r2311-20261125    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261126    clang-17
um                    randconfig-1001-20261126    clang-17
um                    randconfig-2000-20261125    gcc-8.5.0
um                    randconfig-2000-20261126    gcc-8.5.0
um                    randconfig-2001-20261125    gcc-8.5.0
um                    randconfig-2001-20261126    gcc-8.5.0
um                    randconfig-2200-20261125    clang-17   smatch
um                    randconfig-2200-20261126    gcc-12     smatch
um                   randconfig-r2105-20261125    gcc-8.5.0  cocci
um                   randconfig-r2108-20261125    gcc-14     cocci
um                   randconfig-r2301-20261125    clang-24   sparse
um                   randconfig-r2302-20261125    gcc-11.5.0 sparse
um                   randconfig-r2306-20261125    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    clang-20
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261126    clang-22
x86_64      buildonly-randconfig-1001-20261126    clang-22
x86_64      buildonly-randconfig-1002-20261126    clang-22
x86_64      buildonly-randconfig-1003-20261126    clang-22
x86_64      buildonly-randconfig-1004-20261126    clang-22
x86_64      buildonly-randconfig-1005-20261126    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261126    clang-22
x86_64                randconfig-1001-20261126    clang-22
x86_64                randconfig-1002-20261126    clang-22
x86_64                randconfig-1003-20261126    clang-22
x86_64                randconfig-1004-20261126    clang-22
x86_64                randconfig-1005-20261126    clang-22
x86_64                randconfig-2000-20261125    gcc-14
x86_64                randconfig-2000-20261126    clang-22
x86_64                randconfig-2001-20261125    gcc-14
x86_64                randconfig-2001-20261126    clang-22
x86_64                randconfig-2002-20261125    gcc-14
x86_64                randconfig-2002-20261126    clang-22
x86_64                randconfig-2003-20261125    gcc-14
x86_64                randconfig-2003-20261126    clang-22
x86_64                randconfig-2004-20261125    gcc-14
x86_64                randconfig-2004-20261126    clang-22
x86_64                randconfig-2005-20261125    gcc-14
x86_64                randconfig-2005-20261126    clang-22
x86_64                randconfig-2100-20261125    clang-22   cocci
x86_64                randconfig-2100-20261126    gcc-14     cocci
x86_64                randconfig-2101-20261125    clang-22   cocci
x86_64                randconfig-2101-20261126    gcc-14     cocci
x86_64                randconfig-2102-20261125    clang-22   cocci
x86_64                randconfig-2102-20261126    gcc-14     cocci
x86_64                randconfig-2103-20261125    clang-22   cocci
x86_64                randconfig-2103-20261126    gcc-14     cocci
x86_64                randconfig-2104-20261125    clang-22   cocci
x86_64                randconfig-2104-20261126    gcc-14     cocci
x86_64                randconfig-2105-20261125    clang-22   cocci
x86_64                randconfig-2105-20261126    gcc-14     cocci
x86_64                randconfig-2200-20261125    gcc-14     smatch
x86_64                randconfig-2200-20261126    clang-22   smatch
x86_64                randconfig-2300-20261125    clang-22   sparse
x86_64                randconfig-2300-20261126    gcc-14     sparse
x86_64                randconfig-2301-20261125    clang-22   sparse
x86_64                randconfig-2301-20261126    gcc-14     sparse
x86_64                randconfig-2302-20261125    clang-22   sparse
x86_64                randconfig-2302-20261126    gcc-14     sparse
x86_64               randconfig-r2106-20261126    clang-22   cocci
x86_64               randconfig-r2107-20261125    gcc-14     cocci
x86_64               randconfig-r2108-20261126    clang-22   cocci
x86_64               randconfig-r2306-20261125    gcc-11.5.0 sparse
x86_64               randconfig-r2307-20261125    gcc-8.5.0  sparse
x86_64               randconfig-r2309-20261125    gcc-14     sparse
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
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                 generic_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261126    clang-17
xtensa                randconfig-1001-20261126    clang-17
xtensa                randconfig-2000-20261125    gcc-14.4.0
xtensa                randconfig-2000-20261126    gcc-13.5.0
xtensa                randconfig-2001-20261125    gcc-14.4.0
xtensa                randconfig-2001-20261126    gcc-13.5.0
xtensa                randconfig-2200-20261125    gcc-16.2.0 smatch
xtensa                randconfig-2200-20261126    gcc-11.5.0 smatch
xtensa               randconfig-r2100-20261125    gcc-12.5.0 cocci
xtensa               randconfig-r2101-20261125    gcc-8.5.0  cocci
xtensa               randconfig-r2103-20261125    gcc-8.5.0  cocci
xtensa               randconfig-r2107-20261126    clang-24   cocci
xtensa               randconfig-r2111-20261126    clang-24   cocci
xtensa               randconfig-r2302-20261125    gcc-12.5.0 sparse
xtensa               randconfig-r2306-20261126    gcc-10.5.0 sparse
xtensa               randconfig-r2308-20261125    clang-24   sparse
xtensa               randconfig-r2310-20261125    gcc-8.5.0  sparse
xtensa                     xip_kc705_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

