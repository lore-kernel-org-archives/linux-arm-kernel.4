Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0155606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=glWoMsec;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=aqmnkLz/;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=beruM72V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kdk764iItB2tzvrPnSW2o6ljeR7654G7oyKs+MOQe6g=; b=glWoMsecf0Xbh1
	d3BjkdcWWKE6hxe8nwD0eGL6/thoxCdMMQPahzU3XMLTY4tGwgCWjjdy0tvMPZyYC/KP0GLj2MhXy
	q+UBFLEbbSlqtWHI2Um3tZHKvsAY8uq5pYFmuLCkcYMoPdkSC1h3v9brd4LYIUSy1Pj7FnO80t12L
	Z92OK6gnZfcOZHCrgYhipNQBnK7IC7PK51nBCx6SmksFJVRlVyqs0CUHuYbqTf3z/XpZlEV9Ecz9B
	xPqa0oZ0YwC1S4VPNA41KLQLjrQdrCQ7Rup1c/8V2JfhzzGAgYEX5VbyDGHmrlHQQXFzn6QUcXkXg
	kKSAp7pee8yGDB47fVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8p0-00000006tTD-37eu;
	Wed, 11 Nov 2026 13:57:06 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8ox-00000006tRu-22KF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:57:05 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 078BA140017A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:57:01 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 08:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794405418;
	 x=1794491818; bh=Kdk764iItB2tzvrPnSW2o6ljeR7654G7oyKs+MOQe6g=; b=
	aqmnkLz/fxk/yf/NXuAbKeyAb5QNHI7dAS1DtSTNDZDc+1maiYBg0uJ/1fE7i7QU
	GUpKzND/V6gwXB+9RmZjqOsXBZWGejsmcl7NIn84hn9QH+z6JqMS8urwAN46qebP
	y3DXcd+w0ZRSkLwZsVn5g7NpdvwUjYIx38MQx92vh5qYstOwvCEHQE61X7R3WlFm
	2FrWLTQDSaMUgwri/OaJlEnJtgKPMe2X+CO500a6yXb+lWvIHAVsfFPXeSKVDk1T
	Tr72m+IjR6pcddABnGXgRAqDARUnug59EeC7b7/2BIUQvngsNMgQ/rkGdA9qjgws
	9mVEIZobpE95ZcuBQ43lLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794405418; x=
	1794491818; bh=Kdk764iItB2tzvrPnSW2o6ljeR7654G7oyKs+MOQe6g=; b=b
	eruM72Vbk/suiSqJ7+PgkyHJ4OAsc0ZCKqiSFPXfmfNNy0z0HdzqpqgIAYnym4j9
	zkCG/FqByrKTdaDJUBjkKFowkPIlq5demF6jiGLmYshkVKlkjuU+z7Pv2JDc5dyE
	mbslWxOhC5AfimL0qd6vftFWJgbwtPnh9Oz2q8uE42PPY+qfYbejodVl+mF0XbiC
	/pqTMxZMXrZEAIi4bHKOJQIhoqfaGCGW4lZHeKSBjxf1cJqThNaOS/qvlFXe44tO
	2kpE5zpgp9dHv7HuAkf2oOLhY93ND7MAk4TBkZ8o5EqD0z2ljaXh5vO0/9ci742Q
	+XdkhkfZPLAfr6AoJU+nA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794405418; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:mK1lz3tC67GbDXW4rtQjNtViuDbXubbmZ+mV0Cv9smxNG97
	86Df20CYheBGZUwpoEthVlF99h1s2N5Sj8vDfe5tRmpYDMOEXqLFpfyCjH+blJ24
	Y4C8mSihM8GE9VXeyJWI7mjQmNHgDJpfx2o7Fmdxs4dTYbtyXD6c5ik/il9BBPB3
	EEW7zQUHkmV2GLEscEjGWhl6yjAZKrQ0DLp+u2b5M9o/DeYckimX6yTol9COOcE9
	gDpkpcbXr8qGErlX2wCaG12CDif3ADySa2OwWDY35soUIHZwVTyq7qGhRI96FlV1
	6GgkEzFl4839L5X88MD9Ig6QLmPnNmzUl7sLmGw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Toh1YTnD1+dGrAtJ2AuY2/WW/S/YxASsJ+zcEo5XRxg=:+neQ1GDgaggW0c4Lfo/mJB6NE6M1ZJiasN+aoxB7DBA=;
X-ME-Sender: <xms:J3T0aomwmPS2KPcejDvDlhMjjj75Xiq8goYrcG8tyEwCu0OdHbLq3g>
    <xme:J3T0aioUebuzbfJf2HscvB9X9Vgg4Fg7P29eNGyueyyYhAC1dupGX1auwIuaySl2b
    4-jfV1DInX-NSpYbYOKkdPJ_RlkvPRg67RZ_pb6ZXIh_Vw_QBgPnGw>
X-ME-Proxy-Cause: dmFkZTEjx+im0ead3mBwASswY9eNoBZhB5G8zMcuHOYkywMLGJWGf4Wb1ah8yOfNc5a8GJ
    e5M5dRHf282PROUCybONhJ+HMu59oeSOzQFQ/RA02sSyjXNLm47s40PoPE+rZrSqt7zTwI
    IW5/kkUl0Na9JgfDH3OoxOgo9B/WiXOkC01Eew9958VILo6y9+iIf6WKv8WshncaDvKJrk
    FnM3YZ3jdpXvMt8yfs0xYfPQAe5PkQq615IvLQzCu1awFO5Rjss9iQAzijmfzqT20mmGLw
    Bpi8mWV1UJf1yWK30OxwsXQghdZrT7GBop09LZ7tCacRgH/1bJnqa6fx5+OxMA70utbhYd
    rZOa5Tro8N+6BnxViklk3IMkUm+l9m+edp/2pupZ6lm9F0KgbCB9jUB+3pMlSDVoDbN/Ey
    SlWROoPoHujFG1BLtNZsxUBMrMJ9EQIAMkYrai00ORKeOMKrTATL3JmaeWpQc8xiUTq84Y
    7g7jVhKdw3zICtikOv2m3+Zpzvidub+EGUj0WzdKU1IWzk2cucJS2goPu6TtxdUyVl6PAM
    uhQQ7fBnERrDkIao0IvJB96/xSwbfz+rZtuj2DvF/5uza7dwaeIGTOJmcRYnjKzcMn65fV
    Ji8QTVg+HqS+bWg6UmjHgXPCLFU1dXsp6amBh+KL6amiRchT5AaVNOlz6wVw
X-ME-Proxy: <xmx:KXT0ahKyVfzaxbAMLlNC7VeycNkkctLNG5sRSzMDEdbAR5v9CPpfDg>
    <xmx:KXT0asP4ecEsYsalAV6y0Dsx448KtTxWiujoNFKjH4zE4nso9Hm5Dw>
    <xmx:KXT0av7avvcy5NPEu98Dg2ioNafWBMi-5Luhpjiprioxb4tg9DQiAQ>
    <xmx:KXT0au6PFJA7nsF5WH_qpKeXY2nsfNjXv3_HvDPDghLXSKyaZpLV0g>
    <xmx:KnT0atq7m-0CfksC8jaLrq6DIlV9xDBZXHECOUagz1sZJk4rJr0RfvbR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BD98632A009C; Wed, 11 Nov 2026 08:56:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Arg9H_lZnKn7
Date: Wed, 11 Nov 2026 14:56:34 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Agustin Santiago Isasmendi" <isasmendi.agus@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Navid Ghahremani" <ghahramani.navid@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <49846243-34ae-4643-9b39-1537947fbd96@app.fastmail.com>
In-Reply-To: <20261111133930.3665251-3-isasmendi.agus@gmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
 <20261111133930.3665251-3-isasmendi.agus@gmail.com>
Subject: Re: [PATCH 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_055703_823395_1C07DE26 
X-CRM114-Status: GOOD (  20.29  )
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
> l2x0_of_init() looks the L2 cache node up by compatible and enables the
> cache whatever its status property says, so a device tree cannot keep
> the L2 cache off.
>
> On the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3) a PCIe read on one
> CPU deadlocks against an L2C-310 line operation by physical address or a
> Cache Sync on the other CPU, and the board hangs within seconds of WiFi
> traffic.  Running with the L2 cache off avoids the deadlock, so a board
> needs a way to say so.
>
> Honour the status property, as the newer cache controller drivers
> already do (drivers/cache/ax45mp_cache.c, starfive_starlink_cache.c).
> If the firmware left the cache enabled, it cannot simply be ignored,
> since nothing would maintain it: clean, invalidate and disable it
> instead.  No in-tree L2 cache node is disabled, so nothing changes for
> existing device trees.
>
> Tested on the ZTE ZXHN H3600: with the node disabled the cache stays
> off and the system runs normally; with it enabled the cache comes up as
> before.  The firmware-enabled path was exercised with a test-only
> change that enables the cache before the check.
>
> Assisted-by: LLM
> Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>

Hi Augustin,

It is a little strange to use the MMIO registers of a status="disabled"
device to turn it off, and it would be nice if we could require
the firmware to leave it in a consistent state instead, but I assume
you can't do that for the one device you are interested in because
you don't have the firmware sources, right?

In this case

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

but maybe add a code comment that explains this to the reader.

