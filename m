Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444EC60A5BC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ezs9+F5p;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SyA5/nIq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JRlTB/Oq0MlZ1FntrVFpPEXr0i4FFsjXVYH+2p/mtY8=; b=ezs9+F5pvwyrihggSbShVEkt4F
	PojSI2+n1A8OxCsJ2aIKmeCmSrKisiCrd2ZkZlqkb4ai6dsjAO3YrodNbUMHUUTvUL8F9i3KhGVsm
	S+ypFTleC2yL0E6xVCrbtlvVGwKpDVBFGxljOBi0QV2BXpmgeVd25CRSjS7L+8i5NPwh1ceb32D+t
	wDSx3NYY9BXGIk+opQaAQCLSPkqFhQOFdzl89ugRDJfm+9Tzj+MenVxEe4wFwrcmqcYdoy5+kBO8R
	+PABa5iKDYNS9P/7qJr1hCUvrhP4A8nbuCSOrmQTNKSE2uFpKFz82EONIc3Frt7zKgG28Vvfb8WKP
	ibjs+xPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmZv-000000049oY-0ZNr;
	Tue, 10 Nov 2026 14:12:03 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmZs-000000049nr-0Ewk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794319920; x=1825855920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qNtMH7l1kU6ZZbKE7+CnTRLFKr9x7riNWahstWq+vdw=;
  b=SyA5/nIqpYQmyQOREPRL/ZZ/30ZIyRSDSN29juuIxOzC4+lGHc7miVRt
   c2oLzPeZ4U1EXeLwaxbjPlxtKA1/A1lsmoP45dc8jdRF1gJWjyXgTPO3B
   /D7OhpKoIxD/BZwqehqVmlwETEbSs907G6gTyOY8M0LZIxBKbFcSrFxt0
   YDJDRerxrl1uIhcizRzTVtarhJrnoLHsKVvonSnnNZjStTY49CZbLY5Sh
   aqrRsPxP2vmIDHs/1ovf/pUJGFIVqZDjK3mv4xm8Bf411cMQkE7mezfyJ
   1zFL4Jv7W7xfK9nnvy3Icxf5coouDdpfcG2AUPayAeY0owBr+trTkN8wM
   w==;
X-CSE-ConnectionGUID: MrQFzdTcSAy2KIq0ZOjTGA==
X-CSE-MsgGUID: 2yoPzPiSRhm+DEY3VpI2dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3056129"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3056129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:12:00 -0800
X-CSE-ConnectionGUID: 9jp5mXF7SQ6yZQExcMRuPA==
X-CSE-MsgGUID: FjuImkjfRqe1iQ4XjmnGHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8303202"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:11:55 -0800
Date: Tue, 10 Nov 2026 16:11:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Long Zhao <longzhao@ambarella.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <avMmKJpczepWTRdc@ashevche-desk.local>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avMM8z-LYncKS8ip@x1g10>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_061200_135735_EE227192 
X-CRM114-Status: GOOD (  16.22  )
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

On Tue, Nov 10, 2026 at 07:24:19AM -0500, Brian Masney wrote:
> On Tue, Nov 10, 2026 at 09:46:29AM +0100, Arnd Bergmann wrote:
> > On Tue, Nov 10, 2026, at 09:27, Krzysztof Kozlowski wrote:
> > > On 10/11/2026 09:23, Arnd Bergmann wrote:

...

> > > There is a build dependency - DTS needs clock binding
> > > header - so it has to be second, unless the dependency
> > > is decoupled.
> > 
> > Ok, I see. Let's go with Brian's suggestion then.
> 
> I see that the pinctrl driver was merged into v7.4-rc1 and also
> lists ARCH_AMBARELLA. It doesn't cause any build warnings or issues, so
> I'm fine with this too just as long as ARCH_AMBARELLA is going to appear
> in the tree.

We have a bug about dangling / orphaned symbols in Kconfig. It's discouraged to
have them. I dunno if we get the checker patch being applied (it was some
activity a few months ago).

-- 
With Best Regards,
Andy Shevchenko



