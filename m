Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED323606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=apRZDdiG;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9LEHQbx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ecaFsi2e5LNEjbPjQmXTKmGsw/5A00VPELVlO9Khp+U=; b=apRZDdiGIN94wrqitujX+lWb5i
	dEwH8Vdtn4WpfKqr0/zKb/ss7x9S8Xtd2mnbQ1C49Q55OnG/bv+B3gm7s9HA5VIMt2sqdnqwhETfv
	CWQJs2za8xjkFJpFF8Sh89iYbDrwx2jJXazoV87QYQLMxgVYrWsFV5JI9A6UQeNCeLh4fVcqXRrRX
	u0/i7aVaBnudKTAS4MSwswIDWwPjzzqc5rjj1DPBwsalZcMPNAukVFedtFCOJ1cc3d8EAffcYRKd5
	7AgEZEJ/SZ+RtZmLIFZURZH6qsgI04fT0rE36d8vBySMnd5l9HwQFGtJQ/PAv23OX5R3g5Dl9tMXw
	AVJ3+JkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkL0-0000000HBRx-03CR;
	Sat, 21 Nov 2026 12:37:02 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkKw-0000000HBRZ-0liD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 12:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795264618; x=1826800618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vzevyCRwbcuYgq6/jbeCiti9NxgogyfaH27PDNXIwbI=;
  b=F9LEHQbxO4bESnSmEEB8MgYloxj+GgyaWATRdf1GGfxlB6qHrSXnJ/Ht
   YPa7JoX2DoKbf3bo8q9+Z7u1d0xtQbm5B1WDf3tps2pFVhruAaDw/ilFb
   3AhU0KLik54BByvtWyQ7+nuIr2k+hMqPinbcVnbG2xZYVP3SZUmWhGrCz
   1cdTUN+pAsIFcezth1TLmr7uGDDGa/CtGdQhwCu+KSnovLGLYUNMlNXQK
   slH1phRkBOfUGdIrpZb5Y+eISE7ZsS/2dSjiXr0FVk7Ci8G+NUj39F4on
   GSOjOVqV/gZXxyCNe58Hde8lc0ouKpM7GD5F+GLdnzHjiAnpMFIRGkkEI
   Q==;
X-CSE-ConnectionGUID: qdpY6gPhQQyfgFF240Ch+A==
X-CSE-MsgGUID: OQxD8mxVS/2EW3O6CG3oFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4022312"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4022312"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 04:36:57 -0800
X-CSE-ConnectionGUID: 2aGCBJTUTxejGB3+KsWypg==
X-CSE-MsgGUID: cnRiy/mqRGaPtXl2VNqKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10811808"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2026 04:36:54 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUkKp-00000001K21-2IsS;
	Sat, 21 Nov 2026 12:36:51 +0000
Date: Sat, 21 Nov 2026 20:36:37 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: Re: [PATCH v2 2/2] mailbox: marvell-mhu: add Marvell MHU driver
Message-ID: <202611212016.DdozCIS5-lkp@intel.com>
References: <20261120113952.168265-3-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120113952.168265-3-paul.cercueil@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_043658_270340_CAAF486B 
X-CRM114-Status: GOOD (  13.72  )
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

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v7.4-rc3 next-20261119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/dt-bindings-mailbox-add-Marvell-MHU/20261120-123951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20261120113952.168265-3-paul.cercueil%40bootlin.com
patch subject: [PATCH v2 2/2] mailbox: marvell-mhu: add Marvell MHU driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261121/202611212016.DdozCIS5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611212016.DdozCIS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611212016.DdozCIS5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/marvell_mhu.c: In function 'mrvl_mhu_send_data':
>> drivers/mailbox/marvell_mhu.c:96:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Wimplicit-function-declaration]
      96 |         iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
         |         ^~~~~~~~~
         |         iowrite32
   drivers/mailbox/marvell_mhu.c: In function 'mrvl_mhu_last_tx_done':
>> drivers/mailbox/marvell_mhu.c:106:18: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Wimplicit-function-declaration]
     106 |         status = ioread64(mhu->base + AP0_TO_SCP_MBOX_LINT);
         |                  ^~~~~~~~
         |                  ioread32


vim +96 drivers/mailbox/marvell_mhu.c

    89	
    90	static int mrvl_mhu_send_data(struct mbox_chan *chan, void *data)
    91	{
    92		const u64 doorbell = 0xff;  /* Arbitrary value, SCP requires a value */
    93		struct mrvl_mhu *mhu = chan->con_priv;
    94	
    95		/* signal SCP */
  > 96		iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
    97	
    98		return 0;
    99	}
   100	
   101	static bool mrvl_mhu_last_tx_done(struct mbox_chan *chan)
   102	{
   103		struct mrvl_mhu *mhu = chan->con_priv;
   104		u64 status;
   105	
 > 106		status = ioread64(mhu->base + AP0_TO_SCP_MBOX_LINT);
   107	
   108		return status != 0;
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

