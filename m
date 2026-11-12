Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAD7606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WDcIJBJ6;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=naQ/MFh9;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vDEryID5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MnNonxZfn4jhLH91hzGPSmnjnuWOwKJ9GTOdPgW/XGs=; b=WDcIJBJ6gRJFAg
	SMzyAxqmnJRkeFFrs95p0658vwf02Wh3HoICxVcC+aeaur7Kleytkkb/niqSnmJbYO0I+7EtF6tCM
	68rWXYz4CWteHcUq2QH1UTvDhE1U55MIag3vkws+bYQ4iQzbntFtbOdjMz2+ZX2x06A5v5q76nKmw
	UTh/kP8ytipK9JqayLDOz55k8kzJGKYg0LjRGVMZfN3hyF2z86B/SixLVFRCAoPM3/DarC7Yrjqie
	CxAOgb7kKqSdqHFbWO16SkLHQ62xduUBRQfMlHY5BF2cEKZi9ighE9yDYPcgp1wTEJ997JfDZhwYU
	eakzP88hHxiDa97JI22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVaV-0000000ADhK-06ZI;
	Thu, 12 Nov 2026 14:15:39 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVaS-0000000ADgv-348N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:15:38 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id B188D1D00142
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:15:35 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794492931;
	 x=1794579331; bh=MnNonxZfn4jhLH91hzGPSmnjnuWOwKJ9GTOdPgW/XGs=; b=
	naQ/MFh95/QI6xXM+noPCk/tLZAZ7NV9U1VLZEGZRPeZwOEBqBd5hAXtO5waTOjV
	ca/EEI+V/ZgA23+fPAtuwes3iNqUb6965oLR9u6lasH1pBkSS7FvbIyWhevncpv9
	u1uiy7wYS2bcdYA3rB8CcZdCWMQnKvsKMKoVuR6cXkVNip6lVhoYHCM9yu7e3NCe
	40RULwdP/mH88y6SYced9tumQlXAj4Hgdqk4Nk4yt0VQ269WjT6GhQefSFdmWzzC
	dCSQLGr7L0tlE7ExqNVgym1dfXx/bi9R7tgr6ulQ9zm8LVj6Pkxo7rC1Ib70/9lP
	XzGAXKTw1kqKxj6xlMzUYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794492931; x=
	1794579331; bh=MnNonxZfn4jhLH91hzGPSmnjnuWOwKJ9GTOdPgW/XGs=; b=v
	DEryID5qn2tgdxw1Nud7doHl1rtAro3c018luuNa9kZ3LzMzkKMOLbo+D+M4K+mx
	ae2k9Et8kkfbv68tJqUw+wylRmFQ2yFPt/yipIanglh7eVTWcWsqI0jRA1baAP8Z
	/ueonB5H7ZwAIogRgXn/a4djH4ldvph6NJH7IasqJTHzutH6HPbjEJ9gDaHTZLe0
	On7WKKlRWFu6Ns0ymWFXhFF/s6odO8WRSx/ETK7B3lBreLz7F1gddAvCE5UE3tEJ
	pPgWnz1tLgCwkrppLShdukwZMJzrCh/hae+K3vt2DREXvYiB98vEkDEkIs5ItpeM
	NRhVEPhhxRjiLhB0sb8Sg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794492931; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:OeGOmmZU0yhSmiWlrT+AxP2XVGBY4awF1RT4ZpiQV8KbZhX
	quusf+Tm++FErXRSCZqFECwz1f7mUPUP/3Q65v8EMQxq+nqKF1ADBXQ0lb92mMYF
	Sz6oUHNeSJeaIGNQWVQzo2h4K0shtksurOAjfKjOcBNNatH6zh9P38JByWa0Jn8j
	YN6rYY1LpOogoVVJLRH1UUvCFxUnlQBeXmjr1LOqM8OiRBCRQvvYDWQoFFzDTAVY
	7XrnoWW22gv42STViGPxWAlGuFvXa/jC3Q/cUgKhsblyKmYHmrq3ph1jeAxc6Qc0
	0j9zYGrjUbRNZttq2P+BVuncOGKH8hiVi51tK7A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:9r5f4OUrpU08Y1FpmQTahFTgxuW7oF3cawvOFZqcuD0=:67SbXuG4oEDukWtafy3LN+dEdLYaqwctdN0akk5ezW0=;
X-ME-Sender: <xms:_8n1apqqcICHo_xY61Cp9q07j7VqBHq36h97HLEK3TYfBJmCypsTXw>
    <xme:_8n1amfTxZZL2yT20Hb2WANxyfmCsDf5H-BCDO2KF0tP1NXIrPgTr1iOMesgMO6sh
    nh7skYO0S2wTh4FaCqL9hrj6ALCghot0eQYLu3sAO5Yu_mdtsjaJLr3>
X-ME-Proxy-Cause: dmFkZTE0t0FwBrWTDqyXlkUb4nfDISdRbGJULODMOYOjT3eMtqHrTAVPuqH1BpmjQejR8B
    d42P3Yu2FTAggVc8aDAvmV32ZsPGt7+n6RFAOGh9KMQUO7zm5fcMg6rurf61rTborRy3yY
    JdzOxFtrfj2tx3IOzF8B3PKRtV862GePpT4MlDWACCMOCO1EmaPEXFRR+gJGtji/hvGdZ5
    Gq2Zd0ZYIkeK2tbjbY9PxG9crnviFDpNCQC3XEBd8qvrUV9Z1jpoKka6Stprg+YZPvfs97
    MNnSgkWF+QV9f5SXvIWFsVw2Hbiz4cp1YReOfBaWogF74z6og/DCnuTPHbajHvBQnvKoJQ
    hrQrjlfTOE8IhvV1vRY0wCakfb8Q+rAWvnwn6QSNJDdtSQcAjqURXqe71NXD13M2BIlShZ
    eFrASTOtgcZbiGS1Rx3kQDZtP2kVIwTAQSJXtTwZ7PJNqJqAcIWT8PdElnQcMD6zVndYr2
    J8d3WTWnw4Mt7S0ZaLDiz4CSDnuxIdXLqvBWYC1XE8e17Z6uwXUeN+lSyMrE7kA7JYTee9
    dsuMwfIxKxqnCixgcb7SE/VJMhBiYOhgV5v3ieyml0NkRIMNohuveyYFxkO14kBhjcYT8r
    gPZiWQMBrtLwx+4LidChBpyPJFmtw573//KskcIB0yyCY1Bcsxci7K37etrA
X-ME-Proxy: <xmx:Acr1astChvvFihJOZFvsW9RzCykqtzG9WCJMkDw3n2C5B1HE1Ais7g>
    <xmx:Acr1ap5F-4i9M1VCaKcWKBTJUY3j0qiamyXnmNhcrvQOXt_QOCJtCA>
    <xmx:Acr1angIFKaTNi9siy8TKzKqcM5qLGfSMNOlT8rlsgBpL1HBcaokgQ>
    <xmx:Acr1ark6Vesk41fQb421dKYTyIy96QgDlqhvNltV6JMolMqu_EK9oA>
    <xmx:A8r1av0hk3ukQtW61bmVeKz_xrydT2MFhgxw_glgj4YLm5wQzLiJFQwO>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 394A732A0099; Thu, 12 Nov 2026 09:15:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ahf2-alGehdV
Date: Thu, 12 Nov 2026 15:15:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <e57b6554-4a2a-44b0-adca-ee4ca5050e85@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-14-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-14-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 14/15] arm: Reorganize syscall table and separated the ABIs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_061536_843706_327046DE 
X-CRM114-Status: GOOD (  16.84  )
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
> arm has three ABIs: EABI, OABI and OABI with compat (OABIC). Those ABIs
> shares almost every syscall, but have a few exceptions: some syscalls =
only
> have an entry point for OABI/C (e.g. sys_alarm), and some syscalls hav=
e a
> special entry point for OABIC (e.g. sys_oabi_pwrite64).
>
> Currently, the syscall table uses the compat column to specify when su=
ch
> OABI syscall needs an OABIC entry point. However, this makes tricky to=
 move
> arm to use the common syscall table: arm doesn't use the compat entry
> points for time64 (e.g. compat_sys_pselect6_time64) and rely on the no=
rmal
> entry point (e.g. sys_pselect6). Given that the build system will gene=
rate
> the same __SYSCALL_WITH_COMPAT() macro for the whole table, this would
> create inconsistency where some syscalls would point to the wrong entr=
y.
>
> To avoid this problem and prepare the architecture to move to the comm=
on
> table, separate explicitly the ABIs in the local syscall table and dro=
p all
> entries for the compat column. Make sure that __SYSCALL_WITH_COMPAT()
> always points to the native option.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> This patch was tested comparing the results of `$ strings
> arch/arm/kernel/entry-common.o` before and after this patch.

Aside from the two mistakes that sashiko found, thsi looks fine.

Two related points though:

 - hopefully we can expedite dropping OABI support now, as there was
   a report today about how it has been broken for the past 5 years.

 - on top of this patch, it should be much easier to merge this file
   with the arm64 version of the arm eabi table. On the other hand,
   that can probably wait until OABI is actually gone.

      Arnd

