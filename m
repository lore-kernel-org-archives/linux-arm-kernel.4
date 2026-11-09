Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25940606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 23:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fXRB9y0q;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1xiWuXm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4FhdLPD0grYX+522WudA2QHSLtTJRmqNQOiiL/At1p0=; b=fXRB9y0q8Kr9B8Q9e4O+LQOy1Z
	aKLQ6XWcri7sVstktR2vc7rD5TAGBcMbg1DkbuLgD6fIlPCVd0o2ocLSnoqyUjlSo5XkyuSygjqTK
	uwJm4i8GLXC/ywmKUq9fu8zUu3kZ3gtT6uKbGUS+SAeu0l1YEl3fy3HWqGCDhDV1lAtiIW/3GT9tu
	UIa0MLZ5Fg6WaEeDXEfCIvuBTHXnbSMcLFIoys1jbJ9CLSmaia0GwCVpMwLW+2E4d/w/xP3KRVtp/
	wB3Hcm1gJv3OFtMidym5dmoy0xl2pLu+rDkiIjRgIPhZp4A0Jz7R331ENiKr0D9uLjZEPuP4O8NOe
	l2pTLLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYQq-00000001vSv-1zOO;
	Mon, 09 Nov 2026 23:05:44 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYQk-00000001vSV-48o8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 23:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794265540; x=1825801540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fA/YuYOZqr8nX95JQI9ayGBQbBahOSJO/lfwcBjsiT4=;
  b=j1xiWuXmrK+yeZe1MhfR6mZYomT+HHDukDEPIXq0qj8IglGwfGJZGjzm
   3DFMwOUh9OcjpjzvRbvJGhZkSQB0MvmAFT8nffJSibYIMcEgEALGZ0+oe
   ypcsaYPcQIBSnxhlxnMHnTKrFBr8KyvKjo0TPSSWoMj7OPaP9/Ih197te
   2T8ftguU6n0ec2j5K/QcO02szphysVyo2Pr8Mk4vaVXgOx43PppoQgAl2
   hnXE0JTVtI7Rp6EVS0/PuWvN8Acss4wrA2qTR1+CvkRC39IbvGvKJrKgB
   2f2SGJ8tnQNyiWf8nUveMamKWKXUCzoZuwHcSueDVf3ThmQFfLBEnkxZ7
   g==;
X-CSE-ConnectionGUID: 18wYB8HVTfWGXOcmGDF85g==
X-CSE-MsgGUID: APFzMtBZQlSv60MHhS+ClA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3029788"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3029788"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:05:29 -0800
X-CSE-ConnectionGUID: O1fhqldaSzi1N7PVHOdtOg==
X-CSE-MsgGUID: XivK/JkIRVmktnl1NeCaEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9845093"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:05:24 -0800
Date: Tue, 10 Nov 2026 01:05:22 +0200
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
Message-ID: <avJRsij5P7Ch3tqE@ashevche-desk.local>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
 <20261105-submit-h616-uart-fifo-v1-v8-1-14024d2b184b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-1-14024d2b184b@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_150539_092037_797DA754 
X-CRM114-Status: GOOD (  15.17  )
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

On Thu, Nov 05, 2026 at 01:52:02PM -0700, James Hilliard wrote:
> Return a status from dw8250_setup_port() and propagate failures through
> the DW and LPSS probe paths before registering the UART. Use the existing
> LPSS cleanup path to release board resources and IRQ vectors on failure.
> 
> Keep the current setup behavior by returning zero on both successful
> paths. This separates error propagation from the configuration validation
> that will use it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
after addressing below piece.

...

> -	if (!data->skip_autocfg)
> -		dw8250_setup_port(p);
> +	if (!data->skip_autocfg) {
> +		err = dw8250_setup_port(p);
> +		if (err)
> +			return err;
> +	}

No, don't change it here, the return value will be simply ignored until the
change that will make use of it.

-- 
With Best Regards,
Andy Shevchenko



