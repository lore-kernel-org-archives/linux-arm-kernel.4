Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE214606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IteNm/F7;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fsxeVPOQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yYskAYVnH6XbVjZCWrX9MMKwY8O7EPYghGutgzkZiEk=; b=IteNm/F7dLseYSPEzj+DBgLyjC
	AAylp4oxlBrsbE5GgHQ+VKkaqjO7hw292jbWzAMfgcCY9cgkW+/eMpFEXWjXfw1JqEzYdj/VSbz1G
	3vWpnsc02vDH6ukYbr8Xn6IVztBlNTLoVX7JcLJ/uYdLG1xNCn3vXJYK4tr+m0f3V/pMnVa2/ClLi
	afX76iKixBFXWTq3K9f5dbAGOo/KC899VSRpNwjqwcQcH0Gpf2qQHkA8d9lGR7SSdSk3x5gF7G8TU
	1jf9CrU//e0OQ4/ht94vlACpOqI33sezhymfiahdUp3BRVA9iRnhBCQpUKoC1GFtdU8244906hDUS
	0IjPUdKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoYk-00000004VEU-3S1D;
	Tue, 10 Nov 2026 16:18:58 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoYj-00000004VE8-0oRp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794327537; x=1825863537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XLgFMvrq3yUqIfrDH4auZGnz7OE5EcbDwFNADMKNHJ0=;
  b=fsxeVPOQii9m1JAsbbCsy2rwRi9H1dQxwy8u/nYR95aM/AkAsCgSJqlq
   q5VhFMk9I4THSXMhz70Zyl9ZPPb4WhKvbN5iLCgrSGIjepRqOjsdNC3Eu
   HqWAe7PtXD7asvPLgqm71IY2jVgOAUVbYxsQ1YDA/ICwEox/LCULFpAVk
   e/k8tF6wfAntsA6fmZhw3yTGFpAdgS0FtY5m366PUuY84BfCOdKpPAj2W
   78X82VcvgB9FocWq7L3CaMbPoCBv1ykWv46p8fkVI2Zwmbd/diH02ZSpk
   ptLvfnvQhXqlKLStmbEEXDBUn8jUNKM64F1ysAN4uPs5Mi7GhxQf0AUZ6
   A==;
X-CSE-ConnectionGUID: J3RFKTTlQhq7sGkgTnoJEg==
X-CSE-MsgGUID: cQZV764xSd6Z7exmuw1GLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2979649"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2979649"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:18:56 -0800
X-CSE-ConnectionGUID: MneuRwbwRX2t1Z8hvWZwaw==
X-CSE-MsgGUID: P73odN+YSh+sOAsPzzVs0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="9967128"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:18:54 -0800
Date: Tue, 10 Nov 2026 18:18:51 +0200
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
Subject: Re: [PATCH v5 09/16] iio: adc: xilinx-xadc: Add unit suffixes to
 macro names
Message-ID: <avND64ZLHcSPFUkX@ashevche-desk.local>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
 <20261110050201.1850399-10-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110050201.1850399-10-dileepkumar.nagavarapu@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_081857_277991_847EA290 
X-CRM114-Status: GOOD (  11.23  )
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

On Tue, Nov 10, 2026 at 10:31:54AM +0530, Dileep Kumar Nagavarapu wrote:
> Append the unit to the relevant macro names (_HZ, _MS, _CYCLES, _SPS)
> so that the expected unit of each value is clear at the point of use
> and to avoid ambiguity.
> 
> No functional change intended

...

> -#define XADC_MAX_SAMPLERATE 150000
> +#define XADC_MAX_SAMPLERATE_SPS 150000

Not sure if _SPS makes it anyhow better, but you may use (150 * KILO)

...

> -#define XADC_ZYNQ_TCK_RATE_MAX 50000000
> -#define XADC_ZYNQ_IGAP_DEFAULT 20
> -#define XADC_ZYNQ_PCAP_RATE_MAX 200000000
> +#define XADC_ZYNQ_TCK_RATE_MAX_HZ	50000000
> +#define XADC_ZYNQ_IGAP_DEFAULT_CYCLES	20
> +#define XADC_ZYNQ_PCAP_RATE_MAX_HZ	200000000

We have units.h full of useful multipliers, use them.

_HZ --> _Hz

...

>  	div = clk_rate / val;
> -	if (clk_rate / div / 26 > XADC_MAX_SAMPLERATE)
> +	if (clk_rate / div / 26 > XADC_MAX_SAMPLERATE_SPS)
>  		div++;

Side note, you can get rid of one division.

	if (clk_rate / div > 26 * XADC_MAX_SAMPLERATE_SPS)

>  	if (div < 2)
>  		div = 2;

-- 
With Best Regards,
Andy Shevchenko



