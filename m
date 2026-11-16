Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB55606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D4UAwuv2;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=hJx7+72D;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XZGyKgtp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q0TFgv26jI4kGOfBKYI66cOd8gITLH4wiXMswdZiu18=; b=D4UAwuv2lZDxx5
	IOvrukIBXBgpJQ8O0rXqvHGWnLgX98WN4o6LpWbDe2DCdAHnhrqXQn23PRLqRHgRRnOL+Qyq18r31
	UQdU+987Kuoo49m4GPwTMByOHB7Q1tPJQQx+3yMXFvE/uE5NwBGkINM7Obzzqr6zVqeE4wJNEoLj7
	ImVc0zBnZh1+nrr/kB2/tI++KZBEXqbCVCIzIkrfSoHaYF7Ww8ebaukhf7mNUIYi54vysNVwXkv1h
	CikYM7TWxjXEoWLbYFGRfxAwZDgXaYXn8vU9G/q9EzEP65Axb8qsIPS73pa+ihQdclNqpyXnUfclc
	6EcVLyYIpBp0vS9hxyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqzw-00000001OK7-0fYh;
	Mon, 16 Nov 2026 07:19:28 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqzt-00000001OIG-1WIX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:19:27 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5B7BC7A012C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 02:19:20 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 16 Nov 2026 02:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794813557;
	 x=1794899957; bh=Q0TFgv26jI4kGOfBKYI66cOd8gITLH4wiXMswdZiu18=; b=
	hJx7+72D2Zf0H2JFyTbqPHWwB9Frwq6YlREIej4YNKsfapqR3Tc10Pq2QDT/+OLC
	2uaqQvD/nLfQb0tmwoBHNvXDMGSAHzKRis075bn5b94T1G1/JTLUHqFGCQcNkNWb
	kw7Js7YiFvOuygIzeWzYwHgcr9g9Pbpb0FBUgnzEmIBCyeixtAi/2/dS+BXcTzaO
	ZsvXXFAVeLPVYw6oNKe5gNe6EqBqrM94rAwNnPt+ORyJrqtULEqZCa3wi9efbtBp
	NFWbo3RxLCwMLczQAh34OENmhCgGOjdeH/I08JMz7HKyyqnZ3uI+gZo+Hb37r+qz
	Rvvi90ZLk1jpNbhP2VNWuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794813557; x=
	1794899957; bh=Q0TFgv26jI4kGOfBKYI66cOd8gITLH4wiXMswdZiu18=; b=X
	ZGyKgtpwPfhn9+A4AZcIo7i4C75y4GIqQPGSQtzNHNs0k+GH+DBdCwFRU06vnJsc
	+08RafhxwU+l5m39nBHJ/V8nTDkt4iegcDEBAX8QS1ON+ukudNdlaLIrDNa/jTZN
	4QWvS0TVXTUdcTsjtpk4sjOWA5XfDsDPANpMxKzyTLZXQUM6Pg92hlYuervGVoNg
	eWuALRb3riq8FKHKL32fjye1TW9Hrchll4+xx+0Tgrj59Mzz6FSTfMUGFD8k/s2m
	OcJ7b3YW9pK4laWUgQefp+zb9XEVEFjn0PzCpH5BI2VhWxzG30qxOgpMgADHEYi6
	EX+ebWn51RnPOijWRAC+g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794813557; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:hLj2c208nJ5xTXzvqZoFK5MXpKwRRWIY+E/0IHnlYLs7qp6
	CUIR0wMEnFRdfLxsUfVGrK91YoJvyKrxYtYD3aSR15OSkoNX5gLB/iU2/59QZ0uE
	jzRfEvFD6JF3fGdSSb8pz9ghIAR82EMSNNFGXElxxU8krJXupZ7T/Pt4ZiFS6Zq8
	4jjnn7h0jKIXF5x++N4YzhLjByH9NvQdksdhi6+SVVnkEOOmMwcwhwokralVd0Uc
	vCGi1l8wdZSbAMa7oDE4gNbRhhpjvZaCN1R7ca0GuIuw3y5z01BeMAQHvMrhDYpm
	mymy0UbNt1qqRi11xwNYhKLbIx4v4/t1Qet//0Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LM1Sb1tl1qynh80rn5D3cTs0lm/3agMt1ONentbmoa0=:Q0TFgv26jI4kGOfBKYI66cOd8gITLH4wiXMswdZiu18=;
X-ME-Sender: <xms:ca76anB4AUw1DqI-WHDD8ksYHlu8PP2Ly63YtDi6aNsL4g_WMpsnTQ>
    <xme:ca76aoW7o7FUUtwVrarqlAjdlVAUvQW00EpoAwIsCwCdK7JcpBwsWhcIQ2TTONHOO
    pKgvBnxign5OmmnY-cE5eB4OIoE8A5N_WL2jBTJCM_9hXrKMnBPssw>
X-ME-Proxy-Cause: dmFkZTF123o0lc1ZNONC6IHTRcYRdmv5B6bDrX1s571Mq6u7KreO6C3RvwaRcwjUgMnto7
    C0bP7r0rrVpIOYSuaPpEud91ELs3Ye1XlrmhJ6U74AeVmo3/hSdnUprF1ab4qsKYNeDq+o
    wu6Q5zGahlNpkbuyh2WMUkxbaGZ2r5UC5nOQAB82UprzUyo/TAF+o1H3MI9FUjy3hIYsmJ
    6ihpOrK2uS3AjVzXT6KBHyzSMPpCQotKSEo5FmZ3wOpVTeZtWhcAmxRr52XZAKQzF0QGVv
    kcWd3ti6HL2z4Rej96Om9z+PQEw74V97Od+rNW7uwbOPYGwOzDlGcDNaCdW9ACkbHBuic6
    FbOUaRiR4n3529j3UFaQB4M5JUDn9VvwAuai1gL2DnkwqX8T6YhKvAdmL96nvS6oUE+LS/
    bQggH9ePMCJddMsPYuQQ7cHQgde7VdVX8vegD1SNuRWP2NWf258wdb++v856dUkHK70QS+
    aqHeiKHK3u0Hg7PIYQBePQnejqjByPwjkNReVqVt8eaIGN4D6xgSeJpKpjrpe9JP/0ka52
    XTXOinJAGuzBYLM+gwhQJ2n7wGaGbsSoDVnD/CV6DBjX0rZ/d5HjiYQ1Le7Se8t+enk7WD
    gKh4ooagE0M22L9bEcaIN+Ws8kiNpgyomcFBbwwrDdbnBzfObUWg3V/Qw22Q
X-ME-Proxy: <xmx:c676ahyjZlVApz-K4fJ9vDRxXa2dM3Z92nwPSxbJc2Bq5jVzymLApw>
    <xmx:c676aj17wmuvv9nKuAEfAyxgpFWLHzG4ZLlp7RdCU2jvIUHlFItnLw>
    <xmx:c676au8b4aWGY7hE7U5Wg11YKsLCBj-yRg6Qs29sbtW8qngdd_l9eA>
    <xmx:c676ajpU0u-oxkDPovkmYyAHj2eprwvOmGuYZs15L6BPc2VGT-W_9A>
    <xmx:da76avR1A4_tbvlN4y4MgmTxZTF4WWKRvmW5GxwE98gEBnstDnE96w6z>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B774C32A0099; Mon, 16 Nov 2026 02:19:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AIwPeY0WxeBs
Date: Mon, 16 Nov 2026 08:18:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Ulf Hansson" <ulfh@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <e16f2781-af6e-46df-82ea-c584a8d9777a@app.fastmail.com>
In-Reply-To: <20261116-ux500-sram-runtime-pm-v1-1-c554831d6b12@kernel.org>
References: <20261116-ux500-sram-runtime-pm-v1-1-c554831d6b12@kernel.org>
Subject: Re: [PATCH] misc: sram: Enable runtime PM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_231925_871271_467EA485 
X-CRM114-Status: UNSURE (   9.05  )
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

On Mon, Nov 16, 2026, at 00:02, Linus Walleij wrote:
> Enable runtime PM for generic SRAM devices after probe has initialized
> the SRAM mappings and partitions.
>
> This lets SRAM devices with attached power domains be managed through
> runtime PM references from their consumers.
>
> Keep sysfs-exported SRAM and SRAM requiring platform initialization
> powered while the driver is bound. This preserves exported contents
> and avoids unpowered sysfs accesses or an unsupported resume sequence.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

