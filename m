Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEA8606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i/DtzeDH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=Jc6+q7o4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wZU6CfzaUrTUM9Uw9d24QCgARMhh95qEdCVI0vhQmpg=; b=i/DtzeDHxp6Mms3CrMXpFhwRqn
	2vcWh5LArFyOiOVQTz78GGKrWvCMfZ3qF7qzbzESf5SE3pwZXUupvzl4I+XE9rbS5CHv+P/0qO17l
	Z9EKmbf4Ic1Cy+4b1bLIkcO2sbgILNGk5UrQ60kNoFma+KgK/KTNmSwXUeE1TpT8yuCigVzMzlfi1
	dudzPGnC07pnJ2KUey2FcNYtfOxoL1xwqamckXawTU7pXs7YnyH2O3x5ECQNa+eCyyBUeMQE9FcFw
	T+BoLKDo7evmsOZgdLT5XO1qABongScQF/Nb2AYP2NtbIZv3P0KMJDJTROV/WmwTfTE9cij6wOJjG
	QUCjvBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFzy-0000000Ab0b-3FvW;
	Wed, 25 Nov 2026 16:37:34 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFzv-0000000Ab03-3prk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:37:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795624635; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fn8wmiECVHUD3QkyvELPPxKwwuZ9DNuC5BsZ/LyEsXtY8cg2aYjoBxEJgwLN+3JYGlUBQKiSs3HmFqpwYHfmyMXKcBzyl+8S8QravXTlQ+rw2jrUs8q5t1a7q53p7LzuUkgpSyyLv+VJAlOvU5NrIEklfwjwfx5QW2+onexAftU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795624635; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wZU6CfzaUrTUM9Uw9d24QCgARMhh95qEdCVI0vhQmpg=; 
	b=kUmBJtZoJjiy/JIw5a8E5V4T6B6xWVXg7fwLLgn1GiEt4TaGh2Od91Iak/9qP4iGZNp3Zx9PBhiT7fhQ8Bk4Ky/mHZ2QlPXpfwSnSkiB4w11tIefldkFFQzddMRS+FchMJ7yvzOgdl/Bf8HkGNxast9SSTj/IRN3BYXewdCk9Eo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=Jc6+q7o4s8WHJKTxEGWlOILKLZcb5akXj8pQFhixA8NBV12hkF+n5+8amlMh/gP12gne7slcWjdD3t+XTcJSIQZMar5ML3PLiGY75We8IDTMUCvZXteDOZmNSts4HFe3nYeuf40049rpe1P4JusK/SeIjBsqUUGo5/DqAgqRYd0=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=wZU6CfzaUrTUM9Uw9d24QCgARMhh95qEdCVI0vhQmpg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795624633139428.14929217459655;
	Wed, 25 Nov 2026 08:37:13 -0800 (PST)
Date: Wed, 25 Nov 2026 16:37:02 +0000
From: Yao Zi <me@ziyao.cc>
To: Magnus Leatti <magnusleatti@kernelriot.com>,
	netdev-bot+sashiko@kernel.org
Cc: Yao Zi <me@ziyao.cc>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-motorcomm: remove the
 device at shutdown
Message-ID: <awcOrnah0sKdqqSn@pie>
References: <20261120102754.778283-2-magnusleatti@kernelriot.com>
 <179551786477.3135.6652175828683602957@kernel.org>
 <20261124130610.3254004-1-magnusleatti@kernelriot.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124130610.3254004-1-magnusleatti@kernelriot.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.600.19
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_083732_159663_531C08ED 
X-CRM114-Status: GOOD (  14.18  )
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

On Tue, Nov 24, 2026 at 10:06:10AM -0300, Magnus Leatti wrote:
> On Tue, Nov 24, 2026 at 10:57:44AM +0000, netdev-bot+sashiko@kernel.org wrote:
> > [Severity: Low]
> > Should this carry a Fixes: tag?
> 
> No. I never saw anything break without the hook, so it's not a fix.
> net-next, no tag.

However, I do think this deserves a fixes tag, for the reason I stated
in replies to v1 of the series[2].

> > [Severity: Medium]
> > With this change, can stmmac_dvr_remove() run twice on the same
> > binding?
> 
> Only if something unbinds or unplugs the NIC *after* .shutdown ran, in
> the middle of a power-off. funeth, otx2, nfp VF and ps3_gelic wire
> .shutdown to their remove the same way, and it's the design that came
> out of the v1 review [1]. Keeping it.
> 
> [1] https://lore.kernel.org/netdev/avsebFtnIASV-KpV@pie/
> 
> Magnus

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.

[2]: https://lore.kernel.org/netdev/avsTEglKKD_wl_Fi@pie/

