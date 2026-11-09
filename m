Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB2D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0l2Htq/v;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=zLzYjUX5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nC1Wszvh4Y9MkwTmdjUSmc1pvfFIw9wR53jTSHBM7fo=; b=0l2Htq/vrZE/TP
	R/XprXZXSZljR1EQbuqNTVWe/EEDN/q26I5JlfOTLt5O5bt2OZtzpsJ4ExGnDquDEQMIPEomt+UqI
	D0aEMNdOEG2pG7DokI7TfGF8LxsKvhjBQZRC5h2vnrfDvkRob63ZOHU0U+o06reWcdNI8aqoMVrXK
	eaatBdsxAZIxj4XlvV37lW0mGbU31hH+R/rkk4nYosyd/yKPowZsJocEVvEkMLmr+Tj6XxslJgWT6
	MnIhE70HcS48hx4rDVPlRJxN4BBuUJADi20usMG9TPgWGDpiSPqFVFzKGKSyWj1vZoVTywPlb9VyN
	co/lU9pKYDHXpetkGXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKtm-0000000068k-0gfC;
	Mon, 09 Nov 2026 08:38:42 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKtd-0000000063o-1dz2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=zLzYjUX5q2OAokroJ266wewJfAlZdbX8Yu8TWv+pWhkhAy0NaATWmXoq6ABRfIAcqU/BUjUsni+RX
	 3U+Ap6P8w9gqen79WBoA/fgS9MmlOTdDK6wAOYG4Bjrl5lZwoPjj0tmKEQk2ZrREqRBsaTFnFwOYBs
	 xwqdMiiGPwh0thZI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af18637478-63243;
	Mon, 09 Nov 2026 16:37:13 +0800 (CST)
X-RM-TRANSID: 2ee46af18637478-63243
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af18637b98-8865f;
	Mon, 09 Nov 2026 16:37:13 +0800 (CST)
X-RM-TRANSID: 2eea6af18637b98-8865f
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Diogo Ivo <diogo.ivo@siemens.com>,
	Haokexin <haokexin@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ti: icssg-prueth-sr1: Fix device_node refcount leak in prueth_probe()
Date: Mon,  9 Nov 2026 16:37:09 +0800
Message-ID: <20261109093500.54322-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <179335102798.3327.13730382084781364050@kernel.org>
References: <179335102798.3327.13730382084781364050@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_003839_280331_A61D3064 
X-CRM114-Status: GOOD (  11.79  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Please find below the additional information netdev-bot requested
for this series.

How the issue was discovered: manual code inspection of the error
paths in prueth_probe() while auditing the SR1.0 driver for
probe-time resource leaks.

Whether the issue was actually triggered: no, it is purely
theoretical. The affected branches only run when the "ti,mii-g-rt"
or "ti,mii-rt" syscon regmap lookup fails, which happens only with a
malformed or incomplete device tree. On a valid DT these branches
are never taken. When they are, probe() fails with -ENODEV and the
of_node_get() references taken on eth0_node/eth1_node earlier in
the function are leaked silently; there is no stack trace or error
message pointing at the leak itself.

Hardware the change was tested on: none, it was not tested on real
hardware. The change only re-routes two error branches to the
existing put_cores label, which is already exercised by the other
failure paths in the same function (e.g. prueth_get_cores()
failures), so no new cleanup code is introduced.

Regarding the Sashiko finding: the same leak in the non-SR1 variant
of the driver (icssg_prueth.c) is real, and it is fixed by a
companion patch submitted at the same time as this one:

https://lore.kernel.org/netdev/20261030085651.1944-1-laixiangwu@cmss.chinamobile.com/

Best regards,
Xiangwu Lai



