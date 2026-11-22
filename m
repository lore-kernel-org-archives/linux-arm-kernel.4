Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB428606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OT4DnL8C;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BAC/XVF+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TlzTHi+0VW6cnxsXzK9vRsLG/RZrcMxe7NzlbmPXEJ8=; b=OT4DnL8Ca4OfMHtVcu8B17xlUY
	fDtRabUhj38L+JxBanr/8q+7mxkaq9Oys4w1fY5v+NybQIt3ZsmIVyYcCkhRd39KLkYkHT83fK4t7
	h1r06MaxfiGjS8cU1PcQCrxeYnduHvY4Pjb3bgaqtpz3ceNe8EbBKcY0Iz9Gj8S0MTCtR8vx3SwnS
	H7GH9+9e8cQ7uOamI5OQQiMUoQAmtwGMUg50fVsO5rdoRjKe/B0GSydD8+eARK976oDXkmcOuBlS3
	unwcDWnFmahznWaTsSJ0En3ii8dNpowh+rREDzRyZ0RAE1L3IOEl/pUaU+uLAqRQKTfVXawCFppft
	MHwKxElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUzKZ-00000000jcb-1Ziy;
	Sun, 22 Nov 2026 04:37:35 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUzKW-00000000jcE-04UH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 04:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795322252; x=1826858252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i/xRwtOnx0DXbMOqe/jKs//Rhfd679HI7L90EJzaxac=;
  b=BAC/XVF+LrMRGrAMhiyzPoGcPLPobSETmigG7p44Ver4w8IWTakaifZ4
   BkFdWXic80ATZa+E5oJPcwEJcl3i2E+knvLGSK2idnmPSRP0YW6Gbyub0
   NmoyN5Vfq7cIfJvLGY+Z0uKE+0BHOsDQO0MGkCjQ76D+9OT3WvqtbS805
   iqMYQeZv6ghZpA44JzNjK8fH8sJFRWd3WFdEpSCj31tJptOlACEW0AK6p
   dnJvvPRpzyByizel/Rwaq7BHMld2xF/R7z9paqCYzBXm0Y69EQifKyA6H
   bW7oXGW4G1F3F3rPiIsFWGJaPJ88bxXDDdWzhCyRcCA29fVbaWdYR4ZK7
   Q==;
X-CSE-ConnectionGUID: 9AiOwPu/RoasOli8eF0ffg==
X-CSE-MsgGUID: BMSZE6HTS7y8dvGvuiWYuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4154135"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4154135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 20:37:29 -0800
X-CSE-ConnectionGUID: gJT9oT1vTu6oBOV4lefT4g==
X-CSE-MsgGUID: 86FdmE9XSYeQpVd3VxZ3Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11342485"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2026 20:37:27 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUzKO-00000001L1b-1IfX;
	Sun, 22 Nov 2026 04:37:24 +0000
Date: Sun, 22 Nov 2026 12:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bramuel Barack <bramwelbarack89@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Alim Akhtar <alim.akhtar@samsung.com>,
	linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bramuel Barack <bramwelbarack89@gmail.com>
Subject: Re: [PATCH] tty: serial: samsung_tty: fix -Wformat-overflow warnings
 for clk_name
Message-ID: <202611221200.BFeU1ULS-lkp@intel.com>
References: <20261121192158.44872-1-bramwelbarack89@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121192158.44872-1-bramwelbarack89@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_203732_127719_2FD234E8 
X-CRM114-Status: GOOD (  14.94  )
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

Hi Bramuel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on tty/tty-testing tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v7.4-rc3 next-20261120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bramuel-Barack/tty-serial-samsung_tty-fix-Wformat-overflow-warnings-for-clk_name/20261121-222158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20261121192158.44872-1-bramwelbarack89%40gmail.com
patch subject: [PATCH] tty: serial: samsung_tty: fix -Wformat-overflow warnings for clk_name
config: parisc-randconfig-1000-20261122 (https://download.01.org/0day-ci/archive/20261122/202611221200.BFeU1ULS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611221200.BFeU1ULS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611221200.BFeU1ULS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_set_termios':
>> drivers/tty/serial/samsung_tty.c:1389:52: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
      snprintf(clkname, sizeof(clkname), "clk_uart_baud%u", cnt);
                                                       ^~
   drivers/tty/serial/samsung_tty.c:1389:38: note: directive argument in the range [0, 2147483647]
      snprintf(clkname, sizeof(clkname), "clk_uart_baud%u", cnt);
                                         ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c:1389:3: note: 'snprintf' output between 15 and 24 bytes into a destination of size 17
      snprintf(clkname, sizeof(clkname), "clk_uart_baud%u", cnt);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_probe':
   drivers/tty/serial/samsung_tty.c:1781:54: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
      snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%u", clk_num);
                                                         ^~
   drivers/tty/serial/samsung_tty.c:1781:40: note: directive argument in the range [0, 2147483647]
      snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%u", clk_num);
                                           ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c:1781:3: note: 'snprintf' output between 15 and 24 bytes into a destination of size 17
      snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%u", clk_num);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1389 drivers/tty/serial/samsung_tty.c

  1370	
  1371	static unsigned int s3c24xx_serial_getclk(struct s3c24xx_uart_port *ourport,
  1372				unsigned int req_baud, struct clk **best_clk,
  1373				u8 *clk_num)
  1374	{
  1375		const struct s3c24xx_uart_info *info = ourport->info;
  1376		struct clk *clk;
  1377		unsigned long rate;
  1378		unsigned int baud, quot, best_quot = 0;
  1379		char clkname[MAX_CLK_NAME_LENGTH];
  1380		int calc_deviation, deviation = (1 << 30) - 1;
  1381		u8 cnt;
  1382	
  1383		for (cnt = 0; cnt < info->num_clks; cnt++) {
  1384			/* Keep selected clock if provided */
  1385			if (ourport->cfg->clk_sel &&
  1386				!(ourport->cfg->clk_sel & (1 << cnt)))
  1387				continue;
  1388	
> 1389			snprintf(clkname, sizeof(clkname), "clk_uart_baud%u", cnt);
  1390			clk = clk_get(ourport->port.dev, clkname);
  1391			if (IS_ERR(clk))
  1392				continue;
  1393	
  1394			rate = clk_get_rate(clk);
  1395			if (!rate) {
  1396				dev_err(ourport->port.dev,
  1397					"Failed to get clock rate for %s.\n", clkname);
  1398				clk_put(clk);
  1399				continue;
  1400			}
  1401	
  1402			if (ourport->info->has_divslot) {
  1403				unsigned long div = rate / req_baud;
  1404	
  1405				/* The UDIVSLOT register on the newer UARTs allows us to
  1406				 * get a divisor adjustment of 1/16th on the baud clock.
  1407				 *
  1408				 * We don't keep the UDIVSLOT value (the 16ths we
  1409				 * calculated by not multiplying the baud by 16) as it
  1410				 * is easy enough to recalculate.
  1411				 */
  1412	
  1413				quot = div / 16;
  1414				baud = rate / div;
  1415			} else {
  1416				quot = (rate + (8 * req_baud)) / (16 * req_baud);
  1417				baud = rate / (quot * 16);
  1418			}
  1419			quot--;
  1420	
  1421			calc_deviation = abs(req_baud - baud);
  1422	
  1423			if (calc_deviation < deviation) {
  1424				/*
  1425				 * If we find a better clk, release the previous one, if
  1426				 * any.
  1427				 */
  1428				if (!IS_ERR(*best_clk))
  1429					clk_put(*best_clk);
  1430				*best_clk = clk;
  1431				best_quot = quot;
  1432				*clk_num = cnt;
  1433				deviation = calc_deviation;
  1434			} else {
  1435				clk_put(clk);
  1436			}
  1437		}
  1438	
  1439		return best_quot;
  1440	}
  1441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

