Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66125606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ctBswWiD;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UH4V2wyH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EyFMTQbYNXt8dGq0u9x5OdRcIBtDlZceK8vRvToLcLg=; b=ctBswWiDMr+BWx
	TIOsRUv+x78SmnT6HCdHIHr+L/Cfu04XaFLDYkgi40iS1OG2+9Ferve2a0JTrPsN+1N5sf1aweHD4
	GtS4lLkWi6Bo0EtAShRYaJ+sYOzKwUdgfugukQWZxwFbhE9BPJ6ZRUN2r9Lfq+di4awKDyhfXwfcc
	+OY4YOoX13QHN6W0q31KkOOexb7luavO6Dhe3NOMn4Z711XiSBkq/K6Wru7lEhEdjErPlQjzgkWEI
	pkzVym91EC7XcYWtpvJj2+FrF8rBr8Df4O/2zyWVWOJa6orMXc21fhSuBqwfw1NoXIDaY1OpqZVZv
	t+bi2qkxt1A4cuxAnwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxpy-00000007pKx-43Fr;
	Tue, 24 Nov 2026 21:14:02 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxpu-00000007pIu-3HWh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:14:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2882930f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795554837; cv=none;
        d=google.com; s=arc-20260327;
        b=HtOUYnz8E1IQ+7CmrDz2rS/USeYV2j0A0ijEQTaSqUDZeq1MzOAfaOC+f5VERggR/M
         AOQdOC37w4JO6YU97RedsKd+X3u1GPxzrTPV9YDxrisEO1lJ9YC0oquwVCq8kVYdReC9
         E/jSCSVdqKr/e4qlfDDMh0YzeCdsVda04AfjV0xZSLz+P/b0Fqrf5c1y2vM+EI5Agv2X
         bVzo3uPFdSx0nXegXHPGbFTO9HOqHKAIuSKCRc1R3pOx54+1MEPgN0hRI56ZY5bR7P9D
         RaVLyXKddjFwmtw2BBfvBnoFaeitYBG2Pke6NgPp0ZSuOye80JsGvBdKs/kmB9VvPSRX
         B/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyFMTQbYNXt8dGq0u9x5OdRcIBtDlZceK8vRvToLcLg=;
        fh=1NFl5RIO70N9/Oj9VyELsiXmAPxYdYxD9QawMrmiCEc=;
        b=L9g0s1QdXNNeRtgHq/Tnt6A5zxGn936TmBbF+PJyGWhVjBIw16oGZA3P0ifBkhbMJq
         CckswGW31+xNaOr/NOOiLeBOmStGYisaUsj/F2hnQ/Ua85GS1eA7MbCQrh66lS9ktUQZ
         BGpAKcR7S/mgG3zrO/mXld3gVyHqF2dB2GVJHC/9QFOZnxiox07GOqlydS0oxlOEy4Fg
         qcrXRIZMa4Tw3VwyPtgWc4263RjMWcbfBCJv7MUuHYJyuqhSyzFCKz/egf9x/4q/s3Dt
         H1rxYqTMv/uo4VIIh4+V4nzFfxxbsxXndGWIkqajPeva17vcFpW8SJ3AGSJcjHXgyHr2
         DVAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795554837; x=1796159637; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyFMTQbYNXt8dGq0u9x5OdRcIBtDlZceK8vRvToLcLg=;
        b=UH4V2wyHUXjJt/RETV+uh7EDEFaYzW/OKKB7qCim67v8qIepl0kvH3KXD8+jrDQb/Y
         +8wtF/dxIkZWk3SG5B74oSEk6OiPn0BM5BN5hq63Np112r07egAt9m+QwC0DZGg4oa1e
         ACqN3qtMpSCZbidBgwvFYSC8W0MAu+KtJtK3s7L8lomrqMOUVtkCRF9mqSJXG6/jRqDM
         0E/QmMjbd8MqO9iI1WVA0jKA0STJbTMV7X4D7NymipgQfo2aRr+hOh447xpk6xhMMu3e
         K0SEtxRgZWkVjCSJSjWMe8s8iwOlpSFyFnbAPHXyV67GDrIZOH6XJc4CPcicyMI2LDxa
         oe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554837; x=1796159637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyFMTQbYNXt8dGq0u9x5OdRcIBtDlZceK8vRvToLcLg=;
        b=Yp5ECV9N/d526RbucArQvX4alKEfv7fec+9WC2bCVfTxdcP6W5HL2/eC050XzA9gk2
         QqBgXePK3lfX2zd3DygCM7c3IIrGP9uiftupJb8GRs93kMOKOyFbML5UAXEMDefoNZZN
         snwHxFY6b7qf2is1FIjPA7JgNR1o7im8hbHC2dfjBr6rdya9gXXY55cDZd2nDjdlO6PG
         jxgNEt/2IZz8Hl54ZHevbg2ngrtKMfD4QufZB3YZvLBKQKUFM6kqcGroh7ayk/hebS9N
         UcCN8TqKodVefhVeSJeGFqpt52ejQkX3UsJpz/gGC+URvoj10QLmo2124NgvpO0f4Sa3
         PV1Q==
X-Forwarded-Encrypted: i=1; AL+hErHYqkeH4+mMf3L1uBhYQyKyn8665MnsQ5fQb9QjYOUOE26pquEv5t2Kn06A0ilpb2qCLwRv8rEK754dc8dKHjyA@lists.infradead.org
X-Gm-Message-State: APuU4Z933oB+z8k5ai37bLkSdePjN1kUzNNlUfcJMppSJBrM3hpHobOw
	AGOJFahRyflFOly951TbXho7Ivzo0SDZbr8GxoSzkwJAS1cb+JLEtZOfIOGpkN4gLIvWW/k8UdL
	12AbxPteuD051cGZ/DakGMrsRFh41cQdgTnme2IKL
X-Gm-Gg: AZFdTZfzhMST+GPjnJFTeu7g1Nbzi6l9299LGxglfYePO1N2zrMurnKnOG3yb4la/oJ
	UropPR3RaHds1mXup/QWmJLKo6fOsz01Tgoy0a8lZuqndVCCUW88zUz6NrYzF4AAuAvUtPKwg9q
	MOXzVPpxFfLR4cUOeDSiWudriTwqm7DjsB+Mvbjtn+TaIVh1aS7RkIWcWurYsXwIZnn+czdd7ds
	wAC3rExZzAUJCrSGzZggManueN+t7TpFxF82DrxQKGx9TU98rXACXKU8fa4fG93hlMe9MGmxTmV
	0sM7TXRndbDClfKpd1y8z8cp9yciueyJSKVMZQoANZB53nJPc8hovyTokiUHyUNJPCU9lvAzxoC
	Qlgl/Udn0adP3zibdJ5PC/boqQCwxPCVEMvK+XjVE/98eF1wa4hqqcaG5MKwOIN/6lHvIGKb3mN
	kwzU1qKdTttUoTo3xlc4W29J9gZemIqbgdayebtDIiPIh5Qc3MuubEg0/1fpdDxIjpgYTedaWC7
	ryYmB4bcFrGZlGzFnHr+V0sgy0IDqjx/oi/CQ==
X-Received: by 2002:a05:6000:4704:b0:4a9:760f:183a with SMTP id
 ffacd0b85a97d-4abb400aef0mr31827315f8f.32.1795554836268; Tue, 24 Nov 2026
 13:13:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165825.1793558-5-ardb+git@google.com> <20261119165825.1793558-7-ardb+git@google.com>
 <CAKwvOd=21QJOrdVa7OrL9i27f5nJLsMzim=xpFgg2oiX3BK=0Q@mail.gmail.com> <085f76bc-709c-4ea6-8daf-3ee78de56fac@app.fastmail.com>
In-Reply-To: <085f76bc-709c-4ea6-8daf-3ee78de56fac@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Nov 2026 13:13:45 -0800
X-Gm-Features: Aa3M54p2RDSTaS6g6iWQrSQ_1efsKFwMv3DNJ_kvgahhbAkyVdzFLZ4Iz46XfpM
Message-ID: <CAKwvOd=TE0kseZoJRaJwc8wrzxpjJkMMKZH=oFz_ugHS4O6-vg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Re-enable kernel BTI for compatible linkers
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131359_371822_C5C71712 
X-CRM114-Status: GOOD (  32.01  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-28.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 3:38=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
>
> On Fri, 20 Nov 2026, at 00:22, Nick Desaulniers wrote:
> > On Thu, Nov 19, 2026 at 8:58=E2=80=AFAM Ard Biesheuvel <ardb+git@google=
.com> wrote:
> >>
> >> From: Ard Biesheuvel <ardb@kernel.org>
> >>
> >> The compiler is permitted to omit BTI landing pads from static functio=
ns
> >> that never have their address taken, but are only called directly, eve=
n
> >> if those calls originate from other code sections. This causes problem=
s
> >> for calls from .init.text into .text if those sections are placed far
> >> apart, as veneers involving indirect calls will be used in that case.
> >>
> >> Now that .text and .init.text are combined, this can no longer happen,
> >> and so we can re-enable kernel mode BTI under two conditions:
> >>
> >> - live patch is disabled - it also needs BTI landings pads on function=
s
> >>   with static linkage inside vmlinux that were never exported (and
> >>   therefore never had their address taken)
> >>
> >> - landings pads are emitted even in pathological cases where the size =
of
> >>   vmlinux's .text segment exceeds the range of a direct branch, and th=
e
> >>   linker needs to emit landing pads at the callee end so that the
> >>   veneers can call them without causing a BTI fault.
> >>
> >> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >> ---
> >>  arch/arm64/Kconfig | 17 +++++++++++------
> >>  1 file changed, 11 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >> index 1075bc661833..f0fb2d7ff130 100644
> >> --- a/arch/arm64/Kconfig
> >> +++ b/arch/arm64/Kconfig
> >> @@ -2202,18 +2202,23 @@ config ARM64_BTI
> >>           BTI, such binaries can still run, but you get no additional
> >>           enforcement of branch destinations.
> >>
> >> +config LD_HAS_BTI_STUBS
> >> +       # A linker may need to insert a veneer when a call to a functi=
on with
> >> +       # static linkage in the same compilation unit but in a differe=
nt
> >> +       # section is out of range for a direct branch instruction. Suc=
h a
> >> +       # veneer performs an indirect call, and thus requires a landin=
g pad
> >> +       # under BTI, which the static function may lack. Only recent l=
inkers
> >> +       # are guaranteed to emit those landing pads correctly in all c=
ases.
> >> +       def_bool (LD_IS_BFD && LD_VERSION >=3D 24200) || \

IIUC, it looks like BFD 2.41 was the first release to contain the two
commits cited from your sourceware link below.

https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D15b4f66b0a9a=
3be6caf1898d22a13c39e662006f
https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D5834f36d93ca=
bf1a8bcc7dd7654141aed3d296bc

$ cd binutils-gdb
$ git describe --contains "15b4f66b0a9a3be6caf1898d22a13c39e662006f"
binutils-2_41~1223
$ git describe --contains 5834f36d93cabf1a8bcc7dd7654141aed3d296bc
binutils-2_41~1222

So you might be able to relax that version check to be 24100 rather than 24=
200.

Unless there's another relevant issue?

LLD version check looks good.

Maybe other potentially useful trailers:

Link: https://github.com/ARM-software/abi-aa/issues/196
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106671

> >> +                (LD_IS_LLD && LLD_VERSION >=3D 200000)
> >
> > A bit of a rock fetching quest (sorry), but it would make it easier
> > for reviewers to verify these version checks if you had git trailers
> > linking to commits (or bug reports) for these linkers with the
> > relevant fix.  I don't think that necessitates a v2, if the
> > maintainers you're expecting to pick up this series are kind enough to
> > manually re-add them (unless b4 can pick up `Link:` trailers like
> > that).
> >
>
> Fair point.
>
> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D30076
> Link: https://github.com/llvm/llvm-project/pull/108989
>
>


--=20
Thanks,
~Nick Desaulniers

