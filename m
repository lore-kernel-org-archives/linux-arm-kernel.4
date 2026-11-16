Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EE8606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4d1SHpkg;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=niEZmZ8C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vfyJOsUskHlLJmN+D44oLPMzWH54O2TfU7FlES5/KAc=; b=4d1SHpkgjjnR1a
	ZzcFXb78OxqceKOkUTwGuu5Gv2xCoe/DDzkQLNxBl78pTxrUSsxJFZEeGihGWGEYmDwnF0wcjUyC3
	qs+lq6hmp4DjtzcxUTh8iZ03A9Mo55ZcGAqm5ESXIHCC4giJhcYFE0ETzoiTpuznsYqvw41ueR/2D
	QCRVOkE3BJ64+IpyDnYv/3uSIlRZ/dT5zvMp7CrSQqTcQcRu0AtxSY+tcVW6wTfQHJsRAJDHIiS5N
	sLTa1fKzlQOL5gdSlRnqftOSMyFCcqJI8FlyUp8T5lXu4+o4TN+OpVNi2yqOuS9RLtPAT06tDzpaW
	FlH2NxFsC6UZUH6xMHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSztU-00000003KPX-32uG;
	Mon, 16 Nov 2026 16:49:24 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSztR-00000003KOq-4Blh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794847760;
	bh=Mg+KnOr2PFN0W5qEG2JQtutKLFPy/XXNDzadik7RWfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=niEZmZ8Ca5/vAfQ5KRtxF/P+bkvPeRTeQn5UTp3DSmBcefuKctoSECS1Ut9jo5HU5
	 2OYtEUInAqTff99qAA4wiWLO4SGL5g1y5Hhc9vZDXU6ARDDnrn19WzRpPopHgCfuEF
	 TQoa50oYjzc7sCvBe1coRxpd7xHg5mvA/xvU/RacKj598V/8WU+hqDJqekIGIsBEak
	 7WTLcj9zcmKeKkn/yGf+V11Q6cwIfQbsTP3PfE1zQyqYxAc+hAfmdmmELj1QFOOuOn
	 kRIP5HRmi1/9YTQ5b/k8RI5Y0apg2WGFVYqx+78pRqbgjnatfbwLOUaFyXLf7IZzr2
	 KlOooQGbuNJeQ==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id DE1DE819D7; Mon, 16 Nov 2026 16:49:20 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
Date: Mon, 16 Nov 2026 13:48:47 -0300
Message-ID: <20261116164847.3432765-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <avsebFtnIASV-KpV@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com> <20261116091757.1656602-3-magnusleatti@kernelriot.com> <avscVrGbi7mFicuz@pie> <avsebFtnIASV-KpV@pie>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_084922_107818_C1B2B217 
X-CRM114-Status: GOOD (  15.46  )
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

Hi Yao,

On Mon, Nov 16, 2026 at 03:17:00PM +0000, Yao Zi wrote:
> > Does the chip automatically enables WoL and loads MAC from eFuse on
> > power-on?

Yes. I pulled the power cable, kept the driver from loading and dumped
the registers before anything touched the chip: OOB WoL enabled, eFuse
address in filter 0, PMT armed for magic packet, receiver on. The
packet wake bit in WOL_CTRL is clear.

> Aside from a clean power-on, its behavior on reset also matters.

Same state, about 2 s after SYS_RESET. Probe disables OOB WoL before
that, so a cold and a warm boot look the same to the driver. But the
chip arms with the eFuse address, not the one in use. The vendor
driver writes the address again after enabling OOB WoL, for the same
reason.

> we might probably call stmmac_dvr_remove() in .shutdown() to detach
> the NIC from kernel's infrastructure, then reset it with SYS_RESET to
> get a functional WoL state in S5.

YES! Bingo, and I built AND tested now :) .shutdown calls
stmmac_dvr_remove(), then with "wol g":

  reset only                          no wake, 1 of 1
  reset, wait, address                no wake, 1 of 1
  reset, wait, packet wake            wake on the eFuse address, 1 of 1
  reset, wait, address, packet wake   wake on the address in use, 3 of 3
  "wol d", remove only                no wake, 1 of 1
  reboot, remove only                 link back, 1 of 1

"wait" polls PMT until the chip has armed itself, 2.6 to 2.7 s, 7 of 7.
"packet wake" is the bit in WOL_CTRL, the reset clears it. PME was
enabled in every row but the first. It also wakes without PME and in
D3hot, 1 of 1 each. No warning in any shutdown log.

So v2 would be, glue only:

 - every shutdown: stmmac_dvr_remove()
 - power-off with WoL set: motorcomm_reset(), poll PMT, write the
   address in use, set the packet wake bit, pci_wake_from_d3(), D3hot

Two questions:

 1) The glue writes MAC_ADDR0 directly after the remove, two writel().
    Is it reasonable?
 2) Power-off takes about 2.7 s longer with WoL set. I can't write the
    address earlier: in a test that left the registers returning
    garbage until the driver was bound again.

Maxime, this needs no helper in the core, please ignore my question.

So my plan for this week: I'll write a v2 that addresses everything
you've mentioned (once again, thanks) and send it your way. If
something else comes up there will be a v3, and a v4, until WoL works
on every YT6801, NUC, laptop or add-in card. Deal?

Magnus

