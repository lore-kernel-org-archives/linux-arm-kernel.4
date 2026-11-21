Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF81A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ow0SDnMV;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R/hbl7I8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yqFg/CDfhcQQki7rbGu6XmQIamv54cpSA2pIhpeTPrI=; b=Ow0SDnMV1X2TgyHML3SZBxXvds
	1cTDP8D/XlZHwwE6MhRg+7vHTtAR2G6AyA1FZu+leT0b2pR/2suyGgFDAi6aSWLdcXhUsXFxXXzAZ
	ibUT8y5oWnrLmx2cvNKohPuKdV4rIwwQFIJl0KdcoiZdoP++OHeKjQcyYH8mb9lKt1WBrCp9GihYw
	TTvxOGds8eMpTGHf19ISvzbBO1svbUREhns5WhBur2+Yzs9MzXdDTUDSJYOtVPasvqR1yak+F23cy
	CWsoPQCfFtLS7Cgjc8smts5qzA4EV+1mXvJmhyg9C/thccuEFdM4F3X+9dDCcIIAoLye2/30aU2SE
	e4tUt2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqoJ-000000007l2-3BSp;
	Sat, 21 Nov 2026 19:31:43 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqoA-000000007hN-0U99
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 19:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795289495; x=1826825495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9zj66kMuwbMu44FH/2iMUwR4Us5WeWzErC6aqT+gjgA=;
  b=R/hbl7I8HZeAnbl0xV/RnX7l+2OE4xGq47m4+NVdaMfETV14lSUwVsqW
   tMV+JW1EvDOaH9ILlMqH20cEW9L8NLh8xCj4/Vv/Kpr8Z6lFWPgOt5Thm
   mDyvQnVwr+iFppcylNQjplUs7+ltGz1hJnvjHlVX94FhsogB1Oemx85g3
   YKvPdfVh+bftZwiXnoEgYNgg9f9b13bio+QvX/y68mzjecmQkIqQ23Qq6
   SG9Xf21VuNDg/+9n569ohG9oCCR2z79BT6D+DnGDJW/HeKh/HPKyJSJ9t
   0SJhSc/JpNATuTFtXIiDY2ALlEmlRypPRGJlnOSrG5hS+/bBduxQyegu6
   w==;
X-CSE-ConnectionGUID: r3dSpE50Rj+w85R1utteoQ==
X-CSE-MsgGUID: J5ludYa2Q5SJ8xeDvpyiuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4035639"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4035639"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 11:31:34 -0800
X-CSE-ConnectionGUID: 0ayvV+adR7qaALPVu/CEdg==
X-CSE-MsgGUID: KtrBk2viQS+k/l115C11bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10859667"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2026 11:31:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUqo3-00000001KV9-1kKB;
	Sat, 21 Nov 2026 19:31:27 +0000
Date: Sun, 22 Nov 2026 03:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <202611220344.CTLohdLM-lkp@intel.com>
References: <20261120113952.168265-3-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120113952.168265-3-paul.cercueil@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_113134_196469_44F7E2C9 
X-CRM114-Status: GOOD (  13.41  )
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
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261122/202611220344.CTLohdLM-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611220344.CTLohdLM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611220344.CTLohdLM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/marvell_mhu.c:96:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      96 |         iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
         |         ^
>> drivers/mailbox/marvell_mhu.c:106:11: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     106 |         status = ioread64(mhu->base + AP0_TO_SCP_MBOX_LINT);
         |                  ^
   2 errors generated.


vim +/iowrite64 +96 drivers/mailbox/marvell_mhu.c

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

