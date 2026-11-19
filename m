Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8F1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VQbfrq/h;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWjn9KWH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/6d8JpJvsm5E+CxxvIOJP8Z2ErAigEBUqVsjQpPuLoU=; b=VQbfrq/hhzKG9LVfC2cWUVprsx
	vbLTm2B4acPnhpITN24UyKKeSLFSBFMkq4aSULdhHuFKf8hbvntf8+CoASsPiizF0i23LXW4iKhix
	VR0bzNH944e8snJvaV2Uo5z+HYqyyyxY78V6FBNMZK9hcGlXglzOcwBemHRTnsghwLl2u31VX7QFv
	sNlORiVmO1FxCyyIVMCtHi4HwBj9CqbhFSa5mD1PtBtSkPnoBpvo/gcdNyWfq8KfaKo8JGGGZAbhe
	RXzf29b7CiOUJ30gq8y1HlT9inBOwbQBdtaQ0HhOzVW1tmxi3u1oOEPEui2+7VvrG/K43vvQJMckE
	D9dENX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzHr-0000000BXdQ-2u8J;
	Thu, 19 Nov 2026 10:22:39 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzHp-0000000BXct-2FVL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795083757; x=1826619757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sxqRokLTTP1WzLKQkGtBUXqw1JiewEaY5o+OWISfVtU=;
  b=lWjn9KWHUe/gVt9dZCB/F7gndvUukupi1Kj8Md7yJjDAiyAtsJ0DC3wi
   wWYFLeERJxfsD3VSF+xgfaDvgMjs+w/ASrsZVYp1JoFELXVevzO6BYJqz
   4uSAGBcObhbj+ETklXPGRpf3cUT1lG4j/N3r21kSd2YY7kicUOiTq0koD
   NeJHlpqQLY7blshYyh7NI0JNbPul++n7YiS5M2b7XWT5+csq4UvR7KfMS
   pRuWNHoQP8p/p+99Da1EOj1vfmVlyzq+LK/IbhDDq6WLKL6jN8000rSJn
   5ZlMnjRQZHkPn3XGwbZQnkK0gTp6IJxTkNlTWTq7vKShwdxyasMG8lKa5
   g==;
X-CSE-ConnectionGUID: JH9Akai+Sf6+qreoaFNywQ==
X-CSE-MsgGUID: pB+Zw21uRCyeBwqVl6gUag==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3966032"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3966032"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 02:22:36 -0800
X-CSE-ConnectionGUID: 12qW9BOATrS2WfXj5AnY4Q==
X-CSE-MsgGUID: 5EN8y2AHQxerqRKpFqhD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10731979"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 02:22:32 -0800
Date: Thu, 19 Nov 2026 12:22:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Brian Masney <masneyb@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 4/6] clk: ambarella: add CV75 RCT clock controller
Message-ID: <av7N5VMXS6OiNYrh@ashevche-desk.local>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
 <20261119-cv75-soc-v12-4-e5a03cca8b05@ambarella.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-cv75-soc-v12-4-e5a03cca8b05@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_022237_612924_7832A671 
X-CRM114-Status: GOOD (  13.21  )
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

On Thu, Nov 19, 2026 at 06:13:22PM +0800, Long Zhao via B4 Relay wrote:
> 
> Add a table-driven CCF driver for the CV75 root clock tree. Register
> the core PLL, AHB/APB fixed factors and UART0 composite clock, with
> osc supplied via clk_parent_data.

...

> +config CLK_AMBARELLA_CV75
> +	bool "Ambarella CV75 RCT clock controller"
> +	depends on ARCH_AMBARELLA || COMPILE_TEST
> +	default ARCH_AMBARELLA
> +	help
> +	  Say Y here to enable the Ambarella CV75 RCT clock controller.

Tell a bit more when it's required. For example, if it's necessary to boot the
system or if it's just a bunch of some peripheral clocks that don't affect any
basic stuff. Note, checkpatch complains if the help text is less than 3 lines.


...

> +static const struct cv75_pll cv75_plls[] = {
> +	CV75_PLL(CV75_GCLK_CORE, "core", 0x000, 0x004, 0x100,
> +		 0, &cv75_ccu.core),
> +	CV75_PLL(-1, "pll_enet", 0x520, 0x524, 0x528,
> +		 0, &cv75_ccu.enet),
> +	CV75_PLL(-1, "pll_sd", 0x4ac, 0x4b0, 0x4b4,
> +		 0, &cv75_ccu.sd),
> +};

Now it can occupy less LoC.

static const struct cv75_pll cv75_plls[] = {
	CV75_PLL(CV75_GCLK_CORE, "core", 0x000, 0x004, 0x100, 0, &cv75_ccu.core),
	CV75_PLL(-1, "pll_enet", 0x520, 0x524, 0x528, 0, &cv75_ccu.enet),
	CV75_PLL(-1, "pll_sd", 0x4ac, 0x4b0, 0x4b4, 0, &cv75_ccu.sd),
};

-- 
With Best Regards,
Andy Shevchenko



