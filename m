Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95EC606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dgbda2A3;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=FGEemmNH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6gTe3OIXtvUr8l7NQ+B00W/LQtsjPBr3owczjn6ZYLY=; b=Dgbda2A3nKyl/Y
	8ZU/p8AnlWH4PLc4diclJHTcQAUKuWQKJgV31HFXLigB7r+iajtA3Ci/PjpaRRof+J5cECTdEqGxb
	HguLO5XvQ2c/TaLL3IRiUZ5DXQTIWfYcHMTEOhXyviObSd6xZs7+kmEZBKXYvjB3hd9fF0W2NjoQ5
	M/66JjW2wQx9WtUfjEtdtoveKOeNCB1WHAfZC/ND+r/vPNLZxtslhVhEJRaKeU8nmZ+Vt6ZuEe5iP
	DfrdE8jU9mjZlulzMP/6YJNW038LTiVW+LesXM8cqnKHTukUOKNkW4n9na2axrTBMiiu2PQpW7ylJ
	U4Dwou0OsADGGrW6NmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqEE-00000006Zef-0hTe;
	Tue, 24 Nov 2026 13:06:34 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqEB-00000006Zdv-0fmF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795525589;
	bh=6gTe3OIXtvUr8l7NQ+B00W/LQtsjPBr3owczjn6ZYLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=FGEemmNHrmqUTdaDHo8qr+JUyTMRQdHosYEikuWqodR9P94M0ApDiye/zX8oWbfQA
	 /vaqU8IUajnrnL+Qx7DARKZLyeuKAFrwxWP/EvPc26jj+G2/g6zmx8mJ1AImARC8Gz
	 oZbUSjVVxXL7CuOnDsXKpvjKsJFEHIsy2PhbAffGiiIov4JGxYGwwjd3LXSeMzCKKq
	 PeGoMF8IfDbXPY7MTHw5IZ1nsceyRnRYNcTUrNd25mwoqojr051sjiu/lvhkkYCJqs
	 V41rfQjJ/wdOt0uapbJA4EaSi7uzSM+MpLAS1HcFMQyN4JnaXrxLWXtZmi5yUDZFAI
	 TPslTPJhYnuPA==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id B8FB981A0D; Tue, 24 Nov 2026 13:06:29 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: netdev-bot+sashiko@kernel.org
Cc: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-motorcomm: remove the device at shutdown
Date: Tue, 24 Nov 2026 10:06:10 -0300
Message-ID: <20261124130610.3254004-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179551786477.3135.6652175828683602957@kernel.org>
References: <20261120102754.778283-2-magnusleatti@kernelriot.com> <179551786477.3135.6652175828683602957@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_050631_252063_2616B617 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 24, 2026 at 10:57:44AM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Low]
> Should this carry a Fixes: tag?

No. I never saw anything break without the hook, so it's not a fix.
net-next, no tag.

> [Severity: Medium]
> With this change, can stmmac_dvr_remove() run twice on the same
> binding?

Only if something unbinds or unplugs the NIC *after* .shutdown ran, in
the middle of a power-off. funeth, otx2, nfp VF and ps3_gelic wire
.shutdown to their remove the same way, and it's the design that came
out of the v1 review [1]. Keeping it.

[1] https://lore.kernel.org/netdev/avsebFtnIASV-KpV@pie/

Magnus

