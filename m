Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E53606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lu9Jvmrw;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cPLj8Yt9;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hC6LIkJb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BHJ91NJtNYQ6/J6+FaRGzznho5yPOY/r3tuo2Sshg1o=; b=Lu9JvmrwpMUCS7
	nuAzzFJn1Z+U8MHceswyKNnxdQoYTVXs9IZ8ixymJfbpLghzQ4kIMuyaYMH3KTzx1URirInfdd1vr
	JZb5c+NNp4nA4EGRU1oCv4aIlrqlCdJwLzy1YYKFtqj5WQ1gs3V/dPbGeaSBaGH7oRPIozBNUZz82
	tFh3nSvoyyC8pPGHIxL/gVMJnx7p7uTh/7V/UvLT7ZvPTIP2cq7MiSqXFT5xoVvLompSJnpUPb9b2
	Skp5crUrRwwMtFhLN4Zb/xyk8+/dIlPM0FO2HL2hzDUAKMkX2MZ6Umj0x8iNEfxhAt/7gSq7C2xmU
	f9RHNvIr0fgmlqrSEiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUr9-00000003hV8-1ydo;
	Mon, 23 Nov 2026 14:17:19 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUr6-00000003hUN-3Lom
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:17:18 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 582ADEC0B4C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 09:17:15 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 09:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795443431;
	 x=1795529831; bh=BHJ91NJtNYQ6/J6+FaRGzznho5yPOY/r3tuo2Sshg1o=; b=
	cPLj8Yt9KDzFT9oOBUn+/GuSsf5mynsPFU3peaGSzzjdcM3xPq2nCeDkNchhwU0y
	agEnTSgyBbGQ/yirLqdAtbec6K/eMPAPx84L678ABrYcb+wpXySl2GHRp4LB9WLN
	CFo2ebu58MUl9iNZ9Ieq9B5w0n8KUsPK5DwUz9m8y9EZ7/GezgGomuFh9mdki4r/
	+BIiXtKtzOGG5D+kuw3mpodMWyr20zPfOAhpC9pxJqrf1XcU6K399GtXsEQMc/8R
	39qj2UCf7kgamdATa+Pl6YH54Dj6cd0VQx4T8GjJ0eSyaIyzVoR7OVUL9GzpK8m7
	+ruoO3v7zMRO6WezXgniMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795443431; x=
	1795529831; bh=BHJ91NJtNYQ6/J6+FaRGzznho5yPOY/r3tuo2Sshg1o=; b=h
	C6LIkJbKj92f5S7k/JXfyeaid1Af9ZzNDUOfhQPFxJP9BRVK8CoFu3txAUBGFSdE
	kDtEOIgPiZzvlCZbCv4YLx/KipUoHlpFtABBaFDzTO/Eo99zurKqUHK11ZRFH3nk
	zrK7lUHYw/5sxSK66fxI2EBGUdhZg116RSbILC1OuB62zbnw2sD4sW3+a4PBWhw+
	vIkMNp+LX1SFD5zMvRTmes4VjgpqWOOFse8Womzu4lb2d/5udJ8V95DWmA0O1EvJ
	RGzmtn81sr/9oZLy7H3BztHTIli/UeDdJz4S0o8+2QlJ2kzB0w3ffJ58MILv/tOp
	VBsPDLa1+OUIFoA4NwwtQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795443431; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:fimf9aseAfBFZ3j7GKZJjUFFgCDlcgtD4VV1uxw7JoW+JJx
	PT7y/4Ij1ExyOoDEx4DPviIfKosqHqZPsgzL0i9chYgJOebN6uJ7kr1FhtIVoYb+
	FFKq4KAUn1riIB02Dl3BZIQVlF7UAjLuxJXPI6aqasf53nQ+uiJ6W+H8wAPtu/1w
	N1X9cFVYdOyGWBy4HA3xfsJykkaQqafNc4AX/msgBK4cR11fbiMuGH3jt7pGqa4c
	RXeKsCeUo+6RY3BMPq105BGurfm/8E+3xLsR31499W4FqYNDmjyCQ640GoB7lXcL
	v0Wh1Vy7h+YxOBwfU1apFvE+KOaOz3JTsyOk22g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Sap56MIkcyZT8r4cYNPG+lEt8q7zj6cm/hR6DX/YHXU=:rDsMBjpfa65jK66igtyHf1M93PmlfJObl6/94lUiVSI=;
X-ME-Sender: <xms:4koEa8b6jWHk9Km-gWsvkjXKBe9FOycLSAoQHdX1x28WgylltvrlXg>
    <xme:4koEayN-2NZ5tuVMTv_F6M4wNcDyjmgtjmjdAzvHywIA7KHMufFQZrYw4q170T5Th
    fPdBGfTNlodLlNUN9knmz7mxDJr9FP9Hc2uPOv3pg8T14AiyewMGhM>
X-ME-Proxy-Cause: dmFkZTGFrwq2MF5SSuOMe3naqs9tbtMAmc3XEG2p+PrgD+xfiVSS77ldCceRFMgHOXXvSL
    Ging+R6VT6K3yz4OUeCdmIETXjNj7XXI0r9Tg2543OHjiuaKhMh+yVJAoB6OkAWbwGP/U3
    JowxnSxhNhDyTsBNjiM7LlqkLGWpphbuTeJ0WjErvJ9KhK0fJtLolaHFC6Kw2talXF2YGF
    JN7yWyVcYnsY66wGn8uoBc1Op9fn/HtafFpC/Ha3Z7ng5ziTGTERGiQYQq5K4ZdS/5JuDE
    HH1gfdWjYiM0bW96wZfgClnWGF2XIAu99qwAHGam6Iwuv/kahBWnYmwWVFrVPNzzZ/ahP5
    U1UkBFU5ZxOctbFZFvYR87OCQ9D85IrFkHXF9AU7aFYWG6vLW8lI9uDg5E561v2/5hKHQA
    sjQFn5A8NcDFUKKIz/Gj2N6XcZVOTlbQkDMhl7pFKmJR0nTwtc/ea8J3ozLffLR/0wUUbB
    iamGkspUsbgem4niF9wBtKb8Aybdc10XaTbLUSATly8dgGeAoj4vWgf2FM9ltEDrHvDjNY
    51emBC5k6bV+SyYpJacMFkokFxMkxKPk9r+T99bzSjJsfdRVRAC/r+2KM3FJJSK6C1f8wW
    I+V82FhA+/RpOowStt3CO/53UAvaoCC1+Mr9HKqAkD73+MJL10fMk/SelFXQ
X-ME-Proxy: <xmx:5UoEa7zTEzd5mDVuAJ0khzXfAhl-NnyAwD2CijXl1cunNEN88JhvqQ>
    <xmx:5UoEa4LmzfnQ4K0KUaYuA7sCKQ4bXebQmmhpsTBdhtm50HSfa0pUZw>
    <xmx:5UoEa9456MjeyYgj744opH-waU6skY_xuQzxaCDvT7bwukaslpL8Pw>
    <xmx:5UoEa2xmieeiTKUZnDvuF-Yhydil8f6ZkK_qEXx5P2wofodg1yRZbQ>
    <xmx:50oEa5l_6AC-8c6ZgGJR10cedMu4FgnH1XmeVBS7jPfPPs2PoWN-CFom>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6EB4832A009C; Mon, 23 Nov 2026 09:17:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AMjdjL9dYp0J
Date: Mon, 23 Nov 2026 15:16:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Kees Cook" <kees@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-alpha@vger.kernel.org, "Paul Walmsley" <pjw@kernel.org>,
 "Andy Chiu" <andybnac@gmail.com>, "Magnus Lindholm" <linmag7@gmail.com>
Message-Id: <b7b8e8cd-d0ba-4e37-93f3-0fa209207124@app.fastmail.com>
In-Reply-To: <20261123110111-6431e85f-39a4-427e-b545-2e7a590a6c19@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
 <ec5359c1-c16e-4177-8dfa-2ae5ab8a874f@app.fastmail.com>
 <20261123110111-6431e85f-39a4-427e-b545-2e7a590a6c19@linutronix.de>
Subject: Re: [PATCH v3 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_061717_224450_790C8251 
X-CRM114-Status: GOOD (  18.75  )
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

On Mon, Nov 23, 2026, at 11:03, Thomas Wei=C3=9Fschuh wrote:
> On Mon, Nov 23, 2026 at 10:44:40AM +0100, Arnd Bergmann wrote:
>> On Mon, Nov 23, 2026, at 10:37, Thomas Wei=C3=9Fschuh wrote:
>> > There is nothing userspace can do with this value. In the kernel is
>> > always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
>> > userspace and also changes from time to time.
>> >
>> > Move the symbol to kernel-internal headers.
>> >
>> > Meant to be applied through the asm-generic or execve tree.
>> > The default recipient list was huge. I trimmed it to only the
>> > architecture lists.
>> >
>> > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.=
de>
>>=20
>> Hi Thomas,
>>=20
>> I'm happy to take this through the asm-generic tree. I've already
>> made sure it all applies and the patches look good to me. I'd
>> wait a few more days for additional Ack or any other replies,
>> let me know once you think I should apply this version.
>
> This v3 is functionally identical to v1 and v2 which have been on the
> list of a long time. I am not sure how much more feedback will come.
> IMO it can already be applied to gain more exposure in -next.

Fair enough, pushed out to the asm-generic tree now.

     Arnd

