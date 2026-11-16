Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9884606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=raf7+Ytv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=YiQZc7jP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o/s4ptVKvvewZCdNnEs/tgBGB2jIJlIfwFpn+zlkZ08=; b=raf7+YtvCx9M4CapJQ5ud4Eopm
	1AGS3CGt2Wny9StW35oYmKDtbJTl8+wng/4LbvPBll+VUukppsdfy99rUwLogKgqym2QefIgcirTO
	aiimgWhmiVIA/TlbYxfSj+PooXVuBffcBDS+uQtVw51bwtJnhAwmU25QH6V6psJybvT81UO3fIDax
	/fyRAaC7EUu6X843cuqQ7fDkV6ijClk8ydMFKeIZfOJh3eC71V92wpDsL17hf/HtfwgtcHf39Xfzi
	oFKoflcELB7wmXUrHcRmg/Aq6eougiWNqCiwZotw44mqLW97Boqziy7plXHlsDFVFg13t4LU/7BIq
	NbdlFB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0UX-00000003PH0-39Ci;
	Mon, 16 Nov 2026 17:27:41 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0UU-00000003PGG-2hgX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:27:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794850027; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZlxepA0Rs4VAkFBZ7P3O7VFcnZ1cwacWFqY1I4LkidrEBisoW4+5ABJLq7dw6JltJpKA9gSY+FXZ4KQs/yMsJ2SmqTv8rufVDE2AApMPEauOntzDt2nNrdPZ97Pl1kbl+eERYGqXu5IPBR0Dw5wlPC710tCxqNNcarJlwj3TzME=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794850027; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o/s4ptVKvvewZCdNnEs/tgBGB2jIJlIfwFpn+zlkZ08=; 
	b=Rcu7z/CUPxPY8VvY3QBAhmYMdqK9T6Vfiz9ubEvweZ92yeQoMohd5i7meEodf2ajRSQRatR6znp1teljM1DtuVnsl/QMEvq52DJPWDUrOwbBfmbKLdJMpuaDjdiUwi2vRdjfxKRb2x9gzXuix337EDomkQ8yT4RAHrDzSHNRI90=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=YiQZc7jPC1Rc8+ssgUZBSUeq0HpSunYZ7zmsNj8h8G4VuqfXN7ikDQDF33KooiM2ciBOAhlXwRcg3CHP5Je/kevzDjkqQTj2KiLm3pxHfIxavZCimJEvcLpt5SP8RneQgitdGUkegragVPAzX1RtTIZv1MchpHJWAdSq0ij5O3c=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=o/s4ptVKvvewZCdNnEs/tgBGB2jIJlIfwFpn+zlkZ08=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794850025599407.37875575874534;
	Mon, 16 Nov 2026 09:27:05 -0800 (PST)
Date: Mon, 16 Nov 2026 17:26:53 +0000
From: Yao Zi <me@ziyao.cc>
To: Magnus Leatti <magnusleatti@kernelriot.com>, me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <avs83CgSuGULMzmq@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
 <20261116091757.1656602-3-magnusleatti@kernelriot.com>
 <avscVrGbi7mFicuz@pie>
 <avsebFtnIASV-KpV@pie>
 <20261116164847.3432765-1-magnusleatti@kernelriot.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116164847.3432765-1-magnusleatti@kernelriot.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.637.76
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_092738_726127_0E11C47F 
X-CRM114-Status: GOOD (  29.71  )
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

On Mon, Nov 16, 2026 at 01:48:47PM -0300, Magnus Leatti wrote:
> Hi Yao,
> 
> On Mon, Nov 16, 2026 at 03:17:00PM +0000, Yao Zi wrote:
> > > Does the chip automatically enables WoL and loads MAC from eFuse on
> > > power-on?
> 
> Yes. I pulled the power cable, kept the driver from loading and dumped
> the registers before anything touched the chip: OOB WoL enabled, eFuse
> address in filter 0, PMT armed for magic packet, receiver on. The
> packet wake bit in WOL_CTRL is clear.

Nice. But with packet wake disabled by default, wouldn't the card fail
to wake the machine if it just recovers from a power failure?

This behavior is confusing to me, but yes, useful.

> > Aside from a clean power-on, its behavior on reset also matters.
> 
> Same state, about 2 s after SYS_RESET. Probe disables OOB WoL before
> that, so a cold and a warm boot look the same to the driver. But the
> chip arms with the eFuse address, not the one in use. The vendor
> driver writes the address again after enabling OOB WoL, for the same
> reason.

Makes sense.

> > we might probably call stmmac_dvr_remove() in .shutdown() to detach
> > the NIC from kernel's infrastructure, then reset it with SYS_RESET to
> > get a functional WoL state in S5.
> 
> YES! Bingo, and I built AND tested now :) .shutdown calls
> stmmac_dvr_remove(), then with "wol g":
> 
>   reset only                          no wake, 1 of 1
>   reset, wait, address                no wake, 1 of 1
>   reset, wait, packet wake            wake on the eFuse address, 1 of 1
>   reset, wait, address, packet wake   wake on the address in use, 3 of 3
>   "wol d", remove only                no wake, 1 of 1
>   reboot, remove only                 link back, 1 of 1
> 
> "wait" polls PMT until the chip has armed itself, 2.6 to 2.7 s, 7 of 7.
> "packet wake" is the bit in WOL_CTRL, the reset clears it. PME was
> enabled in every row but the first. It also wakes without PME and in
> D3hot, 1 of 1 each. No warning in any shutdown log.
> 
> So v2 would be, glue only:
> 
>  - every shutdown: stmmac_dvr_remove()
>  - power-off with WoL set: motorcomm_reset(), poll PMT, write the
>    address in use, set the packet wake bit, pci_wake_from_d3(), D3hot

IMHO, this would be the right way to go, but I'd like to drop the part
of writing the MAC address, since AFAIK WoL from S5 is usually achieved
through the real hardware address by convention, and

> Two questions:
> 
>  1) The glue writes MAC_ADDR0 directly after the remove, two writel().
>     Is it reasonable?
>  2) Power-off takes about 2.7 s longer with WoL set. I can't write the
>     address earlier: in a test that left the registers returning
>     garbage until the driver was bound again.

if we keep using the real hardware address, at least problem 1
disappears, and I do think it's a little cursed (but not much) to write
the core MAC in a glue driver. And at least now we don't need to write
the address on our own, so if packet WOL bit could be set before PMT
polling succeeds, the second problem goes away, too.

> Maxime, this needs no helper in the core, please ignore my question.
> 
> So my plan for this week: I'll write a v2 that addresses everything
> you've mentioned (once again, thanks) and send it your way. If

Then feel free to add a Suggested-by tag :)

> something else comes up there will be a v3, and a v4, until WoL works
> on every YT6801, NUC, laptop or add-in card. Deal?
> 
> Magnus

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.

