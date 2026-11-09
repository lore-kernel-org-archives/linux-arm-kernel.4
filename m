Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C76606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0TnoU6r1;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HYwbvL3F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QfByDf2RsTrjJm0CVgpMKp92gWvQsy/fjtZd4c4Rb3Q=; b=0TnoU6r17xwCXyZ4lP6V0Euwz0
	I3Z8CdCB9OQ2NTddrZOD3CPJCN0U2zOtT90epHvvK1UEuOBu9GAerWJS0+cgJH8PQlCIRlZC/Zh43
	WBbAjLfGz2hcJFCVyqWc7Jcsgkeq7Swrt4cpi+MA30pdMk0wquANFwRN7EZPHoJpdSlcVvktlbwuk
	XTzIOQVwK11Shx8Kyqa3K+jNQXKkEG42/uxp/WrdWkUt0b02DPLrKppfTgPrzhmeaCG21KJBiIqTY
	Mv1DlI6iyILG+WBp4E+6u5DOPczusMluxNbTk9zR44EtREdeD8W3atqCUxVQaqeMpX+/RLOrn6mgW
	+az5xG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQX0P-00000001mw4-21nA;
	Mon, 09 Nov 2026 21:34:21 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQX0L-00000001mvh-3M1o;
	Mon, 09 Nov 2026 21:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794260057; x=1825796057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+H0fI5ElDVnQFoWv0tS3BdagyzkHK3qkCKRp0pDVItU=;
  b=HYwbvL3F8yzOJmAZww7ZZDfiCzUP0lIysyy7+FRewWjuCoAylievgn66
   8JDYL/fVSyLdr/nzXIpM+Bp0lh9Y5ByLAE2wIJFSX/LUGBszNMW55qPyu
   3JxeNTZCl6HWj4F8SM/av4jZPZ5rdhSGU8H1/p4i7OI+x2RQ9FqufEwB3
   YoG16VAKTif470g8qV4gPmhdlHP+zVn9XJQT4uc5hiCaD2HGsNWD1km8N
   Vd6oiMXqTmLWh9IoZ/s+fkp4s3g54crNtnGRX98y6VSYxEhyu07hyDjcA
   MJVVwEZxQZdyM83flSKDgOf73p/sCvs4RnHVv4vdhx5+ZtsKjTrbQTZ+4
   g==;
X-CSE-ConnectionGUID: YEZtw8SdTB2okOiMFnj9Tg==
X-CSE-MsgGUID: u9D6OIFtTfmfbOy0LCLkgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2863215"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2863215"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:34:16 -0800
X-CSE-ConnectionGUID: vmPDcpCiQWWqL9I9M0mIrw==
X-CSE-MsgGUID: qQnXhozBSuaUZeRIYgxPPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7966257"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:34:14 -0800
Date: Mon, 9 Nov 2026 23:34:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?utf-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Miroslav Ondra <ondra@faster.cz>
Subject: Re: [PATCH 1/2] serial: 8250: Add RX trigger levels for U6_16550A
Message-ID: <avI8VFpnwlK7eadS@ashevche-desk.local>
References: <20261109-8250-select-u6-64bit-v1-0-04bc8332fa34@gmail.com>
 <20261109-8250-select-u6-64bit-v1-1-04bc8332fa34@gmail.com>
 <469362ef-f0c5-45f2-746a-b4a3c51876a4@linux.intel.com>
 <800f8d42-e35d-47ec-bbe6-e437a86d6e70@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <800f8d42-e35d-47ec-bbe6-e437a86d6e70@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_133418_687118_0C591B7F 
X-CRM114-Status: GOOD (  16.55  )
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

On Mon, Nov 09, 2026 at 04:37:43PM +0100, Kryštof Černý wrote:
> > On Mon, 9 Nov 2026, Kryštof Černý via B4 Relay wrote:

...

> > Reusing U6 entry for DW UARTs seems misleading.
> > 
> > We've better mechanism coming up for defining rxtrig in a one pending
> > series so this constant friction with the uart config types can be put
> > into rest.
> > 
> > Please build on top of that other series and help in testing and reviewing
> > it.
> 
> Thanks for the information, I started the work about a month ago
> and not sure if the patch existed before. I will test the other series on my
> hardware. I like that approach more.

+1 to what Ilpo said. Please, make a joint effort with that patch series (test,
review, et cetera) to get it better.

-- 
With Best Regards,
Andy Shevchenko



