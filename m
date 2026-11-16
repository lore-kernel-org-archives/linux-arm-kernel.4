Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC61606A8B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=idFi9xtC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XBaw/1vN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tBrCJP9dOXojpsN85BTJhtl+ayGDg46qUwwBB1MbyTY=; b=idFi9xtCsUalqwk4+q5Eu18U1P
	Pp05QcLQhm2x96dCWX8RIJYCWH2u5JKcQZi0qNCxgZU/4PX5s9ZaZoOMk82hYg8sCNi0Jf8+IRKah
	J+MEMYYn64nHnl36oeh/SjWNE3QCYvBhisGVb8fnApMLN6EcU+r4Hkrv+Oo5ECdAZAlFlPjwgL8Zq
	5RxoUsUY34o6Ls26pNg87+rJKRN6rLyzlgNJ4BCJsXz8jBm+EbP2WvDJxey3rMzQUMu/7k2kC3/mk
	wlvFw7sE1oiSvdToT77Idu8PD/CQwIK9mOC/ycrWFIQrd7ItVv6FF0xixe6GlZoXeeo+EsBQH1Ydg
	MkGwUbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyaJ-000000032kU-2oyC;
	Mon, 16 Nov 2026 15:25:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyaI-000000032jY-0U52
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 15:25:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 561CC62E32;
	Mon, 16 Nov 2026 15:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8301F000C8;
	Mon, 16 Nov 2026 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842729;
	bh=tBrCJP9dOXojpsN85BTJhtl+ayGDg46qUwwBB1MbyTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XBaw/1vNGcj/B/XDzkZuv61tm1PCF15ZgmGy9zbfQAGzgrvA3fsNxpmkWDLLDh2Hp
	 GS6nXdDPPxTnBFR3NPl0ugVHqV8eGEAqn6CCphG/UFLQNd4EDFho9AJcbDnB5/Cfq7
	 ns3nIC/dcZtyzIlMHLw3XjnGieUjL1STN3z81fAbdcwZ1/Hvj/0axkq7ysSlR1bdfL
	 txRKKjxoE6Fk2DIBjDaf8VnUhtpQyvPSEKGAq53OqMh42dUqxtzEQVxFRxW8UP1ZPR
	 IwoRDXIvdXzNgZqxzQZV0zJ5M7L0iX9bxxSOa14dXGiSesuvZW4Kq9RBEgcw02KO00
	 +6OEXiLQPnJWg==
Date: Mon, 16 Nov 2026 15:25:25 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org,
	philip.radford@arm.com, Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	"Rafael J. Wysocki" <rafael@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] powercap: arm_scmi: Fix potential stale zones after
 a skipped leaf
Message-ID: <20261116-influential-jackrabbit-of-criticism-c6c24c@sudeepholla>
References: <20261115110546.2344308-1-cristian.marussi@arm.com>
 <20261115110546.2344308-2-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115110546.2344308-2-cristian.marussi@arm.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 11:05:44AM +0000, Cristian Marussi wrote:
> From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> 
> scmi_zones_register() skips leaf zones that cannot be registered, but
> returns the last leaf error when that leaf ends the traversal. Probe
> then fails without unregistering the successfully registered zones,
> whose private data is device-managed.
> 
> Return success after completing the traversal. Keep the existing error
> return and full rollback for a failed non-leaf zone.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: 3e767d6850f8 ("powercap: arm_scmi: Remove recursion while parsing zones")
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

I may be wrong but sign-off when you repost means you are agreeing with
the change and hence review tag is not needed ?

-- 
Regards,
Sudeep

