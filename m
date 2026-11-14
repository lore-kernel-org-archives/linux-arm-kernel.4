Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E71606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oCzxFC9x;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N97ElCaZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=; b=oCzxFC9xLPNzJaMA/q/Z+DhEL/
	8NoMQYUn50LI2JEzm6esucVOazZFN4VATPx8wWkZeifxfXkLG84ciuY5gJkuKTYRMuhC2/IP9ExMh
	tapg/562zvV+okbpcPa8hOfMlFnMmhaX2hyws3Czve5LcZA60O6d137hkBl6vIsTzznq7AV9I/r82
	zOR+pZqr5D6mNRRAjeCSAgW2kSMLJKx5aWi7uj/suHdawr/bE6QStdu0tviMHmTadEoW3APSHKq49
	obFON2DpKUU895Lajb8nlLX9iIAIMhemBmwmvH28QIrXh72s9C3hJPRJ9p8u+YwrMx5UK64CBLmNc
	/0etYnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1XA-0000000Etdh-2Su6;
	Sat, 14 Nov 2026 00:22:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1X8-0000000EtdG-23pM;
	Sat, 14 Nov 2026 00:22:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1D7061ECE;
	Sat, 14 Nov 2026 00:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7841E1F000C4;
	Sat, 14 Nov 2026 00:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794615737;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N97ElCaZ18uG92IjVfYrXBblFU9aIYDF8KKtN22kDx36OdOITRm5VfjGhB7FhYoPz
	 YBF1A54C19ostQzREksQNdAf+lj8VQ+ACy7pKzdrKlRFWREG2vd0d4u+MzVK5YodJ8
	 uXHj1yfjmmhEs1uRLUTCSMVeQZW5EOFEZ/9Ap5PRcPI3i5ba86J9NzfuxdliVp+ZYz
	 VP0WYYFcQWB1QrTIbLyy6FGb/fxFX6EVGHI5GTMNfmuGUiFrrdEqF3n1Fo7P3IHttw
	 UFj6Bj2dsyiQ3xxluOETQzEmyJUMupPwEir4iyjps9vPgq8eUgYxfHKWwfDzvA7xbz
	 Iq+TEa216kMxg==
From: netdev-bot+sinfo@kernel.org
To: Sandeep Haemoon <sandeeph@loljews.com>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>,
 Mason Chang <mason-cw.chang@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/3] net: ethernet: mtk_eth_soc: 9K jumbo
 frame support
Date: Sat, 14 Nov 2026 00:22:15 +0000
Message-ID: <179461573593.2168702.7673153146325668469@kernel.org>
In-Reply-To: <patch-f1e62a87eb0f914e1ea52a395f465998@loljews.com>
References: <patch-f1e62a87eb0f914e1ea52a395f465998@loljews.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

