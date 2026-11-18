Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC98606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d8oPcDvp;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=abW4jvFc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aTn2TCJftFrQcjFW3PjA+4u4l+dCEluOrUERM1gp3h8=; b=d8oPcDvppnCsi1lkRrYjhg9X9E
	rjRXBSb38rhAHv+3iKiUcr2heAiIAdoXMkMub6sNON53jQFlFIOoUzncNXDlxZRf1ORYBvr3LZRYr
	rDRKospw97of/30+0VjlC4mbjZvHyryX9E6Pa+98w+XlmG1Gs589NOl1YFEmw/nzOq/tt7J+wLVba
	gc0aI8HEsKlassdZQ+R4zc4f4MRyKMylaqZ/0xwLlvlSzy6iKqZYRAwZT9d9vn/94OKwbJBdgcAOD
	p13PYYc0eLDOuRE+a6WvGquvc+128q2GE02R5T3J4DABaAKTZ+AZ4KRCgqDGFWenF5NgWa1/FyRpM
	q1vsIHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdu3-00000008ihb-0IIl;
	Wed, 18 Nov 2026 11:32:39 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdty-00000008iff-2ReZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795001555; x=1826537555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NFnWDBhLRuLnoG+Wd51C14eK9xiBcw4DRsn9WMOefmI=;
  b=abW4jvFc7crgpcg/T/MC4I+64X0OaBgz3Gut+gyqA03Wm6UAsdF4PIHB
   BW4oWi9KNdYbqp7p9RtbuK8zwqb40Rp8oYRNP4a+e0eypTk174vhE6TPZ
   PDxuxma6ZfTDcQd9R4Dm/6jRy+KNzJSI3OAY3YIycNKBZHfL/kOZrTTJf
   Ls+TktquHhLayWDc2Lio+XtALMlfqabRPt2/wN0GE6CmB1Pfq8BLaqPst
   45mlnAxT2Z7FMeKgULjd6oDROhZ/5M9TTkjbXERN/y2lnoOn7sozvix1E
   ntl9xGxO5mQBAwf8Aw332h7nOCZEnwIG1TD7h9S+TMfePo1ziR5gO+Ef2
   Q==;
X-CSE-ConnectionGUID: 39rLXvodSGOrOLS+Jx89HA==
X-CSE-MsgGUID: nlutFj8iQSajyo0UjziPqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3655558"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3655558"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:32:34 -0800
X-CSE-ConnectionGUID: Znnbo5KrSmmzYywMrCBbGA==
X-CSE-MsgGUID: il3ajXlvRVeG50ClETylRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10489712"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.243])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:32:31 -0800
Date: Wed, 18 Nov 2026 12:32:24 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:XILINX VIDEO IP CORES" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
Message-ID: <av2MP0VlOKC5RUXk@mdjait-mobl>
References: <8c5500e70fcd2b4da35e985b9f8a976afa1991b0.1794999782.git.michal.simek@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c5500e70fcd2b4da35e985b9f8a976afa1991b0.1794999782.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_033234_654490_7326C507 
X-CRM114-Status: GOOD (  10.53  )
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

Hi Michal,

On Wed, Nov 18, 2026 at 12:03:04PM +0100, Michal Simek wrote:
> There is missing return value check from clk_prepare_enable(). Fix it by
> using devm_clk_get_enabled() macro.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---

[..]

>  void xvip_cleanup_resources(struct xvip_device *xvip)
>  {
> -	clk_disable_unprepare(xvip->clk);

so the xvip_cleanup_resources() is empty after removing the
clk_disable_unprepare() call.

It is also called in xilinx-tpg.c and xilinx-vtc.c

>  }
>  EXPORT_SYMBOL_GPL(xvip_cleanup_resources);

--
Kind Regards
Mehdi Djait

