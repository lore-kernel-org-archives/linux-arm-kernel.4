Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F7606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mJSCPHQN;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZHsiN0wz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pqjxgeb2LvNzA5lyIDyXZ22UP4O9SLF5sZs86JhTX4g=; b=mJSCPHQNbHZb8Hpl3kvs1DPlOy
	fRvMPxSlN4Tquhtks+YpkMyLKI8cZWD/3pQmvnU1EXlLZUhgt3S/eJI8jiWtbWwMm3NrP5s2QCfRJ
	lsFX0Rp+6pwI1XMNWKpmC0qfLIQ3Uh4R1D4jsjaSIv5ZUI1mD8sEK2t8uPw2HRgnwMD1iI04CjsYd
	vIw663QnucSoOQrqC8lqQe46tohYXG2HQKMdQorCn/gRzwpl5kPaVhod11/hkIjNl6tzrP5k8SqMc
	xvIfgUE+5u9lf+LBNbXEEW3rNzMQ+3f5sQWYVcX50MovM4sv2BG/15mqFMPee9e7Y5QkTSAQwYXW8
	OAcMi8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPknr-0000000F9An-3VhA;
	Sat, 07 Nov 2026 18:06:11 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPknn-0000000F9AJ-34ml
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 18:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794074767; x=1825610767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QUH3kL1d5cW8qdNODM5EpH+O8pqgfABidKcSlg6biNw=;
  b=ZHsiN0wzkGI0Q5h811ckNneB49tkXxR7hCJZu4Pm8IbH5dtqudXZ+WKI
   GlBESLmrrwmlXkP8rtHMkfmbhtnAHFgnZXvM1hJMyyyzPlvpb0ojt6iKj
   DZg0p6VtUdhXoOPKZ8mPnD+rfAsImKaT+j6UI/aKP3IYSClhyFQFHZcqb
   W9SSAGfL4EUUSxkIGyc74yzvJCkpRrtEPt9kxsjQa9opetT2+I55QSFkC
   SJb+DzfcmTLlZLFcCe3XMrrCLneIgvRkAmyFw17JQAsmb4Ehb9K5KSUTy
   dkModbb2PZY/8ZUc+wNhXaPJVI5XVu1TkTlueXYFMZLeOiG4Ou8QcCx0/
   Q==;
X-CSE-ConnectionGUID: lf/8O12MSy2PYbmVPtkhRA==
X-CSE-MsgGUID: 1Zu0ra7zRaqJKmRRkHl5Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2906326"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2906326"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 10:06:06 -0800
X-CSE-ConnectionGUID: VJXgjaVGS1mBFaTiUWSFdQ==
X-CSE-MsgGUID: G87rpHNQTDSdSsZyvVi+qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7421238"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Nov 2026 10:06:04 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPknh-00000000rM3-1fFq;
	Sat, 07 Nov 2026 18:06:01 +0000
Date: Sun, 8 Nov 2026 02:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com
Subject: Re: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
Message-ID: <202611080223.qvA6HnF0-lkp@intel.com>
References: <20261107011012.3655873-3-gary.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107011012.3655873-3-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_100608_681175_98D2DC81 
X-CRM114-Status: GOOD (  15.87  )
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

Hi Gary,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-usb-add-Realtek-RTS5453H-Type-C-port-controller/20261107-091009
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261107011012.3655873-3-gary.yang%40cixtech.com
patch subject: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20261108/202611080223.qvA6HnF0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080223.qvA6HnF0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080223.qvA6HnF0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/cix_pd.c: In function 'cix_pd_probe':
>> drivers/usb/typec/cix_pd.c:628:17: error: implicit declaration of function 'irq_set_status_flags' [-Wimplicit-function-declaration]
     628 |                 irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
         |                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/usb/typec/cix_pd.c:628:51: error: 'IRQ_DISABLE_UNLAZY' undeclared (first use in this function)
     628 |                 irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
         |                                                   ^~~~~~~~~~~~~~~~~~
   drivers/usb/typec/cix_pd.c:628:51: note: each undeclared identifier is reported only once for each function it appears in


vim +/irq_set_status_flags +628 drivers/usb/typec/cix_pd.c

   587	
   588	static int cix_pd_probe(struct i2c_client *client)
   589	{
   590		struct cix_pd *rts;
   591		int ret;
   592	
   593		dev_dbg(&client->dev, "IRQ %d supplied\n", client->irq);
   594		rts = devm_kzalloc(&client->dev, sizeof(*rts), GFP_KERNEL);
   595		if (!rts)
   596			return -ENOMEM;
   597	
   598		rts->dev = &client->dev;
   599		rts->irq = client->irq;
   600		mutex_init(&rts->lock);
   601		mutex_init(&rts->irq_lock);
   602		cix_pd_typec_init_state(rts);
   603	
   604		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
   605			return dev_err_probe(&client->dev, -ENODEV,
   606					     "i2c check functionality failed\n");
   607	
   608		rts->regmap = devm_regmap_init_i2c(client, &cix_pd_regmap_config);
   609		if (IS_ERR(rts->regmap))
   610			return dev_err_probe(&client->dev, PTR_ERR(rts->regmap),
   611					     "failed to init regmap\n");
   612	
   613		i2c_set_clientdata(client, rts);
   614	
   615		ret = cix_pd_init_ports(rts);
   616		if (ret)
   617			return ret;
   618	
   619		ret = cix_pd_event_handler(rts, 0);
   620		if (ret) {
   621			dev_err(&client->dev, "failed to read initial status: %d\n", ret);
   622			if (ret == -ESHUTDOWN)
   623				ret = -EIO;
   624			goto err_unregister_ports;
   625		}
   626	
   627		if (client->irq > 0) {
 > 628			irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
   629			ret = request_threaded_irq(client->irq, NULL, cix_pd_irq_handle,
   630						   IRQF_SHARED | IRQF_ONESHOT,
   631						   dev_name(&client->dev), rts);
   632			if (ret) {
   633				dev_err(&client->dev, "failed to request irq: %d\n", ret);
   634				goto err_unregister_ports;
   635			}
   636			rts->irq_requested = true;
   637		}
   638	
   639		ret = device_create_file(&client->dev, &dev_attr_disable_pd_interrupt);
   640		if (ret)
   641			dev_warn(&client->dev,
   642				 "Failed to create sysfs attribute, ret = %d\n", ret);
   643	
   644		device_set_wakeup_capable(&client->dev, true);
   645	
   646		return 0;
   647	
   648	err_unregister_ports:
   649		cix_pd_unregister_ports(rts);
   650		return ret;
   651	}
   652	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

