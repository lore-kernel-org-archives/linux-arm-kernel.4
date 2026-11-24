Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72192606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PO0b4L7x;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=ErYO21Xw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ITS6G0VnKDuLYuuKatr6g2NkWvCt6BkFPf4zQE2wQcM=; b=PO0b4L7xlJbYfF
	XZkweEaPf7K2QBKnNkzwJnyswWFlJ7OP1rb1QS5RWYSvsxopfHbiAfUwNVr1m7nmTCQm0m1rBTM6L
	A0yU+RaSB/PCfTEMzAXqK6eZ0R/rNiOqgJ31AFvdT3S5WHKMCYS+aJ7CHcTuXmSl30b21ut+dDW0i
	NcGdLBMNoIE0Fhc7HV+3cxoXCZUvpSPUianPsbVIg5r8LI4kdI64jq9loAz3uAYpiuxnXBzMLhY2b
	3GucQoPVFBeE8G2rOdJLRN1ppv1DigqOOt2Zg6GfD5vZL6PNLs6nzd9R3gBgu7Fk474ObMah2B46f
	4RLAK+Ca0xmOlxT7XXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqQO-00000006c93-2hQv;
	Tue, 24 Nov 2026 13:19:09 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqPs-00000006bpS-3Qy5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795526315;
	bh=ITS6G0VnKDuLYuuKatr6g2NkWvCt6BkFPf4zQE2wQcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=ErYO21XwXrp2j56isJFU73eQzfIbySyDAIEqtC+D9ZF7r3b/N1eoniVYsEU4R4Ce7
	 dfKQcYOrStf1hZQvk5yajAONS7DtSNXOgDZzpo682I6XwQGRlrtSvgpRK/oDSsxlMG
	 lL+NrM91lG2hIUOWPJHQitmJIfGd3M4FC7wv4ITc9sP7s6rlW7aRHQ6vVz84bb7jDh
	 wVN/xV43p6AlL+7QznC74Ttd8KY7wOzSjl/fiPuHs3/dxfG98tIjIRX69FFV8M9o7m
	 KcL1WcZ+A9lSpplLq7+b5/Z87i0RMJaTMCn8Xz+Wnh0/x93L9eSZXmvTKbQz7FjwDY
	 MqmIs03yG/YgA==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id EEC748D762; Tue, 24 Nov 2026 13:18:35 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5
Date: Tue, 24 Nov 2026 10:18:05 -0300
Message-ID: <20261124131805.3303833-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179551786682.3135.159994678754691253@kernel.org>
References: <20261120102754.778283-3-magnusleatti@kernelriot.com> <179551786682.3135.159994678754691253@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_051836_901495_CABF4FF9 
X-CRM114-Status: UNSURE (   9.53  )
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

On Tue, Nov 24, 2026 at 10:57:46AM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> Can wake become stale between rtnl_unlock() and stmmac_dvr_remove()?

Yes. unregister_netdev() takes RTNL, so I can't hold it across remove.
And power/wakeup doesn't take RTNL anyway. Worst case: someone disables
WoL *during* power-off and it stays armed.

> [Severity: Medium]
> What happens here on boards whose eFuse holds no MAC address?

I don't know, and I can't test it: my board has the eFuse programmed.
Probe already warns about the random MAC on those boards.

> [Severity: Low]
> Is it safe to change WOL_CTRL immediately after motorcomm_reset(), with no
> delay?
[...]
> On some boards that post-reset load might write WOL_CTRL, for example
> through an eFuse patch entry. Could it then overwrite WOL_CTRL_PKT_EN, so
> the device powers off with packet wake disabled?

That's a guess. The delay in probe is for the eFuse reads, and the
write sticks here: without that bit the chip doesn't wake, and it woke
9 of 9.

Magnus

