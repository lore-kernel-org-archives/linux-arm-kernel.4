Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BA606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OIEqQYZk;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=O7AgBIDQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=b/xkS61/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jf6Sqoi3Qn0aJKe116rFzx97I+WLp3H4fMEI81ndjOw=; b=OIEqQYZks6DRyH
	1rceo8nQqN6dmWSYIgDreZXCIW/x3NwZViLpQrI+b1T1np5jLjrHM9ONhT+Tq2laMhgz/2EFBtc8S
	JB+o0AsUbvnUOMHfgFXJOmO7ThKZnsNJB1GBxi191VdVuXOtQ5TfmVr4xwkwNgKhUxx+FLZBmc5bq
	dGcg/RCmeWqcG01ZRT+kuc2QA70/U9di4pUTs8K5hz9oGTdxH9MM6nVkq0J7ahnV1tUkA5lVkcYCj
	FftkII4o9O0O5mZCseVfySDMsUbfwJYXWKlvc50g6jhIBdSCLMKNY6DS/jbbFypchn52ae5PDc7K+
	RJ3vmZo6yXKTZf54VTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQbr-00000002ntg-1Fnf;
	Mon, 23 Nov 2026 09:45:15 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQbo-00000002nsW-2ofL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:45:14 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 0C879EC0AF1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 04:45:10 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 04:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795427107;
	 x=1795513507; bh=Jf6Sqoi3Qn0aJKe116rFzx97I+WLp3H4fMEI81ndjOw=; b=
	O7AgBIDQYiGEwcU13yBP7pD9SSA2LG3Y/2zfedNLAskwZiMNiVx/3YiRQCiif00L
	KR7wbkQkixoe73zVJ1Er/fxNvlv6oup5Qs7tIFLBQvXHlNf2Lls/CBhsRQAvANrx
	vUnwgy8YyeKjiP9KtWB5j4f+P5wk+IKDzKMPufgsh1nSdormzySXKWxUMBRzZLP4
	HbZufdcYy1Pd6Ly1p43LoHR+3Vb0Qwnx8PqLg6abpEKgj7bS8ALsGmKzkbvNFBXa
	MiwlM30/oy4VCzbP2D0Cn/RvckE2/6m1FYYRZEehucfMzUofj1hrRnSQadQl3L8k
	K8KcORqTkWAcvTDrUnGBuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795427107; x=
	1795513507; bh=Jf6Sqoi3Qn0aJKe116rFzx97I+WLp3H4fMEI81ndjOw=; b=b
	/xkS61/kMaSQuNIi8DG0o5vUJAH7d6Q1xIk97skI5kwzb7tPoAEfcUn2XJqOMww4
	uf8Sh9s1OXPn6LqvXUYfgtWz+icscUJeCIALVZo6TozAZu0w7OG8m6ae/YqfUECg
	k4juAs2ogTO8ctEgqAPm3vFT0ppNeEeqIgPHEcEBLM7hm3pLpXsXo5QUVdFEP1/S
	UkZh2vllQKqkeLfF4kPo9CKZj3Qe9PIXsR15BgQHdGjzXIRTIQBO6ZjEDE6EU8MP
	X6IKLwE7y81JcCGVdMF0ste0Er3Nm+tWTxhbFCV4yRSDgl3CK22qv3rqFc404Pic
	SmeAIHQMNgJ5z33uvvV5w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795427107; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:Yo0UF3qFzQoXvQcKdwIbe26AeiO6CB4Xrz01IyQeEEs+cLw
	Vh3Oh6PvEbXSZuNcb5Td1J/UQWVpGO+8X4YrdpOq085VCgSyPw1bzoXzgNosoms+
	1jsOJ9cl1fHSzP3mDREbZX++MoClD3cLhaJYSRPTRw/TOmeLFfM6t/zjjNITKk4V
	4LuFjT+kwexy3pFmWPEraKfig9wWk5+75J+fkiLm/0cov8GrU9+okVQyW7YQ8pVs
	o5Cue3VteyTN5TUrimhaX4D7pjyXqB7LAwIgwN0UtqY9kpcikSbjiFbAPcfPsoB4
	aAsbEndL27JU4pSyeOr5Nyj8RdubF+X9oGWXHWQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:n6aZHqmDv56bF8XRSZatVJoaf2cIxLxzDgGBelOCUhY=:k9xBw4n1GQ1b94YYLMbzPhZvmLufZirlyqxW+aNOye4=;
X-ME-Sender: <xms:HgsEaxOhIy6VSqHjWAAc5S8_-r6-9swBvBxAZEerTD2O5jLd3ZgG0Q>
    <xme:HgsEa-x69Xr14wICuR1V3aldkqPMHk8AQ7qJe2NS-7QWty46aKqak2PekFIgToWpz
    PoRPYsUtqMhT7VkM1ce2MJx0QvsB3KlJ6zaH6kNqLo-5eQx8qKiXe0H>
X-ME-Proxy-Cause: dmFkZTFpjowEKf6THSkdHWlNfLsqi/vZ5GVMYQLFUxpmwMKx15Gn0GblHHreGqWlNSZRJ3
    6Stix52GCratCpj/7n/ateu49JFA5AjKZNwJ4R9VBgrMnT1kWC9uZL/57j7guCkzp/axZj
    7i8/C5KOfhgQ77XKEjot0lXHcH9w8HKqAMH3Sqehj7oZCfsAqKXpP+uFG+6U2gp4T7mAIb
    lPd5PSTOjznfw247G71MJjn0c6a6ZsMiXUIGFEjVlndXWZ8kMdo/fyAm2Icr8OU41WdOww
    82BaQor6puPLTTo8KDZD6rQ36OvbXVnyqY5z9bIpYMFPhmT2b04eSG2J/h9UtsImG7IdeO
    b9w35fi2So7GFHUgGGCEXxt5oRewJYy8gfT6oAfvi4NLlTPiFtaBawQqb9/9DoasICM2/w
    ffH5NjKuoyrFGXpYfuE+zqEYHhuPIItq0tr7E+LmfnS8/tixEooc1ShXYR6S8j14tfzbXp
    vzLQaphfQaLAl5/NnHlEV6SaEXsvOlJQWNvupyJHK6sIYHYYMIwHwgDnRF/ICBQvKO5/JH
    dPz6PlKvqNhJMc/zq9fkS/kxOD5L+5/9q7vlw+ymavddfSFaFBHsZ+E8RK4GE5ANtYShX5
    t2Q81Q/mVgdYPz2HP2pupFNyQEvOwqpN0/DPYeMPIyxKE8Px19JhQ9r8FMaw
X-ME-Proxy: <xmx:IAsEawGGTpdHb13lBvPvA-EMxmxgd-z86XmyBfAQKnW2yo2D4hi7hg>
    <xmx:IAsEa-PLkdycf7S3rOl8FXT72ZX879GL4GOYQl-HDahX_Sv_GlAI5Q>
    <xmx:IAsEaysK0ulq58o5gOXQVpwfq5yCaWkpgPWJ1er_z6kFjW2uDX6ikg>
    <xmx:IAsEazVFOMlr6GbbnLAYYQyoBUp3w7jHyHBXanRly9aDQskU-2q8Zg>
    <xmx:IwsEayan8b1DSh4GdNFijLjU6RL3T1AZo6Ww15949JvjYP7Bm8s6GjOk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 32C9A32A0099; Mon, 23 Nov 2026 04:45:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AMjdjL9dYp0J
Date: Mon, 23 Nov 2026 10:44:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Kees Cook" <kees@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-alpha@vger.kernel.org, "Paul Walmsley" <pjw@kernel.org>,
 "Andy Chiu" <andybnac@gmail.com>, "Magnus Lindholm" <linmag7@gmail.com>
Message-Id: <ec5359c1-c16e-4177-8dfa-2ae5ab8a874f@app.fastmail.com>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
Subject: Re: [PATCH v3 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014512_785488_43738CB6 
X-CRM114-Status: GOOD (  13.61  )
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026, at 10:37, Thomas Wei=C3=9Fschuh wrote:
> There is nothing userspace can do with this value. In the kernel is
> always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> userspace and also changes from time to time.
>
> Move the symbol to kernel-internal headers.
>
> Meant to be applied through the asm-generic or execve tree.
> The default recipient list was huge. I trimmed it to only the
> architecture lists.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Hi Thomas,

I'm happy to take this through the asm-generic tree. I've already
made sure it all applies and the patches look good to me. I'd
wait a few more days for additional Ack or any other replies,
let me know once you think I should apply this version.

       Arnd

