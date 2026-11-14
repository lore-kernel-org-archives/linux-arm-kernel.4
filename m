Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1F7606A88A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QBfw8TOv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KDEAtidG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IVvzOsH+NuIpRX0xCb+EAFZpqLlQeknfi/yGTtV63pM=; b=QBfw8TOvzdVkUb
	DpllKpT1MaiqVHsKwoubC+jJtLsj2h2LLiJSxrxgtW9I2RUpDft2qKNnnM7Cs+eXFMby8ZDTVP6Oh
	8Psw0p3GhnCQciWT5iXHbF61vmltcTqvoewYAfoyOJ4P2r1s5/Ig4UwhPXau5Ow9Ovu5JJL/utNUO
	Y91FNAgZnAuMmIqGrnEZqykgBDBQzoL9oX4CY/A4L4nsDTfzLHia8DMTtdvPjQSDcNo7LMg6UBDWA
	6HNjprQ3I4/oYEW52jFAYtD5WFVCHMw/j9FGFB9Wz6mkUaL6EZ8+43hxQ0POLDgjrCkCJXDhx3TZM
	nM53t0jmZq55vXUC9KCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4FT-0000000FEA5-1Nl4;
	Sat, 14 Nov 2026 03:16:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4FS-0000000FE9z-44y8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:16:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C6A745E41;
	Sat, 14 Nov 2026 03:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6501F000C4;
	Sat, 14 Nov 2026 03:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794626174;
	bh=IVvzOsH+NuIpRX0xCb+EAFZpqLlQeknfi/yGTtV63pM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KDEAtidGANQE2bawgshd5c1etBu2f/RPRNDpOv6P3ZX7VtwYd+MP9/PhJJvFo4Pe+
	 j7rPhGzH/VqaZiK0i1kT12fS2qCgyhReVZXlfspRh8JmjMgvYuvPiDOekNPY3U55fl
	 v2SIJP6zAufcjJFlFlOyaaChOrEgYziXkcfKrQfgclIsM+GzrV+NRFST9wwHMt69Kz
	 19t8kqDtJs6vuOKbuDKBY5g76UxsMGguaAv9fBuh5Tm2alY2WxhTnps3TmIQzQg1QQ
	 3efYP/MV/6LMSewVBV/45Q9rsBWXtmPSQ7xjtFHGXCtWUGYtZSbZctrU90OQ1dwVXJ
	 w5nvbztBg7avw==
Date: Fri, 13 Nov 2026 19:16:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 <UNGLinuxDriver@microchip.com>, "Richard Cochran"
 <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Jens Emil Schulz
 =?UTF-8?B?w5hzdGVyZ2FhcmQ=?= <jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH net-next v2 1/9] net: sparx5/lan969x: stop the FDMA
 channels properly
Message-ID: <20261113191613.59e240da@kernel.org>
In-Reply-To: <20261111-sparx5-mtu-change-v2-1-59c91357e8f6@microchip.com>
References: <20261111-sparx5-mtu-change-v2-0-59c91357e8f6@microchip.com>
	<20261111-sparx5-mtu-change-v2-1-59c91357e8f6@microchip.com>
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

On Wed, 11 Nov 2026 15:31:11 +0100 Daniel Machon wrote:
> Fixes: 10615907e9b5 ("net: sparx5: switchdev: adding frame DMA functionality")

Please drop the Fixes tags when you repost, either it's a fix needed in
net or it doesn't deserve a Fixes tag either.

