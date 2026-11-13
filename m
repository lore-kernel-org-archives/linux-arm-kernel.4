Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD1606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hum2q7nc;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hmsndqWY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9q3WecW58AVzVN8/3AXX3WSFjtoBFejU4UH87CoM6+E=; b=hum2q7ncx9DNo3zJ1qxV/f6Ktf
	5jTFw59hkGLk18xePqScLlekSwz7gOnXXdDGSN1TTIqGjPf5AXQdHxcehr35L64R7/suTFpONaieW
	fbuY+YoGod6P2dsTU0EQDPNaSLqnDrLOGjHMU76+tMVP91RdolTucdBws2dQ/EouGk2huikhPfiTT
	+T7BBoPQo5P45A+e1HgHfO0T242IejLiQAJYlkpGzk/9NSkRLzcbSx3pU+6GV5KnSEM0TZQqh7LeW
	hdaqfUG+PcTmSwJO/qCkJvJtaQY1/YouLHhvdYbk55HXN5jpC+hoIa10O1+ZQm1WCEaoy+3gN/O2O
	bzeiyNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhOD-0000000BWVO-17wo;
	Fri, 13 Nov 2026 02:51:45 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhOA-0000000BWUX-4Ar9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794538303; x=1826074303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fxqpdnvOspyiKnPiU9wfiXKu4XCKOXuYAgetxr629AM=;
  b=hmsndqWYvkivvkd5QAKKNdThBIEvxKZTBSj7IyB9f8MoQh47ZsDHIbuE
   ZmMRjxDvbZbjmcuFm1pTtnHgD/Oicb742zMezAu4lz180Wr4ZxErgPnrT
   QHL1NaUR+CCl5PPJK96dLKr3ZZrzKaFMHLyRO/WL4ixXg+oqB0rzwylf0
   g5IG7E/JVELM5Xkh+kPfBqygWfwOJb2cxA7aBguCJYdnRuzuNab+bzWUn
   QsM4nVb2rei1W9TOULScQrEIfEc0rnxh6mtzeyKlRHkv5c0iTQ79ARWkM
   xVE7rrWaXbWB0WMPS8ec+93aqfUDUmdS04rXcxqHBQkH+O86WIQBfnYbO
   A==;
X-CSE-ConnectionGUID: Y1Cm/hO8Q72gr2YNpz4H1A==
X-CSE-MsgGUID: XF8uXX4OR6KHrdJy6cV4WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3232619"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3232619"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 18:51:43 -0800
X-CSE-ConnectionGUID: yPq+HySaSR+ZKVdZDROT3g==
X-CSE-MsgGUID: ajzsGcyWSYijWq20X5aymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8831933"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2026 18:51:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRhO5-000000012L5-1qoW;
	Fri, 13 Nov 2026 02:51:37 +0000
Date: Fri, 13 Nov 2026 10:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jamie Nguyen <jamien@nvidia.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dat Mach <dmach@nvidia.com>
Subject: Re: [PATCH v2 3/3] firmware: arm_ffa: Share FF-A version negotiation
Message-ID: <202611131010.OMo0VbqM-lkp@intel.com>
References: <20261112-acpi_ffh_ffa-v2-3-575a9dbed22b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-acpi_ffh_ffa-v2-3-575a9dbed22b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_185143_112466_1B24A13D 
X-CRM114-Status: GOOD (  11.65  )
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

Hi Sudeep,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7475ea8b58616b33c04afb976cf0fbaad9dd63fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Sudeep-Holla/firmware-arm_ffa-Share-FF-A-register-field-definitions/20261112-111406
base:   7475ea8b58616b33c04afb976cf0fbaad9dd63fb
patch link:    https://lore.kernel.org/r/20261112-acpi_ffh_ffa-v2-3-575a9dbed22b%40kernel.org
patch subject: [PATCH v2 3/3] firmware: arm_ffa: Share FF-A version negotiation
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261113/202611131010.OMo0VbqM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1b1fed44d3dcca649a9877915d57c3357a98124e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131010.OMo0VbqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131010.OMo0VbqM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tee/optee/ffa_abi.c:8:
>> include/linux/arm_ffa.h:189:30: warning: declaration of 'struct arm_smccc_1_2_regs' will not be visible outside of this function [-Wvisibility]
     189 |         void (*invoke)(const struct arm_smccc_1_2_regs *args,
         |                                     ^
   1 warning generated.


vim +189 include/linux/arm_ffa.h

   182	
   183	#if IS_BUILTIN(CONFIG_ARM_FFA_VERSION_NEGOTIATION)
   184	int arm_ffa_version_get(void (*invoke)(const struct arm_smccc_1_2_regs *args,
   185					       struct arm_smccc_1_2_regs *res),
   186				u32 input_version, u32 *version);
   187	#else
   188	static inline int arm_ffa_version_get(
 > 189		void (*invoke)(const struct arm_smccc_1_2_regs *args,
   190			       struct arm_smccc_1_2_regs *res),
   191		u32 input_version, u32 *version) { return -EOPNOTSUPP; }
   192	#endif /* CONFIG_ARM_FFA_VERSION_NEGOTIATION */
   193	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

