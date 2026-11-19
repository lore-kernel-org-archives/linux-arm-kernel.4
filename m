Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCA7606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RwJi+0J8;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=l7Rbog57;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4zSlQmV5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lwlbTkMPnCI11I1GYQjW0NZFRrpmfZxueJSODj5a/os=; b=RwJi+0J8KsGqz2
	FMroMybdIa4oK99r1xE6d+K3ygINgs+OWNEfUz+qNga72QlcQbS8V/BgvMdKaZb/vgKuN90CVAe7/
	IpeEuGrOZ3bYyq+unSiIWKyGXv0lDPGRqEvuAcSvfF+R2RplqK2mbyZuqXg2e44H6FUzo0XHNbFbD
	FSzSvYb5X0vNDCl2t8NCF0JdhaL63ZfkMKN3BMl2QRZxGLjVlAx2qEo3C4+VbG5bGK2arjOj6hekd
	OBrU/zftCM0TUxKrHLoI8k6dTQJu+6Ce2ouHQRZe5vws6JRtI/dgMGYZpnVVlpMthAmmEssSVmngG
	JnYs3j1nzYL4snCZJwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxyw-0000000BINK-3viB;
	Thu, 19 Nov 2026 08:59:02 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxyh-0000000BIKH-0vVq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:58:53 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 099037A02F7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 03:58:45 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 03:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795078723;
	 x=1795165123; bh=lwlbTkMPnCI11I1GYQjW0NZFRrpmfZxueJSODj5a/os=; b=
	l7Rbog57Vw7k0YUoDhcKxh+EqBZQRDiwDJY47qlb9tSbQSvp24SIu+1Ws8u5VHv+
	oHxnPq2PY7nFt/KNbYExeMddYWItKMmvVZJFActWb5FjfWxLkAXeAbHPevtTbqij
	bPF8IaxKkytA7WoZhQotMG8U/5U3LNfNrThfA1B5ZPN5yF/vuacCzmiM/X/tlWFN
	N8yUyP0gZ1/JgxpjWVSdRGUk5WbsFRXU9SjqdmgdNWoSgiq5YhCbknqh3RF+037S
	y8fmONPWNrNs+6Y3xllCfcuzaf6h3MkHd1Qmv/1rk7G1UIvlwiQruIzH9NlAiaGw
	EoYf1YeBKo+5gtd5JHtmCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795078723; x=
	1795165123; bh=lwlbTkMPnCI11I1GYQjW0NZFRrpmfZxueJSODj5a/os=; b=4
	zSlQmV5e/9XR6xHudo1zlL7MxjN9cn09tj/JwPyES4J+1I9Ttd0+jKZ19BJhPA+a
	wruqK+VPt88vcwFrQzL5+VXlB1UXgfYG4oPENSWjyKZoSy9lZHnub7Z+nvqQ8/Wz
	Gr/OQqPQSt9GVhMX5HFegGZ8DjflcT3kVGr6LgLmUOVgNfO/xPcK1cbwre5nRWE/
	TQeHt1hdB75h2Jr4KZiIb1juGMCC5bziXNaoNBH84NpcU9zboQ4MkZrVGb7sCR+n
	x6/VyTWQZULhKP765PXorYAspbV5YzC5tDHBaK1lsYzfXd9m2gPlXQblhn2Q76LO
	7mNMMMM5X+kbWPCVVIlkA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795078723; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:IvdgKpKmScO+ta35GK0JY0tzsUUT8fCZoOKJPdorhLQtdbA
	fYuKAML16vYSvQMxSAx3cN8V9db0MIfrCrOzT1+QJLIjggwDh0sjFV1C+GoHYDmD
	sC+fk7D/8QhBZnag1BOQ+1Kshrmrpawl3xEWFWG4+ck+L2P2xO0Y85EEk9hPr+yY
	3ZNpti2WYnctoTjADmRqLuCVTBpjJGEeZyhUkwQIvr0xSmr/0DfBT+UjlVNQ61Ub
	NAjtdgGZm8EtvJy1LDwyKr0Z3hKtl/eC59/8l4j8r6xmZVLLlVUxR/IaPn0qBDNj
	FibZSawWrIExrRxy79uDaeC5JFcukt7EecQH2pw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LJbZ0gn6RXYmljsTdUYMj+jjLXVAUy28HgixDBVDR70=:0xLl/dh1h5zAlN0LYDM9n5BeMS9bFUnQ46DD+dAnNtA=;
X-ME-Sender: <xms:Qbr-aiOHmlEqi3aXi3u2OEeFnGtBpVHZttvl_p097iirGj4aGWvckw>
    <xme:Qbr-arzPB16R38qZmUFHjCheDqIFYofDM-fFgOhnXKII2zJiCTahP0zIWuDKy3WuY
    nF-d2ggCbIz-vlyBfZF0KZzn_BObUpKbc2k2UriDdb6Fl7T4WstyXuK>
X-ME-Proxy-Cause: dmFkZTF4PzICJHkMLknF/Gt4FcNaIfqS4xJjsEUaqhWVoE9PnRocRpcF+r1KHPGC6yvwn2
    Bnr9RlxZs0UPI/isszZRfXPHX6tMkZlyKidhCOSduYqTq0Wv8s4FLCg/tZyxgKYQgbSP01
    c6vZbcCZOIdtfg+roWVqf/YDV4QV+faRHFK+6puvLK632CQESGkEg1oaBgk2R7Gi5cDTNE
    +tjuVBcwfZ4SpbEa9V5t0bK7eiSzNnz/7EBK7MZYXBiCVKMk42nf0ChWDfMdi/upnQHycJ
    QLfP51snVjwwlWakMwlHTqFUdo70L6zFgjJHQNtNrVw56eGmrMDSM5cPWrb+WWlvujfyV5
    BV6x0XzdCHkMbah8gofHy/nIqkAySMSLJ3KhwIBja2+A2JZLsWCaObVsn9FQSzkHODGd3b
    jPcW9Mhpbt0cp1s6k89zHcCZla0I7q+J3AsgkgWo/PAQAHke15t+dGBmBvJdZpLVkR1j0o
    PtMxxYQQ4yP1mZwonZHIcAngRB7Eqapf9FuSGN3xnWckSPkc8RkCx6OwSdrOOi2NI205Ly
    SSH0t7EFnSHeQPK0mmMbZ8OI1e6JDEZLBe6OQPGCTaPcvzZHw/AemjRoWPnqNZ5ha/oem0
    hHuhf60VDEWF/DYDIpjdXPKLWPwsXlEGBI6b7PJqJTL0g4qAWWW68fECttrA
X-ME-Proxy: <xmx:Qrr-ah321sBuDLBDfMLrQFuYiVBUXaE6S7b0PrwrC5T8SsSTJY1VGA>
    <xmx:Qrr-al7mgB4FWhnznTib_ACNJMsKzecuoycoey59OvaI6KGTZZ0Wiw>
    <xmx:Qrr-asW_w1uBrFNqT2E6R44LnttRWufIPdV9-1Xy41e8Z8aLnCEb_Q>
    <xmx:Qrr-asDy1d5yY193kFbum7VTNr25Ru3WBboeLVYqvQjXCKndnLI2dw>
    <xmx:Q7r-apPXBQygjKwMFBdqdGWG87FOLA7LHA64lt5ihYAjYKQxdjSfQuVd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1EDEE32A0099; Thu, 19 Nov 2026 03:58:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A98ktjbAtJSN
Date: Thu, 19 Nov 2026 09:57:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tzu-Hao Wei" <twei@axiado.com>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: "Mark Brown" <broonie@kernel.org>
Message-Id: <3b494499-c8e4-4670-8d61-b770d2298331@app.fastmail.com>
In-Reply-To: <2b550966-0185-47bd-80bb-ebab6f717e2c@axiado.com>
References: <20261028193648.73841-1-twei@axiado.com>
 <2b550966-0185-47bd-80bb-ebab6f717e2c@axiado.com>
Subject: Re: [GIT PULL] Axiado DT updates for v7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005847_826578_318B2694 
X-CRM114-Status: GOOD (  17.57  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026, at 19:24, Tzu-Hao Wei wrote:
> On 10/29/2026 3:36 AM, Tzu-Hao Wei wrote:
>> 
>> Hi SoC maintainers,
>> 
>> Please pull the following Axiado Devicetree updates for v7.4.
>> 
>> This pull request includes:
>>    Initial Devicetree support for the AX3005 SoC and evaluation board.
>>    AX3005 EVK compatible string in the Axiado board binding.
>>    Minor hexadecimal formatting cleanup in the AX3000 Devicetree.
>
> Just following up on the Axiado DT pull request.
>
> Could you please let me know if there are any concerns with the pull
> request, or if these changes should be deferred to the next merge window?

Sorry for the delay in replying, I just got back to merging content
for the next release.

Your pull request came in at the wrong time for 7.4, we really
need to have everything queued up well in advance of the merge window
to ensure it's properly tested, please see
Documentation/process/maintainer-soc.rst for the usual rules.

As the contents of your pull request look fine, we could either
pull it in for 7.5 now, or you can rebase it on top of v7.4-rc1
and send an updated pull request.

A few more things I noticed:

 - you have signed the pull request, but I can't find your
   signing key on the usual gpg servers. Please upload the
   key you used and let us know about it.

 - The contents you send should be in Linux-next for a while
   before you send a PR. Please email Mark Brown (on Cc here)
   with the details of which branch you want him to include
   in future linux-next builds.

 - As a maintainer, you can apply for a kernel.org account
   and host your trees on git.kernel.org, which we generally
   prefer over github, see
   https://korg.docs.kernel.org/accounts.html for how to
   apply.

      Arnd

