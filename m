Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174EC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mfcOsD89;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EF+Hzi+X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nH5gEdl3D5/4uObgUP9+ggGHh8o+1reBAcP3hqYWwcI=; b=mfcOsD89ZzrynH2pec2PlJLsCl
	lV4FvXv/sCXjMjhiYSI4n1nEE+QWeEqmfnDiKKuJqxNoREQWxWqTt1cqly7ENgaHc2pDZf8pir5gj
	MobXD4p/mjyNTpg651FBblm+0FQ9IG21iuYMi6zJNO+BacdKiTzQD89tshZMMksPFOF/P7LNjtrei
	z3PTSkVwHbc5qsEXVpZzlg3zanLfHad010kq4emHbt+sVeQMJSxXNcDndmw83rsp/fEqp9PXLJEkZ
	1yV7ogaU7KddLcK7UrPTakl1ik02MBCBsIRq+JQeY80gcviBQkyRRzpAgb5PTOnuLcGilktGXNAlc
	7iOtY2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcwE-00000008YjR-0wxV;
	Wed, 18 Nov 2026 10:30:50 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcwB-00000008Yiv-1DTy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794997847; x=1826533847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Uowatdy9kwN6q0cDgYxR39/boEiV8TiNmIQ/16Ndc6c=;
  b=EF+Hzi+Xx/XNUJu03mgc+SsUdTC9x6zh7j4u+X7CL/Hnv3fFKjJ7BoEX
   2Zl/0WQW/RAmAtSi/aQOrFIIrbkc8Ap2JeTnpEbTp+7Vs3PHWdedzIhW0
   r0OZeeQoOKUlF9/4pMDsgF9/Ns5MhWoeCOLgBPiUF+xGyRwgJEkXAGsTl
   DE5tZDDJ38PujTY3cjWbvMz8HE/+znsbhT/ahVh5qpVA8WFeIiwKeDSA6
   Vld/6BCauOkqYgQm54v8q4LkN2oirmyGamhVaXkHzomRuRjH8uo2UwyFt
   Efdy2x1sGmFYup6LhfPuNmHvk8hEcTTpYxV7v7zWV+ai9vz8J96qL3yfb
   w==;
X-CSE-ConnectionGUID: K8/LUnzQToC5SBbZwI1udQ==
X-CSE-MsgGUID: 4kELY2SiQK2IgzKAWs8CFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3701497"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3701497"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 02:30:46 -0800
X-CSE-ConnectionGUID: jSpDPBd2RUuwCG2wexdIbg==
X-CSE-MsgGUID: sgEv5KGrQ3SzCnCFRq3NGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10351746"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 02:30:42 -0800
Date: Wed, 18 Nov 2026 12:30:40 +0200
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
Message-ID: <av1-UNzN0bwW2Oo6@ashevche-desk.local>
References: <20260623-upstream_i2c-v33-0-6d5338fc56ed@aspeedtech.com>
 <TYZPR06MB79202A00572E81CBC29399F4F27A2@TYZPR06MB7920.apcprd06.prod.outlook.com>
 <av1mTEtWCf8zFbjp@ashevche-desk.local>
 <TYZPR06MB7920EE43F93A37A61E139CD4F27A2@TYZPR06MB7920.apcprd06.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYZPR06MB7920EE43F93A37A61E139CD4F27A2@TYZPR06MB7920.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_023047_376395_17D6889C 
X-CRM114-Status: GOOD (  41.75  )
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

On Wed, Nov 18, 2026 at 08:53:36AM +0000, Ryan Chen wrote:
> > On Wed, Nov 18, 2026 at 08:14:51AM +0000, Ryan Chen wrote:
> > >
> > > This patch series has been stable in our testing on AST2600 hardware,
> > > and we have also received positive feedback from customer testing.
> > > The issues identified by Sashiko have also been addressed.
> > > I plan to rebase the series onto the latest upstream kernel and submit v34.
> > > Before doing so, I would appreciate your feedback on whether there are
> > > any remaining concerns or blockers that we should address.
> > >
> > > If there are no outstanding issues, I hope the series can be
> > > considered for merging after the next review.
> > >
> > > Thanks for your time and support.
> > 
> > Are you asking me or Andi Shyti?
> > If it was to me, I have no time for this right now, sorry.
> 
> Thanks for your response.
> Would you happen to know anyone else who might have time to review it?

Not of my knowledge. The general practice is to help maintainers to review
their queue(s) and in response somebody else hopefully reviews yours. If you
completely rely on maintainer to allocate a time to review your stuff, you
might wait for months these days (mostly because tons of AI slops attacking
the LKML). I might be mistaken, but I haven't seen match of @aspeedtech.com
in the Reviewed-by: tags. Probably that's what you should do better?

That's what I got for the entire history of Linux kernel

$ git log --no-merges --oneline --grep 'Reviewed-by:.*@aspeedtech.com'

51d0f5020dee crypto: aspeed - Use memcpy_from_sglist() in aspeed_ahash_dma_prepare()
dba7567c2fbb usb: gadget: aspeed_udc: fix device address configuration
aba59ce109de peci: aspeed: Clear clock_divider value before setting it
4dc44aec28c8 crypto: aspeed-hace - Use device_get_match_data()
9ee8fbc05ef0 spi: aspeed: Use helper function devm_clk_get_enabled()
eb33108858b6 crypto: aspeed - Fix modular aspeed-acry
7484a5bc153e drm/ast: Fix start address computation
aaf16cdca641 crypto: aspeed - change aspeed_acry_akcipher_algs to static
f104b2169e68 crypto: aspeed - Replace zero-length array with flexible-array member
83045e19feae usb: gadget: aspeed: fix buffer overflow
70513e1d6559 crypto: aspeed - Fix check for platform_get_irq() errors
dc377e013bec crypto: aspeed - fix return value check in aspeed_hace_probe()
efc96d43ec38 crypto: aspeed - Fix sparse warnings
31b39755e325 crypto: aspeed - Enable compile testing
9deb10cf160e ARM: dts: aspeed: ast2600-evb: Update I2C devices
70cdb930f7e9 usb: gadget: aspeed_udc: fix handling of tx_len == 0
3d393f0303b5 usb: gadget: aspeed_udc: fix missing spin_unlock_irqrestore in ast_udc_ep_queue
6fd45e79e8b9 net: ftgmac100: Disable hardware checksum on AST2600
fea289467608 ARM: dts: aspeed: Add secure boot controller node
8812dff6459d soc: aspeed: socinfo: Add AST2625 variant
d0ec795c8c27 ipmi: kcs_bmc_aspeed: Optionally apply status address

But even them are "aspeed" cases, so you looked at the code written inside your
company which does NOT count as help to the maintainers with their queues
(okay, it counts, but with low priority as these are not 3rd party reviews).


> > > > This series adds support for the AST2600 I2C controller “new register set”
> > > > implementation.
> > > >
> > > > The AST2600 I2C controller introduces a revised register layout
> > > > which separates controller and target functionality into distinct
> > > > register blocks, and extends clock divider configuration and
> > > > packet-based transfer support compared to the legacy mixed register
> > layout used on earlier ASPEED SoCs.
> > > >
> > > > The current driver implementation for the AST2600 I2C peripheral is
> > > > through the hardware's "compatibility mode", which exposes a
> > > > register set that matches the previous generation hardware (AST2500 and
> > earlier).
> > > >
> > > > Instead, add a driver that works in new-register-set mode, to allow
> > > > the new features, and will provide support for future hardware that
> > > > will not implement compatibility mode.
> > > >
> > > > In order to support the new mode, we need a DT binding change to
> > > > reflect the reference to the global register set. Since the binding
> > > > still represents the same
> > > > (AST2600 SoC) physical hardware, we continue to use the existing
> > > > compatible string of "aspeed,ast2600-i2c-bus".
> > > >
> > > > However: since we're changing semantics for an existing binding, we
> > > > allow backwards compatibility by selecting on presence/absence of
> > > > the newly-added properties, and fall back to the old driver (ie., in
> > > > compatibility mode) when we detect a DT using the old binding spec.
> > > >
> > > > Specifically:
> > > >
> > > > - ast2600-i2c-bus nodes that provide the `aspeed,global-regs` property
> > > >   (present in the new binding and absent in the legacy binding) will be
> > > >   successfully probed by the new driver
> > > >
> > > > - ast2600-i2c-bus nodes without `aspeed,global-regs` continue to use the
> > > >   existing driver (in legacy register mode), ensuring that platforms
> > > >   with the current DTBs remain functional

-- 
With Best Regards,
Andy Shevchenko



