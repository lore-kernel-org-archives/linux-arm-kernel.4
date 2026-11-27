Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2E0606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jMwTO0ER;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=REgtil3Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xM+++gh9lEX42BhN1B3t2ZJ0fmEd/nt0wFnMQxSaQZs=; b=jMwTO0ERxNOQrMweWbUY8DKyTI
	X73pt7VuXRQosJYBUjGjxrMMu8iVIMU4VBHjP0xl5ZNguaqeiSHph4x/tBCpbwct3WIYik4mCBXQ3
	zngvHZxYZ8zn4NpfUOHQybAdTW1Z95tDb+riQB9EcfUlsJ1vHRlKuPwgXjEYu463fiQxV1P7gtDaT
	2A9wc86GlOW9Ux0jSYH1MM+OcQ18DKi3R+d+LAVkNwFKEYSTea7AcjKjcKKyqQtrZeEZVUpJem55y
	ROdJDj/9osErusnaHYrFJYt3fj9e8XAsdc19gxL3H9lH8duGgUxdfmWBdTIdsuxHJt7hDpkdikky6
	MmH0ChdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzbv-0000000HF5e-424v;
	Fri, 27 Nov 2026 17:19:47 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzbq-0000000HF3F-2CRc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795799983; x=1827335983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bHhhJa33EMSuLHof5NWbr5J4Gnw3fnFnAMrrEdH8PE0=;
  b=REgtil3YujOidQtwRfDeWMm3XNKOVIsGw06aUfIQ0eggzh9JAOp7jD34
   NqTG1E4C8IkwSBXARNqM9ahB7HAnwJ2fe9NC0kjtofAfH0F+pnWp6AXNf
   sD11bZdUypNTcNcf23m8c0WTOy7U7KJbO4QjsbeGPGEEauqTWKkZP2Ukh
   iAw4rTgUB1H75LGeMl7tnedv0FlXOEXrpRQWe1diFbpqHmeYwW6hYmRPg
   9JARxxI2sgvi0+Bsa+ypciPpkbcrb/fizDxFwVBy2FeNhWGA/H5xYzckP
   0Xyi9b0sIKv5fbF9WfCjviBJgAmMrtxDOJXDQkdMtdXkL+Awu6A7K6B9S
   Q==;
X-CSE-ConnectionGUID: ZVvRzzq6R7K0rfWJ2ByU5w==
X-CSE-MsgGUID: 9S/FjesRRGi8nerWn9CZ2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4625883"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4625883"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:19:42 -0800
X-CSE-ConnectionGUID: O6Ce+IGDSk6VlDcgLtmblw==
X-CSE-MsgGUID: v0hwtTnbTfiQPFaBEUrbDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12571123"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:19:38 -0800
Date: Fri, 27 Nov 2026 19:19:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>, Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [RFT PATCH v2 01/14] gpio: regmap: use the correct number for
 .ngpio_per_reg
Message-ID: <awm7qL5J02ivp_XC@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-2-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127145232.814492-2-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_091943_034209_8E5D583F 
X-CRM114-Status: GOOD (  11.70  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 03:52:18PM +0100, Michael Walle wrote:
> Setting .ngpio_per_reg to 0 means that gpio-regmap assumes there is only
> one register. If the number of GPIOs comes from gpiochip_get_ngpios()
> config->ngpio is still 0 and it's taking over the wrong number.
> 
> Fix it by using chip->ngpio, which uses either config->ngpio or
> gpiochip_get_ngpios().

...

> Fixes: db305161880a ("gpio: regmap: Allow ngpio to be read from the property")

Not sure, before that commit the assumed configuration never worked.
But not objecting it, up to Bart.

...

>  	/* if not set, assume there is only one register */

^^^ Seems like the comment lacks of an adjustment.

>  	gpio->ngpio_per_reg = config->ngpio_per_reg;
>  	if (!gpio->ngpio_per_reg)
> -		gpio->ngpio_per_reg = config->ngpio;
> +		gpio->ngpio_per_reg = chip->ngpio;


-- 
With Best Regards,
Andy Shevchenko



