Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D884606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j17gWJB8;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OwS58YLe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GzzLhdvVHVhImWIaPXcpvvtgW/7/G6PUPzkwtovFrgM=; b=j17gWJB8D7FT8W/4by7THtp9O/
	vQEGFKfdzwcQhwhJXPBtm/tW86zcQ2qSm2ku4bGELQLmchNa+Qmfe6eCyMnXDxho3smZ3hn9v8fMT
	KWNPKZtkhUd4TrkFsj/aensMNIWOD4xAVCxQm6SgMVu6jc8h6Y6MSmvuyF3CJjPXArqf5iA2GIysm
	GLmlWYTdo8tNnjBNQMM69cD5u7SQj6nC0hUUCcRHQw2v+M4WODRVdfh+jtyge9It09IRf5XpWvz9Y
	ll9cd3P2sHYHNeWmzFweDQWFOs89xRlIOeSVxb1ABhhGc0SC+P7f+RK+y45nvf1DWwdYd8xtiB9st
	yTA78Jsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYUX-0000000AkH2-2ARO;
	Thu, 12 Nov 2026 17:21:41 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYUU-0000000AkG7-3U7f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794504099; x=1826040099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uma/eEaGwRBtblC8rBaaMIa/ZWcOfIQeuzdmTFZMvVw=;
  b=OwS58YLefx1Ih3cQR8G2YEH2vAdTzeDuX/P0QzQumu0sMRGIIAg2dQlf
   rnlMAKX+bwwT6q+j7JXK+qDqWg0jpY86Llb7IsAAUZK7Oa13Lf39OALi4
   9sfICaspWEh5+e8nR9yjMn6cvk4PbXDNrmrsS6pcS7Zj6LdwzFTABNh0d
   J/qyrAsMFiQxxDJJHmWHayhP02IuVNqbH4J3hrIqBEmZKl5oBvIl7geza
   hVHRMGM/0xEkcHjNn3oXmGTxUmjZ3khy/YzJq8/qrUlbNOb1OXhsAogA+
   lyuyzqRh+4eibt7ty0EsJTI9EP4aU8gtR05I5daj8cT2a7itF9R3RCEsu
   A==;
X-CSE-ConnectionGUID: +gO6yfEIRS2Ti3zHq9feYg==
X-CSE-MsgGUID: pLiBAdqKTSSgu3HQnumfAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3196847"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3196847"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 09:21:38 -0800
X-CSE-ConnectionGUID: CzwW3/CgRYq5vVebJQA04Q==
X-CSE-MsgGUID: SyVchUWYSNmCAtOxVXU2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8547261"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Nov 2026 09:21:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRYUN-000000011qF-4BY8;
	Thu, 12 Nov 2026 17:21:31 +0000
Date: Fri, 13 Nov 2026 01:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Moteen Shah <m-shah@ti.com>, conor+dt@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, u-kumar1@ti.com, gehariprasath@ti.com,
	m-shah@ti.com, vigneshr@ti.com, afd@ti.com, a-limaye@ti.com,
	y-abhilashchandra@ti.com, johan@kernel.org, kees@kernel.org,
	jm@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] soc: ti: k3-socinfo: Export SoC registration
 helper
Message-ID: <202611130145.c9PExnQn-lkp@intel.com>
References: <20261112081047.1550471-4-m-shah@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112081047.1550471-4-m-shah@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_092139_068210_9FDF0E34 
X-CRM114-Status: GOOD (  12.57  )
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

Hi Moteen,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.4-rc2 next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Moteen-Shah/dt-bindings-soc-ti-Document-the-ti-tda54-mcu-scm-conf/20261112-134044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261112081047.1550471-4-m-shah%40ti.com
patch subject: [PATCH v3 3/4] soc: ti: k3-socinfo: Export SoC registration helper
config: x86_64-buildonly-randconfig-1005-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130145.c9PExnQn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130145.c9PExnQn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130145.c9PExnQn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/ti/k3-socinfo.c:17:10: fatal error: linux/soc/ti/k3-socinfo.h: No such file or directory
      17 | #include <linux/soc/ti/k3-socinfo.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +17 drivers/soc/ti/k3-socinfo.c

  > 17	#include <linux/soc/ti/k3-socinfo.h>
    18	#include <linux/string.h>
    19	#include <linux/sys_soc.h>
    20	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

