Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF71606A8BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m2YGXB8v;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=Aw0Q0zSp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fNYP6nVvRxqwPGp7tM8Nr2Iha6DD2mGej6Jc0Znc4jA=; b=m2YGXB8vfyUW+9
	4mBoRm29UEGoTEQwTo+IYITmg5IcrdqAw7VN1gzii45lslOYrZPPr8d6BoM/0Wvm+Moo14VihRCW7
	mLfXvRYkg2s0F8VUNaH03mIecCKzckmlJ9TgW+dhE74zqxP07cjPJD0BH6iewNBigqeK36K6yw6m2
	1tjfomWulPP7zSSz7wmEbGm46a/tOLg7fIB5KIQIEvFc5EuCbOZOFLSJXowSsG6qGmZjDsfQ3NX8w
	S6HDU5fPBnW+H0CZQOnLWIm90WHmav+E0G2Hq3uIakyHnWXAsOhBiWg1d6hzRLbcE0Khf/N33Ov4s
	J8Rw06+Hm7BG+ox4fw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyAS-00000002xRk-2vQT;
	Mon, 16 Nov 2026 14:58:48 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyAM-00000002xOz-27Wm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794841121;
	bh=2TMsT4OVc4sp3OPhBOTrfBghYpamHYgE3s1CFvg1zYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=Aw0Q0zSptqmYNbyqP8019WOG1/8FqilaE/5ARuKDNqEylY1EIHBd4bpRxabQWGzEt
	 uCEFdq/w/le8oD99HYu2qN2vx2nfnuJRROPWpp76U/PzUotBZciZYcdNOYTy44tCWp
	 x7puOSjOr2Kjf7mUvoonE06lWHBi3A2TTHtyIVCr7i4BsQSb7Dla1ewnW5F8S2DGuw
	 FKUFW3vp1wdf/OIXrHNOW2YAB21cH6C5Ug8j6yPg3QwnDRNmVzHNzbXsoro8JXx68S
	 9vPpPiEaNTSoqBj1hsvBns+6QJSiJ/aEbSmzA0VIz/WA4pZBbYNyAHCVMYVs/JUawO
	 osiKN+5m+DBVw==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 6A410814D2; Mon, 16 Nov 2026 14:58:41 +0000 (UTC)
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
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac-motorcomm: quiesce the device at shutdown
Date: Mon, 16 Nov 2026 11:58:20 -0300
Message-ID: <20261116145820.3005689-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <avsTEglKKD_wl_Fi@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com> <20261116091757.1656602-2-magnusleatti@kernelriot.com> <avsTEglKKD_wl_Fi@pie>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_065842_601672_B7CA3A52 
X-CRM114-Status: GOOD (  17.19  )
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

On Mon, Nov 16, 2026 at 02:33:17PM +0000, Yao Zi wrote:
> I think this is abusing the API, and all the other changes in this patch
> are working around its side effects. So here's my NAK.

Hmmm... Fair. stmmac_suspend() is the PM callback, and the other two
hunks are only there because I call it outside of PM. I will kill that
approach.

> We do want to fix the problem though to ensure the device is stopped
> upon shutdown, especially iirc, many YT6801 NICs in addon card form are
> totally supplied by 3v3aux, thus S5 alone won't reset the NIC reliably.

I didn't know about the 3v3aux cards. Both of my boards have the chip
soldered down, and on the N3350 one it keeps its register state across
S5 as well.

> But this should be done in a cleaner way.

I can only see two ways to do it, which one should we go for in v2?

 1) In the glue only. Take RTNL, netif_device_detach(), and dev_close()
    if the interface is running. No PM callback, so no PME to undo and
    no guard for a failed resume.

 2) A helper in the stmmac core that stops the device for shutdown,
    which the PCI glues can call.

Patch 2 adds one constraint though. For the chip to wake from S5 the PMT
register has to be armed and the PHY has to stay up at power-off. That
is what stmmac_suspend() did for me. With 1) the glue has to arm PMT by
hand after closing the device, and I have not tested that yet. With 2)
the helper can do it the way the suspend path does.

Maxime, would you take a helper like 2) in the core, or should this
stay in the glue?

I'll hold v2 until I know which way to go :)

Again, thanks for answering so quickly!

Magnus

pw-bot: cr

