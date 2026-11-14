Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c44YtM7C;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TeIucKOM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FKtAAVfNMBtdDOun0q+aZRlZBry8DYf1T2KDGjW+TD0=; b=c44YtM7CyuxgrE
	5vAzTEprtHGdZc5WmnJJ6gyVgFjTWdu3Av9jjMO03nq3Jex5/C42QmapYgAfEiR2/PBJstvxMuqIA
	xsc+TWupJ7TfingCqJ2J5Lstlug2bH9Oe9S6Dr4S5+b+M3SmZig/wZgF1bubePb5NgutqBNMcmQTo
	tAlBT4eX6PpR2YSeOlzTdgTDVwgPQP5McUpkPGFTwgUAGd+y5+J+dKbryXUm4uQeE7YNrcuWiLWuS
	jAZ6/XIZWUed6YN+l92ZYjyWul40LiDczBQMWMipBBSNPqxFUds3NeynAzSechGYL4w8MnrQ4FxZN
	tKrP43+XYngzn3BIXH3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4DM-0000000FDSB-2Wc0;
	Sat, 14 Nov 2026 03:14:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4DL-0000000FDS4-13K5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:14:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 39E7660D12;
	Sat, 14 Nov 2026 03:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7592F1F000C4;
	Sat, 14 Nov 2026 03:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794626041;
	bh=FKtAAVfNMBtdDOun0q+aZRlZBry8DYf1T2KDGjW+TD0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TeIucKOMzI8X5GBiYa3bjYfTKSS7ohSu1mx5zfLshvLzb0yyDpMZIkoi+O5NhHljf
	 A0Aw/wvC9anU1NR58RfJEBuv8bobmliOGhVQoENBSQYcaWLzRFvcUV+376M8nlQQE1
	 4WkK9H8lfZ2xcB6ophmWCz5KgvT8kyBfek5QEjpJvIiTyMBNJGwiRq+PtT79PNNb2W
	 WqjxGxug7ngh/xlTaBwsBxv8RAHA+NzohbmZULJ743/RP9K0iChedSolkZwR5idgrE
	 h0wlOXQ/V/uOy6zBD1PiYqrla9FiU+9+qlD22QIpSIFXqayYfFYpHos4YO48vVfZb3
	 yRvDz2GkTvDAA==
Date: Fri, 13 Nov 2026 19:14:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: <netdev-bot+sashiko@kernel.org>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
 <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <robert.marko@sartura.hr>,
 <horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH net-next v2 2/9] net: sparx5/lan969x: free the FDMA
 buffers on init errors and deinit
Message-ID: <20261113191400.2451b854@kernel.org>
In-Reply-To: <20261113075946.fptcvcesbmjlahpc@DEN-DL-M70577.microsemi.net>
References: <20261111-sparx5-mtu-change-v2-2-59c91357e8f6@microchip.com>
	<179450479633.2199510.4808333993834819818@kernel.org>
	<20261113075946.fptcvcesbmjlahpc@DEN-DL-M70577.microsemi.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 13 Nov 2026 08:59:46 +0100 Daniel Machon wrote:
> > Would it work to set rx->page[fdma->dcb_index][fdma->db_index] = NULL
> > after page_pool_recycle_direct()? The poll loop would also need to
> > consume or refill that DB, or reuse the page in place, instead of
> > recycling the page while the DB still references it.  
> 
> I believe this issue is being addressed on net by Zhang Hewei [1]. I asked for
> changes on v3, but no response so far, so I see three options:
> 
>   1) Wait for Zhang to eventually post a v4.
>   2) Send a follow-up fix for this, in case Zhang does not.
>   3) Incorporate the fix in v3 of this series.
> 
> Either of these works for me, but as I dont know if a v4 is ever sent and how
> many respins that fix will require, it'll probably be fastest for me with 2) or
> 3)
> 
> BTW. The high severity issues on patch #6 and #9 have the same root cause as
> this. So my response to those are the same as this.
> 
> [1] https://lore.kernel.org/netdev/tencent_6BAC076E552C6F338052FC02794D9B28ED0A@qq.com/
> [2] https://lore.kernel.org/netdev/20261110105239.5olhrlwa3mck74f4@DEN-DL-M70577/

Looks like the author respun twice since your response.
Let's wait for the fixes to make it to net-next, v5 conflicts with 
the changes you are making. Don't hesitate to post your own version
of the fixes if you prefer. I'd bet it's an LLM jokey blindly feeding
sashiko pre-existing issue reports into an LLM.
-- 
pw-bot: defer

