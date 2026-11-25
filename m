Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C0A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AxTLgF+W;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yk1Wag4v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=; b=AxTLgF+WRU8S2n8zbZVAqanVU/
	jr534Aw02QSVuGyMfQrepB3CeBHfY+Fugsm5/YWEe2FLpFFEhoXMqNnfnB2+y+qrSp7OfbctQzVUa
	8h7nRRqsrLauH0Fi/pSUXegO0UMRggf4Z7tk3WS+mOuvrR58uC5TkOxNIEmDzE0Fydm9DrqQK3F+t
	b6hOZFSMcbEnLoopt5vDP6IgAyh4adZca1ao6Sy607t6/Wi+8AxCj0wd0G8MxEz3PbRj743otB0eB
	g5b3pATuBuL7c4u7zVJhpiOUspIn1G0q07LHfkP9trHSqyGnYG4lRzKiCDR/LkQGS+dzefSD0XbRg
	rBCP8h0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGja-0000000AjQ3-3Bzb;
	Wed, 25 Nov 2026 17:24:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGjY-0000000AjOx-15Aa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:24:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-491846221ffso5208084f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 09:24:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795627478; cv=none;
        d=google.com; s=arc-20260327;
        b=KIKsxVb7KkLsq6HHqrmzvK8WN/QmwcE40ms9LHJsTCjv42EyWWCQLP6TuO2ewF09so
         ECkxJzpFlpUZnaKS9EVUuwEzMYRm7jNlauY7c+Pq05RpIjU5Yb3K0ohqNWX4cDjucXsB
         NWjw9d/ZT52ZSU5EvoXmgb9EzdydzGh6Kvgzz5SZ8xw/zWbNUSINfcnUWX+biEx/NBlR
         OG6fF8dJ9+th33eBanxcjsUYbuzaeY8Fy8aH0OYmanRGl7Jc1Ny+r1tX4DUwykBakCzl
         a4VO2N13VUZq9heCnl6F4C7kI5J1izOZ//LmdwZPGvkg+U8d/4jAF4juoISWElYg9am8
         pAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
        fh=zSKohHw+4RRktG+4qLnLryB7UJyS9xLy0MVTh3lhBxY=;
        b=VjFTlReN5v7vTPRl/3/ZBY9rcYraO5NWcsm4yrGKP9GSbuafWg4DU4TlfVkfcJxcmC
         S+/0TVe1T0OqlulPkTJcDt5EE2WgZiFAUQwttXhGyfGbTHvc4aft4YfdGtmQBMIDVk8Q
         jxwUqAg6jFb3GNLIUEl0Wvjk3O4XlAnpVmMdDNTWd9fEzGJi6BwZAfGFySvGXpw7yV2f
         cB6sOIUE//YVKZrlUGq/n9SkQikZsqsyTwdFRHBOVDaykJ1aAZ64pfI5VUVR4O34Fysr
         xTVPuqoD60gZYROWQHZBpuiA7kBf/mAlbhZZK3ay3sdGLmdKrquvMhQjP8vKOLc+ZOi3
         +SzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795627478; x=1796232278; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
        b=yk1Wag4vg+pVGTCMR3MGZFQd1/gy/Apf16w5J+UkQ79oL7yIrfnQJK8LYoTETMhngI
         2R3H+IyDUsm/iUG9ofvORJNMe0N+jfxvKCcfsWrFtIlHGhgU5LEh5bAgpKFDvtpt9arU
         I55fZMk/qtE4y/pabVfkm2LxviKIsur9LDUkASUmma5bb81M4/VVFKx0T77CPPiekXZj
         zSvpX6x8tIiQeecaQXSgrvIwkcxXTx+09jkXP+jEJA8OXuJF19JWhxJjKB+BrR3glTZ2
         difkE5tMbedi/Xo8YGJZKnBEpKdZMhWzSKI+rj/f29ZJY5bC+XFyO7c9yzA+3DhWx4I3
         hQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627478; x=1796232278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
        b=ANU98NcG9SD9NwUnF+FRkKyqeCJGegOyTarmjmsDL+9inQ6WN6cgJZIi9b6CqMz5cT
         sXNYRoF0iMu2g/clrx4AZaRyttB62vCTY7NjTXNaGQmuVSKJQHMzDLUmjWIsnO3iV9a5
         VcGtwurUteQXwrULk0EHSDDWIj3xxmXebepA4+53DKzbWK8sBbS+44ZdEzvmywGOqZxP
         jDUOQvrTZnT9X4nGivQaTQeO45hTD5MMavLSrsiM3jauqHIyaJrKJzsGJLZdG7n9GMF1
         66Tx6m5DypRoPtIswp6hT0VRMjYOuREEVz01Jd/IVjLELpubvfWTEQsHcInDgyWYkUTM
         h5Cg==
X-Forwarded-Encrypted: i=1; AL+hErEI13sOvm5Jw/KfKHMs517qg2yN8kanvwjSi7ngw4H9PP2qX9Bztv5qIhyQL2gm+9Dfpd73OYCbIRBtxmevCoGp@lists.infradead.org
X-Gm-Message-State: APuU4Z8SKhKM4EgvkxC7fmAdZCsvPl5FkjrjJs3Lp6pGQSZxuZi0ymqL
	EzHmXNo/iZeBrnNZjRsB1jBNsBC188e/BliaDwRA3LZJM/yLvpX1K1/yyS5RyltAVhzrfnI/kS8
	6UFTxNMQci/cusp2FR3fp1A4OO8A3e6s=
X-Gm-Gg: AZFdTZdkkDxHIxSHmKZeumhiIgYS8UIvKRxYIyx3W5GtMtaxuTxZsYgIAgHZD3Cjx5t
	6FSXcY1FWW2i6Q+Iq+NsGaz2+hnKVGZG/STuVs9oKdenGti8WINv5NHpTCwSmXr8BRr2HA1gkjU
	duU00GLW/s14D7ZjrFi2KMgaFkDxk2+XJvX2uNI0KO29YJmOtXAEcVH6juk99Ea6ZzJ2jhzoFhD
	Arkkb3ASWeJoETdAOKAANq5oZnpacYGsPWNYNWL9FBpliEDdtly3yaspwZfmwcNbgrjfZPz143x
	DkCAIQ27YlGXIlCr+icYFmvDJCBtAqoWxQKDUkPyS+jUxEfD2cQ3mERgWVrHMLThxrqZoCQXVNn
	S98rJvZB/oLujugVN14R+OV/ih7yJs3D+M/0YijCc+XaTfdjU1oAfZ0ggflXNH3agf1I=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id
 ffacd0b85a97d-4abb59e2898mr35765846f8f.53.1795627477631; Wed, 25 Nov 2026
 09:24:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
In-Reply-To: <20261120102754.778283-1-magnusleatti@kernelriot.com>
From: Giuseppe Nespolino <g.nespolino@gmail.com>
Date: Wed, 25 Nov 2026 18:24:26 +0100
X-Gm-Features: Aa3M54oC6LgFaDRKQ0RxvICA2M2DvBKp7vjOEYxTmttrvoHrhd5am24mA8KAZok
Message-ID: <CAKx9m6M389NvuG4HiiRO4Ck45TDgmxwRqRwOHc42OM3Da1YWog@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261125_092440_324064_45204885 
X-CRM114-Status: GOOD (  12.87  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Magnus,

Il giorno ven 20 nov 2026 alle ore 11:28 Magnus Leatti
<magnusleatti@kernelriot.com> ha scritto:

> Giuseppe, your Tested-by was for the v1 design so I couldn't carry it
> over :(. I'm sorry, could you test again?

Done, same Slimbook EVO15-A8 (Ryzen 7 8845HS, BIOS N.1.14GOS07, BIOS
Wake on LAN on). This time the module is only Ubuntu's 7.0.0-43
dwmac-motorcomm.c plus your two v2 patches, built out of tree, nothing
else on top. The eFuse on this board is programmed and the address in
use is the eFuse one, so the magic packet went to that address, from
another host on the LAN about 75 s after power-off, on AC:

  v2        wol g   wake, 1 of 1
  distro    wol g   no wake, 1 of 1 (from the v1 round, same kernel
                    and BIOS setting)

This time I also have the shutdown log. With
printk.always_kmsg_dump=Y and efi_pstore, the end of the power-off
reads:

  [467.495243] dwmac-motorcomm 0000:02:00.0 enp2s0: stmmac_dvr_remove:
removing driver
  [467.497124] dwmac-motorcomm 0000:02:00.0 enp2s0: Link is Down
  [467.906480] ACPI: PM: Preparing to enter system sleep state S5
  [468.213535] reboot: Power down

with no warning anywhere in the captured log.

Since the eFuse is programmed here, I can't say anything about the
empty-eFuse case Sashiko raised.

Tested-by: Giuseppe Nespolino <g.nespolino@gmail.com>

As before, I worked through this with an AI assistant; the test runs
and their results are from this machine.

Thanks,
Giuseppe

