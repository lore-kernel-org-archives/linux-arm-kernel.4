Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE11606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lf1h4a+K;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L1rDyxgi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D4lWNtZpY5yf+w+jF193Q7eCu5UhHFdmIhkqgVri7l8=; b=Lf1h4a+K5oQIsKACRbf7PRHeFt
	Ukup5GCn5obv+IFPOQx9lrKjbWCYPTv9feIngPXS14DAuX+KG623vZ62lC+9IuYRPsvxI533hVSGa
	YRAoAxhdxaDHp2MI8Rovuu8RQgQ8G9tOn/HCD2HfFxAeQ48dAf2xule+FdoD3z+BmCo+WB6Vv6Egb
	Vh4QsbIsSJ7JmTzUoVAWsdVex4TBZU0xSAjSN/0inDFdDlqxPeQ4fk9M5AgYfzIJEgysyDGSTBjSe
	zmIcyyS1abuXhQ69ddqGNiajTiCNJs11WzsYAxm/t7t1CVY3/6a0X0R3MyJ4R6QAjbVLSwnI1YOrt
	RG4ra3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMIT-00000006SlA-0UcK;
	Tue, 17 Nov 2026 16:44:41 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMIR-00000006SkN-2iKs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794933880; x=1826469880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QOxWIIE+hizNvCqiDlwiHj72tnFkpkIA/gz3CsEwsNs=;
  b=L1rDyxgibPQBn57FhxWslmtmr0Ns4Qfa23BvLfgaqV4hzhgZZsOEPpFh
   prmfhB3EJPyiVALm5RgEJbdruN1RJMF2kmQeoxRrSUpM1uhIY5pdy1PUe
   v3xalNVpBbTSZajGWAhb6y5lU5VAPI0U5aI5S5SjQAV85d4oisBU4cE2s
   980/CpXSmvWippeH5I4EkTVwRBjRS9ohpzIcbHZ5ji2zotb0OefuZv/Yl
   CXvnIxaRYyDZ2XQkzVv6z4lDZyTWTx2V2Zjl4vnwCKaMaXnhzgPPLuF6y
   ytnCctm4/O1o1EbiZazbOeK59G/moDiX4gg6iCDbZWWHu0MgfMoe9XO8A
   w==;
X-CSE-ConnectionGUID: Swf5toGmQkeJa2eeRycGvQ==
X-CSE-MsgGUID: AfKt0HbeTfqZe9kCg6JgfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3755160"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3755160"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:44:38 -0800
X-CSE-ConnectionGUID: cIHBCJjZTHqSCHUntJ9yLA==
X-CSE-MsgGUID: KPEa74UsTrWq5ls7tngLFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10200067"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:44:34 -0800
Date: Tue, 17 Nov 2026 18:44:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com, amin.gattout@gmail.com,
	antoniu.miclaus@analog.com, gregkh@linuxfoundation.org,
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] iio: adc: at91_adc: fix NULL pointer dereference
 on trigger remove
Message-ID: <avyEb9La1tqS90Cp@ashevche-desk.local>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
 <20261117140510.391907-2-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117140510.391907-2-abdelnasserhussein11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_084439_736275_2D26557A 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue, Nov 17, 2026 at 04:05:08PM +0200, Abdelnasser Hussein wrote:
> When the "atmel,adc-use-external-triggers" property is not set in the
> Device Tree, at91_adc_trigger_init() skips the external trigger slots
> and leaves the corresponding entries in st->trig as NULL.
> 
> In the error rollback path of at91_adc_trigger_init() and in
> at91_adc_trigger_remove(), iio_trigger_unregister() and
> iio_trigger_free() are called on every slot without checking for NULL,
> causing a NULL pointer dereference whenever an external trigger slot
> was skipped, either because of a partial allocation failure or because
> the external triggers are simply not used.
> 
> Skip NULL trigger slots in both teardown loops so that only triggers
> that were actually allocated are unregistered and freed.

...

>  	for (i = 0; i < st->caps->trigger_number; i++) {
> +		if (!st->trig[i])
> +			continue;
>  		iio_trigger_unregister(st->trig[i]);
>  		iio_trigger_free(st->trig[i]);
>  	}

Yes, but no. Please, rather fix the above mentioned IIO trigger APIs to be
NULL-aware.

-- 
With Best Regards,
Andy Shevchenko



