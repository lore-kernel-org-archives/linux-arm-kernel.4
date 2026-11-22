Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF40606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cqQt3E2D;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=CTNMY+A/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z60uyFtNx0VkzpRcWhKH9sXU8xECnZhyM4KOZOe5aGc=; b=cqQt3E2DOehEE2
	kw5qDgUI3UrYIcVgdS3UY1+Kz/y1pmtsD0tofIsN+t8X+iML4Lc5IvLx2r6uIcJ6fb0YYchczrLlX
	ZRjAWZ9bC2rNfNG22Us61Z6nxslcsvEgjQ10rDGEcD51wkET+uHeXY+iVPXudafH8Y2miJlhSp6Zr
	oQ/flDvEAu0Q8QzxiV5HaEOAnn7XnUvXVMWiymwEnHKpn98la6q9IIadaxdq1N9A7FMunjYerqKGf
	QMwqQcw6xspGm71VFtQ1v075KP+31ulejVWqmOjMbi8YY7kb/ia/6ADwJjBe/EXyPdb7bTmFLNHd6
	ytECQRoK6JOC4Cc/bmzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBsP-00000001TfG-2qu2;
	Sun, 22 Nov 2026 18:01:25 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBsM-00000001Ten-3wa0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:01:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E227CA03D9;
	Sun, 22 Nov 2026 19:01:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795370475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z60uyFtNx0VkzpRcWhKH9sXU8xECnZhyM4KOZOe5aGc=;
	b=CTNMY+A/tNuJm6+ioyIbJFdxpOdWp+hvte3qKpCKloOoUBx7Np3NnT8y1pHHD7gJBI5TA0
	92+uWojbeS7No/UvGcNnMK4+2FVIREH1yImWGjnpCMmK2gqr6yyzREWJ0qxaIz9Xbaut9c
	qtCHtNEocCPO/7qCwxwFbvrnsZc0VPEvgWfInKbBQLKGdOHUQTwhsGlKM2uio6wv5UjHHv
	A6xFHbjV6kYoFPzk22yGQ5vfdezNSmjYrrg6BYofd4xm6eWb0CW6m1My2JACuv6Licd/AA
	PT9VlLcPqRn++GBUTp5d9ep1oUxm+Y0vYJRAP/HPiJVdWin1IoOsEwnsRcGnow==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 19:01:11 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Sam
 Edwards <cfsworks@gmail.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, David Wu <david.wu@rock-chips.com>,
 stable@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: retry a failed RX refill from a timer
In-Reply-To: <MA0PR01MB921746F36D90C7080287ACC9FD782@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
References: <MA0PR01MB921746F36D90C7080287ACC9FD782@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_100119_162010_586022B9 
X-CRM114-Status: UNSURE (   5.96  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anandu

On 20.11.2026 08:49, Anandu Padinhare wrote:

> [...]

> @@ -6164,6 +6205,8 @@ static int stmmac_napi_poll_rx(struct napi_struct 
> *napi, int budget)
>  	u64_stats_update_end(&rxq_stats->napi_syncp);
> 
>  	work_done = stmmac_rx(priv, budget, chan);
> +	if (unlikely(stmmac_rx_refill_needed(priv, chan)))
> +		stmmac_rx_refill_timer_arm(ch);

After a successful retry, doesn't this leave the last received frame in
the ring until the next RX irq? Could the poll refill first?

> [...]

Regards,
Nicolai

