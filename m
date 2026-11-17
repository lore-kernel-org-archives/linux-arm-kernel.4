Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440CC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oC+JiwQp;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nu1WrRWK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ufmv0ihdneYJGz/686P9PM+NVPVoVFx/Yd9ScCj5xII=; b=oC+JiwQpdt9Ye81/4oAtwb8AUN
	RU9v6uFb9RJOIT/MTapqMPgr/HEyxMA0UxO28em6eaS0BD+5YFBOjwix8iBEdjQCgTOhRGlZCBETb
	ZOEzmMm2Xc4A8YA2os2LiygwMAST0MXV/OkTyfg/Cu9cpDynWKiJqsJ7Ld1CMznzTyJBul/WpTQcS
	vgdHpiqzPmeIAe48cO2YJElEYlJvmOKcfpGfpJEiAXFFxOq86kpaIIkaFBrrXc3Qq0txYonmZBNvw
	yPP1ZDxxMoqXgFKaNKkvRcRrjumuTRfCTDpFaJIaY/N5l0nZqc4S+bYgU0YHpJLqhvYmdo7Tp5l5o
	IU/rAWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMUn-00000006U8a-10mR;
	Tue, 17 Nov 2026 16:57:25 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMUk-00000006U8B-3EY8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794934643; x=1826470643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5gWosVAhJAIVh6xRABe7voxpNhWAwmAmt4iDoFdypbg=;
  b=Nu1WrRWKnXEfG/CgFEXD6QEvRMTaOjNHmfuwLBZXESkNHg0qsrA67+TM
   nM5ny7ZIdjlOKgAlHlDasqrCmBbJASAI0F52uniAFV5NpRXNo1Xzj4YPk
   kuqIsQ7H0LrGz2yOCqP+CTosYJF991VGwoHRd9c2i70DVrs4NWndYBkGk
   695u8ZdtmAHsSY5AZbFbKiJVrCKNI/0hwwdd83H+ePGn9kQotZ8LRDcMH
   xBZjY2cE9omeJsGFsbjJ6EECL0JnByHs1xQw7JxhkECmegjMn9qGds3oI
   zKHOfpEw02bTihpSEiu6DalWnkSNxh5qlROIQ5LZYrnoCXdAkGybO5yM4
   Q==;
X-CSE-ConnectionGUID: ZdM/LYC/SeaHeOyYLzcX3w==
X-CSE-MsgGUID: sA1LF8xBRwitDl3Sj8Vi/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3705490"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3705490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:57:22 -0800
X-CSE-ConnectionGUID: Z8GSjn/mTjq6l+kVxzb/IQ==
X-CSE-MsgGUID: YhXGeU4HTA2cQbVsXEWi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9662055"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:57:17 -0800
Date: Tue, 17 Nov 2026 18:57:15 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com, amin.gattout@gmail.com,
	antoniu.miclaus@analog.com, gregkh@linuxfoundation.org,
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] iio: adc: at91_adc: convert to device-managed
 resources
Message-ID: <avyHazy3LJwPSXPB@ashevche-desk.local>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
 <20261117140510.391907-4-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117140510.391907-4-abdelnasserhussein11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_085722_852620_C2BE9367 
X-CRM114-Status: GOOD (  14.96  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 04:05:10PM +0200, Abdelnasser Hussein wrote:
> Convert the driver to device-managed APIs so that all resources are
> freed automatically on probe failure and on driver detach:
> 
>   - allocate and register the IIO triggers directly in at91_adc_probe()
>     with devm_iio_trigger_alloc() and devm_iio_trigger_register(),
>     dropping at91_adc_allocate_trigger(), at91_adc_trigger_init() and
>     at91_adc_trigger_remove() along with their manual rollback paths
>   - set up the triggered buffer with devm_iio_triggered_buffer_setup()
>     directly in at91_adc_probe(), dropping at91_adc_buffer_init() and
>     at91_adc_buffer_remove()
>   - allocate the touchscreen input device with
>     devm_input_allocate_device(), dropping at91_ts_unregister() and the
>     manual input_free_device() error path in at91_ts_register()
>   - register the IIO device with devm_iio_device_register()
> 
> at91_adc_probe() no longer needs any error unwinding labels and
> at91_adc_remove() is removed together with the platform driver's
> .remove callback.

...

> static int at91_ts_register(struct iio_dev *idev,

The pdev is not used in this function, which suggests to use 'struct device
*dev' as a second parameter instead.

Please, make that change before this one in a separate patch.

-- 
With Best Regards,
Andy Shevchenko



