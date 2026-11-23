Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CDB606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZEaLoPcP;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BPC4D3ew
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rzz9rMTxPu5h4zXuwInMggFJc9C7/q94I+f+8DTqNVs=; b=ZEaLoPcP0iWA6DAxMOYjl+pfvW
	XNrtVHS5lbey/Z43nCNmnfnfs98JsckeokxyDwyyamOXI3tl3D6n5osqZzZ8Smo/CecOQl4DQ54lc
	+ewmduJJlqdjTF/lIPsD1QbSMOvOFdyiCQb3sQUUKtH71sdYZTibSVDkT5MyU54JP8H4k96JNw92A
	xEIHqJtGTInSA4rR6+jJmy8vJ0CcwdGCOO7jsPl6LkrhsxUZ/7cYjpOihiNkSLjdBYzt5lQCAOIsu
	/YCa9+nxItDSoF8j6qsqXqQuq1M+0I9bYJsTR88ca2I2zL+vKI1ST7Q8BaYzpuaFDF55r3xIT/+b3
	4MT/zQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ7A-00000004a3P-2uAe;
	Mon, 23 Nov 2026 18:50:08 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ76-00000004a2d-3HiG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795459805; x=1826995805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cjeMKRm7en+iyA3bcXvhdG5tSoNAe/JoC/WPf09zNkA=;
  b=BPC4D3ewULvm+L9mcLNqXgkW6hAdY57PmQITA9OEmrNBaJ6qOzOrtl4V
   ZZ8/y0YJEwHYEPcCb7mjtRDldPR7x2YHnWc28GYjFCiYldOdRk5m7gA3P
   25SzXDnfoais4RDaaA87TgY24bSQtXznmDm/rOrI4M/lUO8kqE9aH5nJ1
   kHiBsDMtMazKHh+pilDUoMccXAFO2xeM4A3e2vN7qqoMLsR0/ojD7eBfo
   GOQbk0geZ2Spwydx784zh89652+vyTvpP3u+MrkQGAVKmsUXky1kQUn0H
   en+nyDnrMbasdZ6ob/ku8wNOwa8Gh05hVX0jV/msiFF+MmR+MpEbCJDXm
   Q==;
X-CSE-ConnectionGUID: pPxwGKqvTtakqarU1iKK6w==
X-CSE-MsgGUID: NDHL2OpxRamhqfxLe4qk2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4176998"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4176998"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:49:56 -0800
X-CSE-ConnectionGUID: zr2t5mSNRrKoMsxKB4AbwA==
X-CSE-MsgGUID: Ee1aOYQAQ5qEWJP8jTM6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11776613"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:49:52 -0800
Date: Mon, 23 Nov 2026 20:49:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: imx@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Johan Hovold <johan@kernel.org>, Mark Brown <broonie@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: spi: imx: Use devm_clk_get_enabled() calls in spi_imx_probe()
Message-ID: <awSKzgNGzuxl2OXO@ashevche-desk.local>
References: <895d50a6-3a42-44d2-8625-3b8cba8fbfff@web.de>
 <awR3jGcH97PrYNqc@ashevche-desk.local>
 <797d8f02-2e16-4ca6-bfda-8b6e40742a84@web.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <797d8f02-2e16-4ca6-bfda-8b6e40742a84@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_105004_912549_2AE0546B 
X-CRM114-Status: GOOD (  14.12  )
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 07:24:21PM +0100, Markus Elfring wrote:
> >> * Reuse existing functionality from devm_clk_get_enabled() instead of
> >>   keeping duplicate source code.
> >>
> >> * Delete clk_disable_unprepare() calls on error handling paths.
> >>
> >> * Omit the label “out_put_per”.
> >>
> >> This issue was detected by using the Coccinelle software.
> > 
> > This now messes up with the PM callbacks at remove stage.
> > It's not trivial how to make it correct.
> Is there a need to adjust and extend devres programming interfaces any more?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-api/driver-model/devres.rst?h=v7.4-rc4#n242

I guess you did get my point. You can't simply do what you have done in this
patch, because the devm*() will do something with clock reference counting on
remove stage _after_ the driver.

NAK to this change.

-- 
With Best Regards,
Andy Shevchenko



