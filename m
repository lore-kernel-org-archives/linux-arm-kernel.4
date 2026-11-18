Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17F6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vbjLqbik;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VQuC2NJ4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vJGcGSSjcKVHc6b8pVWGQNzThgXfLhxChnkSyknWbOs=; b=vbjLqbikvo4qK0wSRiYGKAkNvg
	iZomeUTesN9OGbiT4scIxzT3/tE9Qz/jnuJrM0FLxKXFmkcA5Ipk+RDVsWpD4/ObBtum1zN2Ak8oA
	zQpnBUp4JnMUx/xMwbecRIFBysm8Axnx3BzU9WiVEvcUau1du3VvtN0y6lTcDQv5MvAe8quLUEWIk
	AGK5TS9XuqXAeHgtO0b+z2HXWHVPTBcijrJJqCm4JgdD5U75H6PtZgsEYv/h2udH+XmuTqwMQ9hcs
	VANwDoU/jsFkE4NF3SYkfeZTMRvBnFYcB9y6aLsQkT3IUvjnS82IBWnbFaE3iIoI2hx5JrTMz0aB2
	6LY5IXAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbL4-00000008Dwn-0mMr;
	Wed, 18 Nov 2026 08:48:22 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbL1-00000008Dvk-0v3T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794991700; x=1826527700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=69uAnuF7duZcZRgShYJQb+omDDGQbvMHTSaXAjeuHeM=;
  b=VQuC2NJ48s41uxhcA3Wi16xEo+I1URIo0AjVmgVIcIWXyTmBlN+yF6/Q
   2Y1dROGIhVAfS7/gN34qBxPm0MWPr5CVcTvf4Q0P6K4L0fD6qansfqAVa
   plSxBninfpNWelYVV83kVymllfe4ztx2XTzNo0G2Xo379QuUG+OnmfmEY
   KDrqAnkKs5Ontw0HiBgDNrQ5rr1xur8WTYfAMxU4DQOXGi5Ry98dG/Tdy
   7SdHB0J/9TFD12sRBOmXBhxfdzklNUSi05dtjFbAz0m0lfhRtgCqTBaX0
   eBkRCqKpan1NtXsN+J70qytZnGsGfV19tFP3wPs+usc/oMN7G6gukR7rT
   w==;
X-CSE-ConnectionGUID: PgAdLhqoQw2x7WPpAZEe3Q==
X-CSE-MsgGUID: cUnewMNuRqWnNdRB52NgoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3816797"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3816797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:48:19 -0800
X-CSE-ConnectionGUID: 7OikgetmSnmgLK4gxGWkzg==
X-CSE-MsgGUID: wD5IT/7YQQWIqN7+H0Q0Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10097320"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:48:14 -0800
Date: Wed, 18 Nov 2026 10:48:12 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v33 0/5] Add ASPEED AST2600 I2C controller driver
Message-ID: <av1mTEtWCf8zFbjp@ashevche-desk.local>
References: <20260623-upstream_i2c-v33-0-6d5338fc56ed@aspeedtech.com>
 <TYZPR06MB79202A00572E81CBC29399F4F27A2@TYZPR06MB7920.apcprd06.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYZPR06MB79202A00572E81CBC29399F4F27A2@TYZPR06MB7920.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_004819_307267_36A24992 
X-CRM114-Status: GOOD (  33.16  )
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

On Wed, Nov 18, 2026 at 08:14:51AM +0000, Ryan Chen wrote:
> Hi Andy,
> 
> This patch series has been stable in our testing on AST2600 hardware,
> and we have also received positive feedback from customer testing.
> The issues identified by Sashiko have also been addressed.
> I plan to rebase the series onto the latest upstream kernel and submit v34.
> Before doing so, I would appreciate your feedback on whether there are any
> remaining concerns or blockers that we should address.
> 
> If there are no outstanding issues, I hope the series can be considered for
> merging after the next review.
> 
> Thanks for your time and support.

Are you asking me or Andi Shyti?
If it was to me, I have no time for this right now, sorry.

> > Subject: [PATCH v33 0/5] Add ASPEED AST2600 I2C controller driver
> > 
> > This series adds support for the AST2600 I2C controller “new register set”
> > implementation.
> > 
> > The AST2600 I2C controller introduces a revised register layout which
> > separates controller and target functionality into distinct register blocks, and
> > extends clock divider configuration and packet-based transfer support
> > compared to the legacy mixed register layout used on earlier ASPEED SoCs.
> > 
> > The current driver implementation for the AST2600 I2C peripheral is through
> > the hardware's "compatibility mode", which exposes a register set that
> > matches the previous generation hardware (AST2500 and earlier).
> > 
> > Instead, add a driver that works in new-register-set mode, to allow the new
> > features, and will provide support for future hardware that will not implement
> > compatibility mode.
> > 
> > In order to support the new mode, we need a DT binding change to reflect the
> > reference to the global register set. Since the binding still represents the same
> > (AST2600 SoC) physical hardware, we continue to use the existing compatible
> > string of "aspeed,ast2600-i2c-bus".
> > 
> > However: since we're changing semantics for an existing binding, we allow
> > backwards compatibility by selecting on presence/absence of the newly-added
> > properties, and fall back to the old driver (ie., in compatibility mode) when we
> > detect a DT using the old binding spec.
> > 
> > Specifically:
> > 
> > - ast2600-i2c-bus nodes that provide the `aspeed,global-regs` property
> >   (present in the new binding and absent in the legacy binding) will be
> >   successfully probed by the new driver
> > 
> > - ast2600-i2c-bus nodes without `aspeed,global-regs` continue to use the
> >   existing driver (in legacy register mode), ensuring that platforms
> >   with the current DTBs remain functional

-- 
With Best Regards,
Andy Shevchenko



