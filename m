Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7A460A2603
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UHmO0nRi;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Bm5j7Gjp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OenGVGv1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BmvM/YlBq8/rduSNOPefNuH8wB7Qup2UTei4EUu05Gw=; b=UHmO0nRihr+XaA
	2gEomrs47i1drcWZp6kNIl98bR2wQBFd+UwhZLXEB8qvf+zy2k3XSfxDYZFYlNcGR8PbbEj8fO7vr
	dFqxhbmbgnpw0pu0XWCu8zYDsN+C61PbxLXKa6HoMTPC/NWL1O7v9XicfbgysLHEBEYFvrjJQ4HUw
	SKuTwGe3P38i5dL08S3G6/FQS1U8xWJ4qW6IhSV3YuZNS+UUK196wG/QClvHAALuT0z9bBx42d6cd
	Fu92eEZ+obyA4urnhME4MMRUIWz1dvtb1orYiqstRqNTDJk+fcACIIP76bFD4PoTKA0SaZvNbk3mk
	MiKXRw2oFF/qhBzsxV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVb9-0000000ADmR-0fmW;
	Thu, 12 Nov 2026 14:16:19 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVb6-0000000ADm9-3i8u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:16:18 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 0EA5D1D0023B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:16:15 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794492971;
	 x=1794579371; bh=BmvM/YlBq8/rduSNOPefNuH8wB7Qup2UTei4EUu05Gw=; b=
	Bm5j7GjpPQPj3DAWDQpQzrWYO3h/hYngRAiAt4x0eFgIA9IKgH2kefBS5Y4nAkVx
	oWYwoG+KSmOFFh+zYurrHFBtvkb9wl7M5jFAPVAEsr/i3IcRjZAOELkrFX+tHh0i
	7gehpMO8NL4HBzRKk+fEO73yIB4Y7ah7q/HEjR86me2pveNnBf8nNy7eJXiIlYZ2
	6/iRYo39R0KhYNkqDPKa1sgU6ATHHw/P4Ja7JYYFK2jD3Ig7FjsBnGW3CplzWaUN
	zJQ9XBKwBc8VW962jOPvuN7vQ3fEtFTQapR/egFL3jmnJvnWQLgMn4MZw7SS/rpe
	uRcd5whmJ9GEQM5J4/ka5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794492971; x=
	1794579371; bh=BmvM/YlBq8/rduSNOPefNuH8wB7Qup2UTei4EUu05Gw=; b=O
	enGVGv19RfGHq7HwrbT3bjgU7EN1uTV0VfPxDg2KISaIsH6eO9y62jd4W3Ucdmi5
	Ajw2ckXLMXHBOIZttM6mBSTEjzjFRJPFEEW+W63LdC86+ZdwF5Vo/Lvzymu3QwWy
	mkC2iTc2+SXirdxPwJCtGjoVPJ4+gV4ZWb7ccY5XRjD+czEsHWpa+HZx3gKN51gy
	EBrytDOzxHs5hWZQYn24dTaObZW/EBW2n33Jw/im+TUeD/JesZETA+Eom5tshtTV
	v/6u1yy5i/2xMTV7Le8p90gJCd25uMwKUP/tYYtY+S5LqZIYxV6ms8kcyVOQxzN5
	bSyj1MmBCys18jnssObhQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794492971; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:l7zGl7h0PVNLEMHeYI9ilXk7y2ZVvSPCkK3WzG3EFUn101U
	BD8Y8nv04rrGo2x64r15y4CgiV5/jEFiskZq0i9nE7471NLqvaUkaHIDBYaB/3Si
	7DHp24BYPI8mUTFQ6yFnc1YKvBMeAN6yG5YDDg7AJRz0v9ZhB4dpZY1rCy4IOJDJ
	r+uLdgjKSmCAMieDt71OjccoW1DhiyJE8X0qyXSx2eL2TAuIvSTxpI7GGCqxRate
	+ciLMlsnWJppLaq0Qul0PFDknDBpBmsfcMtQpZyBuu+klwBDBIDR+7VyWcGiqMii
	y0MlnR8fezwFvkhZ8tIXyBSt7tPrMGMcb4J95ng==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:wA8qIrkkAJGeV4C8Qp1D01NklBrWEYQITXQ7UurAlXY=:BmvM/YlBq8/rduSNOPefNuH8wB7Qup2UTei4EUu05Gw=;
X-ME-Sender: <xms:Jsr1ah8kr-NLdn5cAzSkdTfL3MBjf4FCfu-zfNt1S1n4Y_50lQMaMA>
    <xme:Jsr1aggPKVYpDAXAWld2Bg-8Cd34r4f6c5kr09kBiry9WOfzxhfOiiaBVKr7xdbdA
    Ibr5DlBsngV4_rscQ8z1GaRvbcIswlsKxL802npH5HuvIxKg6y-X-1m>
X-ME-Proxy-Cause: dmFkZTEBSKBTxemaKw9o7Z/MaokhoauH4Z82+HOM1GBvw01dBWrZk2ZbdIIwb5no2bv6Vs
    /lz5gLX84OQgFfkZb88jfLOoqaZ1V06a4XgQrL9i63ufnm9ivwN5CXnprKjPLzIQmLf9l8
    UdpM9lF1f5JoYYPwkd5+xsxwFx9HWMhGRLAA33oztdhR8jL0wLkj8bgMABzxHQTa8dauqs
    O/IuDgAICrjNlSkYGf/dtwFlGeLr7CXcLYRBcrF2DO7QASskcoW6uue9cFly886C2qM0VS
    3QCVVTXY8um4X35PiW7GqhVIFBuNouTxgdBzSDetLe/1DEVakzwOveOblXLlvrLSdpCFp7
    GbRLE80m2mO9VlbvVqoCc3qdFBEFmmO8NNCa4syxdrgfGdsHXBQnMm/vTP7OEDPkoVj2jb
    c3We0PBus5CEJXwFEE6lTDR6B19H1I2wChYRR26WYg+m7SxKvuR5P7zfcj3yz7UWUwiM1X
    4x9eXr3YsmZpjNLg0+3v0dupN9JISsgbo0OS63uEun91Y52UhaSMN+BVVyQQfBwGlfYT/5
    VMk1kORXyct18zpR5wNEevRwINiHngtQWuF9PhWPHWX5jQufv09reGcb9FtSqFc+shRny3
    1MXv9vX/l1iJh8ZKOzdtG5wQVCt2RXd26IaE34GU4HNJt2T/6aAY7aGxug0w
X-ME-Proxy: <xmx:Kcr1alqDZt7bUGYLXPXelGGnZCQktktFs4jef847PvyzCmW7GQJy2w>
    <xmx:Kcr1amIHJ85dkSJ5utCexWbkwZOcKbPr66hNfTA33DzGuTC3hz0miQ>
    <xmx:Kcr1apBMlBfvKZvyBphBSEVAEe01a4C4vL5sK_Y07sSKdMbjDir3Hg>
    <xmx:Kcr1ag5FFI1Odcw6H7qXh_JLH8cWdqVk5jjrJP7Zwk6gE63bKxh5PQ>
    <xmx:K8r1ahJaGHm3eRH84_CJ-7OrgXKmkN1kDesPRmDqTvtZ8dSUF7Sf8PVb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9FE5232A0099; Thu, 12 Nov 2026 09:16:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0flP_EnE2Jk
Date: Thu, 12 Nov 2026 15:15:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 "Magnus Lindholm" <linmag7@gmail.com>
Message-Id: <b77c9ec0-18da-417c-b703-77901af8f52a@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 10/15] alpha: Define entry point for set_mempolicy_home_node
 syscall
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_061616_989558_4A6D864C 
X-CRM114-Status: UNSURE (   9.28  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
> Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycal=
l in
> the syscall table, define it as the real syscall entry point,
> sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
> DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of t=
he
> mempolicy sycalls will ever be compiled for alpha, resulting in the
> COND_SYSCALL() fallback being used to result in the sys_ni_syscall.
>
> There's no function change here, but this step helps to unify the sysc=
all
> tables and create a common table to rule them all.
>
> Acked-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

