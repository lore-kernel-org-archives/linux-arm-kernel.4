Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDC5606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WKhIClmB;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K/1Y+/YJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oHP5B0UlB7/SoTwhxB0AOYNlEwskAwU+hgd9yWW6YwA=; b=WKhIClmBV/n4DICR7hRJ9BdWkH
	xj932MFKnwud0cpvrI8t0g6afgMFKoSCnekSTrhAXQLPM6vxS1BC8A2rPFjtMOw6Nmvkd/qkzaKJ9
	ZqDykZNR1ILW24Iu0ixuRbwPXNn8v6ITFCup8xtVZzMPLakj7hdJATmcx9nvwokwJ6bN56nowZWYz
	a4GAN/N3zotCTEmDPiRND+ONN58JXK6247u8JOM8LklJtQxt5AsdvGj05faulXoDHMYDkDkLdEhQ9
	mIeLrzftZT5QIxk9XBRK3U3/GUpqI/HvKmutYkMTO9QBxBy887n+9dURy9PZk1w8ZkfqNdsX337WG
	VpbBOGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoTr-00000004Uod-0QQV;
	Tue, 10 Nov 2026 16:13:55 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoTo-00000004Uo5-3Q8C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794327233; x=1825863233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b+GfY+61OeZggR11g46pkfalBMS7RT2Vza+al9X93H4=;
  b=K/1Y+/YJaQBOwILXxGr9Zy7PM7M+YT0V/hximGUx1UP+pSQYUgCIPxVj
   SFOeC0UXKcFwSmVjwMLTwWYqUDDs6RW0NxIT31Gaj7h+y1X8bn3+vw8gw
   G6xngkfSHocCY6CQW/ZP9WLmXjPNxLeycUp2RMTJlhxEN1W2ZtroGOwnJ
   HRsiH1B5HdcPy3CocdfFaPnWXayZ0d+YJY4WDtL/t0gVQXjt8CpWE0SSa
   HevQQCSMdWfcObfxKZmZGfhgzuBZJubr9gW2LpRTrrztD4B7SjDyr8QPx
   AqpHMChVqiK1i+aMEeOAMLS3bj3NTA43O3lgU5M1oqXxKE/C4kGCEDY98
   A==;
X-CSE-ConnectionGUID: HVod0PYJQXiDs1bEyU/AhA==
X-CSE-MsgGUID: CH/gISPnQ0SKKjATbf3acQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2949304"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2949304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:13:50 -0800
X-CSE-ConnectionGUID: OLMcxOxJRmK8fg92V8WCXQ==
X-CSE-MsgGUID: tTtacSy3SlKPGm6b8dLczg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8518342"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:13:47 -0800
Date: Tue, 10 Nov 2026 18:13:45 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v5 07/16] iio: adc: xilinx-xadc: Use guard() for mutex
 locking
Message-ID: <avNCuWIuS5iFrId-@ashevche-desk.local>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
 <20261110050201.1850399-8-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110050201.1850399-8-dileepkumar.nagavarapu@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_081352_893505_D48C3229 
X-CRM114-Status: GOOD (  11.24  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:31:52AM +0530, Dileep Kumar Nagavarapu wrote:
> Use guard() helper for mutex handling instead of explicit
> mutex_lock()/mutex_unlock() sequences.
> 
> This removes the need for explicit unlocks and the
> error-path labels that only existed to release the mutex,
> simplifying the control flow
> 
> No functional change intended

...

>  {
>  	int ret;
>  
> -	mutex_lock(&xadc->mutex);
> +	guard(mutex)(&xadc->mutex);
>  	ret = _xadc_update_adc_reg(xadc, reg, mask, val);
> -	mutex_unlock(&xadc->mutex);
>  
>  	return ret;
>  }

I believe somebody already told you two things on this:
1) make guard()() be delimited by blank lines, so it's visible at a glance;
2) don't leave unneeded variables, like 'ret' in this case.

...

> @@ -101,9 +101,8 @@ static inline int xadc_read_adc_reg(struct xadc *xadc, unsigned int reg, u16 *va
>  {
>  	int ret;
>  
> -	mutex_lock(&xadc->mutex);
> +	guard(mutex)(&xadc->mutex);
>  	ret = _xadc_read_adc_reg(xadc, reg, val);
> -	mutex_unlock(&xadc->mutex);
>  	return ret;
>  }

Same story and so on...

-- 
With Best Regards,
Andy Shevchenko



