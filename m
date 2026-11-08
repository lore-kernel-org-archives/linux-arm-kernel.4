Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE40D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 23:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zT30NKNc;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=njl/gkPF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RIAxd3jomjJTAeBATxn+eqNDxCWaLYEphq5oj8QW39o=; b=zT30NKNc9GdKUGtQI/6BfbEEie
	+J+sSmexq8q3WCmaHzKnSdnRTtakSb1fa4dn9annQSD0j4UpbcwwjnYKlbC2oCmuLQVUyvQqT3iAT
	19AhopbcpGuQZZRVIzdvwVLIHJIlJoV4wz/HJCNv+aZHqVWcyyPugWYi+smKMR9dvZsftkftkKlLA
	nxp/IxmE+yT2LzPwN2vXoOAnOpE8VaVqiujMa+DYcnS6OC0DBndOyzxjAVwjVR3OcNd9H7tMZ9wde
	qIvLZwRBi2lPMbRGCkqAV9AoAYRaNp5SriQwnq1KyqrgI9cdSOZmijN8w+RSekFxs+CS84tJ1txl+
	4268OnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCNX-0000000Gunx-1mz7;
	Sun, 08 Nov 2026 23:32:51 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCNT-0000000Guna-3WcA;
	Sun, 08 Nov 2026 23:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794180768; x=1825716768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fi54V+VFdqsG4yBOFRiGtGx1WzCG1Fe17uVh8OseR/Q=;
  b=njl/gkPFRa/M774rjksgEhDasOG/T0QQ2ESVUlNqMJTbH09Zd/y2qpoN
   juf7xhnMvzIE2FNUt11qMYWF+tQcN9KGn+J5O5p4co5JyMiGmdesmODhS
   jZbe20cGaxc6/67RYmqpNMxAJiuF2kQGn1oKCOoiVv10WFkT4SL9khI5h
   CeWUvgyzkTCrHRrmCf0HhYUPP+Ql87rs6cZBxEBKpwWGKot+VNXGGwgvC
   AJ2SVKEm1meI5T0olG7gnrdvAac9nK8vPu9KuCzilf1LopK2dExdmiW/e
   cIaaW6hHBuAUNNgwKaV7UVE5ApQ+reK9i2E87wG65jJfGDkd0gzVV4+PD
   Q==;
X-CSE-ConnectionGUID: V38y1jAMTcWJIDYtSXp97g==
X-CSE-MsgGUID: VCFdq/AsS6WOvdKtUUk3QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2909847"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2909847"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 15:32:47 -0800
X-CSE-ConnectionGUID: JYca/77zS7yncDSYRey/VA==
X-CSE-MsgGUID: OTEb+65GRAGJzDOpXDgMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7605594"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2026 15:32:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQCNM-00000000tX3-3EMA;
	Sun, 08 Nov 2026 23:32:40 +0000
Date: Mon, 9 Nov 2026 07:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
Message-ID: <202611090709.TnLL9fnj-lkp@intel.com>
References: <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_153247_965628_634E2709 
X-CRM114-Status: UNSURE (   9.87  )
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

Hi Sasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Finkelstein/dt-bindings-phy-atcphy-Add-M3-series/20261108-164340
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261108-t8122-phy-v1-3-c2783b2a53a8%40chaosmail.tech
patch subject: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261109/202611090709.TnLL9fnj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090709.TnLL9fnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090709.TnLL9fnj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/phy/apple/atc.c:678 struct member 'hw' not described in 'apple_atcphy'
>> Warning: drivers/phy/apple/atc.c:678 struct member 'hw' not described in 'apple_atcphy'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

