Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8588D606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L7JlpK4s;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Zo9efcIB;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XhhVe9IY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UbnPlEC24dkXjKamOs3/pbar/DmSKOkynvOR6CwNOYI=; b=L7JlpK4sMSgMOn
	6vnCPpoCy3cvb5mLmYudairgyTSy42y0QOAhClzV3ta2uZDosJ+eQ7WIQYd6lHr7cAV1P0spTteqT
	nJon2Sxh5ZojESttb3zsWr4jenl8LefP1gU2VcifMK9fbp5yTQl6FxCs6OAoZZT5WrT5QMZo6dpA/
	Fbe/JffyBOlA5yxNn9evvtmkw5r85TemnE5K13Wmi9AQ3IgYTgE7ihNkSW/LbZ2mbCcsPsp5YZnpt
	YNkzVHToyLsaJQx56B57fs81/+vYBTE6IwelKbS8S4IlVmJet8E76o+b0yiXiT5EJBh5Eveiu6jmX
	1dKioDD526AB7X1HMngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVbp-0000000ADti-1bF2;
	Thu, 12 Nov 2026 14:17:01 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVbn-0000000ADt9-1NMq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:17:00 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 7AC681D0005E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:16:58 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794493014;
	 x=1794579414; bh=UbnPlEC24dkXjKamOs3/pbar/DmSKOkynvOR6CwNOYI=; b=
	Zo9efcIBsV78Vf7GQOyuzvtCvTm2u3MlgEKOux4tEFcwIxcLJDAElgyImkKJZWGM
	RW8b/ibuCWyFPs4J/4r2X14zHg295WnvPsaAeswZzrgqtWFjP5sXGAaZIE2DGyGu
	PQzy8ZLLXtPB45VkkoDzxuXnCGMXaWwdJcwYoPZd90DojaeXxIQMrLdtgouHNmAB
	num6RS2HUj+pD1yxMzAN1uak93kdgfOVd2YiISsSy/cWw5d54zPRYYV7aThMlAXw
	UcVn9pirhBrOb6+N4bAQd+p+vVH/huRZfn+Ma8rq5f+viyORhqCpaX+JPDyoL90t
	j6UVGOGE4m7h9YEfDdeawA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794493014; x=
	1794579414; bh=UbnPlEC24dkXjKamOs3/pbar/DmSKOkynvOR6CwNOYI=; b=X
	hhVe9IYYq7iI/u1fU8tbuZ4FHSYY/53NyzJh7/mAIFWl/8U99ycxaF1H6lANmhIi
	bVjyp+45zE7Q1cm2do/HF2qh6F5gCGVnfE+5HuX7hPxFfoOwAXx0KjpXbwBO/tTC
	Vd8X8OVaheeQ4buEDOoLwgmoDku1J5ST0xaZzpMHkmKi92XZvvYrGzThEY0dLGVk
	ZjVFLII8bFfsH2lrybiI1OBpHwXL5fTtUb8xLYe4tIXAPslzLMnT39jTFz6uv5iZ
	vRY2lie75dslydLYg5XvHDJSkKkB5EB9VoGHmQpoVpeXcwFsmaMOrqhsWRh/k//x
	rPvQKHYw9shsucBIgAPqQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794493014; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:SFLicWMYWhn5TZkFxjHaHUpOJ9xZhcu6uwx6IL27zIGbtyc
	7+N+eC3jdcHqFtz931enn5p89zrBF1KaKuu+kGCP1qfzDCybcp4OL7mPmDijBXC7
	t41QIU3DYXfypGh35T16kLcQTh4L5CT5pKcHCGI7v4ya7A/GvJU6Et1ZJsWsatCL
	fFtSBUqu1s/u/04TIdEvOd8+y95jh/T7UDR6pY5KYD8QBr04qxNixwbgd2xuHp1W
	5Tgfhluvmm/k21MEr2hiWPS2uD9T7aYuNjuFfrpYLKEctCz6LadMfTG8psr6ssYG
	LRKoOnxyVMae8A3GYN3DeQd29gLkjZKBE3NtYcw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:RJMoJlBKzRz4YafuepOWgyGgRwmbNROO/4+xzp0wgnA=:voWKWCaOGlpdmVP0Cwkilh51Ef0aw4U3oRcvlpmnlcI=;
X-ME-Sender: <xms:Usr1asjg9G4PPrrr82juOslt7WKJN2ox9e-bN6SzpTxkGdZM0A_dDg>
    <xme:Usr1av04JsRqLh9v9gbHE1H_izlBix8MV34vFWayd6EjzWrkxHPwiFWLrHvDmo26s
    ovJDj8__BsFibCUgFTXI737JjmO5mwOO0BL3xeXFvJrkizs4QQO0SsY>
X-ME-Proxy-Cause: dmFkZTGU1UV2oYSfQ0TDb1+YCaM1GfW0+RS3kK7MgTRdv3CA05JCz48Ta9CCSLlOcpZnTE
    5+ZOMsON9AJ3ihTXUUpRdagXPodCCoX6aSe4q5jQysfDOpftb9F+DFbYH7T2XBDQ7VjKfO
    kI6OhDcTdOghERSXPTFLEsqkUrMOnhT6vfB2kbZOXMxWGEnfDaRp9cSlFXHNSKBIf4r47G
    4UHIhOtAVLx1q6wW8GKxQdM7x6pA399ztVauThgsUqwHlKALouxJ7qbpJSnrvVw4HdBBfn
    rr0IGOO4fLpCz/qnjaC4U0it81fcb+Ukr6/dPb2fOTpIwMvU1Q1LkaugEouHuqsMSRrZMR
    wV2gg/g3S07ecr7z3571XaK5lEBI91xNUybORKYiWEuNXxwFFwvfUgSLVVUKe9kW/uxhbd
    GX8PX23AF79RywweGYodz3PlJe9ZozIMs2roOlsVr8lH0EB+TwL3walkuyEZQ+gY4fJSqa
    PRURPvRwJTeZh3C0FKz/ZoYkgakQuZmn8A3xnYOOTXuTOsozSOJV4MTOvyXPBX0L4u6EZP
    ZFekd1SJrKrVK/v5LX7o5DqlBAVNNSyi2f8yamaDRcunU86gEoaMyuQQj+9YR8LUFBeUyD
    uNY4M0HCGLraPM58SZuaw6nEEdvr0veDZlNZKCN8poVAPde3S/fO9I4sgxWQ
X-ME-Proxy: <xmx:VMr1aqkc6vj6abTdLo9cLUp0T0kq2sgpni80YY7mV3HtE5BBDfwxkA>
    <xmx:VMr1aiR95H7Gh3yZfCsXTicuFLoqUwgsX_WWV7HkuqoxcsoHYiNRkg>
    <xmx:VMr1aoYQy0UwsKNL0xGgEHQMls0uV32cDihyhr37Cxc9GbjGJVFSpA>
    <xmx:VMr1aq88aO4veFItIVp-gV4Ex-D1sEipyC0nBa7yTRep2NeKu6s2tA>
    <xmx:Vsr1aivy198MKwqJ4bN_4_eeISMyguI0Px1x3gP4D8vhBtwwmWJfmHEJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 78F7432A0099; Thu, 12 Nov 2026 09:16:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AytIAyy8u7pB
Date: Thu, 12 Nov 2026 15:16:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <d7086f73-c6c7-466f-9f33-e64af741f126@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-4-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-4-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 04/15] s390: Use the common syscall table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_061659_429699_E33EF1E9 
X-CRM114-Status: UNSURE (   9.23  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
> Remove some of the duplicated code by using the common syscall number
> table.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/s390/kernel/syscall.c            |  2 ++
>  arch/s390/kernel/syscalls/Makefile    | 12 ++++++---
>  arch/s390/kernel/syscalls/syscall.tbl | 49 --------------------------=
---------
>  3 files changed, 10 insertions(+), 53 deletions(-)

Acked-by: Arnd Bergmann <arnd@arndb.de>

