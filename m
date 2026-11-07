Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33661606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 06:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GHMKLPZB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMAjPY00
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LPA6Inh2wBCKqBtP/pIYKJnpKzD87TCTJsmoxrtXeEE=; b=GHMKLPZB2eFJqMOHoqUKrKIyGH
	UUA3+txkWYEVXsIe0jUwKzqRik3OOh0o+3S0LyCRZI3BHLdP1Dx8uQWPRGnurZdEXjWiQJdCPT3XM
	e6iHjyiLFxscDWqr+Ya5vgQPD9rxyYoyYbRX0tU/yJ0ER3fwZ2BEGErIj6cvSTRIvlTPhN5fb+MLt
	ZFkbRG+apcm8cj9ewFbTG+hiSYzN2nAbdXUREg3gb1R4Lg/hCfxvkAWNnrFJpoE3kRjUP0QcCr5Ye
	4Enrlob4yWiEiD1KwRpqw6tfhfNzH2xuZrbwq5T6EhO7xHD46AnDp+/UvW9xneioIcaNj8kIULiYL
	tvPX63Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPa6o-0000000EHRv-0Uls;
	Sat, 07 Nov 2026 06:41:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPa6n-0000000EHRp-2I2D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 06:41:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA9AD60A50;
	Sat,  7 Nov 2026 06:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AEB1F0089F;
	Sat,  7 Nov 2026 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794033659;
	bh=LPA6Inh2wBCKqBtP/pIYKJnpKzD87TCTJsmoxrtXeEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iMAjPY00ocatbN7KrM421pXvOa3zCuXmd1SDzQ8m1xoKbqBSsbNw1BO7OMjl5kXXO
	 DO5bAmAdG+bK9qGTpVSC28DVVwZdG5/tPDUChrjljJvj6QxpsiBZAeP7vI99goGu75
	 NzKtssuKmOGGTAF10BI2aQXOFphNaYV5eTFjUVxgyOhtBwyk7JrqJXOX/Zk0RGp2we
	 2hFYEulFcwS0MT2/1eHpQ8IuYgbL2rKOD4aix3bXPGklfx0+xccdTN6/1Fp3GTX0io
	 jRTxbCEHeWnito8QmGIhR0v7Eez9j3nrrUraB3hL5AhnHw5mi8yFNEkfcGCB9zownl
	 P/rsHhh4NKZ0A==
From: netdev-bot+sinfo@kernel.org
To: hyunjungg <hj351016@gmail.com>
Cc: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net] net: ti: icss-iep: fix deadlock when disabling PPS
Date: Sat, 07 Nov 2026 06:40:58 +0000
Message-ID: <179403365845.488859.14463866308744692967@kernel.org>
In-Reply-To: <20261107063726.3388730-1-hj351016@gmail.com>
References: <20261107063726.3388730-1-hj351016@gmail.com>
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

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

