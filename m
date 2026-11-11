Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB5606A881
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qZRyAGV0;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lGUb2FYK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dMVjouUzlrMgpNrx39+0TONjSPVxOpIOUimAbYCMEv8=; b=qZRyAGV0ZVQ/U6VTfiQ6Fbqi9F
	1XZEHj/ySMJUh0B47eAh6wXkmcVUyD4YVBlUfVpAnq8BmPI8BbYPWxppMer059/2uGMjlYRdhdi0A
	5nJp/Lis8cLD/WIAaUpJ/Vo+A0VNuh75PViwMkFMBU4RsT616oy8bj1pKyyDMYkLt0g78trQqJKAV
	iGYMK/w1vp6UkBZ03WLt7hzXll7w4nZK5EVk2lRl+IrSU6HITQeARfFuUefJTJ9Oi5Y9sJIs3nHsQ
	RlolqlENFLvQsBy3UEzCTBRj4njRlNviP2cWKURVJWf5bEoXM4Es7lzmdKEGQ9sHHyVhobEpv+1te
	q0Ndnskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8wn-00000006uVz-3awG;
	Wed, 11 Nov 2026 14:05:09 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8wm-00000006uVQ-0LWv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794405908; x=1825941908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RjhR0GWgOac4DoIlu+EJPS0Wj64t3lFbbPAIZhDjKtU=;
  b=lGUb2FYKvqsGVpi2DVWMFwPsiJZIg2iJctkfNTXtn+dK41cH3MEFvbo+
   UA4rdNXUybt/aR41tc/4TE8OnjnOhLL9eMqfyxn1iVAMrTm5Mo6vhvzZI
   zowKAL0534UreBF9olICvO+6SJyCxLGxY+ZCnqepZ385bkjp87edxaIpo
   Aj9NzLBpFOj+hH0dUJKwofTYMfSgRI65Bg+MhgulAZGtnIg/5GuyqzA0X
   U8wemfH4hkLtQZbiAOiIDGwhxChBFq6dNvfrAordfi62syMedGHabTZbG
   IzEoRLV77EYtVeehyUc2zPFDc/6uWkZxt43v0jhLReazeOKA/Gu+6fon7
   w==;
X-CSE-ConnectionGUID: AYp17eO+TBWx22QngW9srw==
X-CSE-MsgGUID: vtAMZIa9S2ed70/MiZW9hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3097523"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3097523"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:05:07 -0800
X-CSE-ConnectionGUID: qlLm7GuhQQqzaOZ4ZNWGnQ==
X-CSE-MsgGUID: ySqjelIxTcy+TS5B6Q3oUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="10296625"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.142])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:05:03 -0800
Date: Wed, 11 Nov 2026 16:05:01 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: cwweng.linux@gmail.com, andy@kernel.org, conor+dt@kernel.org,
	cwweng@nuvoton.com, devicetree@vger.kernel.org,
	dlechner@baylibre.com, jic23@kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, nuno.sa@analog.com, robh@kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Message-ID: <avR2DaxSJJwpnWP9@ashevche-desk.local>
References: <20261104091136.151269-3-cwweng.linux@gmail.com>
 <SN1PR12MB2528F7F6F04801AB698A5A60A5712@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN1PR12MB2528F7F6F04801AB698A5A60A5712@SN1PR12MB2528.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_060508_170151_564BA6FE 
X-CRM114-Status: GOOD (  12.64  )
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

On Tue, Nov 10, 2026 at 08:08:03PM -0600, Victor Chernyakin wrote:

...

> > +	if (!num_channels)
> > +		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
> > +
> > +	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
> > +		return dev_err_probe(dev, -ENOSPC, "too many ADC channels\n");
> > +
> > +	channels = devm_kcalloc(dev, size_add(num_channels, 1),
> > +				sizeof(*channels), GFP_KERNEL);
> 
> Couldn't size_add() just be regular +?
> (Question to Andy who originally suggested it)
> We've just checked that num_channels is small and won't overflow.

While that's true, the other aspect(s) of this is in play. Namely we want to
have the same pattern over the kernel that makes code robust (tomorrow some
cases can be modified unnoticed with opening such an issue again) along with
the potential of finding those patterns and update in case of mass-updates
of low-level API, and I have heard for the matter of fact that devm_*alloc*()
are in the plans to move to something like k*alloc_obj*() or k*alloc_flex().

-- 
With Best Regards,
Andy Shevchenko



