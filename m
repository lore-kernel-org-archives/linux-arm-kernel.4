Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD63606A6AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yhS5S7Bt;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ffnMaN5J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I7ETygHFy4ZrJzYJUzThx5GehZFSEsdSaH2VRPBo+2c=; b=yhS5S7BteyGlP9r2b6jcTBEKuy
	fzsU9jvy0q/RGQW2MZWVBaQPS8UdKEQc9Eq8+y2biyC6YUwdMOCYt/wXcFRbRlcwIyT3DtXE6QdE3
	hSX9vlVxoeU6BlgZOzben7nOhVtzho7oAZPA9g6sQtJyg3/hZ6z1gU8cpYe5trnov3hNr3eJlAzMr
	dckpyx2Wwez4HLHDE7q9Eh4TTPG+QiO3TEsC1x4iohP6pqKYxL6TbVCWZHM8klPQ1RLDlJBBjKYei
	oAml//rAzwDIHbYB2cXDfwQFDMoFj1FPKSSEtz6n0IOg57Ewj1csj8J4qEZvK3WMyB3d4xeXhvbIm
	rl1CBGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgKB-0000000EVOF-17j2;
	Thu, 26 Nov 2026 20:44:11 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgK6-0000000EVNB-0XA6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795725846; x=1827261846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eKUhwDV/gMSHptOzLlZGIzm5ZxRtl4Wc3XXhlLLplok=;
  b=ffnMaN5JzbTw548yVqqPKmR9KfyUvmrYu8jgZAkp0TeuXJjuzMirFOoo
   iVY6yKbk0EWhfye6HwTjQNERqm1878m72d6ahI5jS2ZGWL6KRSb4bcEgw
   Z2U0fTFjSAbDfKPyKTu5+HDKiLXZE2MlHmtym37rVIsA7pf1x1saY3yYG
   T9PeCmoR0CQ50AY4tidiEnVCLt3N0OYpc3cSowOhwxXr/x7ja9yiTx6Gp
   KB+wlB5idrvqWrWFD8O0RjKsLzV6UIKwjS2k23/VmmocRqVVyagli73Q9
   tW1w5i21iiA/cz+5eHA8t0+KLHQ/2kGGJtsgHNjXj1xcFs38HLT37WOW5
   g==;
X-CSE-ConnectionGUID: nK8sTflFSRGn99AZScSnPQ==
X-CSE-MsgGUID: WJLLDdCcTquHsOHIxNhZlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4657580"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4657580"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:44:03 -0800
X-CSE-ConnectionGUID: 0ZP8mGilQuK8Va0Bboq95Q==
X-CSE-MsgGUID: obiWjL8aS/O3Q4mwfUrbvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12032903"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.208])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:44:00 -0800
Date: Thu, 26 Nov 2026 22:43:57 +0200
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
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFT PATCH 06/13] gpio: max7360: create the regmap-irq chip from
 the gpio-regmap callback
Message-ID: <awiaDVcNkqjaRL6S@ashevche-desk.local>
References: <20261126153600.299724-1-mwalle@kernel.org>
 <20261126153600.299724-7-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126153600.299724-7-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_124406_211576_D03ACE33 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

On Thu, Nov 26, 2026 at 04:35:17PM +0100, Michael Walle wrote:
> Use the new gpio_regmap_add_irq_chip() helper to create the regmap-irq
> domain.

...

> +struct max7360_gpio {
> +	struct device *dev;
> +	struct regmap *regmap;
> +};

Why do we need both? Is regmap created with difference 'dev'?

-- 
With Best Regards,
Andy Shevchenko



