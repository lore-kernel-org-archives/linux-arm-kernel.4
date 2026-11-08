Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 02:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TuREfBeB;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BPgbc7TG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tZ3cb3vI/JlKWC9M4GlF0iTBKf/jfDE7Mio5RIYSa5U=; b=TuREfBeBg6CloC
	2JhQW24z6aMBv8ougD1EFMIzPEICqFUo5ea7JPGirZcQwtYFSybbPBT+2VPDCLHD4GDpz6x9v3Kgb
	pG1/q36Juw/g/JuH52L3qCPrczmECpyBEkPOHppH87oX2PhpAWT6I+On+zPv97C+CRo1NbVL5O2Bk
	Twk4dbapsyLb3aC4GU44t+qVRyrA7iDSjcYYWIb0qPQhoJu/jrscMkY2jGE6rhvDIq5upoROc+U6o
	emuriCos4rPtsUN+V8FoG0Wa2YeH59HllxG3BEtmlnyeGJFuMVTNbut/R/86O+INLxG8MK4cegrGv
	jC7ySNKZTJHd+Thy+xww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsIB-0000000Favc-1Wg0;
	Sun, 08 Nov 2026 02:05:59 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsI8-0000000FauW-1zMW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 02:05:58 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5383c97c8cfso3631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 18:05:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794103554; cv=none;
        d=google.com; s=arc-20260327;
        b=r95f3G3sYMGznPSubpBdCSqoIqEqqoMqP8zFT8X7h0VetHKB5nJagfD44DU2BwbIor
         vW5iPAXhPqeH+8Aa4DJBKlrMv9Lzrh438qSBLqNG40pN+///kHexeNHKeXuYSYbbdwZG
         uGAhzd296xwUusg83F8CZ90j5wYOrKTh36xIs8HOIEzToahs+kK1n9BO7Hfs36E4SXWv
         gG45q1mZ2m58mHRdrHLQSmuMWT+QZmJyBWPo4PVbCRoAKnLEiXhBxqv37XrGg86n3P6z
         +0c707msaKz/Klg5RopVKG4K9ORH6z9/6DU7nMaJ/FUSfD5lPn1PA8+fjERZvCA/i7BP
         9ROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tZ3cb3vI/JlKWC9M4GlF0iTBKf/jfDE7Mio5RIYSa5U=;
        fh=0oLW3E0HRLe/7OrtdwKkDRa9xEQvhv1rydtn4UU/t4k=;
        b=kYfUbhthK1ax8BniebJaixVnGKNzEGPkF3tmPI1I/k9+nmwj06ajQuHruNaM9zQEM1
         +mQDhBNBRgzM+ivlzJs2YrQ2plyHDyNbkST1Fch56Ggv8oWSik0Ot/C/spaAK7PhxLPZ
         ArRuoYJ7f5c4uDjTJwJ7+RnHSxhFtEFlxAWUeGu0x6RgxXYl4yhoPOmYGe9uIJUWD4tB
         TRulNYr+HPGvKUAEcv9qujlC38qYIyyn23LSed/L0DMM74GjrAmKEVfzsz3jdovhp1iV
         yCA3M84d7gF8ntAN6UBb53HA8hFgfXLC5CsDu2URlaahEaPw+HGVqXp8PbKtyIaTaJOv
         Fzag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794103554; x=1794708354; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tZ3cb3vI/JlKWC9M4GlF0iTBKf/jfDE7Mio5RIYSa5U=;
        b=BPgbc7TGHrF0VfSgQyQFOgthHhzj62376x6wS+VI7ThSDFINV4wOqrhKuLc2ARWbTq
         R2aqS2xxU7CYlYUFR4FincCcoc7bygvgqvGfXeUN80erG+wW1DIVfO8pqINNYyWf6JeS
         aTzmB6B7k+mGz0lfkSJzm5x8qrVX35s6GAkrd5LiEXcqCwvXFRG2X1XJAmu8VCfD+caC
         kKWQdn1MRrmtaF29rFLdA6W6ymHf/q+bDcJpGOgT6NeoUCKdd8tBArdApaaFL2IvSItN
         AM/SDWz9IP/XXeWAlydR/uG+4wHgMd5uTZtZoRxtXkFJ7RPklHJwf2ft9S8zqI1BY+ip
         GBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794103554; x=1794708354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZ3cb3vI/JlKWC9M4GlF0iTBKf/jfDE7Mio5RIYSa5U=;
        b=iRcjzCSlFOnM4KIn9GQq9bzu015Xb6VItwC/LZjmrs8DRlfNXsjFfVu+7N/9FMeRFQ
         4fM/q8EVPmk+bAp6W4QOa56Palybu4gOHuFM1ulGPWI+/DlRuroFer37AdnFX5OQdP7k
         t1ZAp4kkKM0bo9DBOCjn//Vo5/cC0SbdOlqo3tBKJ9OSKPNw1w6JoyXIZm0K3NJnSbtO
         AS1GPM2E78upCWQ36eW8paX2PMujATdCrbOZSt9L1FNhsrdhhmuC8Ui/8AlYSZN2+ckL
         kEOxuL3QwKwVjbJG/0BDfnCrgzklSwkQJhkcA3a4B6i4Q69T+6FxdWzmQuB4nf1SUcru
         FMOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVoanK6San16PNnBMCjLjtCZ0PKRFXM9NSbSwfFrYiXoZxvVFr8Ebk6S6Gw9UwqSQW9ndAgoFUk2/NNIQ6Y/9p@lists.infradead.org
X-Gm-Message-State: APuU4Z800Yd8jUnJjRew0VzGkAtgQiYF79Yf+3oaArVjVkKaSx2qdc2I
	JRCRMBvkmkV9bPndRJsBcJGp2msX7r6hC6ntR6Mb1henz7hrekIkpo2SFn79ucv612SOe+HKfte
	xVvUYc20ZcWJQ5KhMCNyEKv8WZU3XS0RNSUWjCqTKFQMuEFQPjJTXVdWQ3mk=
X-Gm-Gg: AYBFou2yFOO3olDLCm8+4hYE2TxLV/dXMru8CXmFfaU9LoCJ+z92Kk+8PfDDGMGRx+4
	esYZpJxha5xUZptxwwoYyofqIpvrdHIYDUXT4EsK01Nh/AHzA6G2pZ3IoHYVqhmgbmZqCg/n1WV
	nuZGXOh8/BaG0CG4ARwbh3KEt+MoWFvyjTrxZOoEqqBtB+lVit1UQUp1p9EbvLDEa+6ECrwF8nV
	XFBwiOUe58G32YpeJcXlCVja28MQ/s5HsugGlAiHvvUt0updusAro3TsVGazMD29roazEHSCOKN
	1eRciL1VUxlZ4YnkmmmG1wZXhFmzmEY66N2kbeY67JnuC/gZvUEWPHGlgvHEsCLAIps6Hury16+
	Tw+oFsQLfjSLnm6qtUSDbTVktxZzrhiWeQg==
X-Received: by 2002:a05:622a:8842:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-54f9de1134amr17137481cf.1.1794103553216; Sat, 07 Nov 2026
 18:05:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261004195027.227748-1-danielmentz@google.com>
 <92758f79-d5b7-4c15-a55d-6bea5f84a028@arm.com> <CAE2F3rAJdC9pAqMKcXhxpw1keGzH_kQUNBoPHXjTP8+7TOhfwQ@mail.gmail.com>
 <ae8db5bf-9f9e-4f0d-afa1-91718323568e@arm.com>
In-Reply-To: <ae8db5bf-9f9e-4f0d-afa1-91718323568e@arm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sat, 7 Nov 2026 18:05:42 -0800
X-Gm-Features: AclHuK9EOG_P4byoqFnHT9I6oYEPYHsXYF7yVIBFj_Z2u0jA_efLpQYmTCcKiXc
Message-ID: <CAE2F3rCocgqvmfhALrdo2VfLuyt0=oQD0zFUKLb5E+0deWgEqA@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, will@kernel.org, joro@8bytes.org, 
	nicolinc@nvidia.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dawei.li@linux.dev, jgg@ziepe.ca, praan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_180556_530998_526C9DA3 
X-CRM114-Status: GOOD (  35.09  )
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 7, 2026 at 9:40=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 05/10/2026 10:26 pm, Daniel Mentz wrote:
> > On Mon, Oct 5, 2026 at 9:42=E2=80=AFAM Robin Murphy <robin.murphy@arm.c=
om> wrote:
> >> This still isn't answering the question of "why?" though. Yes the
> >> architecture says some things, but if we were strict about avoiding
> >> mismatched attributes then Linux couldn't ever support non-coherent DM=
A
> >> at all! Similarly while the architecture does permit SMMU
> >> implementations to be picky about their output attributes, does any su=
ch
> >> implementation actually exist at all, let alone in a system capable of
> >> running mainline Linux?
> >
> > Fair point that existing implementations have been forgiving in
> > practice. My thinking here is simply that a small, self-contained
> > cleanup that brings the driver into line with the architecture spec is
> > worthwhile on its own merits, even without a known implementation where
> > this currently causes problems.
> >
> > This is really in the same spirit as your commit 7618e4790982
> > ("iommu/io-pgtable-arm: Improve attribute handling"), which aligned the
> > attribute handling with the architecture specification on the basis
> > that:
> >
> >    "Although the SMMU architectures seem to give some slightly stronger
> >     guarantees of Non-Cacheable output types becoming implicitly Outer
> >     Shareable in most cases, we may as well be explicit and not take an=
y
> >     chances."
>
> That was more about being self-consistent and technically compliant with
> VMSAv7, which again is not relevant to SMMUv3. In fact if we _only_ had
> to support SMMUv3 and not arbitrary other io-pgtable users then we could
> point to 13.1.7 "Ensuring consistent output attributes" to prove that
> that change would not have been necessary.

If self-consistency is valuable, that is really one of the main
benefits this patch offers. Right now, when ARM_SMMU_FEAT_COHERENCY is
not set, the driver tells io-pgtable-arm to configure translation
table walks as
iNC-oNC-OSH (via coherent_walk =3D false), while configuring STE
fetches, CD fetches, and queue accesses on the very same SMMU as
iWB-oWB-ISH. Aligning SMMU_CR1 and STE.{S1CIR, S1COR, S1CSH} with the
page table walk attributes makes all SMMU-originated accesses
self-consistent.

>
> > As I noted in my reply on the v1 thread [1], under ARM IHI 0070
> > (sections 3.15, 6.3.11, and 13.1.2), a non-coherent SMMUv3
> > implementation (SMMU_IDR0.COHACC =3D=3D 0) in which every SMMU-originat=
ed
> > access configured with Normal Write-Back, Inner Shareable attributes
> > fails and records an External Abort (F_STE_FETCH, F_CD_FETCH,
> > CERROR_ABT, etc.) is completely architecturally compliant, yet wouldn't
> > work with the current arm-smmu-v3 driver.
>
> Sure, and another system could only support iNC-oWB, wherein this change
> still wouldn't work. If you want to argue against making assumptions
> about the implementation/interconnect, you can't simply make a slightly
> different assumption about the implementation/interconnect ;)

I don't think this is trading one assumption for another assumption of
the same quality=E2=80=94it is removing an assumption and strictly increasi=
ng
the set of supported implementations.

Because io-pgtable-arm already uses iNC-oNC-OSH for non-coherent Stage
1 and Stage 2 translation table walks, the driver already requires a
non-coherent SMMU to support iNC-oNC-OSH. Before this patch, however,
the driver additionally assumed that a non-coherent SMMU also accepts
iWB-oWB-ISH for table and queue accesses and silently degrades it to
iNC-oNC-OSH. By using iNC-oNC-OSH consistently across all
SMMU-originated accesses when non-coherent, we drop that extra
assumption rather than introducing a new one.

>
> In fact for maximum fun, you could even have an interconnect that only
> supports the iWB-oWB-ISH type, but the SMMU is still non-coherent since
> it's in a _different_ inner shareability domain from the CPUs...

I'm certainly not claiming that this patch adds support for every
conceivable interconnect design (and such a system wouldn't work with
io-pgtable-arm's non-coherent page table walks today anyway).

>
> Yes, 13.1.2 "Attribute support" says that the system may not support all
> memory types, and unsupported ones may abort, but then equally it says
> "[...] the SMMU is not required to generate attributes that it does not
> use. With the exception of R/W, INST, and PRIV all configuration fields
> that affect unused attributes are IGNORED." And this is why the
> mismatched attributes argument doesn't stand up on its own - without
> knowing the system-specific details of exactly what is being ignored
> from what we think we've programmed, how can we say what the actual
> attributes used to access memory really are, and thus what is or isn't
> mismatched?

It seems to me that our goal for a generic driver shouldn't just be to
support a set of known implementations that happen to ignore these
fields. Instead, the driver should follow the architecture
specification as closely as possible.

Thanks,
Daniel

