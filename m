Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zbpccqI1;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IGhtZykK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OZnVqgS+627wbGOBiAKFbmD/cZAtRB7WK6dNl2WoB8s=; b=zbpccqI1jMAdNh5cN9/92RHAh/
	cnv6xE87Jx7YCvfh0De4eGpnEo5IO3fKPaQUEFTVu/at1ut358JCdB8SOLRN30G5aC70UE1+fg4wa
	UbZLwqLbcY6QXQEMBqG0kwNfSbl7ebBm7VW9+NHCIUl0g6C5rF/XdYR5J6cIhvYAV6ZRZw/X+P0gR
	vLCiiraTeP6KK+Vv6vvGbC4v0ZtziBLOct4qbVgDXI7f3u092+nA0GQaM80i/J/Lw/FZMcaYXO2hf
	NZd6ob5k1fu13bBh2uSpA3G9rKgzB6a31Jlaoe79dX1+JEL1MOI7PhFuKejT2ouM+wzI4jqfWVVYd
	BGji6OMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5wy-000000012H5-2DPn;
	Sun, 22 Nov 2026 11:41:43 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5wn-000000012EZ-3fvK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 11:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795347690; x=1826883690;
  h=date:from:to:cc:subject:message-id;
  bh=bv8e3DhemwTqaGhcaxA8q3q0az9G3V5fylWuyOsLOYo=;
  b=IGhtZykK/eCwogNS+NTLQmqfJ7TmJbMmQsQUd3AzD/9gLz8x99utoqp7
   vnIpQ9RNUlwVHuuiCyJuvrdmZKHprxisFRO0xEUTbZGX22ujHrXGcx6Bu
   Ji3buHXtoeiny2K7mOSenZt2O02PUlVq1aWkVNlMGMG2H/PDs+Be5XtU6
   NkpVZ/WytbvRGOqqaN0TwBiPa74xwe6N6PzU0kKfR08p3UrfZ6BQErSaY
   lkg9jzPxGHGpCCOTIhNyNvJrqhCoujTUzuCWcOfzMDYgQICNdOECGLqiI
   iX8Du4COkBwyZ488tetapDOYOKbtiifFrLDdROOy0gdx/v/IWrMDntnNI
   g==;
X-CSE-ConnectionGUID: oJofM8wvTW+NfYfIn/SYhA==
X-CSE-MsgGUID: q0we36hZSzqFYenzpnST2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4156096"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4156096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 03:41:26 -0800
X-CSE-ConnectionGUID: gwaDPH6wTtW4Gr63gInAxA==
X-CSE-MsgGUID: KMNWttOTRUiZBMhy8PN1qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11362414"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Nov 2026 03:41:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV5wg-00000001LS0-2lPj;
	Sun, 22 Nov 2026 11:41:22 +0000
Date: Sun, 22 Nov 2026 19:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4:ux500-clk-power-upll] BUILD SUCCESS
 b69e83e8eb7c99509445716d683c338e9cfbf00d
Message-ID: <20261122194046.SgijNxbD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_034129_946901_B5D34A26 
X-CRM114-Status: UNSURE (   5.08  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-clk-power-upll
branch HEAD: b69e83e8eb7c99509445716d683c338e9cfbf00d  clk: ux500: Power the AB8500 ULP PLL from VintCore12

elapsed time: 878m

configs tested: 708
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261120    gcc-15.3.0
alpha                 randconfig-2000-20261121    gcc-14.4.0
alpha                 randconfig-2000-20261122    gcc-8.5.0
alpha                 randconfig-2001-20261120    gcc-15.3.0
alpha                 randconfig-2001-20261121    gcc-14.4.0
alpha                 randconfig-2001-20261122    gcc-8.5.0
alpha                 randconfig-2200-20261120    gcc-15.3.0 smatch
alpha                 randconfig-2200-20261121    gcc-10.5.0 smatch
alpha                randconfig-r2101-20261120    clang-22   cocci
alpha                randconfig-r2105-20261120    gcc-13.5.0 cocci
alpha                randconfig-r2106-20261121    gcc-11.5.0 cocci
alpha                randconfig-r2109-20261120    gcc-11.5.0 cocci
alpha                randconfig-r2301-20261120    clang-24   sparse
alpha                randconfig-r2304-20261122    clang-24   sparse
alpha                randconfig-r2308-20261120    gcc-10.5.0 sparse
alpha                randconfig-r2308-20261122    gcc-13.5.0 sparse
alpha                randconfig-r2309-20261121    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261122    clang-17
arc                   randconfig-1001-20261122    clang-17
arc                   randconfig-2000-20261120    gcc-11.5.0
arc                   randconfig-2000-20261121    gcc-8.5.0
arc                   randconfig-2001-20261120    gcc-11.5.0
arc                   randconfig-2001-20261121    gcc-8.5.0
arc                   randconfig-2002-20261120    gcc-11.5.0
arc                   randconfig-2002-20261121    gcc-8.5.0
arc                   randconfig-2003-20261120    gcc-11.5.0
arc                   randconfig-2003-20261121    gcc-8.5.0
arc                   randconfig-2004-20261120    gcc-11.5.0
arc                   randconfig-2004-20261121    gcc-8.5.0
arc                   randconfig-2005-20261120    gcc-11.5.0
arc                   randconfig-2005-20261121    gcc-8.5.0
arc                   randconfig-2200-20261120    gcc-15.3.0 smatch
arc                   randconfig-2200-20261121    gcc-14.4.0 smatch
arc                  randconfig-r2100-20261120    gcc-13.5.0 cocci
arc                  randconfig-r2101-20261120    clang-24   cocci
arc                  randconfig-r2103-20261120    gcc-15.3.0 cocci
arc                  randconfig-r2104-20261120    clang-24   cocci
arc                  randconfig-r2104-20261120    gcc-13.5.0 cocci
arc                  randconfig-r2105-20261120    clang-22   cocci
arc                  randconfig-r2106-20261120    gcc-11.5.0 cocci
arc                  randconfig-r2109-20261120    gcc-8.5.0  cocci
arc                  randconfig-r2110-20261120    gcc-8.5.0  cocci
arc                  randconfig-r2111-20261121    gcc-14.4.0 cocci
arc                  randconfig-r2300-20261121    clang-24   sparse
arc                  randconfig-r2303-20261121    clang-24   sparse
arc                  randconfig-r2304-20261120    clang-24   sparse
arc                  randconfig-r2306-20261120    gcc-10.5.0 sparse
arc                  randconfig-r2307-20261120    gcc-12.5.0 sparse
arc                  randconfig-r2309-20261120    clang-24   sparse
arc                  randconfig-r2309-20261120    gcc-14     sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    clang-17
arm                   randconfig-1000-20261122    clang-17
arm                   randconfig-1001-20261122    clang-17
arm                   randconfig-1002-20261122    clang-17
arm                   randconfig-1003-20261122    clang-17
arm                   randconfig-2000-20261120    gcc-8.5.0
arm                   randconfig-2000-20261121    clang-24
arm                   randconfig-2001-20261120    gcc-8.5.0
arm                   randconfig-2001-20261121    clang-24
arm                   randconfig-2002-20261120    gcc-8.5.0
arm                   randconfig-2002-20261121    clang-24
arm                   randconfig-2200-20261120    clang-17   smatch
arm                   randconfig-2200-20261121    clang-19   smatch
arm                  randconfig-r2102-20261120    clang-22   cocci
arm                  randconfig-r2104-20261120    gcc-15.3.0 cocci
arm                  randconfig-r2105-20261120    gcc-14     cocci
arm                  randconfig-r2106-20261120    gcc-8.5.0  cocci
arm                  randconfig-r2107-20261120    gcc-8.5.0  cocci
arm                  randconfig-r2108-20261120    clang-18   cocci
arm                  randconfig-r2109-20261120    clang-18   cocci
arm                  randconfig-r2111-20261120    gcc-16.2.0 cocci
arm                  randconfig-r2309-20261120    gcc-10.5.0 sparse
arm                  randconfig-r2309-20261120    gcc-8.5.0  sparse
arm                  randconfig-r2310-20261120    gcc-10.5.0 sparse
arm                         shmobile_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261122    gcc-8.5.0
arm64                 randconfig-1001-20261122    gcc-8.5.0
arm64                 randconfig-1002-20261122    gcc-8.5.0
arm64                 randconfig-1003-20261122    gcc-8.5.0
arm64                 randconfig-2000-20261120    gcc-8.5.0
arm64                 randconfig-2000-20261121    clang-24
arm64                 randconfig-2001-20261120    gcc-8.5.0
arm64                 randconfig-2001-20261121    clang-24
arm64                 randconfig-2002-20261120    gcc-8.5.0
arm64                 randconfig-2002-20261121    clang-24
arm64                 randconfig-2200-20261120    clang-17   smatch
arm64                 randconfig-2200-20261121    clang-22   smatch
arm64                randconfig-r2100-20261120    clang-20   cocci
arm64                randconfig-r2101-20261120    gcc-14     cocci
arm64                randconfig-r2102-20261120    clang-24   cocci
arm64                randconfig-r2107-20261120    gcc-13.5.0 cocci
arm64                randconfig-r2108-20261120    clang-17   cocci
arm64                randconfig-r2111-20261120    gcc-11.5.0 cocci
arm64                randconfig-r2300-20261120    clang-24   sparse
arm64                randconfig-r2302-20261120    clang-24   sparse
arm64                randconfig-r2303-20261120    clang-22   sparse
arm64                randconfig-r2304-20261120    clang-24   sparse
arm64                randconfig-r2305-20261120    gcc-9.5.0  sparse
arm64                randconfig-r2309-20261120    gcc-14.4.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261122    gcc-8.5.0
csky                  randconfig-1001-20261122    gcc-8.5.0
csky                  randconfig-2000-20261120    gcc-16.2.0
csky                  randconfig-2000-20261121    gcc-16.2.0
csky                  randconfig-2001-20261120    gcc-16.2.0
csky                  randconfig-2001-20261121    gcc-16.2.0
csky                  randconfig-2200-20261120    gcc-15.3.0 smatch
csky                  randconfig-2200-20261121    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261121    gcc-10.5.0 cocci
csky                 randconfig-r2101-20261122    gcc-14     cocci
csky                 randconfig-r2103-20261120    gcc-13.5.0 cocci
csky                 randconfig-r2105-20261120    gcc-16.2.0 cocci
csky                 randconfig-r2105-20261122    gcc-14     cocci
csky                 randconfig-r2109-20261121    gcc-11.5.0 cocci
csky                 randconfig-r2111-20261121    clang-24   cocci
csky                 randconfig-r2300-20261120    clang-22   sparse
csky                 randconfig-r2300-20261120    clang-24   sparse
csky                 randconfig-r2306-20261120    gcc-14.4.0 sparse
csky                 randconfig-r2307-20261121    gcc-11.5.0 sparse
csky                 randconfig-r2309-20261120    gcc-12.5.0 sparse
csky                 randconfig-r2309-20261120    gcc-13.5.0 sparse
csky                 randconfig-r2309-20261120    gcc-14.4.0 sparse
csky                 randconfig-r2309-20261122    gcc-13.5.0 sparse
csky                 randconfig-r2310-20261120    gcc-13.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261122    gcc-8.5.0
hexagon               randconfig-1001-20261122    gcc-8.5.0
hexagon               randconfig-2000-20261120    gcc-16.2.0
hexagon               randconfig-2000-20261121    gcc-16.2.0
hexagon               randconfig-2001-20261120    gcc-16.2.0
hexagon               randconfig-2001-20261121    gcc-16.2.0
hexagon               randconfig-2200-20261120    clang-17   smatch
hexagon               randconfig-2200-20261121    clang-24   smatch
hexagon              randconfig-r2102-20261122    gcc-14     cocci
hexagon              randconfig-r2105-20261120    clang-24   cocci
hexagon              randconfig-r2107-20261120    clang-17   cocci
hexagon              randconfig-r2108-20261120    gcc-16.2.0 cocci
hexagon              randconfig-r2108-20261120    gcc-8.5.0  cocci
hexagon              randconfig-r2108-20261121    gcc-14.4.0 cocci
hexagon              randconfig-r2109-20261120    gcc-8.5.0  cocci
hexagon              randconfig-r2110-20261120    gcc-8.5.0  cocci
hexagon              randconfig-r2111-20261120    gcc-14     cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261122    gcc-14
i386        buildonly-randconfig-1001-20261122    gcc-14
i386        buildonly-randconfig-1002-20261122    gcc-14
i386        buildonly-randconfig-1003-20261122    gcc-14
i386        buildonly-randconfig-1004-20261122    gcc-14
i386        buildonly-randconfig-1005-20261122    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261122    gcc-14
i386                  randconfig-1001-20261122    gcc-14
i386                  randconfig-1002-20261122    gcc-14
i386                  randconfig-1003-20261122    gcc-14
i386                  randconfig-1004-20261122    gcc-14
i386                  randconfig-1005-20261122    gcc-14
i386                  randconfig-1006-20261122    gcc-14
i386                  randconfig-1007-20261122    gcc-14
i386                  randconfig-1008-20261122    gcc-14
i386                  randconfig-1009-20261122    gcc-14
i386                  randconfig-1010-20261122    gcc-14
i386                  randconfig-1011-20261122    gcc-14
i386                  randconfig-1012-20261122    gcc-14
i386                  randconfig-1013-20261122    gcc-14
i386                  randconfig-2000-20261120    clang-22
i386                  randconfig-2000-20261121    gcc-14
i386                  randconfig-2001-20261120    clang-22
i386                  randconfig-2001-20261121    gcc-14
i386                  randconfig-2002-20261120    clang-22
i386                  randconfig-2002-20261121    gcc-14
i386                  randconfig-2003-20261120    clang-22
i386                  randconfig-2003-20261121    gcc-14
i386                  randconfig-2004-20261120    clang-22
i386                  randconfig-2004-20261121    gcc-14
i386                  randconfig-2005-20261120    clang-22
i386                  randconfig-2005-20261121    gcc-14
i386                  randconfig-2100-20261120    gcc-14     cocci
i386                  randconfig-2100-20261121    clang-22   cocci
i386                  randconfig-2101-20261120    gcc-14     cocci
i386                  randconfig-2101-20261121    clang-22   cocci
i386                  randconfig-2102-20261120    gcc-14     cocci
i386                  randconfig-2102-20261121    clang-22   cocci
i386                  randconfig-2103-20261120    gcc-14     cocci
i386                  randconfig-2103-20261121    clang-22   cocci
i386                  randconfig-2104-20261120    gcc-14     cocci
i386                  randconfig-2104-20261121    clang-22   cocci
i386                  randconfig-2105-20261120    gcc-14     cocci
i386                  randconfig-2105-20261121    clang-22   cocci
i386                  randconfig-2200-20261120    clang-22   smatch
i386                  randconfig-2200-20261121    clang-22   smatch
i386                  randconfig-2300-20261120    clang-22   sparse
i386                  randconfig-2300-20261121    gcc-14     sparse
i386                  randconfig-2301-20261120    clang-22   sparse
i386                  randconfig-2301-20261121    gcc-14     sparse
i386                  randconfig-2302-20261120    clang-22   sparse
i386                  randconfig-2302-20261121    gcc-14     sparse
i386                 randconfig-r2100-20261120    gcc-14     cocci
i386                 randconfig-r2103-20261121    gcc-10.5.0 cocci
i386                 randconfig-r2104-20261120    clang-22   cocci
i386                 randconfig-r2104-20261122    gcc-14     cocci
i386                 randconfig-r2302-20261120    clang-24   sparse
i386                 randconfig-r2303-20261120    clang-22   sparse
i386                 randconfig-r2305-20261120    clang-22   sparse
i386                 randconfig-r2306-20261122    gcc-13.5.0 sparse
i386                 randconfig-r2308-20261120    gcc-14     sparse
i386                 randconfig-r2310-20261120    gcc-14.4.0 sparse
i386                 randconfig-r2311-20261122    gcc-13.5.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261122    gcc-8.5.0
loongarch             randconfig-1001-20261122    gcc-8.5.0
loongarch             randconfig-2000-20261120    clang-24
loongarch             randconfig-2000-20261121    clang-22
loongarch             randconfig-2001-20261120    clang-24
loongarch             randconfig-2001-20261121    clang-22
loongarch             randconfig-2200-20261120    clang-18   smatch
loongarch             randconfig-2200-20261121    gcc-16.2.0 smatch
loongarch            randconfig-r2101-20261120    clang-24   cocci
loongarch            randconfig-r2101-20261120    gcc-13.5.0 cocci
loongarch            randconfig-r2103-20261120    clang-24   cocci
loongarch            randconfig-r2106-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2110-20261120    gcc-13.5.0 cocci
loongarch            randconfig-r2110-20261120    gcc-14     cocci
loongarch            randconfig-r2110-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261120    gcc-13.5.0 cocci
loongarch            randconfig-r2111-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261121    gcc-11.5.0 cocci
loongarch            randconfig-r2302-20261120    clang-24   sparse
loongarch            randconfig-r2304-20261120    clang-22   sparse
loongarch            randconfig-r2305-20261120    clang-20   sparse
loongarch            randconfig-r2307-20261122    gcc-13.5.0 sparse
loongarch            randconfig-r2308-20261120    gcc-14.4.0 sparse
loongarch            randconfig-r2310-20261120    gcc-8.5.0  sparse
loongarch            randconfig-r2311-20261120    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    clang-17
m68k                  randconfig-2000-20261120    gcc-15.3.0
m68k                  randconfig-2000-20261121    gcc-14.4.0
m68k                  randconfig-2000-20261122    gcc-8.5.0
m68k                  randconfig-2001-20261120    gcc-15.3.0
m68k                  randconfig-2001-20261121    gcc-14.4.0
m68k                  randconfig-2001-20261122    gcc-8.5.0
m68k                  randconfig-2200-20261120    gcc-14.4.0 smatch
m68k                  randconfig-2200-20261121    gcc-8.5.0  smatch
m68k                 randconfig-r2103-20261120    clang-22   cocci
m68k                 randconfig-r2104-20261120    clang-24   cocci
m68k                 randconfig-r2105-20261120    clang-24   cocci
m68k                 randconfig-r2105-20261120    gcc-15.3.0 cocci
m68k                 randconfig-r2108-20261120    gcc-13.5.0 cocci
m68k                 randconfig-r2110-20261120    gcc-16.2.0 cocci
m68k                 randconfig-r2300-20261120    clang-22   sparse
m68k                 randconfig-r2301-20261120    gcc-9.5.0  sparse
m68k                 randconfig-r2307-20261120    gcc-14.4.0 sparse
m68k                 randconfig-r2308-20261120    gcc-12.5.0 sparse
m68k                 randconfig-r2310-20261122    gcc-13.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261120    gcc-15.3.0
microblaze            randconfig-2000-20261121    gcc-14.4.0
microblaze            randconfig-2000-20261122    gcc-8.5.0
microblaze            randconfig-2001-20261120    gcc-15.3.0
microblaze            randconfig-2001-20261121    gcc-14.4.0
microblaze            randconfig-2001-20261122    gcc-8.5.0
microblaze            randconfig-2200-20261120    gcc-11.5.0 smatch
microblaze            randconfig-2200-20261121    gcc-8.5.0  smatch
microblaze           randconfig-r2102-20261121    gcc-10.5.0 cocci
microblaze           randconfig-r2103-20261120    gcc-14     cocci
microblaze           randconfig-r2105-20261121    gcc-10.5.0 cocci
microblaze           randconfig-r2106-20261120    gcc-16.2.0 cocci
microblaze           randconfig-r2109-20261120    gcc-8.5.0  cocci
microblaze           randconfig-r2109-20261121    clang-24   cocci
microblaze           randconfig-r2301-20261120    clang-24   sparse
microblaze           randconfig-r2305-20261120    gcc-8.5.0  sparse
microblaze           randconfig-r2306-20261120    gcc-8.5.0  sparse
microblaze           randconfig-r2307-20261120    gcc-14     sparse
microblaze           randconfig-r2311-20261121    gcc-11.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                            mtx1_defconfig    clang-17
mips                  randconfig-2000-20261120    gcc-9.5.0
mips                  randconfig-2000-20261121    gcc-16.2.0
mips                  randconfig-2001-20261120    gcc-9.5.0
mips                  randconfig-2001-20261121    gcc-16.2.0
mips                  randconfig-2002-20261120    gcc-9.5.0
mips                  randconfig-2002-20261121    gcc-16.2.0
mips                  randconfig-2200-20261120    clang-24   smatch
mips                  randconfig-2200-20261121    clang-21   smatch
mips                 randconfig-r2100-20261120    clang-22   cocci
mips                 randconfig-r2101-20261120    gcc-16.2.0 cocci
mips                 randconfig-r2103-20261120    gcc-16.2.0 cocci
mips                 randconfig-r2104-20261120    gcc-14     cocci
mips                 randconfig-r2105-20261120    clang-22   cocci
mips                 randconfig-r2107-20261120    clang-18   cocci
mips                 randconfig-r2107-20261120    gcc-8.5.0  cocci
mips                 randconfig-r2108-20261120    gcc-8.5.0  cocci
mips                 randconfig-r2110-20261121    gcc-14.4.0 cocci
mips                 randconfig-r2302-20261120    clang-24   sparse
mips                 randconfig-r2304-20261121    clang-24   sparse
mips                 randconfig-r2308-20261120    gcc-8.5.0  sparse
mips                 randconfig-r2311-20261120    clang-24   sparse
mips                 randconfig-r2311-20261120    gcc-10.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261122    gcc-8.5.0
nios2                 randconfig-1001-20261122    gcc-8.5.0
nios2                 randconfig-2000-20261120    clang-24
nios2                 randconfig-2000-20261121    clang-22
nios2                 randconfig-2001-20261120    clang-24
nios2                 randconfig-2001-20261121    clang-22
nios2                 randconfig-2200-20261120    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261121    gcc-10.5.0 smatch
nios2                randconfig-r2104-20261121    gcc-10.5.0 cocci
nios2                randconfig-r2107-20261121    gcc-11.5.0 cocci
nios2                randconfig-r2304-20261120    gcc-9.5.0  sparse
nios2                randconfig-r2306-20261120    clang-24   sparse
nios2                randconfig-r2306-20261120    gcc-10.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261120    gcc-9.5.0
openrisc              randconfig-2000-20261121    gcc-16.2.0
openrisc              randconfig-2001-20261120    gcc-9.5.0
openrisc              randconfig-2001-20261121    gcc-16.2.0
openrisc              randconfig-2002-20261120    gcc-9.5.0
openrisc              randconfig-2002-20261121    gcc-16.2.0
openrisc              randconfig-2200-20261120    gcc-11.5.0 smatch
openrisc              randconfig-2200-20261121    gcc-14.4.0 smatch
openrisc              randconfig-2200-20261122    gcc-16.2.0 smatch
openrisc             randconfig-r2100-20261120    clang-22   cocci
openrisc             randconfig-r2102-20261120    gcc-13.5.0 cocci
openrisc             randconfig-r2102-20261120    gcc-14     cocci
openrisc             randconfig-r2110-20261121    clang-24   cocci
openrisc             randconfig-r2302-20261122    clang-24   sparse
openrisc             randconfig-r2304-20261120    clang-22   sparse
openrisc             randconfig-r2304-20261120    clang-24   sparse
openrisc             randconfig-r2305-20261120    clang-24   sparse
openrisc             randconfig-r2308-20261120    gcc-13.5.0 sparse
openrisc             randconfig-r2309-20261120    gcc-10.5.0 sparse
openrisc             randconfig-r2311-20261120    gcc-14.4.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261122    clang-24
parisc                randconfig-1001-20261122    clang-24
parisc                randconfig-2000-20261120    clang-24
parisc                randconfig-2000-20261121    clang-22
parisc                randconfig-2001-20261120    clang-24
parisc                randconfig-2001-20261121    clang-22
parisc                randconfig-2200-20261120    gcc-8.5.0  smatch
parisc                randconfig-2200-20261121    gcc-16.2.0 smatch
parisc               randconfig-r2101-20261121    gcc-10.5.0 cocci
parisc               randconfig-r2102-20261120    gcc-15.3.0 cocci
parisc               randconfig-r2103-20261120    gcc-13.5.0 cocci
parisc               randconfig-r2107-20261120    gcc-14     cocci
parisc               randconfig-r2108-20261121    gcc-11.5.0 cocci
parisc               randconfig-r2109-20261120    gcc-13.5.0 cocci
parisc               randconfig-r2109-20261120    gcc-16.2.0 cocci
parisc               randconfig-r2300-20261120    clang-24   sparse
parisc               randconfig-r2300-20261120    gcc-8.5.0  sparse
parisc               randconfig-r2306-20261121    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                   mpc866_ads_defconfig    clang-17
powerpc               randconfig-1000-20261122    clang-24
powerpc               randconfig-1001-20261122    clang-24
powerpc               randconfig-2000-20261120    clang-24
powerpc               randconfig-2000-20261121    clang-24
powerpc               randconfig-2001-20261120    clang-24
powerpc               randconfig-2001-20261121    clang-24
powerpc               randconfig-2002-20261120    clang-24
powerpc               randconfig-2002-20261121    clang-24
powerpc               randconfig-2200-20261120    clang-17   smatch
powerpc               randconfig-2200-20261121    gcc-11.5.0 smatch
powerpc              randconfig-r2102-20261120    clang-24   cocci
powerpc              randconfig-r2102-20261120    gcc-16.2.0 cocci
powerpc              randconfig-r2110-20261120    clang-18   cocci
powerpc              randconfig-r2300-20261120    gcc-9.5.0  sparse
powerpc              randconfig-r2301-20261120    clang-20   sparse
powerpc              randconfig-r2301-20261121    clang-24   sparse
powerpc              randconfig-r2301-20261122    clang-24   sparse
powerpc              randconfig-r2303-20261122    clang-24   sparse
powerpc              randconfig-r2304-20261120    clang-20   sparse
powerpc              randconfig-r2305-20261120    clang-22   sparse
powerpc              randconfig-r2305-20261122    clang-24   sparse
powerpc              randconfig-r2308-20261120    clang-24   sparse
powerpc              randconfig-r2310-20261120    gcc-12.5.0 sparse
powerpc              randconfig-r2310-20261120    gcc-14.4.0 sparse
powerpc                      sequoia_defconfig    clang-17
powerpc64             randconfig-1000-20261122    clang-24
powerpc64             randconfig-1001-20261122    clang-24
powerpc64             randconfig-2000-20261120    clang-24
powerpc64             randconfig-2000-20261121    clang-24
powerpc64             randconfig-2001-20261120    clang-24
powerpc64             randconfig-2001-20261121    clang-24
powerpc64             randconfig-2002-20261120    clang-24
powerpc64             randconfig-2002-20261121    clang-24
powerpc64             randconfig-2200-20261120    gcc-16.2.0 smatch
powerpc64             randconfig-2200-20261121    gcc-10.5.0 smatch
powerpc64            randconfig-r2100-20261120    clang-24   cocci
powerpc64            randconfig-r2101-20261120    gcc-13.5.0 cocci
powerpc64            randconfig-r2103-20261120    clang-20   cocci
powerpc64            randconfig-r2109-20261121    gcc-14.4.0 cocci
powerpc64            randconfig-r2111-20261120    clang-17   cocci
powerpc64            randconfig-r2111-20261120    clang-18   cocci
powerpc64            randconfig-r2301-20261120    clang-24   sparse
powerpc64            randconfig-r2302-20261120    clang-20   sparse
powerpc64            randconfig-r2311-20261120    gcc-13.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261122    gcc-9.5.0
riscv                 randconfig-1001-20261122    gcc-9.5.0
riscv                 randconfig-2000-20261120    clang-24
riscv                 randconfig-2000-20261121    gcc-9.5.0
riscv                 randconfig-2001-20261120    clang-24
riscv                 randconfig-2001-20261121    gcc-9.5.0
riscv                 randconfig-2002-20261120    clang-24
riscv                 randconfig-2002-20261121    gcc-9.5.0
riscv                 randconfig-2003-20261120    clang-24
riscv                 randconfig-2003-20261121    gcc-9.5.0
riscv                 randconfig-2004-20261120    clang-24
riscv                 randconfig-2004-20261121    gcc-9.5.0
riscv                 randconfig-2005-20261120    clang-24
riscv                 randconfig-2005-20261121    gcc-9.5.0
riscv                 randconfig-2200-20261120    gcc-8.5.0  smatch
riscv                 randconfig-2200-20261121    clang-24   smatch
riscv                randconfig-r2104-20261120    gcc-13.5.0 cocci
riscv                randconfig-r2107-20261121    clang-24   cocci
riscv                randconfig-r2300-20261120    clang-20   sparse
riscv                randconfig-r2302-20261120    clang-22   sparse
riscv                randconfig-r2307-20261120    clang-24   sparse
riscv                randconfig-r2307-20261120    gcc-14.4.0 sparse
riscv                randconfig-r2308-20261120    clang-24   sparse
riscv                randconfig-r2310-20261120    clang-24   sparse
riscv                randconfig-r2310-20261120    gcc-10.5.0 sparse
riscv                randconfig-r2310-20261120    gcc-14     sparse
riscv                randconfig-r2311-20261120    gcc-14.4.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261122    gcc-9.5.0
s390                  randconfig-1001-20261122    gcc-9.5.0
s390                  randconfig-2000-20261120    clang-24
s390                  randconfig-2000-20261121    clang-22
s390                  randconfig-2001-20261120    clang-24
s390                  randconfig-2001-20261121    clang-22
s390                  randconfig-2002-20261120    clang-24
s390                  randconfig-2002-20261121    clang-22
s390                  randconfig-2003-20261120    clang-24
s390                  randconfig-2003-20261121    clang-22
s390                  randconfig-2004-20261120    clang-24
s390                  randconfig-2004-20261121    clang-22
s390                  randconfig-2005-20261120    clang-24
s390                  randconfig-2005-20261121    clang-22
s390                  randconfig-2200-20261120    clang-17   smatch
s390                  randconfig-2200-20261121    gcc-8.5.0  smatch
s390                 randconfig-r2106-20261120    clang-17   cocci
s390                 randconfig-r2106-20261120    gcc-14     cocci
s390                 randconfig-r2106-20261120    gcc-8.5.0  cocci
s390                 randconfig-r2106-20261121    gcc-14.4.0 cocci
s390                 randconfig-r2107-20261120    gcc-8.5.0  cocci
s390                 randconfig-r2108-20261121    clang-24   cocci
s390                 randconfig-r2109-20261120    clang-17   cocci
s390                 randconfig-r2110-20261121    gcc-11.5.0 cocci
s390                 randconfig-r2111-20261120    gcc-8.5.0  cocci
s390                 randconfig-r2302-20261120    clang-22   sparse
s390                 randconfig-r2303-20261120    clang-24   sparse
s390                 randconfig-r2305-20261121    clang-24   sparse
s390                 randconfig-r2307-20261120    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261122    gcc-9.5.0
sh                    randconfig-1001-20261122    gcc-9.5.0
sh                    randconfig-2000-20261120    gcc-11.5.0
sh                    randconfig-2000-20261121    gcc-16.2.0
sh                    randconfig-2000-20261122    gcc-13.5.0
sh                    randconfig-2001-20261120    gcc-11.5.0
sh                    randconfig-2001-20261121    gcc-16.2.0
sh                    randconfig-2001-20261122    gcc-13.5.0
sh                    randconfig-2002-20261120    gcc-11.5.0
sh                    randconfig-2002-20261121    gcc-16.2.0
sh                    randconfig-2002-20261122    gcc-13.5.0
sh                    randconfig-2003-20261120    gcc-11.5.0
sh                    randconfig-2003-20261121    gcc-16.2.0
sh                    randconfig-2003-20261122    gcc-13.5.0
sh                    randconfig-2004-20261120    gcc-11.5.0
sh                    randconfig-2004-20261121    gcc-16.2.0
sh                    randconfig-2004-20261122    gcc-13.5.0
sh                    randconfig-2005-20261120    gcc-11.5.0
sh                    randconfig-2005-20261121    gcc-16.2.0
sh                    randconfig-2005-20261122    gcc-13.5.0
sh                    randconfig-2200-20261120    gcc-11.5.0 smatch
sh                    randconfig-2200-20261121    gcc-10.5.0 smatch
sh                   randconfig-r2100-20261120    gcc-13.5.0 cocci
sh                   randconfig-r2102-20261120    gcc-13.5.0 cocci
sh                   randconfig-r2108-20261120    gcc-11.5.0 cocci
sh                   randconfig-r2301-20261120    clang-22   sparse
sh                   randconfig-r2303-20261120    clang-20   sparse
sh                   randconfig-r2311-20261120    gcc-12.5.0 sparse
sh                   randconfig-r2311-20261120    gcc-8.5.0  sparse
sh                      sh7710voipgw_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261122    clang-24
sparc                 randconfig-1001-20261122    clang-24
sparc                 randconfig-2000-20261120    gcc-8.5.0
sparc                 randconfig-2000-20261121    gcc-8.5.0
sparc                 randconfig-2001-20261120    gcc-8.5.0
sparc                 randconfig-2001-20261121    gcc-8.5.0
sparc                 randconfig-2200-20261120    gcc-11.5.0 smatch
sparc                 randconfig-2200-20261121    gcc-8.5.0  smatch
sparc                randconfig-r2100-20261120    clang-24   cocci
sparc                randconfig-r2101-20261120    clang-20   cocci
sparc                randconfig-r2102-20261120    clang-22   cocci
sparc                randconfig-r2106-20261120    clang-18   cocci
sparc                randconfig-r2107-20261121    gcc-14.4.0 cocci
sparc                randconfig-r2300-20261120    clang-24   sparse
sparc                randconfig-r2302-20261120    gcc-9.5.0  sparse
sparc                randconfig-r2306-20261120    gcc-12.5.0 sparse
sparc                randconfig-r2306-20261120    gcc-14.4.0 sparse
sparc                randconfig-r2307-20261120    gcc-8.5.0  sparse
sparc                randconfig-r2308-20261120    gcc-10.5.0 sparse
sparc                randconfig-r2309-20261120    clang-24   sparse
sparc                randconfig-r2310-20261121    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261122    clang-24
sparc64               randconfig-1001-20261122    clang-24
sparc64               randconfig-2000-20261120    gcc-8.5.0
sparc64               randconfig-2000-20261121    gcc-8.5.0
sparc64               randconfig-2001-20261120    gcc-8.5.0
sparc64               randconfig-2001-20261121    gcc-8.5.0
sparc64               randconfig-2200-20261120    gcc-14.4.0 smatch
sparc64               randconfig-2200-20261121    clang-20   smatch
sparc64              randconfig-r2101-20261120    clang-22   cocci
sparc64              randconfig-r2102-20261120    clang-20   cocci
sparc64              randconfig-r2105-20261120    gcc-13.5.0 cocci
sparc64              randconfig-r2106-20261120    gcc-13.5.0 cocci
sparc64              randconfig-r2106-20261121    clang-24   cocci
sparc64              randconfig-r2107-20261120    gcc-11.5.0 cocci
sparc64              randconfig-r2108-20261120    gcc-14     cocci
sparc64              randconfig-r2110-20261120    clang-17   cocci
sparc64              randconfig-r2110-20261120    gcc-8.5.0  cocci
sparc64              randconfig-r2111-20261120    gcc-8.5.0  cocci
sparc64              randconfig-r2300-20261122    clang-24   sparse
sparc64              randconfig-r2301-20261120    clang-22   sparse
sparc64              randconfig-r2302-20261121    clang-24   sparse
sparc64              randconfig-r2305-20261120    clang-24   sparse
sparc64              randconfig-r2308-20261120    gcc-14.4.0 sparse
sparc64              randconfig-r2310-20261120    clang-24   sparse
sparc64              randconfig-r2311-20261120    gcc-10.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261122    clang-24
um                    randconfig-1001-20261122    clang-24
um                    randconfig-2000-20261120    gcc-8.5.0
um                    randconfig-2000-20261121    gcc-8.5.0
um                    randconfig-2001-20261120    gcc-8.5.0
um                    randconfig-2001-20261121    gcc-8.5.0
um                    randconfig-2200-20261120    clang-24   smatch
um                    randconfig-2200-20261121    gcc-14     smatch
um                   randconfig-r2101-20261120    gcc-15.3.0 cocci
um                   randconfig-r2103-20261120    clang-22   cocci
um                   randconfig-r2104-20261120    clang-22   cocci
um                   randconfig-r2104-20261120    gcc-16.2.0 cocci
um                   randconfig-r2108-20261120    gcc-8.5.0  cocci
um                   randconfig-r2109-20261120    gcc-14     cocci
um                   randconfig-r2110-20261120    gcc-11.5.0 cocci
um                   randconfig-r2301-20261120    clang-24   sparse
um                   randconfig-r2303-20261120    clang-24   sparse
um                   randconfig-r2308-20261121    gcc-11.5.0 sparse
um                   randconfig-r2311-20261120    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261122    gcc-14
x86_64                randconfig-1001-20261122    gcc-14
x86_64                randconfig-1002-20261122    gcc-14
x86_64                randconfig-1003-20261122    gcc-14
x86_64                randconfig-1004-20261122    gcc-14
x86_64                randconfig-1005-20261122    gcc-14
x86_64                randconfig-1006-20261122    gcc-14
x86_64                randconfig-1007-20261122    gcc-14
x86_64                randconfig-1008-20261122    gcc-14
x86_64                randconfig-1009-20261122    gcc-14
x86_64                randconfig-1010-20261122    gcc-14
x86_64                randconfig-1011-20261122    gcc-14
x86_64                randconfig-1012-20261122    clang-22
x86_64                randconfig-1013-20261122    clang-22
x86_64                randconfig-1014-20261122    clang-22
x86_64                randconfig-1015-20261122    clang-22
x86_64                randconfig-1016-20261122    clang-22
x86_64                randconfig-1017-20261122    clang-22
x86_64                randconfig-2000-20261120    clang-22
x86_64                randconfig-2000-20261121    gcc-14
x86_64                randconfig-2001-20261120    clang-22
x86_64                randconfig-2001-20261121    gcc-14
x86_64                randconfig-2002-20261120    clang-22
x86_64                randconfig-2002-20261121    gcc-14
x86_64                randconfig-2003-20261120    clang-22
x86_64                randconfig-2003-20261121    gcc-14
x86_64                randconfig-2004-20261120    clang-22
x86_64                randconfig-2004-20261121    gcc-14
x86_64                randconfig-2005-20261120    clang-22
x86_64                randconfig-2005-20261121    gcc-14
x86_64                randconfig-2100-20261120    gcc-14     cocci
x86_64                randconfig-2100-20261121    gcc-14     cocci
x86_64                randconfig-2101-20261120    gcc-14     cocci
x86_64                randconfig-2101-20261121    gcc-14     cocci
x86_64                randconfig-2102-20261120    gcc-14     cocci
x86_64                randconfig-2102-20261121    gcc-14     cocci
x86_64                randconfig-2103-20261120    gcc-14     cocci
x86_64                randconfig-2103-20261121    gcc-14     cocci
x86_64                randconfig-2104-20261120    gcc-14     cocci
x86_64                randconfig-2104-20261121    gcc-14     cocci
x86_64                randconfig-2105-20261120    gcc-14     cocci
x86_64                randconfig-2105-20261121    gcc-14     cocci
x86_64                randconfig-2200-20261120    clang-22   smatch
x86_64                randconfig-2200-20261121    gcc-14     smatch
x86_64                randconfig-2300-20261120    clang-22   sparse
x86_64                randconfig-2300-20261121    gcc-14     sparse
x86_64                randconfig-2301-20261120    clang-22   sparse
x86_64                randconfig-2301-20261121    gcc-14     sparse
x86_64                randconfig-2302-20261120    clang-22   sparse
x86_64                randconfig-2302-20261121    gcc-14     sparse
x86_64               randconfig-r2100-20261120    gcc-15.3.0 cocci
x86_64               randconfig-r2100-20261120    gcc-16.2.0 cocci
x86_64               randconfig-r2103-20261120    clang-24   cocci
x86_64               randconfig-r2103-20261122    gcc-14     cocci
x86_64               randconfig-r2105-20261120    clang-20   cocci
x86_64               randconfig-r2106-20261120    gcc-8.5.0  cocci
x86_64               randconfig-r2107-20261120    gcc-8.5.0  cocci
x86_64               randconfig-r2301-20261120    gcc-8.5.0  sparse
x86_64               randconfig-r2303-20261120    gcc-9.5.0  sparse
x86_64               randconfig-r2307-20261120    gcc-13.5.0 sparse
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
xtensa                   nommu_kc705_defconfig    clang-17
xtensa                randconfig-1000-20261122    clang-24
xtensa                randconfig-1001-20261122    clang-24
xtensa                randconfig-2000-20261120    gcc-16.2.0
xtensa                randconfig-2000-20261121    gcc-16.2.0
xtensa                randconfig-2001-20261120    gcc-16.2.0
xtensa                randconfig-2001-20261121    gcc-16.2.0
xtensa                randconfig-2200-20261120    gcc-9.5.0  smatch
xtensa                randconfig-2200-20261121    gcc-12.5.0 smatch
xtensa                randconfig-2200-20261122    gcc-11.5.0 smatch
xtensa               randconfig-r2100-20261122    gcc-14     cocci
xtensa               randconfig-r2104-20261120    clang-20   cocci
xtensa               randconfig-r2107-20261120    gcc-16.2.0 cocci
xtensa               randconfig-r2109-20261120    gcc-8.5.0  cocci
xtensa               randconfig-r2111-20261120    gcc-8.5.0  cocci
xtensa               randconfig-r2302-20261120    gcc-8.5.0  sparse
xtensa               randconfig-r2303-20261120    clang-24   sparse
xtensa               randconfig-r2303-20261120    gcc-8.5.0  sparse
xtensa               randconfig-r2304-20261120    gcc-8.5.0  sparse
xtensa               randconfig-r2306-20261120    gcc-13.5.0 sparse
xtensa               randconfig-r2306-20261120    gcc-14     sparse
xtensa               randconfig-r2307-20261120    gcc-10.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

