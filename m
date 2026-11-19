Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225CF606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fEm/PzxJ;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=vM780bDg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iCZcK+Xk9vEKsk+p4nxjQUbosFq7NZ1ptOlpIIJy0po=; b=fEm/PzxJKyhRzl
	wMLCslzAx8vesNsw5Se8DwFlvRB0Uxyg2sbA9n1T3FzSx93jHVaqJL1H6Z+iHg/F4pBHFS30ZlPMr
	mq6Nxs5VxIpRBsUcD6p0qgcSlF1OhNGIcWXslnOWzpVDSleL4EhVBxzDUu7lQhcV5Zxs0Nxz5Vj3r
	P3CRrpwNlGswRNTGlyqjlKEaG9lHg9qhl+MAtbi8KrfvyPpRU/iT7x9Jz7bXQ1Zjs/N78fiDeVTGL
	XbM2ObBJTvkeBLT58sC9dUPlOm9oJ8G3WngTZdckEgKPYn4Xx7ZJCH2x1Un9eBlPgFiWI7zS42uqq
	LpIwJVCHS9Qdqat6LXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6Pd-0000000CvOp-0A21;
	Thu, 19 Nov 2026 17:59:09 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6PZ-0000000CvM5-1zPe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795111144;
	bh=xsVNIntK1rJNk6kiLRX09ac8CvYS2CGxELxLEhw8/2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=vM780bDgvP7sJiIA+q5wqHHmA3tP7bquxsKL/hA2VDi0Dyh4vGhEG6dwxpG4xUMg8
	 mnbZtRfY9IhGA+bUnVx3tS8mISD2Ecjgk01yzknZSh0hLm+/9FwA+jVt2JaF62jiIT
	 9lsVF4ZM+5kPCj2b8xbAPSRfRkArVxzdCvwMbRt6Aj8KY7wJsdL0pv958rMzcG40yi
	 mKl1cpc22q22P0KCOqtgrPsNcQxssRH2nfwUCiPKVpWmq9FAeXBnf5JtRS08wZSTVd
	 cbJePIAHH6SoQxeEKq7XqSx3MNI5IfVs1JXxozKEHoAr2kdb7psSiq8XDPWryCO7m4
	 rSe+bhdvuqAYA==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 0E3F08D7D3; Thu, 19 Nov 2026 17:59:04 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Yao Zi <me@ziyao.cc>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5
Date: Thu, 19 Nov 2026 14:58:22 -0300
Message-ID: <20261119175822.1033074-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <avwr7G83tUvZ1HP2@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com> <20261116091757.1656602-3-magnusleatti@kernelriot.com> <avscVrGbi7mFicuz@pie> <avsebFtnIASV-KpV@pie> <20261116164847.3432765-1-magnusleatti@kernelriot.com> <84566846-2ddd-471d-8f4f-068ef10f522d@lunn.ch> <avwr7G83tUvZ1HP2@pie>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_095905_574571_5EA2EF7A 
X-CRM114-Status: GOOD (  12.41  )
X-Spam-Score: -2.1 (--)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yao and Andrew,

On Tue, Nov 17, 2026 at 10:26:52AM +0000, Yao Zi wrote:
> I think it's likely not BIOS setting this up, since the chip's behavior
> is the same when a reset is manually triggered, according to Magnus'
> test.

Fair: BIOS ran before my dump, but if I trigger SYS_RESET from Linux
with no driver, the chip behaves the same: OOB_WOL_CTRL_DIS clear,
GMAC_PMT = 3 (power_down | magic_pkt_en), eFuse MAC in filter 0,
WOL_CTRL_PKT_EN clear. No BIOS involvement, and v2 counts on that

Yao, on power failure: yup... it fails to wake. I tested it today with
the v2 module and "wol g", BIOS set to stay off when the power comes
back:

  power-off                 wake on the eFuse address
  power-off, cable out, in  stays off, no wake in 4 min of magic packets

So if power drops, it just won't wake until it's been shut down cleanly
through the driver again.

FWIW the vendor driver does the same: wakes after a normal power-off,
sleeps through everything after a power loss. So its the hardware and
not something a driver can fix.

Thank you both for your time! I will be sending V2 in the upcoming days.

Magnus

