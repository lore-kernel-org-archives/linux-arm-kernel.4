Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A85606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QMRhinzd;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PwLiZqlJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tY2SpyuPdssWSThVnpPJYj27PoJlqJ6g+T13oSL+a+4=; b=QMRhinzdb5gqEsoRCjptzx0KJB
	WmkEFq2oobFj026RYwT1GIPWt/Wc6KFgFpzx6kjGHU1sXVHpHHJ3GcdWzeLKspFj4B4n85t9dWPYh
	SojD0NzwrDcgXWIQCIWc4g3KcIxEBiPkihu89DRqZwok7fVb1XJv9Tnm38sjTcgDif8FA081kIzJm
	j0GwABQ+8X5GNYn08Hz4lbRktTiaAimf+ajTWBw+Zwp48okdx7f9UsJU+NaUnAa58hEZ9jhKqlphC
	o5YzCzGSu588ZjdTXq9EqJwNBGssEbLsrYG+aOvkvZrza6M5/83IRx5LaIzrCR01UbTa8gwEfThAX
	C35P4+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQuD-00000002sxR-1Qxv;
	Mon, 23 Nov 2026 10:04:13 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQtx-00000002sn9-2aHB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795428238; x=1826964238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=neK3HTToqVnQ1UB3GnpwKbB37DgyPWqMw7JZiDGo6R0=;
  b=PwLiZqlJ7w7t1Kiu+lO2hTHANcgKQK7tOJZeaNtJeZaY11uVpvgSJktk
   kXxGOlYqdw1J18QJsUQfO5nnj3zasAFs6cXbGuN+gPdKRepK7x/plpDoz
   kdAX9YCiz55G2MjHe5E+0ucezkvVljx1AA730GW/SZEOCsRae/vNiOzyo
   RXpBs64335BcQDyA+erZx9renCuUFSP1Llp+id8getbZ6f0XJh2r9xTp0
   wkTOSdBznjVyyP3bNVRYfLKjihD9aZXvmnkyCyoPyk2SoeCh0Xr6DKD8t
   o3iLu729Fu+dQ44LE0GIZJNnFVWk+s71v8wfdaHFAa9Xol1flq8GVpGig
   g==;
X-CSE-ConnectionGUID: 96aZFWNNQU2Fnuxe0eIl3A==
X-CSE-MsgGUID: QKd6j+8TS1CZyh1zbC5/GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4317855"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4317855"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:03:57 -0800
X-CSE-ConnectionGUID: lN386rJOS6WEacrgahraBw==
X-CSE-MsgGUID: 8ZkK7dl8Qoe4qq9WEu4MbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11565818"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:03:54 -0800
Date: Mon, 23 Nov 2026 12:03:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com, amin.gattout@gmail.com,
	antoniu.miclaus@analog.com, gregkh@linuxfoundation.org,
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] iio: adc: at91_adc: use local struct device
 pointer in probe
Message-ID: <awQPh4P9u1Dtuh0_@ashevche-desk.local>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-6-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123070101.53868-6-abdelnasserhussein11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_020357_689995_E5E6B34F 
X-CRM114-Status: GOOD (  12.95  )
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

On Mon, Nov 23, 2026 at 09:00:58AM +0200, Abdelnasser Hussein wrote:
> Introduce a local struct device pointer in at91_adc_probe() and use it
> in place of &pdev->dev and &idev->dev throughout the function.
> 
> Also switch devm_iio_device_alloc() to use sizeof(*st) instead of
> spelling out the full private structure type.
> 
> This is a preparatory cleanup to reduce the diff noise of the upcoming
> conversion to device-managed resources.
> 
> As a result, messages previously logged against the IIO device are now
> printed using the platform device being probed.

Yes, but part of that may be already done in the previous patch as you touched
the very same lines. Here should be just a residue (of what has not been touched
by previous changes).

-- 
With Best Regards,
Andy Shevchenko



