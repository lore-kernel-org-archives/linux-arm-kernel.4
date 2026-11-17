Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52316606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 10:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VhjXjb1Z;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=INKXdEZy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CaJ1rJLSwQEJ3xQnkbS25PPEL12zni1uFP562brZmQ4=; b=VhjXjb1ZaHbRGjTjER6l580xB7
	4edwxh1+QI3rzrMeI74uaciSfAGQ7vPGoa311F/edONkdy+HFSOx4e9Iv3txrGhIyWcbrdLiXe9rF
	lbyZ0nMQr5iQ/kC9F9YSOUrn/KdHsUrSZGQdLy9T4kLkddEy9ZKJG9ri6ijXy6AuNE1KhKTeT+WqI
	z0cLFID4jrTkZhjZH1TzkWjTRRX8Wfr0f8sgmA+7P3HiW2/DObWfJvGSoArAc1YFlMWB4yQ+71F3E
	qaqyQcPFZmL2l96j/uZyZXHzJno6q2rh58g74BnBpF2M4IthsnMfUxrMixjZ0czW+Bs2b1dvmqAbj
	xA4vz9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGPQ-00000005GQA-0WT8;
	Tue, 17 Nov 2026 10:27:28 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGPM-00000005GPF-2xl6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 10:27:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794911223; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Clivc2j+q5iAoTxjufxOwW0bo9td3gtNSStaakH9pymqYeMRDRmgZIttaIqehx22kg03Y6iknKn1NiNtyjdZmoyC9wOy3+J6ukoTlmuh34lQOHXyI/nMQQo7Ewk75/EChGm3o9Nsb8RrJon1EbK+ysdJxged/YTtuyqf1hoZbw0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794911223; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CaJ1rJLSwQEJ3xQnkbS25PPEL12zni1uFP562brZmQ4=; 
	b=EtSjqUUSE6CJPBZYq9sEyKfLY5odPpgCXRpaTtixpSx61m9JdyX+nHpuIUvo0T868TyWTh1w/JnjNJlO2z4Ey4pfvtJDzQqIxmcefHn5UeZBOS83gC6tDTMxIoZPzjnT1Re5LfPpccSm9HdX9I9xiSVhFrYItlNMYyshSgsXb4o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=INKXdEZy9k32hIXFyq4r4o92XYBB2kusiyHKlp9yXTRTLIX/Q3AcUkUs6FEOnVl/9MLDyEiLN259SiyyL+4zNyXdBaKO3zcKm/M76KRvp6moc3QnIBdMezjEllMXkRdu4SOnyeeW0iIG8ZUsMD+lJR0Q+GPm7Ox5Oe1Fb6/Na14=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=CaJ1rJLSwQEJ3xQnkbS25PPEL12zni1uFP562brZmQ4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794911222333275.566664836868;
	Tue, 17 Nov 2026 02:27:02 -0800 (PST)
Date: Tue, 17 Nov 2026 10:26:52 +0000
From: Yao Zi <me@ziyao.cc>
To: Andrew Lunn <andrew@lunn.ch>,
	Magnus Leatti <magnusleatti@kernelriot.com>
Cc: me@ziyao.cc, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
Message-ID: <avwr7G83tUvZ1HP2@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
 <20261116091757.1656602-3-magnusleatti@kernelriot.com>
 <avscVrGbi7mFicuz@pie>
 <avsebFtnIASV-KpV@pie>
 <20261116164847.3432765-1-magnusleatti@kernelriot.com>
 <84566846-2ddd-471d-8f4f-068ef10f522d@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84566846-2ddd-471d-8f4f-068ef10f522d@lunn.ch>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.900.72
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_022725_119137_E206AD04 
X-CRM114-Status: GOOD (  17.51  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 02:27:07AM +0100, Andrew Lunn wrote:
> On Mon, Nov 16, 2026 at 01:48:47PM -0300, Magnus Leatti wrote:
> > Hi Yao,
> > 
> > On Mon, Nov 16, 2026 at 03:17:00PM +0000, Yao Zi wrote:
> > > > Does the chip automatically enables WoL and loads MAC from eFuse on
> > > > power-on?
> > 
> > Yes. I pulled the power cable, kept the driver from loading and dumped
> > the registers before anything touched the chip: OOB WoL enabled, eFuse
> > address in filter 0, PMT armed for magic packet, receiver on. The
> > packet wake bit in WOL_CTRL is clear.
> 
> I've seen BIOS poke around in PHY registers before, especially if the
> BIOS has an option for WoL.

I think it's likely not BIOS setting this up, since the chip's behavior
is the same when a reset is manually triggered, according to Magnus'
test.

I could grab some devices with U-Boot as firmware, and check against a
YT6801 addon card, which should confirm the power-on behavior.

Anyway, the approach of resetting the chip on .shutdown() to get WoL
working in S5 should have nothing to do with the power-up behavior. It
only affects whether the WoL behavior is consistent regardless of the
reason of entering S5.

>      Andrew

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.

