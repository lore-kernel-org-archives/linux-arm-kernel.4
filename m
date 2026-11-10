Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E290606A209
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D53+9MVp;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dKZcrHXq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A/5LL2oP+jZw6FK1LnyXF4yA4UCBdbE9fOMI+QqDcr4=; b=D53+9MVpveX8JZGXvhlj2NPNFT
	FoPfOYJ1vqTMAm5qthO4KN+Dl7QWYYm02m5U5iywmHxMhKjQfpX2262+dLNT+23IsZFSNoiAgfSSE
	hseRM7VQx3Uw7QTBPeCNpOpahnWxXVBAALwiTLK8iUzO/symjsbw2Uo/bFmKpiHqPq1VpHR6LjLo2
	OlFunpideDmhbWViafj+ZYDeiSMTFckm7sxdKfrpS4nRe6q32BLLoMdtwjdfsUrtdCsHAkmN/mDjO
	GupVwBSk6eTkPT1OqR/CgLpPgVkFDnZirzAyQOkf0yOqBahps02yoexZTab48QtFhiNCOy5RtnJJp
	AFEu1Tgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQooN-00000004YeZ-2C8B;
	Tue, 10 Nov 2026 16:35:07 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQony-00000004YE7-1Pn5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794328483; x=1825864483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=62tf4jRuBAhAw6YJUn1Bb7RvCWjFNxKFAHNol+T/IT0=;
  b=dKZcrHXqvN9b/A+RQjIPgBTuY4gnSwFoFMnzMut3MyyOPqOVQtd8qdrn
   CHst3Mj/pQt4QNCpvkZnQQS7QjlhhbAyqptrC7oeDguGIUGUKYZH+GSxS
   zIsi4caWKkREKac1Gm5kWM7ZH57gsYlqGuO9olyi4+onxvb9X1A3ZNwHf
   HfZVTzP81MK6Jwux4pf8gc1MoBK/bXdal4CoZz4wo4svXzp2ZOjg1spCa
   rUh0PEU1CK8rNM0OacXMK4OR5nRqrfsQxLiM+2oabPCL0szq4mml0z7vT
   BuOI6j0SD2LGF9ezI24PHPUCCGh3E+VuY1hrBDEsx1kuioPCbfVGdNTmW
   Q==;
X-CSE-ConnectionGUID: m0d25/EuQn6WS3UWjwOB5g==
X-CSE-MsgGUID: Jy58xLgdQjSqchMmSFvpqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3112912"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3112912"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:34:42 -0800
X-CSE-ConnectionGUID: jGJAXPcdRle/P09ygKzg3g==
X-CSE-MsgGUID: 4EeMYk2fRkuNsMxdZCUkTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8629844"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:34:39 -0800
Date: Tue, 10 Nov 2026 18:34:35 +0200
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
Subject: Re: [PATCH v5 16/16] iio: adc: xilinx-xadc: Add I2C interface support
Message-ID: <avNHmwYFsrpN99Nt@ashevche-desk.local>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
 <20261110050201.1850399-17-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110050201.1850399-17-dileepkumar.nagavarapu@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_083442_434490_A29BE9FF 
X-CRM114-Status: GOOD (  17.26  )
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

On Tue, Nov 10, 2026 at 10:32:01AM +0530, Dileep Kumar Nagavarapu wrote:
> Add I2C interface support for Xilinx System Management Wizard IP along
> with the existing AXI memory-mapped interface. This support enables
> monitoring the voltage and temperature on UltraScale+ devices where the
> System Management Wizard is connected via I2C.
> 
> Key changes:
> - Implement 32-bit DRP (Dynamic Reconfiguration Port) packet format
>   as per Xilinx PG185 specification.
> - Add separate I2C probe with xadc_i2c_of_match_table to handle same
>   compatible string ("xlnx,system-management-wiz-1.3") on I2C bus.
> - Add NULL checks for get_dclk_rate callback function in sampling rate
>   functions to support interfaces without clock control
> - Create separate iio_info structure(xadc_i2c_info) without event
>   callbacks for I2C devices
> - Add xadc_i2c_transaction() function to handle I2C read/write operations
> - Add XADC_TYPE_US_I2C type to distinguish I2C interface from AXI
> - Defer XADC hardware initialization until first device access, since the
>   I2C path reaches the PL SysMon indirectly through a platform controller
>   DRP bridge that may not yet be operational at probe() time. Initializing
>   on first read/write instead avoids probe failures caused by transient
>   unavailability of that downstream path.

...

> +struct xadc_i2c {
> +	struct xadc xadc;
> +	struct i2c_client *client;
> +	bool hw_initialized;
> +	unsigned int conf0;
> +	unsigned int bipolar_mask;
> +};

Have you run `pahole`?

...

> +static int xadc_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	unsigned int conf0, bipolar_mask;
> +	const struct xadc_ops *ops;
> +	struct iio_dev *indio_dev;
> +	struct xadc_i2c *xadc_i2c;
> +	struct xadc *xadc;
> +	int ret;
> +
> +	ops = device_get_match_data(dev);
> +	if (!ops)
> +		return -ENODEV;

-ENODATA

> +	indio_dev = xadc_device_setup(dev, sizeof(*xadc_i2c), ops);
> +	if (IS_ERR(indio_dev))
> +		return PTR_ERR(indio_dev);
> +
> +	xadc_i2c = iio_priv(indio_dev);
> +	xadc_i2c->client = client;
> +	xadc = &xadc_i2c->xadc;
> +
> +	ret = xadc_common_init(dev, xadc, ops);
> +	if (ret)
> +		return ret;
> +
> +	ret = xadc_device_configure(indio_dev, 0, &conf0, &bipolar_mask);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to setup the device\n");
> +
> +	xadc_i2c->conf0 = conf0;
> +	xadc_i2c->bipolar_mask = bipolar_mask;
> +	xadc_i2c->hw_initialized = false;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

...

> +MODULE_IMPORT_NS("IIO_XADC");

> +

Unneeded blank line.

> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>");
> +MODULE_AUTHOR("Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>");
> +MODULE_DESCRIPTION("Xilinx XADC I2C Interface Driver");

