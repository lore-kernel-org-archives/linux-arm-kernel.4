Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0019D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B4CJ2RM2;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y1DpnByB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rcCOAgaNQ6mOxfEeq0aJhRnhXgr/WD3qzoIXLp7iAwM=; b=B4CJ2RM2w/AWUYLXn8rkxc9ATz
	+n3KSG3xVmaRQFE2a+pyb7hgrRsHhf0MLY132hH5Ak3RvJFThLgWo/x/Rcjh9qLekwV0Q/T9yOKB8
	UlN5BHUWJDBxPSMhEDXadN5PWymeoYIYrAoGn7PMms7MZyuKonF5MBUvM/3DSbgvlO7AzQfqWJB35
	JmXJaspEcBwRXe+9R6UZUuEv2Wx3oD7lFM4T6T9FNjhYij/nXOlB3RjhDIaHkOuKPDLlihVHrjcks
	y4q4kSssr12qucGpGbrWwRoLW1MwefJQv6aK0fZwgZIgaN3AVSHHHaO1U812I3v+ASjnG63euNiAI
	IgAtiQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnMH-0000000CC4G-11AQ;
	Fri, 13 Nov 2026 09:14:09 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnMD-0000000CC3e-3kZn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794561246; x=1826097246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3YQC2srLmB0eRjZt+W5Kk9zvcxE/nqYSAZ8PFwWwbRU=;
  b=Y1DpnByBB4sZ1LxBDhsUPcSSPeilLfV6OlC7umEGQthehoEC4lEkaQUU
   kNr4bqUGUpBi6Gs4b8/Z98ZSLQf3nZnTQ6363AvXGzBCJ+sh+hKg9G3mo
   H345EH5U2+NCZM4IsH0H4Oo6s59ROJg3KPhaSqw4tUNC8pRsVGFPwc0aM
   sGH5Ci1uMxwmkvLXMm2t/+7efSmm7UqG53pNllX7t93BDnqI/hlJNf/54
   CVeMhV24+UIDQ095/X9B2+M0Xxt5/ald9YzieHFR0mFK3p9SOnaoqoCbM
   mo0NafxQnqyI+1F/aMqI63raOCdY35pvdMRWs865rR/w19Eg2MBkhZhV8
   Q==;
X-CSE-ConnectionGUID: U3900rPXSg+95x338lnzVQ==
X-CSE-MsgGUID: sT+Rr4A+Tqa0giP0pcpbqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3388893"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3388893"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 01:14:04 -0800
X-CSE-ConnectionGUID: 918UqnjfQUaNbjvAweC7Xw==
X-CSE-MsgGUID: NDVEmg+mRYOn7n4rQPLLqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="10656371"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 13 Nov 2026 01:14:02 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRnM7-000000012ch-3Yr3;
	Fri, 13 Nov 2026 09:13:59 +0000
Date: Fri, 13 Nov 2026 17:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@kernel.org>,
	Jamie Nguyen <jamien@nvidia.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dat Mach <dmach@nvidia.com>
Subject: Re: [PATCH v2 3/3] firmware: arm_ffa: Share FF-A version negotiation
Message-ID: <202611131749.3XbZQkPM-lkp@intel.com>
References: <20261112-acpi_ffh_ffa-v2-3-575a9dbed22b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-acpi_ffh_ffa-v2-3-575a9dbed22b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_011405_944436_4CFCE1B5 
X-CRM114-Status: GOOD (  11.19  )
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
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261113/202611131749.3XbZQkPM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131749.3XbZQkPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131749.3XbZQkPM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tee/optee/ffa_abi.c:8:
>> include/linux/arm_ffa.h:189:37: warning: 'struct arm_smccc_1_2_regs' declared inside parameter list will not be visible outside of this definition or declaration
     189 |         void (*invoke)(const struct arm_smccc_1_2_regs *args,
         |                                     ^~~~~~~~~~~~~~~~~~


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

