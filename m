Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E2606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R4Z63EET;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFFNGj7+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LHRQ0r5bmbaFTzfb7dcnjC6GldWyI7arDZV1wn6q7Lk=; b=R4Z63EETt+6IE7
	uR2lz8ULWQy3uvL6f+D6+pQ6WB+8ow9TbuQx5K+fYMCF9RepgcOgBDmoLB01XnobxfQMCsxa87fvR
	ql8fYsI/eoVj9/t6MCg1gDVhG+g8Yoac+cOKFGLgp+m5uxYSioICTYDrmPwckicV6CxURKuocbqBR
	IvOiOIuKWA1EyGHlYe82vjnTxy2Eq9aeNA27qvz02FDdCe5NmqMgKEFzdljASiO6DMCQdAH3gBOki
	/+N+a76BpIJsNSS82DC8SuMQgMP7KS9ZBIJkwPG+CGaAoW7mXp8r7zFXnV9RfhtSgVlQaneTN53OO
	75fB3i4KXmCGwcC1tj+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMC1-0000000EfDq-3INU;
	Fri, 20 Nov 2026 10:50:09 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMAS-0000000EeWN-32pC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:48:48 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-94937a33cfbso75594685a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795171711; cv=none;
        d=google.com; s=arc-20260327;
        b=K6KNwxxVxjYDPIKizHy1ix9Uk5Yo69CS6ki/6s6tZJqks4J00ef+JnJyxjcmxqxZqR
         HNxnUUDtkTYyp3EbQ39tHLehut9v0sZR5PHPKPs+TWcdj2xiOfIo3kZT4QbUXqxNuz9h
         L9onlR6YN1/d9WPaVFMHm+MEzbEBKnfBYDBcgeAiLY/lkEXcq+JxN3lws2xuEnN+gD32
         LnEKcAoKI95jAXpP2nRlhdLB7Mnv+wuh2mc0ktw0LY2lNG8gomDmTIx14dZf6tKNooCI
         bQNIEE4belbbXGDpytgkvhw/iEt1LH3h8w7oBznuvEZyvlxQqSLYssdOMOXAG6HnYu7j
         8gkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHRQ0r5bmbaFTzfb7dcnjC6GldWyI7arDZV1wn6q7Lk=;
        fh=pv0Z2qeqzqaAMe9z+mhgpiNtqt9jLT3EA2a7CvRW1qI=;
        b=qIWLpJoDu4as/joWr2SzcLXJWXoEKWnQlopuwDNwnWKoYeWLrUOwGfrBGL01SGsHNV
         NF7PSPWFWdEE0mUwv0bo6IDxhZyUsiwqJOyM+dRG/PbdQW5iL8adljzozeMT+p05O2+C
         jLdVPe0SWvP1ViCgvmy/cBmR18tuINFqaQLMNdX+3AEarlAFyn34tNhjHh9OaQlhdUM/
         m60SBsBuAKeBOsRiY4z5DSMTBkQ/7cGC2VsweabuY24CcuqQUhG2do4s/S23bbPap7Cy
         X5ZjrhRKyPXOJo1p9y+A58ihsY/8tloNPB65XUC/j5aJ9I8r7GArdf9OlLg8DlPeigIY
         KXMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171711; x=1795776511; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LHRQ0r5bmbaFTzfb7dcnjC6GldWyI7arDZV1wn6q7Lk=;
        b=FFFNGj7+TXE7QjamNn7UQhLS9VEhav3HkXjxL9nL91u2OI0CCeDB/0ibh96CvfFIND
         YXmIOCVcyhrstkIOEKqiB4MMmtDFouf7P15s/kMTE6PXg+PenMNZqJKcyVJv96w0X8DY
         I6hceRXot2kNB0+N1HKieevadP+Kx3ibhZrghTV3bovYSQxF+GpMA+URqLelPpBrqXTe
         IyJj3B2g7CBFVCRuORT8UNgA2UwPh9nlmaatGJTyOhSeFeCKlVboKu1cszAETpzpl/7q
         OOPUHkgzy8p/ZcUvUbIoZV18lsnZrw81pu7tx+bhw3dnlxgKM0L4CfsET8MlAFA0iK4C
         IoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171711; x=1795776511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHRQ0r5bmbaFTzfb7dcnjC6GldWyI7arDZV1wn6q7Lk=;
        b=0pmKAEVxqK4j9mQ2Uxa0OULrTi67/62FQ+JilFus4muslYtBKW3GsKzC4MU/oOzd35
         p24zhBR+lvbhLF+qDl6FCcRlGPot1rFhldKy4GRRuQztD6H/j1zwVNQAtNP54VExQe6U
         l5tm6vQOS9RvmGhpAo1M9gyEWFEnrWGynfrBW+XGqrfAMoX23R0++ul9/PT3diAkuQMf
         ZrZ62sf4Jbl6t3u5btiE6NhBf+NHvh8VcymJjA1O0ABi8xLL1ccxNPpp4vT7dIAqvd4G
         4SdnKegsUO8YJXwjVF3oR3koT/Z9ygDQvOYGSIWaC+bFetvpBW8HD+NpKy5s97Anyh6O
         C2Zg==
X-Forwarded-Encrypted: i=1; AL+hErHdmxH5oAwjluvQ+nmW/Ot/tfUmKKoJuEBKNwhSZGaoIJ/d6tO81Pv/J53667FvXneiOc+bVombzc2pr5reIAsB@lists.infradead.org
X-Gm-Message-State: APuU4Z+mOdcPubhYcTGPP/KTyIRL7l3dQOy856gjseqAUtmBQ7q3aCAk
	67knOPCH2ptLQY4y90PC0ZsFJQlCLy/2ZgTxYlRuW/sAkMjuJ9XBTiGkmEAypXK4K1pNk5dWLev
	1ggYKoM7cLFrDDSj7UwnWaZpF0ElTqwc=
X-Gm-Gg: AYBFou0TPnPyBJMnuEm3JLTRaMYIIYkCJEj3Jdlovxht/nUBIIqAGRexJ5KyB/CtBX+
	SFFscDdm4rBUORTNtzOppa2KWRynfa7I0JtW2pnouonTjWoN+dLc0qqEEOWwRaGcdj9i6IsI+JV
	k+YucSH0D1QwvcQxaWnhV1Yygv40wVg+evAnTcA2uzpLyvxH3K+/yWvYa0aDFmVrrdyHCs2ue4j
	qOFe8uGOgL1DgxoXKXvHsVznmFzbUfVjCHXH5+9Y5qzZdR3yPmRel9vhAfngnJzW2GUFcydWHEd
	Q7PxCBMoge0Zyy0WtAuWgChySotuKH696DA23+xmgDP3Lw9Ze376qC5s402AzyTZ0vNsNJj5XX5
	FO3apOEvpWTK2ldc4qOq+QwX8FAqoE6J7s8LIiITJt1LWD+nEBkbabRZEjJ/A+uasOIvMCQ==
X-Received: by 2002:a05:620a:c42:b0:949:6614:667f with SMTP id
 af79cd13be357-949ba9b3dddmr392835585a.20.1795171710862; Fri, 20 Nov 2026
 02:48:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027100231.31184-1-jiangshanlai@gmail.com> <auO09UUOqkhXXuoI@arm.com>
In-Reply-To: <auO09UUOqkhXXuoI@arm.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Fri, 20 Nov 2026 18:48:19 +0800
X-Gm-Features: Aa3M54ogZcxmwU__d9rnXzxqYES-3ez8E7NLPA3T5222y6QcxVN7zVWPaQJXIzE
Message-ID: <CAJhGHyD-XmGQ0emzB67ipYJA_+Zf8KqO_KCYUT9qbtQFBJpGCg@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshan.ljs@antgroup.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Thomas Huth <thuth@redhat.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024832_799874_FEC23689 
X-CRM114-Status: GOOD (  15.06  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Catalin,

On Fri, Oct 30, 2026 at 5:04=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:

> >
> > Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
> > Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>
>
> Thanks for the report. I think the problem identified is real. My TLA+
> model (apart from having a bug in how it modelled speculative TLB
> loads), did not exercise this init_mm case. I updated it and it now
> shows the problem.
>
> We'll check your fix in the next few days.


Just following up on this patch. Have you had a chance to review the
proposed fix?

Please let me know if any changes or additional testing are needed.

Thanks,
Lai


>
> --
> Catalin

