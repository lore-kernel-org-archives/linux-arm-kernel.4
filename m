Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB13606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gDEbQMcf;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9/59kju
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0aBqMxJDgvMz7i6AIJn4XzKKfdX+IDbRJyfCRCeiBUk=; b=gDEbQMcfp6lVlaWIM+faqCiLNl
	Bhzk1PrMkPAuHO1tW8IwICu5+MlM5izGGBQGL70HqFC15IRmZ9ILhFwqgbap8kO78zcQJNE9pnF7o
	j2eqyV6TY9KQRy15umXlbN8J3woQvAoTLn+rBEEVwZfv5R9kNn65GfJu208kBZ3Xu6AVRL95VrMPw
	r66NCJNAJq5pxte3wbD0Ni0JByNMhueY5FQQfRxgAgpw7o6EsNqrbbMJsl61gw74Nd1TnvLxHBiAF
	vQN4ETI4ASbUIME7XPmI4DwOrSUpoAkrIxVg8CNR1EnXa37VQE6Ki6Jf0ru+N+s8bEr+/WyIAuIV2
	k/E1adYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDU8-0000000A4mY-1iyb;
	Wed, 25 Nov 2026 13:56:32 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDU5-0000000A4m6-4AgL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795614990; x=1827150990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q2j7sJN2VX0ocB6DN0v8l2ZUgx6RTf6tkLY8172U/34=;
  b=F9/59kju4IJo9vVD1auri4BF468lqY5gUkBpckumDQ59KLbBFRaiaBDM
   wab+A6G+X3MOE5WrexoWxlHNzQuuovoDhThT7aQmDxy4+uIAfmgTVdtmt
   VcMCT2xgGnongV4ZTAtM1fC2TR5f9JVNZppunn1EWXqKEcvlM2UtWKN7s
   CkCdX2hh3LOEyxY+TOVqN1cn9URZQTCCnBIQFRvc/jhyg5zuPB1FapvWQ
   rGjs/c+EAKap3PYhRP8s3RTKQ2k8ednBkV836DwS3WOK9+cxLABfXz3+J
   5nG/U4V+Y+yZ5Cjs4/1KGa0jdzu2VC2WBka/4jIIzP689cjkdnv7syqdR
   A==;
X-CSE-ConnectionGUID: XwroL8CGQ/6pur99q8tmAQ==
X-CSE-MsgGUID: nR2/kT6lSxWRe2P7a/MsTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4372744"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4372744"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:56:28 -0800
X-CSE-ConnectionGUID: CkpgHFkZQ5eqf98NxGmH0w==
X-CSE-MsgGUID: FiWqEJ7oSZ6BoW8opDBKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11870000"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:56:24 -0800
Date: Wed, 25 Nov 2026 15:56:22 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Gerard Marull-Paretas <gerard@teslabs.com>, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, jic23@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Subject: Re: [PATCH 0/2] iio: adc: stm32: describe the STM32H7 temperature
 sensor calibration
Message-ID: <awbpBtAeQl4i-YVy@ashevche-desk.local>
References: <20261124202220.23721-1-gerard@teslabs.com>
 <89f43760-01c7-43e8-9682-b7363ffc931f@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89f43760-01c7-43e8-9682-b7363ffc931f@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_055630_131059_7BAD6B1E 
X-CRM114-Status: GOOD (  10.81  )
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

On Wed, Nov 25, 2026 at 01:56:35PM +0100, Fabrice Gasnier wrote:
> On 11/24/26 21:22, Gerard Marull-Paretas wrote:

...

> The DT is deprecated and are going to be removed [1].
> 
> [1] https://lore.kernel.org/linux-arm-kernel/2afd5f78-0174-4955-8c1b-be18aea3800b@app.fastmail.com/
> 
> So I'm not sure the dt-bindings update is useful.

But as long as the code supporting old DT is in kernel, the update needs to
those versions, no?

-- 
With Best Regards,
Andy Shevchenko



