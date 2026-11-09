Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B19D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 23:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wAQ58bUe;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q/llW0h2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cce/9RXAeZ7GCno3/183y+2YRTDy6KkvbogDyDUbNIA=; b=wAQ58bUe7zct81UGUDexdIn9mH
	a9MAfV3IvyvMhtk1cNDIDs4zH/OMrpgkjujeNNlNT4bAlwS/NdRaALptrBvTrbiL4AHrBkRqXVZTe
	l+pr5zUhv0aT/sbgMKk/lAN2NaIHMPN/DPLUAzVQBXDF3l3KwAJHVdzcfp0CJtH2r6X5EGF4ydIrB
	Po7ufPtAa6Ju+bsRkToAaN8fV+NaBkFWI5YbPJC1szJ4S0oxA5ldCZ4rvn4yIPofrrLSSeB7ldkPN
	IFXbhSoWbfTBVilYsEoNoz9yGe+CZdPrjIrn3ctn8sU0nR4LvUpFCg1kKiHkcX1ygmj/8mmZOdQFo
	32AMEGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYS9-00000001veS-39Et;
	Mon, 09 Nov 2026 23:07:05 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYS7-00000001vdt-12AI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 23:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794265623; x=1825801623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7pmup5JwHroklabp2D5twn2dbPMnGh/ztW33CBS2YQw=;
  b=Q/llW0h2hdc+2u+rt77U2KyqPtvEz9EX9nmwtMthTtQUBQTBVZmaTElU
   hECzRTHKHKOkgAEOwfMPQ41TIQ96wjJGrfzeTrq1rCMYQaJHTS299hqPS
   KH+/u2BfIKYD51IsMhZ7bq5ydDWAPQXJnYQcW/hpmbAULm4cxXUsdHc9V
   odPZSdvefu6bvenoIruqkslKqMSdTOhicSgArk3TouDAXRpLAWvSNlH5a
   am6o/yJ3dopaVexuobtX+eYVZ5KVXXQP2jBPscPa3OF6BRT7CpRvhlPxy
   YWvkh2weX1eAX/6UqkPIYByoqIhrf7JXqMyIaZ1wA0lR0slcaOwQEknWP
   A==;
X-CSE-ConnectionGUID: ZEmnFBCYRa+jBzQ/Qp4Pzg==
X-CSE-MsgGUID: oAXnJA+HTUyVGm4p03Q6Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2998124"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2998124"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:07:02 -0800
X-CSE-ConnectionGUID: YE0vm8kqRGqbaS24Yp0OKw==
X-CSE-MsgGUID: +wxkWmm0Q3CUyhw4YfOevQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8424973"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:06:59 -0800
Date: Tue, 10 Nov 2026 01:06:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v8 01/11] serial: 8250_dw: allow port setup to report
 errors
Message-ID: <avJSEbiZx7cU3ONt@ashevche-desk.local>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
 <20261105-submit-h616-uart-fifo-v1-v8-1-14024d2b184b@gmail.com>
 <avJRsij5P7Ch3tqE@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avJRsij5P7Ch3tqE@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_150703_296317_F89BE8C4 
X-CRM114-Status: GOOD (  19.46  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 01:05:28AM +0200, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 01:52:02PM -0700, James Hilliard wrote:
> > Return a status from dw8250_setup_port() and propagate failures through
> > the DW and LPSS probe paths before registering the UART. Use the existing
> > LPSS cleanup path to release board resources and IRQ vectors on failure.
> > 
> > Keep the current setup behavior by returning zero on both successful
> > paths. This separates error propagation from the configuration validation
> > that will use it.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> after addressing below piece.

...

> > -	if (!data->skip_autocfg)
> > -		dw8250_setup_port(p);
> > +	if (!data->skip_autocfg) {
> > +		err = dw8250_setup_port(p);
> > +		if (err)
> > +			return err;
> > +	}
> 
> No, don't change it here, the return value will be simply ignored until the
> change that will make use of it.

Alternatively to minimize the churn do it like

	if (!data->skip_autocfg)
		err = dw8250_setup_port(p);
	if (err)
		return err;

-- 
With Best Regards,
Andy Shevchenko



