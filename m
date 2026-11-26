Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC23606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WiEAWeC7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dC18WjEE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=; b=WiEAWeC7qeb9AXhkoyLHAEA/QA
	9r1Mmpk8v53M3oksykoxJI67USHUImxi5yauZ0L6g9wVbwN95Gb8oz/AJ1Yh4u9Vvp3qcyKb7yITf
	DO7cTK3DzdFBEJ46utg766pHUaBYW06vqpMGFbsOV30lzqaRpMU3IqRh9cxB0ajwtO1qVEe0V6MhN
	YXWdrnJqwqTNHjP9ko/XGhsOO1sigJYfyVCIlGpflYCJ7HooSRtpwVqamJ31F6vKZeSaapnd/+/wh
	59///tBgah71VMa7rmrjcdzRcqVBUXCAPNPUaIL8tHY4AN091CNlR8X7JDFYbUxY7mv6oYQDdxsMg
	cTSRuwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN6t-0000000Bdiq-0ez5;
	Thu, 26 Nov 2026 00:13:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN6q-0000000BdiF-1p0N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:13:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso63693805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 16:13:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795651986; cv=none;
        d=google.com; s=arc-20260327;
        b=mlX80Elu3SrgBIE5C+n9SZQlA5C3zEnvcF5LbcfGXsuyBnMI/LAgtXltEp8TWLIVm0
         cSgjAOtgP6mHqrtbTSrj3YzodTY3oY/rlupSTpYmFVIVRvHU6IDMrsK5MdckIY8irY+e
         6P2uCRW76ww3VBc76LgqBkKA7J2tEdsizuZl5s1Non0gQPdgjqIzL4SZWIZk39QnoR5N
         2G4yXJqcWLUnq34yF6S9CD1UTtL9EsArxYqtQ6SdmFQ9f9br9YIyRxFRByDkdGPz+8Oa
         tfI/MIQWmR5dIRxLuohbqqaLsgYLEPOqFKW+6/jnKjp7bTd5UQn+NaqgbBfVRTEjiYgQ
         iuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
        fh=tT3wX5kQu4jcWdb1o2D7QWeycOBacASOksMvnnW2qsM=;
        b=SISwYf66BkO9GnDhU8erX+GqFNOpSb2Zz3fTgfNIBeHs2n7YxzUjBIFZIYevg6yghK
         1NOr6DivnbPSDyaJ/QLdvgKSmdio4PpXmyXOlpAmLAlr/yM1Ba+l9faAHFUyUyBAAN6L
         c9+LFuXOMAodnZfuJcmvSKlr/3mfWH6gT7HrPRvDBvuLbhInmVgqkBTaHriZmn8T9TFg
         iMdK4EvlPw7hhzXiFksdhfR7Y4uQxQ0YPMLw1SKLMEaTLZL/DGQnpBGq6+dzbctxnKYB
         cqsEYt+ZnPFtLEFWSKXqRu2cvy7YCzkB+lFcA2VNOcG8MAvZVXYkqix2xHOF043ScGE9
         cWRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795651986; x=1796256786; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
        b=dC18WjEEqEuY710QsJeGKyGhO4MEWVO5289fmpazxq4OThKQmA4ofiUJgvsXrXKd7x
         JcJh91FE338aWGxJumhoa6aesfK1zIRm3gAPI2nKqBYjMrdJDyJzhGZRKC9fPtWDXUHd
         Jqofmr0pQL1Y9V/wJOfwAS6QcGY/GkvdBza+SUKdCodvKPKELn2dHvf3moEKjkUe060o
         fNbYQtfQgA+6+I3qKy0nzIW0ZgwrBtSJzgO8gFhptenqcVGprfShxUrrmttRjioHjpHw
         uk2yCmHhK3yH6xSJqL3febX+C1rGIRie04RU4tPwAUkaccA9aIqe5oqWAsMt+EJj1BPA
         QRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795651986; x=1796256786;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m+a/3dUR/m6XHDL8SgjwUi1VZhGDD7+ERJ5Rr8mIHKk=;
        b=jKL3cB84JDkJXx+xrC0ZU6RaOUHaFm5aqTdcOjNW1E9NGpdZee02JjoHBMZJZXWyIx
         C6M8xncxmcSHpdyowRBGxH04EfpYgO0/l2mAYLzXF2egJjkoc3sULjGKZPbbGSX+LwuK
         8ycnI0g5HgtEYyyXkXwgF6LQfEM4a08+pjPDVtGnbBI+haxCpuN5vI9Zwd+658lXB5wx
         kKTtpuFOysRrLeVPeujUciQ3ijZeTveXTURTDJs27oejdThRwjuaN+k9mAfHldJZCtwo
         YHVLLGKiByzTRqVBTY8QFZu6sNv2ykaNAJtUPditaqYSID1ae5W9CaLuT+v/9QLayDRb
         hcyw==
X-Forwarded-Encrypted: i=1; AL+hErEkX/yqaitNVhbzLoebnEyEBjaCTuLEgsz1p5xpExXZxwedNwN3RpZN8sRUKGYZ6VpVJ9cna3FuH0r2tvJACQhU@lists.infradead.org
X-Gm-Message-State: APuU4Z9hGpSuWtJ8Ni2ErcWrmFrszMqFpwRju5rMkag1K3Aj/iJIsYPc
	Q65Nqek8AskkhjAlY9kc2vFTMN8F6noxCK6sHtHWleMYp+D+1t7iOHl7L8bu9Z0j02QDgjrm9XB
	fH2g1qI3UWS8lKBbXqLlxChm6BI6bGJ1spCZBsEQ=
X-Gm-Gg: AZFdTZerllI3/3HMb0NJLTxifkR6ucWupBwmAA16XJtNMqDlRKIoPGXLbQ9ptsMs72x
	6UFHH84G1OUEgVnOBaZmqMeznQWNEyrbOqTsxtgkVnQTVNGsRUfDqgDA96fCiOrvaiKpz1cZTik
	SKkpsrfedc3Fu0z56kL0bsLq8mOkejQGbJtyFyr5c8dON8c6WoKNBwbJJEvxLINhVjjU37OG2M9
	KY0Ybt4OikOCzNplfdejuZQTbHaNd02VwCFkSDD81gXXFUFzbQR5n5tLX8Eo9tB5g6R8yVaA36P
	u8P5x96CfOX+idL02PCwC44jYays/BigTuUP3oD+SBo19irbpTnvbVtgM023ValHxZ/uFGrC9dl
	vnMaHr0T59fSDtFuko7ol+29wCXYk7/b/5A7iOx+bXrJq+Sr6uIfh7Pv3/DUnaDzXza4=
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id
 5b1f17b1804b1-4bb8880abafmr462648765e9.9.1795651986199; Wed, 25 Nov 2026
 16:13:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120102754.778283-1-magnusleatti@kernelriot.com> <20261125173155.2073979-1-magnusleatti@kernelriot.com>
In-Reply-To: <20261125173155.2073979-1-magnusleatti@kernelriot.com>
From: Giuseppe Nespolino <g.nespolino@gmail.com>
Date: Thu, 26 Nov 2026 01:12:58 +0100
X-Gm-Features: Aa3M54qC3fGsiPPBixEGOnzpXrpAk5AzehFlhpO5G9XQuOCyUKhWAYQx7aS2YrE
Message-ID: <CAKx9m6MuwhnMGrcy+bBoCG2X0F2T65jZfhbSTGH4-YmsXGYm9g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: dwmac-motorcomm: shutdown
 hook and Wake-on-LAN from S5
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: Yao Zi <me@ziyao.cc>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_161308_541427_6EFD4B87 
X-CRM114-Status: UNSURE (   6.65  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Awesome, thanks for the update!

Il giorno mer 25 nov 2026 alle ore 18:32 Magnus Leatti
<magnusleatti@kernelriot.com> ha scritto:
> Thanks Yao, Maxime and Giuseppe! You're the best.

Thank you mage, you did a great job mate.

Giuseppe

