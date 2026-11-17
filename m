Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CFF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ueJGxD8q;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gGAZ0XFB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hMTRae/7dai+hIUARFlVZIWWrBH0aaFjeRGhcjedEQw=; b=ueJGxD8qGGdNIlCG58w59y3qfW
	vpRZVv7wkya7St+9STvgi3suywVdopyN2yyk+y1nT3mNyJayur3sF4OEl2CRyMCn8hVwNfB1SEUDM
	l/DrmAvSz3ohRfoXwSIlohQE4oWi2TSq2Oo6i7VVK0VHxg0Q57Pza0vv5cjr8eKiwaS1H6qGsFQoJ
	ZLXY3dn+oN2pPDVyLnBvq2GPDduA/xGA0fALnsvF1JgFj+tUY5TXtNBKjAro0BBAtjq2e7LX0Cy06
	QtxsMIPGEXuGTSa3Gnsozzp+l1ZUqqaE79+QXz9ZfRu+XXCvbcfDe0yr+N3YdIdEYO2K+CzZDHwMu
	s58EbNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJDr-00000005vvs-3cPX;
	Tue, 17 Nov 2026 13:27:43 +0000
Received: from out-60.mta1.migadu.com ([95.215.58.60] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJDl-00000005vqz-3GVn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:27:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hMTRae/7dai+hIUARFlVZIWWrBH0aaFjeRGhcjedEQw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794922055; v=1; x=1795526855;
 b=gGAZ0XFB5QNCHerJj3LBLNtoVrV23V2S21pAJ3xVsjvinRE3aCVm6i7Oue0MPbAS8TdiFMBB
 NoAsqesw3fDcTdlL8DfzVwdOuj5vEnNQ1qrPKO3i2kTVWAUlnAer4dAaX+fP34/DYa4tRTbWcEr
 6uOXFSlRZBTnQZqz+QDkBA6s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 07008d2eff61e532;
	Tue, 17 Nov 2026 13:27:35 +0000
X-Mizu-Trace-ID: 07008d2eff61e532
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 21:27:17 +0800
From: Peng Fan <peng.fan@linux.dev>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/8] irqchip/imx-intmux: Fix and modernize resource
 management
Message-ID: <avxWNZii97F9PZE-@fedora>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_052738_095400_0B9D4D7B 
X-CRM114-Status: UNSURE (   4.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

Sashiko reported some findings [1], please wait V2.

[1] https://sashiko.dev/#/patchset/20261117-imx-intmux-v1-0-189e7e0ad98d%40nxp.com

Thanks
Peng

