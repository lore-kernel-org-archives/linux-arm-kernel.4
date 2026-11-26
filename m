Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27627606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kw/a9Rhx;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=lQ7Jk51k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dQ2pLlHkipA5j/g4e46Tzr27HhC2bIUcguIGENtKDSY=; b=kw/a9RhxIENYsl
	OiBbvkj0fIaM7eEn7Cgut3IP40v74kxA7mtFtIimb4/Cf+k7+aG6IqXzs76g0sqdyLEAPi4bDeODH
	+VjhA12GWZUKCogAWs3EwyDd7cqDF6E/of9k8K80AFOwQoajB66RvxzMPfzmmoQIrW7MseE1J5WoA
	Dj7CilmKHiHX6gHyOL7HXh//JG+CDgPREzVYSKZ0ir5STzwlay3QOtUzGpDfxsTG7iBs65yMgNQhK
	IFP224zlQkaXJ1usM29Z898ycu7IkRTQ/ibWpHQ/j8lOARwzMNLwAy1gXfKh75D3Dn2SECm3CAC5R
	CnoDKAkyUYhz/Hyr+qZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbOO-0000000DjYT-2bF0;
	Thu, 26 Nov 2026 15:28:12 +0000
Received: from mail-106120.protonmail.ch ([79.135.106.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbOL-0000000DjXo-12RH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795706880; x=1795966080;
	bh=dQ2pLlHkipA5j/g4e46Tzr27HhC2bIUcguIGENtKDSY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lQ7Jk51k51sJryrt6f93LDAfwohteLVmYmEZRVZHELMQtenvQeZLxHybpXp9ZkOIx
	 yC8pjLT9PcPtRaif0E/ThjDwai8qK6mfBvmUyqeFR1iZVFqJ3fLpV54KPIlHBpN7RX
	 OdA0wgTvwK219/BumT4wVASQAJd80Qpp0gbv8/pxAEJ4UgE/T472Ywa3UyUqvjBryx
	 DeEQ5UPVbC5uv3U6hUZFK2Z+XnHp7+SfVPxlpR1tXLE4sv+hOGPx4/IRimi5/puBz6
	 FCcGiV7qrBwC3el+604HBQIpnVhhPa4SlOUO8+6jzInkqi1vtQXUPlDNmHLQiiEN89
	 RLHREO3kZTlAA==
Date: Thu, 26 Nov 2026 15:27:56 +0000
To: Pablo Mazzini <pmazzini@gmail.com>
From: Norman Herms <dockseed@proton.me>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH RESEND v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Message-ID: <Rr1r6gV_K1pXOchQNOVGHqSsBhPKVvUm6B0ze5_HRKLV9DsfwfdiGcZAC3zB0Eabk2BwSmD9-u8KC_LZQ6U-HG7YrIKcFQ92B-7rZrQXwdQ=@proton.me>
In-Reply-To: <20261124215048.42074-2-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com> <20261124215048.42074-2-pmazzini@gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 6939877897ff4f8c7a0c2e7b39d0cf71bfe5a30c
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_072809_895095_19803C04 
X-CRM114-Status: UNSURE (   4.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

Hi Pablo,

Tested on a Radxa Cubie A7S with v7.3.6 plus our A733 patches, with
this series backported, our own IRQ-bank workaround removed, and the
PA interrupt dropped from our A733 DT (as 3/3 does for the A523).

With the series, GPIO interrupts on PB0, PJ24 and PK0 are delivered
(GIC INTIDs 101, 117, 119). Without it the parents are INTIDs 99-117
and requesting the PK0 interrupt fails.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Not tested on an A523. Built and measured by AI agents (Claude) on my
board.

Thanks,
Norman

