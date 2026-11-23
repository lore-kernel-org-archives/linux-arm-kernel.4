Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268E4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mgx72bza;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m0FxNPI4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uFotz/PBNoJ86Mzc+Vb7F9h81RpsnbNUlSTRRVj22Uk=; b=Mgx72bzaTh39H32g40XKm0M7xM
	e2gPRlcl5NCbX21DFicZfZPcq/4vp4WsIJrVmtOmVES+KSIC3fffu480YcGxw9kyH8cjzK7BBkU4x
	vNzr606U+jQMfLNUITlIroAvijJ/pwhEtvTLMArUud7PCi3GDIUzr9vl8EQ84gMF10C4ZFW6He9Ao
	JwYuAtC4y2nvHLYsYVq8bZJnFcpJuBOTIv26N/ujgbCrCpgUyzANTnjFK/RX3vqEdQ6NhTVhcowxX
	hKYK9AJlB9Je0OjYx8o+4H0FYRMQdYlPc7C+R2GaTh7W6rlvMnkDcvHP9WFYiLxp4yPwAJvLRcbqV
	CE/fsYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQv6-00000002tHb-0ijl;
	Mon, 23 Nov 2026 10:05:08 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQux-00000002tDf-3poa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795428301; x=1826964301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dub71eKiV2/3YtfuEZPw6uumWMkbGA+kBpd2hRXyyp0=;
  b=m0FxNPI4jYhyrNp0Gydcno4hk6aixwzadOTk9kZn6nZFqf+OFbf+Y/vm
   eaRvbI0TC90o3//fPS0B+FsirSXQfcxfsOqBznGoGPEfIVztYtheESR++
   YLnn7wC8197tPxD79gVFl1aFObxaStPaRbMKV9muRAopSO+KYZROUrc6v
   ls3bOicuadQsQ9m5pO/83ETEnoFck9bxXx+Eq72HlO5XZulInfN6OKPUl
   17vPA69rnSdISJ8viGcHxoAVUx7ixJWJOXdlSMGSQND6e+FV1QQH0tOG8
   PAega+YEWx8QNhsImhulgqaRiIjp7x70QYruuHZ8TRXyjDvgLyDnvfiaX
   A==;
X-CSE-ConnectionGUID: PMUWlsnBQ1KYarjYHvXSdw==
X-CSE-MsgGUID: HIJbN7uCR1uRYhL9dMQv6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4242403"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4242403"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:04:56 -0800
X-CSE-ConnectionGUID: B65L1yQORU2006WM5Pr7Jw==
X-CSE-MsgGUID: EAKfBXh8Qhm2TX6UL47YEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11462982"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:04:51 -0800
Date: Mon, 23 Nov 2026 12:04:48 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com, amin.gattout@gmail.com,
	antoniu.miclaus@analog.com, gregkh@linuxfoundation.org,
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] iio: adc: at91_adc: pass struct device to
 at91_ts_register()
Message-ID: <awQPwFIWTO5ktbhL@ashevche-desk.local>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-7-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123070101.53868-7-abdelnasserhussein11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_020500_060619_5B04CD57 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 23, 2026 at 09:00:59AM +0200, Abdelnasser Hussein wrote:
> The at91_ts_register() helper only uses its platform_device argument to
> obtain the parent struct device.  Pass that device directly and simplify
> the function signature and its call site.

Perhaps Suggested-by: ?

-- 
With Best Regards,
Andy Shevchenko



