Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811F5606BAB6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HYFpucmw;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rHAkUWbn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oIe8tsNYDsRzQFg3J2rpKh8+KY+zb5Wykm4LdjiH/U8=; b=HYFpucmwB2NRhZcH4Zcd1+ldAB
	97lvsPFiZw1pyrh0aMWCcudMD+GTXn+/wGSgDPkTUIiJXJcHCT4vtw4LpJLjs+JauOTH5goU/TQLc
	zhose/JiEqAFm0oF7fAQ+Iyi8w32iMwBG4tW3X4+QKYeDPCygTNxb+yTwBM4L6Gim82wIQak11/Bp
	/ORwjMbJ3NRTm5nDEHQWvo7nqrcbQBCDrBXqJ3UmnmXEfRaZJ711LUT8JObhW4O6fXDdJ6WpUu+dI
	7k5XCjvyi0TSagshUEvCTtjP+qesfrKU3nfF63cDloT4pl8mChvrJSMWXZMe+k6MCuMcCzPMNEIVU
	Fmjw3Spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtkt-0000000DV59-1DrE;
	Fri, 13 Nov 2026 16:03:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtkh-0000000DV32-15OP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:03:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB8991516;
	Fri, 13 Nov 2026 08:03:42 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9667A3F673;
	Fri, 13 Nov 2026 08:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794585825; bh=oIe8tsNYDsRzQFg3J2rpKh8+KY+zb5Wykm4LdjiH/U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHAkUWbnsG87EaSsWRJnZUOiwdJFcWBWAMR/bFBo7N1n8fxIbeFiGIn4wQWmOGNzK
	 bHV9z02MXIuwXuOXvZOGvlTKDTw51Mzcardv1ryWXIAwbST7id1sjLaVJTfsfS2LLX
	 q1ACZXW9TtK8/xORwMhIWasFJlJxW2eTJqbOeGmQ=
Date: Fri, 13 Nov 2026 16:03:37 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] powercap: arm_scmi: Fix potential stale zones after a
 skipped leaf
Message-ID: <avc02U7K7mXG0PDZ@pluto>
References: <20261113-4e14e563a1-powercap-scmi@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-4e14e563a1-powercap-scmi@mail.sdu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_080347_346059_3779CAD7 
X-CRM114-Status: UNSURE (   6.60  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 10:09:35PM +0800, Guangshuo Li wrote:
> scmi_zones_register() skips leaf zones that cannot be registered, but
> returns the last leaf error when that leaf ends the traversal. Probe
> then fails without unregistering the successfully registered zones,
> whose private data is device-managed.

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

