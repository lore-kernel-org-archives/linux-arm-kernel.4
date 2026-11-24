Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC06606A688
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QuCMI27z;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CiqT2qZn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O+rpuV/3Cdeqi3olBPq3dLsHItggXZ3BKkKR1WXWVLM=; b=QuCMI27zZfxi3qjjYYlHVlX+dV
	Q+OblgSyFeBxY6LprG4Mnn2gGoV3b5GbZ9M5iNO5kS+x6BvACZsu9Zi7CB5XAfwdX9tuZuM9gNh/7
	t6p7FZqWfO+lCzn+vybbiLYFXZX2mB5x/e6vR20GQPpV//DWRyS5VucH8sP6ZLuhVEJB4xjJACh2r
	HxajFlOvrKCR2rbveD+LEd2wOocQnekkCXULUgV6SGGkaqjyYt4uztN/Ye3yYjc/rmCYu7YmJNC6o
	5lF+gNCWGNn5Ylnh5wSw8OvdGn6aVh/PBvn56OnMoQtKcfKNmTwYqMgGR0hIFMplqeI6oQFLPq9tJ
	C1oQgvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwxP-00000007i3B-2Ukr;
	Tue, 24 Nov 2026 20:17:39 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwxN-00000007i2q-0Eub
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795551457; x=1827087457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vemVSTIihOUQsSm9fN9JJKFg/NjYffet9HHWmoPjrPI=;
  b=CiqT2qZnxY/g6zOkqH0YpvDI69yX4dIVsOLXo57QR+ZkZBUnRe84L/yf
   N/5SBscrrF+ONMnipxcrW3cGf4tTHIQg3oa9rdA6UUllYjLq5WVK/OLXn
   a2qOV3mUDBi421HKJpXPUHIQ4lZ7iyq1Aec1ur9LdhZ2aZIXpfHlJCGax
   RpeAsIOU/y+GPHpQlgDQjnMPrL1iCGY3JqSwbVkdgJlhk/PcOIO8ULsFE
   cy8izMtu4GCldHSmKONuY+eWjxEO5QJ1GsnxUd8l2UC2+GdpUkTrx91mm
   rlWBOySbBInxcygesg1uhw5vy0vdSKVUhDoSHmWRjhSo6oXwSqSnWj1s3
   w==;
X-CSE-ConnectionGUID: fXQ1v4ysSR+YFdFvLVhrrA==
X-CSE-MsgGUID: KsuYO1ZzRFyqHxBh5RGc7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4413232"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4413232"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:17:31 -0800
X-CSE-ConnectionGUID: fpE7LlwrSku8z6M0OuQLOw==
X-CSE-MsgGUID: 4ohg0cV2Q7uBUThxTfPeUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11648580"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:17:25 -0800
Date: Tue, 24 Nov 2026 22:17:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	Arnd Bergmann <arnd@arndb.de>, bui duc phuc <phucduc.bui@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, Joe Damato <joe@dama.to>,
	Julia Lawall <julia.lawall@inria.fr>,
	Li Youhong <liyouhong@kylinos.cn>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] net: allwinner: Use devm_clk_get_enabled() in
 emac_probe()
Message-ID: <awXw07bDd0bX4Mas@ashevche-desk.local>
References: <780975ed-825f-4f9b-8ac2-67664a7a2a2f@web.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <780975ed-825f-4f9b-8ac2-67664a7a2a2f@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_121737_164144_29B0DBB5 
X-CRM114-Status: GOOD (  13.58  )
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

On Tue, Nov 24, 2026 at 06:19:54PM +0100, Markus Elfring wrote:
> 
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
> 
> * Delete a clk_disable_unprepare() call on an error handling path
>   and in the implementation of the function “emac_remove”.
> 
> * Omit the label “out_clk_disable_unprepare”.
> 
> This issue was detected by using the Coccinelle software.

This breaks the order at remove and probe error path cases.
Note, devm_*() at this case will keep just a clk object, but
the actual enabling is done explicitly. W/o testing on real
HW it's hard to say if this order is strict or not.

-- 
With Best Regards,
Andy Shevchenko



