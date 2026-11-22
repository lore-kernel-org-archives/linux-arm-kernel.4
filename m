Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2107E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=plbDsM8L;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r+ozfGLC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XPYrCbu4T8TJmTKZRllmVp6cNeS8O7+5fQphOJsL0qY=; b=plbDsM8LAkhKk7
	1bokWYGe/V7WJOpOg7ImSOd1rsnyivWF810WsVjGr1wDvW5+IShDol6CbLgb7sVrQioAZC0iv/X8e
	UWaFQ/y+d7ZRaHKrRqVqlvKSks2RGgY9WuvdUrPaKUCMWDywxDgqwaR5+/16TmZaxAMaZ9LmAllfr
	M3Hsmd0jn7giSu9A+9qUc6QFl2ijI6+wWR02tpIwtjvRvpBLA+3PLly3Wc5QnLjdE8B6/avBJ/QvB
	2/TTa54HzL1Z/KvjnzDqkgqYGiGyfwj0cp6FLqe4Q7LL5Rwy8sd4swyDCoLKojZQOicEeczTG3JMN
	2YnaDcjvPR5QSAykEAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFD3-00000001npx-0rvc;
	Sun, 22 Nov 2026 21:34:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFCy-00000001npA-4521
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 21:34:50 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2f05bc71e01so8658805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 13:34:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795383288; cv=none;
        d=google.com; s=arc-20260327;
        b=C8Yp8vUdeuOAbEdUUwOSgoiPWYWjQb4NFy5CKkNOyCIUqVEiSCIC93vBJ3EXmN6vyJ
         HGxYuj3B/MtWmTJ637URGTJxsF+yIT8ydqlecbS6D8RXubrtMb2AirkSXtSKS31wfqGb
         3SmwNnaQPZ1SvrkPzx+MOVReYf1Rz9av3PTgeH6R33NRvle9/5OL0dIB2DQ2buG407pv
         arTenc2RjUBElugO0ItoY/F5o/WpLWBZpYO9EXY/6P2pD5wExsw/5r2mQqOADj5ekMtR
         52saPivHcZMDaqP2xCnR+EPcLn3PT13SMAA6oNKUz5jAeSIyFmhw9xe1va8o1Xo3TgXg
         Pl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XPYrCbu4T8TJmTKZRllmVp6cNeS8O7+5fQphOJsL0qY=;
        fh=X52sg8M57fjxHQzXwrOw4QZQHKUsRFmWpj4h2IXbEDQ=;
        b=pWJ30cR5jQAX659VdSSrjt/UvcnsVt2oVKthNkDS+ERE1wEIVS9swuFIR4cXmU1/uN
         9RZf2gyUkZuzhI1N/Jz7pmFoBy6MPFrmcZZEotCKl2eXAb7nwKo7WdhJ0Ws34Mp8gMht
         MIiDPS79IBrKtafJCzV7I0wTlPypgkuZEa83tQzfN6YYphdmzjBidsMgpTzyU88xIMmx
         6TeFGE2iyXU7mQmIuUPQfPDTwcuXLk4HqQjYUgG12Vnr//lIafxjDhLkgb9mDxVZyzjG
         p1pjNjDXuUM0XeRXfcireEmshh8jFgeke6wyP2tUajIr5cUpf9wbpatDrxiadSzMf0AA
         6Rfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795383288; x=1795988088; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XPYrCbu4T8TJmTKZRllmVp6cNeS8O7+5fQphOJsL0qY=;
        b=r+ozfGLCLa1i69sDVzY1SqPxo+7cL0Y6JE5A42ia40mLY1q//V5pWPnJTczKN4pKuj
         J1OLf/puj3iKHmboG53ELNjkZqXAbGAbFTjF5caI9ZAQE1n0G4jITKUx4PFwEHr1edXf
         ucKDgs4IqpL7YQL9o3LvJsa8VG8i/NQ0hxGXIf12mV8hUnaoouch+UGKGQo4ZJ2el3XT
         /0yQS9/xqfN1WxYOUa2Kl2kNkVtChOa2pkn+GHsJeDGyMitYuXtsNfAcjLo66Z97xwJs
         ni+B+8qkXOw4AJzlR4gn6dcWCMYjv64alSnOxqhLkkjM2wvOKKDu36ZNkYRMqVrOk5zx
         y5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795383288; x=1795988088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPYrCbu4T8TJmTKZRllmVp6cNeS8O7+5fQphOJsL0qY=;
        b=xx+zrgsMKoOTDC0j63qzoGtohRcz/hneyrayr+KBRkYDvpH/Q9HLFvGj7yjpquEfCK
         B5ujgh85c2+5usIzj++GZsJsM6eS16fNXObUSjV+xi2fDLfqWOJMxJ6gtpXhNFoenM7D
         0ZtWEzUd2R5E1j2E5rqrtX/VcfQNyaZKuzWU9Ssqh+9atKxZXrzI31VxVNUSy6qDZiXX
         lhBIL0VRPXXHjXS0Nq20XVLEFasdyV2j5vcqjU5NKZyuze1FqtqqyqjRodfrQuREDNAp
         nbMTyAMS+1Nn3PrnkSkNPc9WRmxZ81iXnqaN/hF4zN8UA9WQ0k1AgBgrvdWlZhmqb10I
         dG1A==
X-Forwarded-Encrypted: i=1; AL+hErFcHVVZa78tEZyFuK5TOkBJN4ZRDiROlvTBJb8f7Lkc9HFqWqCi1UYd4kvcw9UdLf3L7jb6RblQYcVmxw5/ZRW7@lists.infradead.org
X-Gm-Message-State: APuU4Z/v2VAWJOULbRL+IO+RzdGSfO3JGHZJdPCn5d0ZzLUs8bfnFZbG
	Fia15f63pNmAyv+L+t6Ayi8BMyz8P/7m/wdocEeOlcf6YTGYQ6dl8kGQPjBHDJygUAIITSeAFkk
	kx63r/EtxLkQEjiGLGZD+WOj7k+c3XKntIVf8BoXF6w==
X-Gm-Gg: AZFdTZcrVE91bng98LMPlFZCk2nIoQrmBZH8tWhXTCGgO3037IbQP2CPE+Srocqvz24
	mLmtLY3khTuPhjjSe8D3fp2O6ECX8c76Nbm1ghLt6gxc/ujirznEwZql7KDTN51G/cXjzKGTmyF
	8N5JNqIVZRBOByfeKFEbirzE/OzbnltzG2cBLjUPDS2uE9EBtUiEsLYJNxRr36HdRMrwQbxHvn3
	Imx2Gi0RuwIzhFWzI9254V+3gFWylmpL19wkmQIykI+Feb0nS7LjtraGAabM4XNT9QVHCvJcOY5
	n+0WTxJUVAp04jzelnN3BIIDld1ds1895y5lnPYvlVuaWs0KVQoux+yjQAaZvdhqr49/6v22g4y
	k/c8MnjzBhblKEFPz8rA/BmLoV3judwb9DVOjR1kalvOH/DJZoG3Z2QyIpF8F0vys8bRuqw==
X-Received: by 2002:a17:903:298c:b0:2ef:d952:4a65 with SMTP id
 d9443c01a7336-2f03f1babeamr91216115ad.43.1795383287859; Sun, 22 Nov 2026
 13:34:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <MA0PR01MB921746F36D90C7080287ACC9FD782@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de> <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
 <CAH5Ym4jkX_tD58Gtd-mzruB+hqHK7s_9knNWh+gMqUjwuYyVPA@mail.gmail.com> <3303844cdf7c00c5369453eb91027c1b@tipi-net.de>
In-Reply-To: <3303844cdf7c00c5369453eb91027c1b@tipi-net.de>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sun, 22 Nov 2026 13:34:35 -0800
X-Gm-Features: Aa3M54ojoA-gtiCq3dXKw6zioYXOKf9vTAqllY425ytZiRU_L22WV3K8LaUJ9aM
Message-ID: <CAH5Ym4ijMNSAWZ8k3GmwOoLDBVTy32B1uhS_fE-dGhsPkgozeQ@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: retry a failed RX refill from a timer
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Anandu Padinhare <Anandu.Padinhare@electrifex.com>, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, David Wu <david.wu@rock-chips.com>, 
	stable@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_133449_012312_7F1EA4BE 
X-CRM114-Status: GOOD (  16.99  )
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

On Sun, Nov 22, 2026 at 1:09=E2=80=AFPM Nicolai Buchwitz <nb@tipi-net.de> w=
rote:
>
> Hi Sam
>
> On 22.11.2026 22:02, Sam Edwards wrote:
>
> > [...]
>
> >> Do you mean "first as well" or "first instead"? Because "instead" can
> >> cause avoidable packet loss:
> >> 1) Initially, network is idle and ring is full of empty DMA buffers
> >> 2) A burst of exactly one ring's worth of packets arrives
> >> 3) The RX irq fires and stmmac_rx() attempts its refill-first (none
> >> needed) then depletes the ring to the maximally-dirty state; the
> >> refill timer is armed
> >
> > Thinking about it more: the "unreachable packet" problem happens at
> > this point too, even with the "first as well" behavior.
> >
> > Maybe the best way to resolve it is to adopt stmmac_rx_zc()'s behavior
> > of refilling during the loop?
> >
>
> Only if the ring is no bigger than the NAPI budget, right?

Right, but as pointed out in b6cb4541853c7 ("net: stmmac: avoid rx
queue overrun" -- the commit that introduced the "leave one behind"
behavior) the ring can be as small as 64 and that commit's author was
seeing budgets larger than that.

Perhaps NAPI should only be told to stop polling if we either:
a) Reach the clean tail of the ring (so we *know* there are no further
packets for us)
b) Run out of memory and have to arm the retry timer

Thoughts?

Sam

>
> Otherwise tne poll can't empty it unless a refill failed, and refill
> first
> covers that.
>
> Refill in the loop sounds good, but this would be IMHO a net-next
> follow-up.
>
> > [...]
>
> Regards
> Nicolai

