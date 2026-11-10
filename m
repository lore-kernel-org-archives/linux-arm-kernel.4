Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0522860A2618
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XwPQW/55;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aUEhOHj2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EeDJ3iXHw1eTGr3jYLp8sNAP6zgbBAsImYmgoG9HH1E=; b=XwPQW/55PtItWFtfYWUWuBauEX
	SE2ojrlqxVElLzxf2MNxXw/2m5tPyG5RFtM604xlrLy58s9peebSEkoeNk7pZVh8NFli30JFf6kOs
	T2UjKC6u5YJIot7/ViettNxH4GBiDbsBNLvnS6qJpueMrVk/C3gagKam+UFzlryiH73Uj51Ockgpd
	2wphhSw+afaT853OO3P4/P6HFlYqnrMVKrb8GkoyH99wpgpXIJJaHbnVAfIXSytw59CIPZVO7s2BJ
	hrCm6OXffK6K+nJBHgWb/1qG5kJizjv1KNRdDX7LZmn5kT3uHdeNotsExFK5UcbWiiLzyPoupnrvg
	umSxLlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoev-00000004WcM-3oz9;
	Tue, 10 Nov 2026 16:25:21 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoes-00000004WYu-1nph
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794327919; x=1825863919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lyuz2D4EmFcet2JRZyG53EVIYy8D1CxnxYUn7KkldQw=;
  b=aUEhOHj2SvaeWr/fGfZlqJfy4skYaQjqfwpJr1+wwLgOGQl1zEQ6CnEi
   Y/cWWZBkCTkKI+mM+Saj4L57FSvSyU1EDYrFm6AvjHMHwNXdiNa9HjzwU
   COrgSVal1qbDTrgcpPblyoTlQmD8u3BNdK9vppL1E1fZgblqqJWWo5bxL
   PSUrI4zE+mTtIhYCqNXEdLfh5bBLTP4pbt5vYu32CuatYTx9DCxuMIXX1
   HwFmmLCdp7V3+AFnYehR0Lz6PVHqc8XjZFVpjpeGmdGMOith/UcTd6kN4
   r7b0xEOntyTf6sVsGntaHqT67G0Mlhgt5VKcXzmSe4XyL3+WUSdD2vL8x
   w==;
X-CSE-ConnectionGUID: TcY/PVmGTs6lZL2+pe2fxA==
X-CSE-MsgGUID: pX50GdVsSlGrGzzOQrkLwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3082523"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3082523"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:25:18 -0800
X-CSE-ConnectionGUID: rpPa5ikRQqOeounq2lJdXA==
X-CSE-MsgGUID: GpEMo1VERpSvxmHTl/EiMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8784099"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:25:14 -0800
Date: Tue, 10 Nov 2026 18:25:12 +0200
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
Subject: Re: [PATCH v5 13/16] iio: adc: xilinx-xadc: Add helper functions for
 the device setup
Message-ID: <avNFaNki0m47M80d@ashevche-desk.local>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
 <20261110050201.1850399-14-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110050201.1850399-14-dileepkumar.nagavarapu@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_082518_485338_F17DDEF4 
X-CRM114-Status: GOOD (  18.29  )
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

On Tue, Nov 10, 2026 at 10:31:58AM +0530, Dileep Kumar Nagavarapu wrote:
> Refactor the platform driver probe function by extracting device
> setup and configuration logic into reusable helper functions:
> xadc_device_setup(): handles IIO device allocation and basic setup
> xadc_device_configure(): handles device tree parsing and bipolar mask
> configuration
> 
> Move the bipolar channel mask calculation immediately after
> xadc_parse_dt(), as the channel information used to build
> the mask is populated there and remains unchanged before it is consumed.
> 
> This refactoring reduces code duplication and prepares for sharing the
> common setup logic between platform and I2C drivers.

...

> +	if (irq <= 0)
> +		return 0;

When == 0 is true?

...

> +static int xadc_device_configure(struct iio_dev *indio_dev, int irq,
> +				 unsigned int *conf0, unsigned int *bipolar_mask)
> +{
> +	int ret;
> +
> +	ret = xadc_parse_dt(indio_dev, conf0, irq);
> +	if (ret)
> +		return ret;
> +
> +	*bipolar_mask = 0;
> +	for (unsigned int i = 0; i < indio_dev->num_channels; i++) {
> +		if (indio_dev->channels[i].scan_type.sign == 's')

Wasn't that changed to format?

> +			*bipolar_mask |= BIT(indio_dev->channels[i].scan_index);
> +	}
> +
> +	return 0;

Don't we have a specific for_each type of macro to iterate over all channels?

> +}

...

>  	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq < 0 && (irq != -ENXIO || !(ops->flags & XADC_FLAGS_IRQ_OPTIONAL)))

Side note, this conditional is wrong. It doesn't handle properly deferred probe.

>  		return irq;

-- 
With Best Regards,
Andy Shevchenko



