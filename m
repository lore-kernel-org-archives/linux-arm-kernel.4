Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AF606A689
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U7Ota0ec;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aYEYUGEz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bTziaN0Yw097dCTsEwR9QukNmJKHlrH7u2+Skaj2v6Y=; b=U7Ota0ecfXKN8z
	8kfubviJIue4yKTc6lsVMpS6M13o/RYLaWpvu8Pz3RyUljGRtBFiRDcpV2gfmengQJHXyxUZHPmoc
	We7PtYNZTYwmZF73mBaCaQgM+th8/uE+Zp+5bPXekUD2JymJnBFva/TiMnmLmecxXcLNOAiVMPwOz
	4sJCUj2ASuGpEuiLozqABOxWRT/+h05eePjwB4i4SkbFQzWKVZdQ1LS/z0zFabN78T6BvxlAUviVI
	rS4rbvL8e/Djk0u/M36OM9jSZbhM5GMRkNmzcf2MaOtlTzq/QJofCga0zkycVgI4NeGtGoQRvqEYk
	VhwaWtHH/yE7a+ME7CVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW941-00000009EUv-08S1;
	Wed, 25 Nov 2026 09:13:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW93z-00000009EUc-2G0q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:13:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A90B46256F;
	Wed, 25 Nov 2026 09:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B401F00A36;
	Wed, 25 Nov 2026 09:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597994;
	bh=bTziaN0Yw097dCTsEwR9QukNmJKHlrH7u2+Skaj2v6Y=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=aYEYUGEz9o/vhRX/zZ571koETPrTA/8SeRG23YTIpSglUtVm3ETsvrUuL46F/eTD9
	 SNyC0dkiUhVtUtFGutfNkKfBjKJcJivLK2R9Jg9lSOHidMPHCgcM4bcIEkjmCaHb6s
	 ITSL6JgLHjdEyuNMp2QzltQ31q2n3l9il4Yzb1b4nSv/NYve5O57BbK8hc8PsYqYif
	 s6Z1k5E84++nZgEZlbijief0+P/G7WbHFeKY/a48ivM9aSrqY2jLuy2yS5JKxfxSZX
	 3Ot0KBgjv3bmuSU/M6ZpvukWtVC6WnpCpEn7TvOfaEPVt9j7CdpgEOi68vDuJXshSq
	 UXAyeqvwZc1eg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 05FA4198003A;
	Wed, 25 Nov 2026 04:13:12 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 04:13:12 -0500
X-ME-Sender: <xms:pqYGa_rEcjNa01hjz8sROcqaFH1fJA19T2Bj_dBk7LSn_4OoC8nc-A>
    <xme:pqYGa0dO3UI4A-kBavHTC5eYyU3WenJqXzl0-wPERb674F-tT-Jqhu1CMDKiRfqDc
    gwCg1Sr6xsWW4ldaZwYJklZHugbKwCdADFnTMlyNMwzjVfzviqUUa3B>
X-ME-Proxy-Cause: dmFkZTGnYlHbc0Cvaa9/Sucg00Ew/XiLqbsJlzrXTUTTag9Hud8tgS5KuCcES6JHMk4VEQ
    W8cwtmmo4IR+qu2B+KrInXzfJx9IVDmCAaGAYOZnz9TEJwuxqmNkBainZ8Z3em2BuXYifl
    OGE6kto+Tiw4fTq5/CFZs/dA0WgmHtaqLfjrq+PEIWIpVElcbPF5hdLTow9EX8NDYvY4BG
    2a/v69SC7LZr1AXyPBDB/y92QXnVjryzMH0vySnKpXQu56ik2pVDb59bo/DVK1cZjFjp31
    isvny8bFS6pI+HD13mHtZFUBVxJVV5brQmS+8AseRqM0c/L1mN0VZLrQUgYfQLdkPAk2dc
    CLOsMCpCNErHTO+DoifKAe34Iivt0+9GaEJkjqEctxwPPzwKqetiOaW4u86z8vko652dGK
    cdRFDaqmW11KsgWWoabN05IOjCYo9DQKXJWP4CLLYN7DSBunwmcLUyJGzrsNot3ZZRQGMk
    JWDtMOuUYT7nF2QlWgrjJmALlYlDyhqSavT1V1b4Mq1hFo81+lVGecwmwDO44MWdEqFFxH
    gidzsjjpvah7wbMLuVm1M090q7eXg36w6zVY6aPo7v/FdQgJG+1T8MBII62s3rbPCxH+ie
    F5bQe513RgHMAW4l6slFKqH+zu06LC9xsfKITJ5NQJcsmDXU5AmcAcYLWspw
X-ME-Proxy: <xmx:p6YGaz88OjAV73qCvQSDsn2uvukEd1j4iL564_01e-I53bgY9AP8CQ>
    <xmx:qKYGa5te6XvtTJgSkktCeGVBkoNuT7L2Re6hd9aj-FlT7GkpXclIyQ>
    <xmx:qKYGa3oYfzaWhP6WD75-RRaoGLVwE4RJiu9-P6SFy2J0Myo3ZyqGBQ>
    <xmx:qKYGa9oFS6Gd58zf14CWc3-earY-5TktoJFs2YFLe96D7bulpsVHag>
    <xmx:qKYGa2aq7gdm04BBE1oe6pEq8rVUhmS5Lv8VaOAAOJkLr9KZy3srtYi->
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3D655F80096; Wed, 25 Nov 2026 04:13:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 10:12:49 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Kalesh Singh" <kaleshsingh@google.com>
Message-Id: <22afd968-9f17-41b1-83b5-9e46e831c837@app.fastmail.com>
In-Reply-To: <CAKwvOdk7MFxj5uadbpaaQkbdu46TxzPPEqn=ieF_JWNL4_KsSg@mail.gmail.com>
References: <20261119165825.1793558-5-ardb+git@google.com>
 <20261119165825.1793558-6-ardb+git@google.com>
 <CAKwvOdk7MFxj5uadbpaaQkbdu46TxzPPEqn=ieF_JWNL4_KsSg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: module: Keep executable init sections in the core text
 region
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 24 Nov 2026, at 22:40, Nick Desaulniers wrote:
> On Thu, Nov 19, 2026 at 8:58=E2=80=AFAM Ard Biesheuvel <ardb+git@googl=
e.com> wrote:
>>
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Since commit 3e35d303ab7d ("arm64: module: rework module VA range
>> selection"), the core and init text regions of a module may end up mo=
re
>> than 128 MiB apart, i.e., out of direct branching range of each other.
>> This is why the module loader maintains a separate .init.plt section =
for
>> branches emitted into .init.text, and a separate ftrace trampoline for
>> ftrace callsites in .init.text.
>
> (Sorry, for picking nits in the commit message, but still think this
> could use a stronger problem statement up front, particularly some
> mention of BTI since without BTI this is a non-issue)
>
> "This is a problem because the compiler may omit BTI landing pads for
> such cross section calls, which can lead to BTI exceptions for large
> kernel modules that are built with BTI and make calls between
> .init.text and .text" (or something to that effect).
>
> i.e. commit message doesn't mention BTI at all, and BTI is why having
> those too-large-to-encode operands in a direct jump are problems.
>
> (two comments below on configs and includes)
>
>>
>> __init code typically makes up only a small fraction of a module's co=
de,
>> so instead, keep .init.text in the core text region, by overriding
>> module_init_section(). Do the same for .exit.text in
>> module_exit_section(), which is only consulted when CONFIG_MODULE_UNL=
OAD
>> is disabled, in which case .exit sections are moved into the init reg=
ion
>> too.
>>
>> On arm64 allmodconfig (10604 modules, disregarding modules with 'test=
' or
>> 'torture' in their name), this grows the aggregate size of the module=
s'
>> core text regions by 2.6 MB (+0.58%), or 243 bytes per module on
>> average. As this only costs an additional page at runtime if a module=
's
>> core text region happens to end within that many bytes of a page
>> boundary, this is expected to affect ~5.5% of modules. In practice, 5=
27
>> modules (5%) grow by at least one page, of which 16 by more than one,
>> adding up to 567 pages of 4 KiB. Given that allmodconfig enables KASA=
N,
>> KCOV, UBSAN and GCOV instrumentation, which inflates __init code by
>> 1.5-2x, these figures should be taken as an upper bound.
>>
>> On a distro-style configuration without sanitizers (1023 modules), the
>> average growth is 104 bytes per module, or ~10 KiB per 100 loaded
>> modules, which is expected to cost ~2.5 additional pages of 4 KiB (or
>> ~0.6 pages of 16 KiB).
>>
>> This permits the separate init PLT and init ftrace trampoline to be
>> removed in a subsequent patch.
>
> Maybe not worth the trouble ("over configuration"), but I do wonder if
> you'd want to make either of the below changes conditional on BTI or
> MODULE_UNLOAD (as is, they are unconditional)? i.e. don't pay for what
> you don't use?
>

Replying here to both points:

Currently, we are paying for what we are rarely using, given that
.text is next to .init.text in 99% of the cases in practice, and so
the logic for .init PLT veneers and the alternative ftrace trampoline
is rarely exercised. Getting rid of those, as patch #3 does, is already
worth it imo.

But yes, BTI is the driver for this change, so it should be mentioned
as well.

>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>  arch/arm64/kernel/module.c | 33 ++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
>> index 24adb581af0e..39e7a50733a9 100644
>> --- a/arch/arm64/kernel/module.c
>> +++ b/arch/arm64/kernel/module.c
>> @@ -25,6 +25,39 @@
>>  #include <asm/sections.h>
>>  #include <asm/text-patching.h>
>>
>> +/*
>> + * The module loader allocates the core and init text regions of a m=
odule
>> + * independently, and so they may end up out of direct branching ran=
ge of each
>> + * other. This complicates the handling of PLTs and ftrace trampolin=
es, which
>> + * need to be emitted within range of the branch instructions that u=
se them.
>> + *
>> + * So keep executable .init sections in the core text region instead=
. This
>> + * costs a bit of memory, as __init code will no longer be freed aft=
er the
>> + * module's init routine returns, but this is usually a small fracti=
on of the
>> + * overall size of the module. Non-executable .init sections are not=
 affected.
>> + */
>> +bool module_init_section(const char *name)
>> +{
>> +       if (strstarts(name, ".init.text"))
>
> #include <linux/string.h> # IWYU
>

Ack.

