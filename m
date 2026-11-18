Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0709D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=szfz72F+;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VXyk6zvn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CgfZZyH7KabdKr1+wIIK9g0k0FRDxF2NmtOKcQevUd8=; b=szfz72F+60ebW77p8dCei04R0z
	TVdmbRWZB3DBSgf+XTw5a8T95OuqdDOIN4EChlNNF9LnWl/n6zKbiXhNjLCamRDLLOvYw0itK7DGx
	Vq/q9/7R4rFY2XYUMYxKXDrBDw0HFCd9D0b/i3FZPz8/d/9YgTK28if8wT4yxIxzn9Rr1R/WW9FLg
	GI7VEds+KQO4qjDQOidn43/EWg+VLCD88sVmfDxIoS78CWa2GHG3Op0VTWm5oHZk+x37s1SQeicDM
	6/cWn1n1PzYPcV9cBEheBLFG4gXOa9atgcB/ZLHFNEkNtPfaX5m7CkobWHOIkSAX3D1ZU699qpAMR
	hKebK1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmfv-0000000AGQP-2nSD;
	Wed, 18 Nov 2026 20:54:39 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmfs-0000000AGPi-1Ckn;
	Wed, 18 Nov 2026 20:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795035276; x=1826571276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Z8yZI/D4aXBD6yY6mwl1Kv3eFQ1J90JCFRfS4YRBT4=;
  b=VXyk6zvnWtJaxA4FbrzTwi9wPkJQPvHdYeckQwzRfK8ZyUCRq82ml91P
   hUiZQ0vsmdnge+IZoaLrgyKJunC7dfdRlYNseUyx5dzH3HvHhoOmOHNQr
   lm1KGLv6/aob9yf5NQeITlSf56KixOp9PrsGIManH9p7CjtvCk7Z2Ifob
   03mTp8RQkqtWXLfKij9chqSZw3ti+bxCIBFC0399H+CXdNTjsD+u1CBrY
   Af59IYk7eSWa9489J5A3qMtng+5np+ARDRl1ULJINrjrqPRcHTfdT/Vr2
   LLFO+AT3ctsXv0shoscUnYnsUjCJEYaLh1OjZ5bV8+8LeYfxILObQcQ6I
   w==;
X-CSE-ConnectionGUID: SJSkipwHSvCIKenG77bJww==
X-CSE-MsgGUID: IzomxjGVToWExLujVy626w==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3750867"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3750867"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 12:54:35 -0800
X-CSE-ConnectionGUID: zFQUWE4eQdiLMAAJFqq2rQ==
X-CSE-MsgGUID: za9zUMc1RhSZjEpYJWoLOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10460438"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Nov 2026 12:54:32 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTmfl-00000001ELO-0Yml;
	Wed, 18 Nov 2026 20:54:29 +0000
Date: Thu, 19 Nov 2026 04:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 6/9] PM / devfreq: rockchip-dfi: make RK3588 use its
 clocks
Message-ID: <202611190436.kIOKt8jJ-lkp@intel.com>
References: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-6-32ff1546b0e4@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-6-32ff1546b0e4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_125436_423055_8D75CF29 
X-CRM114-Status: GOOD (  14.14  )
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

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on chanwoo/devfreq-next]
[also build test WARNING on chanwoo/devfreq-testing next-20261116]
[cannot apply to rockchip/for-next robh/for-next linus/master v7.4-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/dt-bindings-devfreq-event-rockchip-dfi-add-clocks-to-rk3588/20261117-163537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git devfreq-next
patch link:    https://lore.kernel.org/r/20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-6-32ff1546b0e4%40collabora.com
patch subject: [PATCH v3 6/9] PM / devfreq: rockchip-dfi: make RK3588 use its clocks
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261119/202611190436.kIOKt8jJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611190436.kIOKt8jJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611190436.kIOKt8jJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/devfreq/event/rockchip-dfi.c:139 struct member 'num_clks' not described in 'rockchip_dfi_variant'
>> Warning: drivers/devfreq/event/rockchip-dfi.c:139 Excess struct member 'num_clk' description in 'rockchip_dfi_variant' (did you mean one of: 'num_clks')
>> Warning: drivers/devfreq/event/rockchip-dfi.c:139 struct member 'num_clks' not described in 'rockchip_dfi_variant'
>> Warning: drivers/devfreq/event/rockchip-dfi.c:139 Excess struct member 'num_clk' description in 'rockchip_dfi_variant' (did you mean one of: 'num_clks')

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

