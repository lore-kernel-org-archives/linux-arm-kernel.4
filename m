Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A3C606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SETm1h9i;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EtuQW3NX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mBNa+ScIpmGVzZ4A7bhDXfja2ed0aI6O8EfxTnKnQvU=; b=SETm1h9iYL9Gwq
	BfWsGycyH+hePaMseyNvBfQkBwuGA/Gj1YWJ2AVdrYo5Kof964f25jco4tkoASSBRVdJ446muLz4K
	YR5OpAZQ1H6We7kD+cgaSoo5pfwnc3EjHLhlH/Sdz8xtHqpKFXcJopMTTRLpueO+aY5hG94Fz2WNT
	dQay033/l13xjlNOiMuDTQ81wujvqmbUIjPmHD1RCDkIDu9VGP5cr10gjv2hgPeF/+GUduypgHMpO
	Uc6ScTvbdaVeOSQ9XN13ekt+/iOEBdC/8RkXnKfpR9VJle40uexdP4ZWXKSe334KftjxO20zRZnQA
	lEmgtL85ldIVIGumWX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBhu-0000000Dfry-2zEk;
	Thu, 19 Nov 2026 23:38:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBht-0000000Dfrj-1fl3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:38:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C70A6111E;
	Thu, 19 Nov 2026 23:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452AA1F000D0;
	Thu, 19 Nov 2026 23:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795131500;
	bh=mBNa+ScIpmGVzZ4A7bhDXfja2ed0aI6O8EfxTnKnQvU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=EtuQW3NXY/J9PK3t2GBgCdi4EsAjj0OlBji8D+BUYhkb2ka3e3M4d/FOSq/gcLZcN
	 ZRjuMrMfWb4ydchOjTpHDwrI7Afn0kCFHkZ7eKVu7f072Dy8LadsBz0E/anZh5ljsv
	 lM3Sbuq2Nr1SUkPJc9EOW5dqybH5KWsqvoLg/4P90OnDdIZtLIYlYlR+BsxTHkf1RO
	 EJiRknNYklnzKKygRMkXd96CCZxxvgWxYB0A5P5W4ocy3ybc3SXAyvHq/c5en6Rx45
	 2XRecFyG+FveyyjiGwZ0EPUgtJGfcNGp8gkZMkl/NhwQet8JPCKxU4S3ZBVR04QvBb
	 O3gui6vZazbCQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7D565198003A;
	Thu, 19 Nov 2026 18:38:17 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 18:38:17 -0500
X-ME-Sender: <xms:Z4j_ah0Ep0Bi5zqf7AEH0kOtlo7DLTTS1TN2WyNM9IPpRXvN0JgJZQ>
    <xme:Z4j_ai6iGWE2AW8LR2I8jplHOXOk9MfoHzPUcBYpPq_aqePjheIxmXOUW6h0hjfA-
    n-PbjCtcCQxvrdYeJJhjF4ofmtNmR1Z-3N1wZdo3lNm5tvq7k6ZCnmE>
X-ME-Proxy-Cause: dmFkZTGs04s0d2iga8e7YFQwwvkVRSyXtHjXV2OcR8mHf2/a2hR/39xXKVNCsWLBrVgB5t
    3H0FPbejIcGRTan9V81bai8M1jBhKWhHfhHZSu62XTKJpNSExAUF27s7/sH7JiS7b622ro
    2MMpDyxI2a16ml8z9Fz6m/ej0Dndbt/qjvCdwy9zZcdtbQ0lOa5Zk6AQ+Q7QkT7DiKA8CI
    BNyhsZ1fDdZNGTywY0iohgsEVke4YXKaTPYY5vOsajhHOuc5JfRKwCoTUUfO4GbIIdx4SM
    BrcgjSOhs5bntVVd+wuamxrsMRbRe5iOjzB9nPL6KbtAIMSjhT4AN7VY+PovVu0JbsdVM8
    TmtFBHVninWPqNHGyFWgxo3XCC/4jF7hXpRK/sg5Fs9ZF+ALPzYj6TugkqxmPxfCLMVmu6
    +oXDhv0LjA3Bddq6kvnDY357WqT4fCSVSzHkqVfYsB/27i64kjEnEPV7pIqT7HKjW1IyHO
    QN40MjOy5fB0vNsDvsLu7pnCGNpHON8jTUZE+fyI1T4L6uA83xClqruGDkaHDaxaRVgcLA
    4+yqIpQVdt/3HqQx4F4RzA8DrGYTO3CqaFrIna4QZ4Tjg4p2jn7toJkPPh13eav3NFIWcY
    aaH10JUrgEXVDALVbUkL6h2+os7CGt59z+eiUyMuxIk10Q1nWWteS36BiBzQ
X-ME-Proxy: <xmx:aYj_auMlaNijcZEswgXJzlybW7WnEeFalageigkwqtaifKrV7Ljlnw>
    <xmx:aYj_atqBVQyy1mscR0G1FnzjLrvjbgWYHRdA_O2DkfCDtSesmV1wMg>
    <xmx:aYj_ajf6vhuT4ElGz9rZJ3I749El_4UwBSLj2N8xR6ZqednMWw1l8w>
    <xmx:aYj_ajRTHxRtiikDS4fYjQ_TvKYoeO6FgUtWD4EW_ByGNembq_Tl9Q>
    <xmx:aYj_asaA4fVlqAYDdF8ZvHonlMq609A5l2R3DXEKi-07ty_-SmgP8cbY>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A8453F80093; Thu, 19 Nov 2026 18:38:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 00:37:55 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, "Josh Poimboeuf" <jpoimboe@kernel.org>
Message-Id: <085f76bc-709c-4ea6-8daf-3ee78de56fac@app.fastmail.com>
In-Reply-To: <CAKwvOd=21QJOrdVa7OrL9i27f5nJLsMzim=xpFgg2oiX3BK=0Q@mail.gmail.com>
References: <20261119165825.1793558-5-ardb+git@google.com>
 <20261119165825.1793558-7-ardb+git@google.com>
 <CAKwvOd=21QJOrdVa7OrL9i27f5nJLsMzim=xpFgg2oiX3BK=0Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Re-enable kernel BTI for compatible linkers
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Fri, 20 Nov 2026, at 00:22, Nick Desaulniers wrote:
> On Thu, Nov 19, 2026 at 8:58=E2=80=AFAM Ard Biesheuvel <ardb+git@googl=
e.com> wrote:
>>
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> The compiler is permitted to omit BTI landing pads from static functi=
ons
>> that never have their address taken, but are only called directly, ev=
en
>> if those calls originate from other code sections. This causes proble=
ms
>> for calls from .init.text into .text if those sections are placed far
>> apart, as veneers involving indirect calls will be used in that case.
>>
>> Now that .text and .init.text are combined, this can no longer happen,
>> and so we can re-enable kernel mode BTI under two conditions:
>>
>> - live patch is disabled - it also needs BTI landings pads on functio=
ns
>>   with static linkage inside vmlinux that were never exported (and
>>   therefore never had their address taken)
>>
>> - landings pads are emitted even in pathological cases where the size=
 of
>>   vmlinux's .text segment exceeds the range of a direct branch, and t=
he
>>   linker needs to emit landing pads at the callee end so that the
>>   veneers can call them without causing a BTI fault.
>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>  arch/arm64/Kconfig | 17 +++++++++++------
>>  1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 1075bc661833..f0fb2d7ff130 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -2202,18 +2202,23 @@ config ARM64_BTI
>>           BTI, such binaries can still run, but you get no additional
>>           enforcement of branch destinations.
>>
>> +config LD_HAS_BTI_STUBS
>> +       # A linker may need to insert a veneer when a call to a funct=
ion with
>> +       # static linkage in the same compilation unit but in a differ=
ent
>> +       # section is out of range for a direct branch instruction. Su=
ch a
>> +       # veneer performs an indirect call, and thus requires a landi=
ng pad
>> +       # under BTI, which the static function may lack. Only recent =
linkers
>> +       # are guaranteed to emit those landing pads correctly in all =
cases.
>> +       def_bool (LD_IS_BFD && LD_VERSION >=3D 24200) || \
>> +                (LD_IS_LLD && LLD_VERSION >=3D 200000)
>
> A bit of a rock fetching quest (sorry), but it would make it easier
> for reviewers to verify these version checks if you had git trailers
> linking to commits (or bug reports) for these linkers with the
> relevant fix.  I don't think that necessitates a v2, if the
> maintainers you're expecting to pick up this series are kind enough to
> manually re-add them (unless b4 can pick up `Link:` trailers like
> that).
>

Fair point.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D30076
Link: https://github.com/llvm/llvm-project/pull/108989



