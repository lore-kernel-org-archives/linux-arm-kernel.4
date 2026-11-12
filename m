Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0C4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R3Wwysc1;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jbpv6X+C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0YziDZfUnrU7+ZJzcup14ZR4PkDNoZg+AFnvLqgDtiI=; b=R3Wwysc1q4FjzeZTlQt7IIHkKB
	/NQqn25m+BfTu0rg1J4rjAsj/qZo78dxHZ26ddDWpbdH/zBnIDE3tzpp1wSGXHGSNr05iwBT++T88
	UY8XRfHbK5rGgPUHJY3AOTKI0trp9Wo+WQtivThNBw3ko0b0U8oLOOTuQIqLxaUEk8QTtPvriQCjs
	g1CjlMBobHRZ5Omrbp32u0J2Oc1gu6NiYlGHqwB9pO+uCfze54Okh+ycI9G1am7Rn335UZwigYYdS
	tOFMvzQJkXfdcdcYw2ZqKPPHVbI0MOlIXA5r2WRKoFIzrptp5jJmLXfmxviaPWaQQhWxU0YF6XSGP
	fRQnoRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRan2-0000000Axzr-0Ax0;
	Thu, 12 Nov 2026 19:48:56 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRamy-0000000AxzP-1vNz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794512933; x=1826048933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1H8hTocbRs5F0H8f9VjKeKS3W2Q+jtOlQ95m5Xrt4xE=;
  b=jbpv6X+C1Afh8f4nEuo/jqv2UbwP9Sh47Sc6RyJbNW+wewlj4LDnhO0K
   ZAjjrrbyGsENCtSBywSTh3v+OkuC85USHGTrBykCW+TjL5dGW1R0dGISZ
   lkORQEZYJ6Qtyve05hVm6iqttwK/ced9CrpAQR2PBSlB61UqpMoxTgDO3
   8qWBdzgNDavSGJkJcRGsTtmZVWH3jZGnusx6r2KWzEtUCsWQ9ctknLtna
   M8oQ+McYpZm8+kHNkc3PxXIvYSg9ySUJK+Fdy66uxi7JWnhF0ChNI5mhv
   5nztTXq98AJCcTpZu9Y7k6cRrHVwRaSdpQ9GuPol0MfIs3LjWtv0dY1yh
   w==;
X-CSE-ConnectionGUID: 79d4nsWfT8+IKzLWZej6HQ==
X-CSE-MsgGUID: Ce1xdZ71T5C3V12chqeGnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3309592"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3309592"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 11:48:52 -0800
X-CSE-ConnectionGUID: JAAS6zlARt+yL8xcodFyKA==
X-CSE-MsgGUID: yMKYkCFERiWre3Fu7XfTBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9296784"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2026 11:48:49 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRamr-000000011yx-3hkD;
	Thu, 12 Nov 2026 19:48:45 +0000
Date: Fri, 13 Nov 2026 03:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] perf: arm_v7_pmu: suppress -Winitializer-overrides for
 perf maps
Message-ID: <202611130312.GB4BOZab-lkp@intel.com>
References: <20261111023326.70922-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111023326.70922-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_114852_568152_5A50A1DF 
X-CRM114-Status: GOOD (  12.03  )
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

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm-perf/for-next/perf]
[also build test WARNING on linus/master v7.4-rc2 next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/perf-arm_v7_pmu-suppress-Winitializer-overrides-for-perf-maps/20261110-183326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20261111023326.70922-1-rosenp%40gmail.com
patch subject: [PATCH] perf: arm_v7_pmu: suppress -Winitializer-overrides for perf maps
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261113/202611130312.GB4BOZab-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130312.GB4BOZab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130312.GB4BOZab-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:173,
                    from <command-line>:
>> include/linux/compiler-gcc.h:118:33: warning: unknown option after '#pragma GCC diagnostic' kind [-Wpragmas]
     118 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/compiler-gcc.h:129:9: note: in expansion of macro '__diag'
     129 |         __diag(__diag_GCC_ignore option)
         |         ^~~~~~
   drivers/perf/arm_v7_pmu.c:156:1: note: in expansion of macro '__diag_ignore_all'
     156 | __diag_ignore_all("-Winitializer-overrides", "");
         | ^~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:78:57: warning: initialized field overwritten [-Woverride-init]
      78 | #define ARMV7_PERFCTR_CPU_CYCLES                        0xFF
         |                                                         ^~~~
   drivers/perf/arm_v7_pmu.c:167:51: note: in expansion of macro 'ARMV7_PERFCTR_CPU_CYCLES'
     167 |         [PERF_COUNT_HW_CPU_CYCLES]              = ARMV7_PERFCTR_CPU_CYCLES,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:78:57: note: (near initialization for 'armv7_a8_perf_map[0]')
   drivers/perf/arm_v7_pmu.c:167:51: note: in expansion of macro 'ARMV7_PERFCTR_CPU_CYCLES'
     167 |         [PERF_COUNT_HW_CPU_CYCLES]              = ARMV7_PERFCTR_CPU_CYCLES,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:45:57: warning: initialized field overwritten [-Woverride-init]
      45 | #define ARMV7_PERFCTR_INSTR_EXECUTED                    0x08
         |                                                         ^~~~
   drivers/perf/arm_v7_pmu.c:168:51: note: in expansion of macro 'ARMV7_PERFCTR_INSTR_EXECUTED'
     168 |         [PERF_COUNT_HW_INSTRUCTIONS]            = ARMV7_PERFCTR_INSTR_EXECUTED,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:45:57: note: (near initialization for 'armv7_a8_perf_map[1]')
   drivers/perf/arm_v7_pmu.c:168:51: note: in expansion of macro 'ARMV7_PERFCTR_INSTR_EXECUTED'
     168 |         [PERF_COUNT_HW_INSTRUCTIONS]            = ARMV7_PERFCTR_INSTR_EXECUTED,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:41:57: warning: initialized field overwritten [-Woverride-init]
      41 | #define ARMV7_PERFCTR_L1_DCACHE_ACCESS                  0x04
         |                                                         ^~~~
   drivers/perf/arm_v7_pmu.c:169:51: note: in expansion of macro 'ARMV7_PERFCTR_L1_DCACHE_ACCESS'
     169 |         [PERF_COUNT_HW_CACHE_REFERENCES]        = ARMV7_PERFCTR_L1_DCACHE_ACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:41:57: note: (near initialization for 'armv7_a8_perf_map[2]')
   drivers/perf/arm_v7_pmu.c:169:51: note: in expansion of macro 'ARMV7_PERFCTR_L1_DCACHE_ACCESS'
     169 |         [PERF_COUNT_HW_CACHE_REFERENCES]        = ARMV7_PERFCTR_L1_DCACHE_ACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:40:57: warning: initialized field overwritten [-Woverride-init]
      40 | #define ARMV7_PERFCTR_L1_DCACHE_REFILL                  0x03
         |                                                         ^~~~
   drivers/perf/arm_v7_pmu.c:170:51: note: in expansion of macro 'ARMV7_PERFCTR_L1_DCACHE_REFILL'
     170 |         [PERF_COUNT_HW_CACHE_MISSES]            = ARMV7_PERFCTR_L1_DCACHE_REFILL,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:40:57: note: (near initialization for 'armv7_a8_perf_map[3]')
   drivers/perf/arm_v7_pmu.c:170:51: note: in expansion of macro 'ARMV7_PERFCTR_L1_DCACHE_REFILL'
     170 |         [PERF_COUNT_HW_CACHE_MISSES]            = ARMV7_PERFCTR_L1_DCACHE_REFILL,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:57:57: warning: initialized field overwritten [-Woverride-init]
      57 | #define ARMV7_PERFCTR_PC_WRITE                          0x0C
         |                                                         ^~~~
   drivers/perf/arm_v7_pmu.c:171:51: note: in expansion of macro 'ARMV7_PERFCTR_PC_WRITE'
     171 |         [PERF_COUNT_HW_BRANCH_INSTRUCTIONS]     = ARMV7_PERFCTR_PC_WRITE,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:57:57: note: (near initialization for 'armv7_a8_perf_map[4]')
   drivers/perf/arm_v7_pmu.c:171:51: note: in expansion of macro 'ARMV7_PERFCTR_PC_WRITE'
     171 |         [PERF_COUNT_HW_BRANCH_INSTRUCTIONS]     = ARMV7_PERFCTR_PC_WRITE,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:61:57: warning: initialized field overwritten [-Woverride-init]
      61 | #define ARMV7_PERFCTR_PC_BRANCH_MIS_PRED                0x10
         |                                                         ^~~~
   drivers/perf/arm_v7_pmu.c:172:51: note: in expansion of macro 'ARMV7_PERFCTR_PC_BRANCH_MIS_PRED'
     172 |         [PERF_COUNT_HW_BRANCH_MISSES]           = ARMV7_PERFCTR_PC_BRANCH_MIS_PRED,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:61:57: note: (near initialization for 'armv7_a8_perf_map[5]')
   drivers/perf/arm_v7_pmu.c:172:51: note: in expansion of macro 'ARMV7_PERFCTR_PC_BRANCH_MIS_PRED'
     172 |         [PERF_COUNT_HW_BRANCH_MISSES]           = ARMV7_PERFCTR_PC_BRANCH_MIS_PRED,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:84:57: warning: initialized field overwritten [-Woverride-init]
      84 | #define ARMV7_A8_PERFCTR_STALL_ISIDE                    0x56
         |                                                         ^~~~
   drivers/perf/arm_v7_pmu.c:173:51: note: in expansion of macro 'ARMV7_A8_PERFCTR_STALL_ISIDE'
     173 |         [PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] = ARMV7_A8_PERFCTR_STALL_ISIDE,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:84:57: note: (near initialization for 'armv7_a8_perf_map[7]')
   drivers/perf/arm_v7_pmu.c:173:51: note: in expansion of macro 'ARMV7_A8_PERFCTR_STALL_ISIDE'
     173 |         [PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] = ARMV7_A8_PERFCTR_STALL_ISIDE,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:41:57: warning: initialized field overwritten [-Woverride-init]
      41 | #define ARMV7_PERFCTR_L1_DCACHE_ACCESS                  0x04
         |                                                         ^~~~
   drivers/perf/arm_v7_pmu.c:186:51: note: in expansion of macro 'ARMV7_PERFCTR_L1_DCACHE_ACCESS'
     186 |         [C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV7_PERFCTR_L1_DCACHE_ACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:41:57: note: (near initialization for 'armv7_a8_perf_cache_map[0][0][0]')
   drivers/perf/arm_v7_pmu.c:186:51: note: in expansion of macro 'ARMV7_PERFCTR_L1_DCACHE_ACCESS'
     186 |         [C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV7_PERFCTR_L1_DCACHE_ACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:40:57: warning: initialized field overwritten [-Woverride-init]
      40 | #define ARMV7_PERFCTR_L1_DCACHE_REFILL                  0x03
         |                                                         ^~~~
   drivers/perf/arm_v7_pmu.c:187:51: note: in expansion of macro 'ARMV7_PERFCTR_L1_DCACHE_REFILL'
     187 |         [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = ARMV7_PERFCTR_L1_DCACHE_REFILL,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:40:57: note: (near initialization for 'armv7_a8_perf_cache_map[0][0][1]')
   drivers/perf/arm_v7_pmu.c:187:51: note: in expansion of macro 'ARMV7_PERFCTR_L1_DCACHE_REFILL'
     187 |         [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = ARMV7_PERFCTR_L1_DCACHE_REFILL,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_v7_pmu.c:41:57: warning: initialized field overwritten [-Woverride-init]
      41 | #define ARMV7_PERFCTR_L1_DCACHE_ACCESS                  0x04


vim +118 include/linux/compiler-gcc.h

8793bb7f4a9dd13 Arnd Bergmann 2018-06-19  115  
8793bb7f4a9dd13 Arnd Bergmann 2018-06-19  116  #define __diag_str1(s)		#s
8793bb7f4a9dd13 Arnd Bergmann 2018-06-19  117  #define __diag_str(s)		__diag_str1(s)
8793bb7f4a9dd13 Arnd Bergmann 2018-06-19 @118  #define __diag(s)		_Pragma(__diag_str(GCC diagnostic s))
8793bb7f4a9dd13 Arnd Bergmann 2018-06-19  119  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

