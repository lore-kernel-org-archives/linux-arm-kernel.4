Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54269606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FV4LhKd3;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FsVMDLq+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q4lNPn/UK40kisCgS/o/tQFd2nFoymjIVtaW1cQeiCw=; b=FV4LhKd3Z2ek6nba0hz+AQnbwi
	dg+MpHu0pRJFV5AP9V3lwW2AfPyoGBZeLwvF7AmNejAeoF2u3dcf4ZCDanz+/9G7n/4HRtfh2tHIb
	ZovvbV3F4LriDr8xuwhX7zmGvRq87enIT8OHJ3DHtW/sOV/id0S4LhFmryrvzv8qNQVGOtf9/ZoIY
	9syuDLktyeLmzK2DaE45420r/m0oLmp/lOZCQFLcbLQpz152SefxlAS8uEpibXUWSjLTLOjmH62TF
	wYN9BzuUi8Qexxm1UAf22/mJCeBxOqrFdsgU+hu5wS7maqlBk+tWWd7NvgmT4CF8TlRx16Y4CqcpU
	OlrJQNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVJD-00000001a7d-0NBO;
	Mon, 09 Nov 2026 19:45:39 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVJB-00000001a7D-0TC0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 19:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794253537; x=1825789537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dmur0JcSjI2h2Sn4a6LIR095JVkgSSE5Iw2d6Hhzk9U=;
  b=FsVMDLq+Mdg+QVKbt+CSMo6Sq+5KSUyoTO4shsrZSlV1LkhqsQs69Prs
   cCj1NNM6n19THfymMJdgmTegwFmjfjsPcnDya9f6EJaomAjkqXPY+q9EV
   BMAIccnBzg/Y7aKGkw2ouRKFxdocxLTUdyRv5cKK3WjLn1SJNIh6zDkWh
   hSO/XSA/x22ZXQeVrD1JcPGMdlRqcarQHMQ+igrVRH+vnO3lIz63pFnsH
   JjdgptXz6sgtpUw4tnyhqEupeNmkt0fDqutcdKcLtMwZxjqPCinveQcEU
   q+eTPHcJWpuGKRaste5TFrsdoSfa9GUb37D5D2KQ/VclyaF0cqMO3T1qk
   A==;
X-CSE-ConnectionGUID: glJTE+8RRdmT6xKSd9BUJA==
X-CSE-MsgGUID: ne41P8zyQlKO/HsO6xysVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3015816"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3015816"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:45:36 -0800
X-CSE-ConnectionGUID: kViXZNE9R2ico6E4XGQLrA==
X-CSE-MsgGUID: ymLHrCHYTDuxbi0VO1H2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8285756"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:45:33 -0800
Date: Mon, 9 Nov 2026 21:45:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	"Simek, Michal" <michal.simek@amd.com>,
	"Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>
Subject: Re: [PATCH 2/6] iio: adc: versal-sysmon: validate temperature
 hysteresis
Message-ID: <avIi2pDCcaKDx3Ro@ashevche-desk.local>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
 <20261102122112.1723130-3-amit.kumar-mahapatra@amd.com>
 <aumyreagvU6zewKI@ashevche-desk.local>
 <DS7PR12MB9503E787CBD5E9292B5637CEDC762@DS7PR12MB9503.namprd12.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR12MB9503E787CBD5E9292B5637CEDC762@DS7PR12MB9503.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_114537_199576_71F46697 
X-CRM114-Status: GOOD (  16.38  )
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

On Fri, Nov 06, 2026 at 11:35:00AM +0000, Mahapatra, Amit Kumar wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Sent: Tuesday, November 3, 2026 3:39 PM
> > On Mon, Nov 02, 2026 at 05:51:08PM +0530, Amit Kumar Mahapatra wrote:

...

> > >     sysmon_q8p7_to_millicelsius(upper_reg, &upper_mc);
> > >     sysmon_q8p7_to_millicelsius(lower_reg, &lower_mc);
> > > -   *hysteresis = upper_mc - lower_mc;
> > > +   *hysteresis = max(upper_mc - lower_mc, 0);
> >
> > But you can use abs_diff() and let it make the problem of the supplier.
> 
> I went with max() because an inverted pair (lower above upper) doesn't
> really describe a hysteresis, so treating it as zero seemed the safest
> reading. With abs_diff(), an inverted 80/90 pair would be read as
> 10 degrees, and the next threshold write would then set the lower
> threshold to 70.

Bu where did it come from? HW or DT? If the latter, we may just reject
the wrong values at probe time, no?

-- 
With Best Regards,
Andy Shevchenko



