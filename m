Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F95606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FWyXvro1;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P0HOccOZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vDq+dwDh9VHOyE9PGWl7oPgRqIwaNRdCgws6u1M1EvA=; b=FWyXvro16xq2qE88RoWXdtz0r9
	b2VKOrli5mYjo8Czaubh8XopRG9uxZQObcTUK4sfpT9vM+fu6eQFXQ0cd1pF0kzblKbjsKlfarXuY
	eOOyRpmKw4OYIRpLEy27/dznqeP4Q4GMtJj/DNUSJUquVpHGC4Xc2vNEb4l9XlMogOslnd9X3dqe1
	LC1bNUdJCFovACS0yIdZ85vFUnAvXbAocB5JRr5UK7bqGpreoK2fG7YPAGAjAwqrNTcEke2dkjZSV
	HgQQTQCc/ehh4VFEiVqFIT00mA1qRB7QOR8YD73jpO9PFolskTd16Ljudmlc1q359ja/vUHgcE6G+
	QH2pDlVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5sF-0000000CpYW-3ojQ;
	Thu, 19 Nov 2026 17:24:39 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5sD-0000000CpY3-0Xwm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795109078; x=1826645078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MKwGymcfbhD1OXly6CaW73N6VxGumEiDjiKrm7VXbkM=;
  b=P0HOccOZfXLiOSH/1iLYWDsupIHKUohFBEUf2uNzskCqhoWRHJFioOel
   lbZa/at+pu+W+XI5BfFSshQwiSxLj5RD/4Hj88JJwTaRHaeZ8f/j2K4Mg
   DKVl1xAsWnVgT3ByySSr/+qMOCMRd0QfmJozMHmGhJLJ6atLp0me+7QGs
   4LNf9wo7kfQ4O7EHJPV/t6SJ06blBNldc+heH1f/GIfELHmaz3oSSOi2W
   AU/O+WlhOpxmdcTc6QhKjT6nZbIEPfrLCr8vmnIaBaxi0u1EGjSyLLMkE
   PhprY6h7wGy41SRnQVkT6JQmXxg1QzIATZDCiuF6/9pR+o3cAGda2eoMF
   g==;
X-CSE-ConnectionGUID: LfvdqMtEQUawSF7qgqYizw==
X-CSE-MsgGUID: IhRCTCrJRCSEohGOy+oowQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3855712"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3855712"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:24:36 -0800
X-CSE-ConnectionGUID: GjIjjLCTQn+hGDx23MTRSQ==
X-CSE-MsgGUID: QOl9cBzES66bHUzesE5z9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="11057979"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:24:32 -0800
Date: Thu, 19 Nov 2026 19:24:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 04/10] iio: adc: stm32-adc: Validate channel index before
 writing chan_name
Message-ID: <av8wzmfrU7zLzGmU@ashevche-desk.local>
References: <20261119153151.1397003-1-lee@kernel.org>
 <20261119153151.1397003-5-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119153151.1397003-5-lee@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_092437_207753_88180FA3 
X-CRM114-Status: GOOD (  10.72  )
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

On Thu, Nov 19, 2026 at 03:30:37PM +0000, Lee Jones wrote:
> stm32_adc_generic_chan_init() reads the child node's reg property into a
> signed int and, when the optional label property is present, writes into
> adc->chan_name[val] and calls stm32_adc_populate_int_ch() before
> checking whether val exceeds adc_info->max_channels.  Because val is
> signed, values with the top bit set also become negative and bypass the
> upper-bound check altogether.
> 
> Store val as a u32, matching fwnode_property_read_u32(), and move the
> max_channels bounds check immediately after reading reg.

...

> +		if (val >= adc_info->max_channels)
> +			return dev_err_probe(dev, -EINVAL,

-ECHRNG

However it seems in the original code like this.

> +					     "Invalid channel %u\n", val);
> +
>  		ret = fwnode_property_read_string(child, "label", &name);

-- 
With Best Regards,
Andy Shevchenko



