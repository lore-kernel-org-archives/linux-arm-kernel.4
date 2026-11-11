Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC39606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=URUmMDa3;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=RH7SY87L;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DkoyMIQa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3TwglgxLWnAxX+mS1r9ZwGA0WJrncrgzLhkdtYm1buI=; b=URUmMDa38UOKTL
	1aU3w4ow0paK0ORo+r9b3u2496zsVU36ljwiWOHJwcn2w40kbuNMZ+KUVcrILm+O3Ke168AWmdbt9
	pVclNFPs2RpLFB/LFSGNAJHTjaqaQNRJJDW8my9+bSEGdzbmpApPQBuzvSzmgXunzfXs2+P7qq3hd
	2MiCoX8UUpH/NAmo5zUcC7VwVIvnKBHQVoMtBplfyy5NUBIJJ62MONbh+uAT1LGFwYo2jWycPjXZp
	f1Byzz2T+2L3KicM40QBxs/SZaoEJgWvZK8jvT63PwP8oyP5crQWYUgS4We6FrQx3HFbFOgMV5E4L
	64jwiZh5yaa/NIR5vyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Fn-00000006wRe-44Ow;
	Wed, 11 Nov 2026 14:24:47 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Fl-00000006wQc-1tDJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:24:46 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id F1785EC0582
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 09:24:43 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 09:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794407081;
	 x=1794493481; bh=3TwglgxLWnAxX+mS1r9ZwGA0WJrncrgzLhkdtYm1buI=; b=
	RH7SY87LiwkHVy9cgslSDnIz8sD/o0b4zBjMZMvzA+24pRxnD+fa7YidgfXMPfad
	ermH94Z5y9+39PFpCeeZEQRaeRarZbl/2wgtrRIlK24ftcnCnj3EDN80+VhJYPN7
	07zxww3X4jEXnVkJuJV/FMzBgbYcresVBlFmDLupaHN0LQsxYyrj2yfHGHMjT5FM
	zmc4kbqKjZ+dL+hp/xzquP3rXLnpX6FLfyYBmzlSl0TkaZI2+Ik7f4n03X4xCE3d
	5Gtq4yMAqJwWeQN3Dtr2mYABO+qlmD/OfvM1rC410u7qtBmvn53LBhr9IU5u1jth
	miVk5E+LktvttM2+oB158w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794407081; x=
	1794493481; bh=3TwglgxLWnAxX+mS1r9ZwGA0WJrncrgzLhkdtYm1buI=; b=D
	koyMIQa8ZTONxRUJofZyeusQxJ+rHMdzpsnatnFDlgY3krzuqIFufng5JrnIwK9J
	ijkvN8cmd3AUYpT6TjKyjhEhExPuDmHn3opRQtoXvCeASpr7qwadvnkk34Xjec7/
	GikAaMOgukWd2kSDU1IglSnj15PwWJaiZeFZX2gFbONoUjMdVt+CYdA5yFMgxYv+
	A9vJfiiQ9x2xMX8LdgjzeVHdBINCIBGL3Hf6ZqkJMbaM0LiCh2QayVZ7VnePV3Ux
	bBjvscrK+YEEinO8F0xJkPltKnQchPna9eqMNmoKsagI9kyupi8rsSB+vvL+qSgi
	hiKFr3O3XfrsZKIpw/zlw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794407081; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:cxrWZmxEFSzin6l/FJPji5vyvGzUpjOoxUd6e5U9F4mGvh2
	L34T5VN8gk78eZYHH2J9/furLSbOYp9s+2mpYTq5wRpSOyjVdZaGzqvkRDQKYCw8
	JpGC65tT6tTZuO6UC9Zw91u5hYFxaWYWKcH0VIKHLNTjqu/ImnuJ4ifx9nO3yqPT
	mBIg/3G/T2S+SU4+DqHjhAI5shzqs2Uo9oqqKGMAes+a3XBCi461iqnyyl7xoJq9
	hT+SV//pZYm256TqglkQ+O3HCKuz/eL6xOJbt6M0zIx2GZoVrQUJWDnCZywhXsGE
	NgLhw4GZPdgq5TbGnxieAN5+Hoq0V7ayjWF8Opw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:brchbrSjiSUdb5zlu/9g80IQ0bsBCqP5Jks/we0uqbQ=:p4rMGuJU+q62McnvRiUfh5OSocpkBbOE4t6t/A0jo58=;
X-ME-Sender: <xms:pXr0av6Lu6xeWLyuv6Mb4nWPTsfd6Ik9BRHt9iXkAfK1TqsTglNxVw>
    <xme:pXr0avuiVzmk8-p9u5azSDwYSLNZGrL8Zrb6A8SYIF8gAl-gGs5KyQBuo-7zxiB3A
    ycLK8fL42L9obFASxb9HcmlRFkoIpj2Ij9pQIiITmpvtvMwi6bQAaY>
X-ME-Proxy-Cause: dmFkZTEKKjBhFtwnKUVG+UzeK+T9XrlhXvPXTegWPGIpg32SD2Ui/IHxWmbtlbQjXrAfST
    a1tuBMrlmT+T3MDYFzCzcrRgU+U7wVVz0/i4o6VsgkkhIrd4SLrg/kc+/gs6AnqZY12rdZ
    +icjB3j23LVnU7CfXma8V+M6aeRSjlAcsyNariP9y5t7GXcOvt5FcLDZm1mfU+EgXt+Xpw
    qMcz2gUMjP/B0NcKLxSx0G/5OEBSMJvLiAWsSLkYhqdXRJhF1gMUC3mJjiO86lxpPbDtDg
    13MTTg05/vvqd8jM+gMLkhteU27iBJ15znFcQfyLlB7/0HNuq9hlVFcYsV2WkFcj5zlsjT
    uk9aeO7WxwxFTqKHt3xdJetz7ONOWpcHhF3wrSozj5UB3Pa0mYwUYQu4gNKtqZwDwN4/nt
    Tn/keb1Mmm+CF5kI0R3yGLsEWn6gSjbZLNo2vihrJLyPvXWGX/PQ850syTHQHEs0Tc5GVV
    3sI2mf6bOJXvJ9Q76xQdSaLGdusxa7v6VQAUayujc0uzvB6oxCwqbG0LfzBbja3faz78NM
    iQ2uIc1Rey+nfZdVnlRFepUy58ES4YcxGJmcNPDL1d9+g1zNi9F2YPZVDj8PIQzl4xRxFu
    8oeFzoNXCmgsfk1O6ygP0vRxVw4vOv7iwFAURYX2KDpQ71HRnUefbrV7f6iw
X-ME-Proxy: <xmx:p3r0as9iBAyYdh0ku8wBkbOe759cmGuJcP9VcOrpN9XaOJMbiGWe9g>
    <xmx:p3r0ajwH4TUb7xExaNVmJk-Zj79iQ1JLmJINQbHOw3mtHlCKSyFiIQ>
    <xmx:p3r0aoO6LGSoxDh2pwvge6111uT7t3OXW6jj18gI-0K5p99-7yrK3w>
    <xmx:p3r0ao85StYK1JZy8nFDnJElCGpVTr69L9NsVpHFhNmc9L44QAJzvA>
    <xmx:qXr0at4h5mT7r5kp1cbB0f_-lnHJd0F1BCX6HWfI3k2ynSimTgln5Mtn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DA12532A0099; Wed, 11 Nov 2026 09:24:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AEzoRN2GBSm-
Date: Wed, 11 Nov 2026 15:24:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Agustin Santiago Isasmendi" <isasmendi.agus@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Navid Ghahremani" <ghahramani.navid@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <a9b6ed5c-4514-49ff-bbec-3f8206e8051f@app.fastmail.com>
In-Reply-To: <20261111133930.3665251-2-isasmendi.agus@gmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
 <20261111133930.3665251-2-isasmendi.agus@gmail.com>
Subject: Re: [PATCH 1/2] ARM: l2c: factor out the number of ways
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_062445_579908_BE5C2B3F 
X-CRM114-Status: GOOD (  10.21  )
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026, at 14:39, Agustin Santiago Isasmendi wrote:
> __l2c_init() derives the number of ways from the cache ID and the
> auxiliary control register.  Move that into l2c_num_ways() so that the
> next patch can use it before the cache is initialised.  No functional
> change.
>
> Assisted-by: LLM
> Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

