Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l5EfiZtZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RfUUMbfu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+5r94kBhSyoTj9wXK6JW6+FDLjCWm0/KAzeGsgyJNkY=; b=l5EfiZtZZx9Xjwfz3bmuwwv0/o
	GmmuOjk4460IHp+W0VPFISxG626aV6sbLjxSGWOnL2VHsrIkpV1QJs+uaml28UoIymMLD8dNbLoyz
	WMdPshOzxteq6oUJN84pCJiojqjjZ8AlFVUn4VYUsoNT79Ja4MjeXj1yoLbzzHpMNsuVWxudNqVwC
	jY364ya2UXHd5WFPImTWzPV0pZKTg3oX39vbUxQKerj2l5qLnK1noPD0mAw9/sEXVOvAG62ZxgCKv
	I3sJ+D3v/5h+Ip74HO2GoKpwf6BqQQlHphkwuz1Q5f/2cp8UORXGYFnap0yQ7CggGK3b8DbKvTh0V
	LHcoZ3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCzD-00000007P6g-1yNd;
	Wed, 11 Nov 2026 18:23:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCzC-00000007P6S-3W0U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:23:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4143C41459;
	Wed, 11 Nov 2026 18:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965B81F00A05;
	Wed, 11 Nov 2026 18:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794421434;
	bh=+5r94kBhSyoTj9wXK6JW6+FDLjCWm0/KAzeGsgyJNkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RfUUMbfuQZDxcZFcfbwfYFolkkaKNSd4HnAqoWAsIYj6oUvs/G2J2KjHGMb6iUL5U
	 2vz053gUP6fb4LF1BpZYHLfuQvTF2h+nngsLyiLW6X52uFDBNB4gtCfYibaid7z2HV
	 /yAVGU0tWqlIVGQZAljs/H+KRY3p9PEA+ox+zwem8nr2pjSm5likGhvul7DfmswYaf
	 thXXbMtIneTcA6CipoqlEHeAOB7LJr6IYVbSr/ofl6VuvyyEh3aHdJTbk+sSSZa/fO
	 4El92gzNz7doMInBJSK2y5+oRjMqTaOKGo14UQMg5zbykAVqjKzmRU/hjICgXamLPz
	 3Iy+/BWmH+scQ==
Date: Wed, 11 Nov 2026 11:23:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Schier <nsc@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] ARM: kprobes: Rename test-kprobes.ko to
 test-kprobes-arm.ko
Message-ID: <20261111182349.GA1452558@ax162>
References: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
 <09d5963c-4255-4da0-8c36-5624696ab633@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09d5963c-4255-4da0-8c36-5624696ab633@app.fastmail.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 08:24:44AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 9, 2026, at 07:46, Nathan Chancellor wrote:
> > When scripts/modules-check.sh is fixed to normalize the module's name
> > like name-fix-token does in scripts/Makefile.lib before checking that it
> > is unique [1], there is an error due to lib/tests/test_kprobes.ko and
> > arch/arm/probes/kprobes/test-kprobes.ko having the same module name.
> >
> >   error: the following would cause module name conflict:
> >     arch/arm/probes/kprobes/test-kprobes.ko
> >     lib/tests/test_kprobes.ko
> >
> >   $ modinfo arch/arm/probes/kprobes/test-kprobes.ko 
> > lib/tests/test_kprobes.ko | grep name:
> >   filename:       arch/arm/probes/kprobes/test-kprobes.ko
> >   name:           test_kprobes
> >   filename:       lib/tests/test_kprobes.ko
> >   name:           test_kprobes
> >
> > Rename arch/arm/probes/kprobes/test-kprobes.ko to test-kprobes-arm.ko to
> > make its module name unique and clear up the error.
> >
> > Reported-by: Sasha Levin <sashal@kernel.org>
> > Closes: https://lore.kernel.org/20261108225808.1809266-1-sashal@kernel.org/
> > Link: https://lore.kernel.org/20261103110411.11698-1-info@daylightlinux.ch/ [1]
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks a lot! Nicolas, can you pick this up?

-- 
Cheers,
Nathan

