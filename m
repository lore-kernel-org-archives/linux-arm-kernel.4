Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52200606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oInhvjMp;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lu7J3CbV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FAusodFBrbI8G7AAMkwV4nh7h71Xni9RUPUyfFZl+Wk=; b=oInhvjMpvQqfhaLL8JU+c4w7MJ
	13YPfzeJd9Fpq5rtvKtHhEdpCgHqGXxC9kCd2enM1Uzw2SQuX2Ks0GISTGPWCcJihHjXB6XmARE/s
	fflUFxDJmkZbRrnanTDnwsOG0gLj1l+vRAXxAvtccgnCZzR9oX9W3krpxqeDuph3Lou5B6q/WyZTN
	td9GxQwSKUuCH/5Egk7A4BTAKnvlfPt7kOi9tvbINbHEgZpcmH8f1tW4DbU43P78wQRV9Qg8lGlrP
	hzhlslY3EZ3SC8rpSdFJt04+KsA1FIxBIuS1WcByvQ1WLIrCKiIIIsw9TomQPgrVAcCA4xrZ/rRI3
	BWeJet5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyMt-00000007ug4-35wj;
	Tue, 24 Nov 2026 21:48:03 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyMi-00000007uct-39NR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795556872; x=1827092872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gQ5DGumkXVY5xtwGUpFVEiU5TLfOLBabHwPqzekY9qk=;
  b=Lu7J3CbVHK1ysxfj3w3iBsN/c8OGr/d1H6/cAWp6tAiIzQVl5pzd6NPg
   FhjD4jgs+WsN9cP1Ak5CtA18BKeX4rHMwmn4kil3cSi8TBbE+KKdmwcIx
   P7+cCcsgcCbS8KiCfcNUkF0K5PaB3tZHvdsVRuApoF+pqBtOG+GSHRVsy
   YLJLkO475KtmazAAL2qfkhILKSrtAHa50FQhNmX3d09/YPYp1TA8IfXQU
   /vKk94Fd6WhygXuJnqrv/wdCQScHTX+j7uEpaZTuM3yAydpH1V3z6qwI3
   ZTB+RBW+6dEXkT0Zodaa1EpbI10UvX7ayhV245uJlnWoXOxak5WsRm1bi
   A==;
X-CSE-ConnectionGUID: ZldiUCVSTtuuGz13R4yLlA==
X-CSE-MsgGUID: bN3XBGqlRKGRDSq58HKmWg==
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4355222"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 06:35:49 -0800
X-CSE-ConnectionGUID: DBADT9mOR3GP8LyuPqes7g==
X-CSE-MsgGUID: kCiXYfZ5SRyT++JDoxRa5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11471491"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Nov 2026 06:35:46 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVrcU-00000001PTi-3CLa;
	Tue, 24 Nov 2026 14:35:42 +0000
Date: Tue, 24 Nov 2026 22:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] power: reset: at91: Use devm_clk_get_enabled() in three
 probe functions
Message-ID: <20261124222203.k0pVspdI-lkp@intel.com>
References: <de6c1040-c4d1-4703-9932-b3b668801c72@web.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de6c1040-c4d1-4703-9932-b3b668801c72@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_134752_850772_022CB9DC 
X-CRM114-Status: GOOD (  13.11  )
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

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on amd-pstate/linux-next amd-pstate/bleeding-edge clk/clk-next soc/for-next nferre-at91/at91-next linus/master v7.4-rc4 next-20261123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Elfring/power-reset-at91-Use-devm_clk_get_enabled-in-three-probe-functions/20261124-095011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/de6c1040-c4d1-4703-9932-b3b668801c72%40web.de
patch subject: [PATCH] power: reset: at91: Use devm_clk_get_enabled() in three probe functions
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261124/20261124222203.k0pVspdI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124222203.k0pVspdI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124222203.k0pVspdI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/reset/at91-poweroff.c:156:6: warning: unused variable 'ret' [-Wunused-variable]
     156 |         int ret;
         |             ^~~
   1 warning generated.


vim +/ret +156 drivers/power/reset/at91-poweroff.c

ae499f0fadaf28b Maxime Ripard     2014-07-03  151  
099806de68b75a0 Uwe Kleine-König  2023-11-04  152  static int at91_poweroff_probe(struct platform_device *pdev)
ae499f0fadaf28b Maxime Ripard     2014-07-03  153  {
0b0408745e7ff24 Alexandre Belloni 2016-10-25  154  	struct device_node *np;
0b0408745e7ff24 Alexandre Belloni 2016-10-25  155  	u32 ddr_type;
064380a12e12412 Alexandre Belloni 2015-08-11 @156  	int ret;
ae499f0fadaf28b Maxime Ripard     2014-07-03  157  
0b64a0e53cc7875 Yangtao Li        2023-07-04  158  	at91_shdwc.shdwc_base = devm_platform_ioremap_resource(pdev, 0);
caa6e150f8fbcf4 Claudiu Beznea    2018-12-06  159  	if (IS_ERR(at91_shdwc.shdwc_base))
caa6e150f8fbcf4 Claudiu Beznea    2018-12-06  160  		return PTR_ERR(at91_shdwc.shdwc_base);
ae499f0fadaf28b Maxime Ripard     2014-07-03  161  
e51202a7ed9dff5 Markus Elfring    2026-11-24  162  	at91_shdwc.sclk = devm_clk_get_enabled(&pdev->dev, NULL);
caa6e150f8fbcf4 Claudiu Beznea    2018-12-06  163  	if (IS_ERR(at91_shdwc.sclk))
caa6e150f8fbcf4 Claudiu Beznea    2018-12-06  164  		return PTR_ERR(at91_shdwc.sclk);
064380a12e12412 Alexandre Belloni 2015-08-11  165  
062836db01f9826 Ladislav Michl    2018-03-16  166  	at91_wakeup_status(pdev);
ae499f0fadaf28b Maxime Ripard     2014-07-03  167  
ae499f0fadaf28b Maxime Ripard     2014-07-03  168  	if (pdev->dev.of_node)
ae499f0fadaf28b Maxime Ripard     2014-07-03  169  		at91_poweroff_dt_set_wakeup_mode(pdev);
ae499f0fadaf28b Maxime Ripard     2014-07-03  170  
0b0408745e7ff24 Alexandre Belloni 2016-10-25  171  	np = of_find_compatible_node(NULL, NULL, "atmel,sama5d3-ddramc");
996463fdb8cdec4 Claudiu Beznea    2018-11-05  172  	if (np) {
caa6e150f8fbcf4 Claudiu Beznea    2018-12-06  173  		at91_shdwc.mpddrc_base = of_iomap(np, 0);
0b0408745e7ff24 Alexandre Belloni 2016-10-25  174  		of_node_put(np);
0b0408745e7ff24 Alexandre Belloni 2016-10-25  175  
e51202a7ed9dff5 Markus Elfring    2026-11-24  176  		if (!at91_shdwc.mpddrc_base)
e51202a7ed9dff5 Markus Elfring    2026-11-24  177  			return -ENOMEM;
0b0408745e7ff24 Alexandre Belloni 2016-10-25  178  
caa6e150f8fbcf4 Claudiu Beznea    2018-12-06  179  		ddr_type = readl(at91_shdwc.mpddrc_base + AT91_DDRSDRC_MDR) &
996463fdb8cdec4 Claudiu Beznea    2018-11-05  180  				 AT91_DDRSDRC_MD;
996463fdb8cdec4 Claudiu Beznea    2018-11-05  181  		if (ddr_type != AT91_DDRSDRC_MD_LPDDR2 &&
996463fdb8cdec4 Claudiu Beznea    2018-11-05  182  		    ddr_type != AT91_DDRSDRC_MD_LPDDR3) {
caa6e150f8fbcf4 Claudiu Beznea    2018-12-06  183  			iounmap(at91_shdwc.mpddrc_base);
caa6e150f8fbcf4 Claudiu Beznea    2018-12-06  184  			at91_shdwc.mpddrc_base = NULL;
996463fdb8cdec4 Claudiu Beznea    2018-11-05  185  		}
996463fdb8cdec4 Claudiu Beznea    2018-11-05  186  	}
996463fdb8cdec4 Claudiu Beznea    2018-11-05  187  
996463fdb8cdec4 Claudiu Beznea    2018-11-05  188  	pm_power_off = at91_poweroff;
0b0408745e7ff24 Alexandre Belloni 2016-10-25  189  
ae499f0fadaf28b Maxime Ripard     2014-07-03  190  	return 0;
ae499f0fadaf28b Maxime Ripard     2014-07-03  191  }
ae499f0fadaf28b Maxime Ripard     2014-07-03  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

