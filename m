Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tcQu1miK;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eSbP3CbG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BGorJs6MAne/EhbfWhhLdgvrIugkfOpSJMie/q8kNWI=; b=tcQu1miKrdgTdBsgeMWyFOD3Rg
	BbRzqn6yuw6mbACXHCzyPlwLMfU2Mp+tMKzB8w7+HgTan+Vpy8new4U+g+qSA4zCCpRzv1a8y1hD6
	muVjyBAnZtPwe4hVbxffOENQCO4i0HCOXE09TcTF2/9kjT/6vpZB+Nxp0xTBoBX4gp58YSjW/9x3Q
	Q8RtjQL0c/RUYy3Xdz09Yqk+FoVo8/0IjFxkxHsI6+rxW9yAfEE4IeFjRpbEJbsdlwaJoCiWfWNV9
	DLZRKOEE73e5mBGzJf0+opTznA+axVzZVSxiFYYsMsAX2+bdpV2FrDTjhBzPZv64cTBpJQ2OrUqRG
	hI0VEuCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXpV-00000004MNn-1vzU;
	Mon, 23 Nov 2026 17:27:49 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXpS-00000004MNV-3X0h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795454866; x=1826990866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BTSVDrbAJDTCXRKEQem0cmfMprjd3jaaHHt/48c53dI=;
  b=eSbP3CbGHAnQHZFYGJLFyMshITGP5K/OCFtxZ5o6PUvkcVebZM5Sf4I+
   gwE37CngAzVuwRK81pTywUbAtVwe5h5KZOalByCIvKUuqTYoSxgshkH96
   UPiYRIQTInpd5rPZoqdniuBdRzWEZejPGg35nNhL8FOyszzyqqeCwOpg/
   V5jMIiTGJpBMtp0XVbPCPsCV6Q1+vfmb50Xll9Wxf/tBJHVjNR48Il18j
   n3vpMpxfwim9PUqqGFzhEmD8t0feXcxCotf5kNlrUFTI5EOrPpjI89dE3
   gJDrkcMkgZPzvBIrmMRd2wcfh7/fn0aVOHhyZJ7TlwbpZkhkAR4WuwxSE
   g==;
X-CSE-ConnectionGUID: q0iUeBKqTwaNAUDSdc1/kg==
X-CSE-MsgGUID: DbO4pe2YQoCvbORf1sFw/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4160038"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4160038"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 09:27:45 -0800
X-CSE-ConnectionGUID: EJOu3Ye0QOiLP7SCRiYRsA==
X-CSE-MsgGUID: Udz6c8q8TN+hoMFsvXLt0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11714619"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 09:27:42 -0800
Date: Mon, 23 Nov 2026 19:27:40 +0200
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
Subject: Re: [PATCH] spi: imx: Use devm_clk_get_enabled() calls in
 spi_imx_probe()
Message-ID: <awR3jGcH97PrYNqc@ashevche-desk.local>
References: <895d50a6-3a42-44d2-8625-3b8cba8fbfff@web.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <895d50a6-3a42-44d2-8625-3b8cba8fbfff@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_092746_937736_B064EB24 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 23, 2026 at 05:23:12PM +0100, Markus Elfring wrote:
> 
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
> 
> * Delete clk_disable_unprepare() calls on error handling paths.
> 
> * Omit the label “out_put_per”.
> 
> This issue was detected by using the Coccinelle software.

This now messes up with the PM callbacks at remove stage.
It's not trivial how to make it correct.

-- 
With Best Regards,
Andy Shevchenko



