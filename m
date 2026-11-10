Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1DC606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dXLJD1V6;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MCOMSxH0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CBpuD9EN7mGAnC0N09j6dxtwPl1Nk8UemTazmCtVEmo=; b=dXLJD1V6EHN6OH/8n0B6SVGU6z
	0dwb7Us2K07w+Tl9xJra0uZVveZtq4jXwQ8nQPKiBBOex391ZgqUemIZ7yVCIwoD4xnaYPOJAqv7r
	onezeF64CeEdHjw6wcS9mT2KtItGhrNNPfxtUKiTUb2VPjXvLeJYdw4hDtmFtqKnUSHamcwjLrQ0q
	fXuNME50MSDVqJMccB9EbicFsVlSrhG2jEzo04m4EZd/YfuDSIyX/Cm+9k9RVtq8SIqfvXcqNqBhK
	ZYXhtjAZnK30GUoYt9ru1VcEl7/eLrGWUHONEyYTvLfJh+mdH9Oo/dd+7SyDRXlTx3xBwg8kgBq1f
	z9Y5H2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQobk-00000004VPs-0kd7;
	Tue, 10 Nov 2026 16:22:04 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQobi-00000004VPV-0YPk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794327722; x=1825863722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cy+rZt1gNtVr4opsRLmcs7QTL/zYCRzwfuBXOZCZ7sM=;
  b=MCOMSxH0Q0tnrrazeDCeiFeBsy9/G1568ARzAi9XJFa65XoOmt7od/3y
   aHU/3yYcZeB6UzIxWpDQV6nRa+rhQU6EKEZiGJQABaVQpIQ29UVEsRSSj
   +TPZUXMmiP8o4/VDLdnTZLMTPClLCGU0WrqXiADJqi2T8VBQc3bfWpfbq
   F2u+7oEujpDZt9xTwMCLJq617wbAdySfs2du7dtFNovj5BC70I16WRgRO
   pPCmoKGq55mkDK1vbXr1OA28YRK9b3pzNaXlhtiY9rtVhjdhZbvyIpQ6P
   OKeCWdNGHSLBUwuR63rdV+1VMxWmsXUItWRn9JWcB4uZsTiLa6678GaOc
   g==;
X-CSE-ConnectionGUID: qZFw0pXqTHezPPwX6i2A5w==
X-CSE-MsgGUID: 1op26US/QjSkW4XSAh7alQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2973434"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2973434"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:22:01 -0800
X-CSE-ConnectionGUID: rskXrzBaQJa6lenaPAoyjA==
X-CSE-MsgGUID: EUnsRGwFTlyeG6iuM9I8lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8018663"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:21:59 -0800
Date: Tue, 10 Nov 2026 18:21:56 +0200
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
Subject: Re: [PATCH v5 12/16] iio: adc: xilinx-xadc: Refine Zynq read/write
 error handling on timeout/interrupt
Message-ID: <avNEpH6KGJkeI7dX@ashevche-desk.local>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
 <20261110050201.1850399-13-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110050201.1850399-13-dileepkumar.nagavarapu@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_082202_240626_7B076C2A 
X-CRM114-Status: GOOD (  14.62  )
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

On Tue, Nov 10, 2026 at 10:31:57AM +0530, Dileep Kumar Nagavarapu wrote:
> Refine the error codes returned from the wait, the same way in both
> xadc_zynq_write_adc_reg() and xadc_zynq_read_adc_reg(): a timeout
> (ret == 0) now returns -ETIMEDOUT instead of the previous -EIO,
> giving a more precise errno for this condition. An interrupted wait
> (ret < 0) now propagates that error to the caller instead of being
> silently treated as success.
> 
> xadc_zynq_write_adc_reg() waits on xadc->completion after issuing the
> Zynq DRP write command, then drains the response word from
> XADC_ZYNQ_REG_DFIFO. The DFIFO read already ran unconditionally after
> the wait, regardless of outcome.

...

>  	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
> -	if (ret == 0)
> -		ret = -EIO;
> -	else
> -		ret = 0;
>  
>  	xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &tmp);
>  
> -	return ret;
> +	if (ret == 0)
> +		return -ETIMEDOUT;
> +
> +	if (ret < 0)
> +		return ret;

First check for generic errors, then for exclusive conditions ( == 0).

> +	return 0;

...

>  	ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
>  	if (ret == 0)
> -		ret = -EIO;
> +		return -ETIMEDOUT;
> +
>  	if (ret < 0)
>  		return ret;

Ditto.

-- 
With Best Regards,
Andy Shevchenko



