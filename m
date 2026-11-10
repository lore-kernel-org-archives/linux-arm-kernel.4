Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF462606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gEWhYAkg;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jypLlI9Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pB57B8wW+SEvfaiOl7ycc6ShOq9TASgyNKl6X5D51Yw=; b=gEWhYAkgLyBII216W+0oLQd++B
	egdIIUNWK7G2J5veV8nb/pjMejvKOpH/ri0TeHr5Mq97AacFG7TCy/WJWfydEkREpUejcr3PdGU0K
	tHmEQxSQFB+ohQS94HCjb8Ig9htFq2OnAeDfNM6WMnvHHanMQUoFJ7jpNWtSvkZckqfiPZkcTU3eo
	sPmAq3TnWL9bYE3VVZkskTUvXkwOa4t9CYxPo4aHp6CLQ+qv3wKSJWOzFj3NuFK7AMKgfw3rvIYjd
	TUNGX1F6g7aTrgro2mdzjefhcp3ecRHM1FHL/gzb6/uOiT8t7lndSIuAAFXEzWR4zJxl1C/9WcAis
	gBkdtfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmXu-000000049Yi-3ksT;
	Tue, 10 Nov 2026 14:09:58 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmXs-000000049YH-1mTr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794319797; x=1825855797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=m1MGGQV4qzQITJrJo2OceVWPRzE+TICqoPHwYE9qCiY=;
  b=jypLlI9QQAXJtqVGRBswU0T9B/23na9Rnfb2kxd594LmdoOLT2NfQuIj
   BlOPe1YluFNaO1Mg/FIQVdmudsgUv8wdPWbarnOwYIVWlHwkXohZT5Jb+
   A6nlb0uyahzeS5DOPMUWIgT7FK7iHSdzKBn8Fexr2vakrloMRAplMP1hN
   Yynk2QX5bnD34oICrN5mPpM9zYBSXX2wvFAxKnW9bhN+yQeChOalOsg5g
   YaO7dcIyom6IRf/vVtlrNaByvtnuWDJzC1avJXjhc9G6rve0+bUzwy7lA
   idwslSQDYCKQ8g483CORNY5MhO+iUvKvqfuASmfi0C9pLv8JPPLEmAiT7
   A==;
X-CSE-ConnectionGUID: MIRMAjUNQQqcNJwz18Yl1w==
X-CSE-MsgGUID: nMtvQWAfRtqWWMebBn5GWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3065887"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3065887"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:09:56 -0800
X-CSE-ConnectionGUID: hnkphMxnRqWtT2jmMU07YQ==
X-CSE-MsgGUID: K+4pWKqGRQSoA8y0UQ7tFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8180084"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:09:52 -0800
Date: Tue, 10 Nov 2026 16:09:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
Message-ID: <avMlrXeemXOSR3ng@ashevche-desk.local>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <avMg5XmU8uSzPR4s@pluto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avMg5XmU8uSzPR4s@pluto>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_060956_497050_335171B1 
X-CRM114-Status: GOOD (  13.25  )
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

On Tue, Nov 10, 2026 at 01:49:25PM +0000, Cristian Marussi wrote:
> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:

...

> > +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
> > +{
> > +	const unsigned int *elems, *pins;
> > +	unsigned int nr_elems, nr_pins, i;
> > +	bool pin_only, gpio;
> > +	int nr_functions, func, ret;

> Beside nr_functions, cannot all of these variable definitions be moved
> inside the scope in which they are exclusively used, i.e. down inside
> the for-loop ?

While it can be done, it's not most recommended style. Is it already in use in
this driver elsewhere? If not, don't do it in a single function. Same if it's
used in like one or two out of dozens of cases. TL;DR: be consistent in the
first place.

-- 
With Best Regards,
Andy Shevchenko



