Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD447606A336
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=liBsBM6d;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQf0Qkxd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h2Eny9FxiErINLKHHB+LsOS3lNpf4KzhrBwDKF7vmi0=; b=liBsBM6dJ8vKF6zYLzox9RthWf
	CRKF4d/yZdKETE+oIgZ2RCubYWeleNtmz1rhtZfgSTfTJaoB/oB8Dv0O3o82pGrR+BJRRqC5pG4BU
	7uBm5fiKxANdugbbRvB7tYPomRl5rtnLgB2VHWkV/94M2NOpQvxgxhTvre/TOzUQnt0wetuYnyswB
	jkoyB7puDE4VDIKnttnxL+b6CMFl+TmQtC95A3iSxKWxKrhkL6wBhXW7cMbRVJ+OrPW762BaCxvb5
	tOfqSvBtX1ImcvYPkXF5HCmuIfEvYRHMBSYoggvtRGufu06/JHUEXXDfWhBNZ3dBMFpqzVtlwYt8E
	Me/hs/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgDs-0000000Ei2P-0xDH;
	Sat, 07 Nov 2026 13:12:44 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgDp-0000000Ei22-0WW0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794057161; x=1825593161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vu7IQNdMRbB0dIkqRFXuGnUsBbyW4fu+qslSq5Yf8QY=;
  b=MQf0QkxdW+ABXm1z2K0WtwC9i00QODqxQ4VjZNfVjrZ+XmeWUkqEkj5v
   3Is726UbRSTbR/y1g2HAL2NIdxAqMTe6v4lr/RHS+9x3+ASEnW7hpUuFf
   7bOaZzxeheYtbZ4JtkKdEAe6EkNPVplg47y5Jm5k1lTUh6sNspNBGO/u8
   IN+Fp/uk+PkXB3yEl4N2VBYw62pdDp8pcotX/KZDrC8TPvzwtsjkVmMnA
   rjuxYr0gkRKUUyiYbhjU9XjWzEoOFpys2m9/lJVJP+w7hpJ+3hRt6OVkj
   iJ8yIx9F/uVcUlpNqQWJkG4zDzSBp/n4KMhQ9pubib1yFBxg294oCWdM3
   g==;
X-CSE-ConnectionGUID: DumwnZDgSByFXIkTY32ywQ==
X-CSE-MsgGUID: YOgu+P9JROObrtpTBxHjag==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2878068"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2878068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 05:12:40 -0800
X-CSE-ConnectionGUID: 9HcWSSIqScq7cK/DZEKUIw==
X-CSE-MsgGUID: gMLGUiA3T3KMQeZSdW6Kdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7382053"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Nov 2026 05:12:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPgDi-00000000qrv-2xXd;
	Sat, 07 Nov 2026 13:12:34 +0000
Date: Sat, 7 Nov 2026 21:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, gary.yang@cixtech.com
Subject: Re: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
Message-ID: <202611072135.EulyUBtA-lkp@intel.com>
References: <20261107011012.3655873-3-gary.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107011012.3655873-3-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_051241_187795_D8D5D4A0 
X-CRM114-Status: GOOD (  12.12  )
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
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261107/202611072135.EulyUBtA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072135.EulyUBtA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611072135.EulyUBtA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/typec/cix_pd.c:628:3: error: call to undeclared function 'irq_set_status_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     628 |                 irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
         |                 ^
>> drivers/usb/typec/cix_pd.c:628:37: error: use of undeclared identifier 'IRQ_DISABLE_UNLAZY'
     628 |                 irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
         |                                                   ^
   2 errors generated.


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

