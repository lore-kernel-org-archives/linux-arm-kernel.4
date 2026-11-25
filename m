Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C769606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oj0VCOmv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cryOxmxh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mWutYmcI+akmXQxpptAbrI1MPXq/0LbtGQvDAhb+8lc=; b=Oj0VCOmvFmWzcpc6c5MVdLZomk
	IWWyVWnGdPoQhyTj+67NquI4bLiUc1Rg0RLEe53U5iELJE2h2XmSy83l1lo5ecqXAsnO26dZUSa8b
	BCSOkrbWLD3FR5XP9XhA5r3ZEKJ41zmLaPy0w+ZReOejstNREhiGURNGaZHG+1IrbGUSSkUEyd85+
	dO9QCrpXHoj3O4WEBur4QTGxp1teGOLqkI2ztx8h5TofruTR1Szw2TVb83yesTyC1Tp5x0bFocdwJ
	FGF1GSYPrFbQH2h3QqgFXuZTyoo6j7u4G/KDe1Wm2yqJaObZj0h59QXfAjE9EhVxsGCAhgTBLUWCI
	8d7ISj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHSP-0000000AxoG-40ZO;
	Wed, 25 Nov 2026 18:11:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHSO-0000000Axo9-0XdD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:11:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE6C94645F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894CC1F00A19
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630259;
	bh=mWutYmcI+akmXQxpptAbrI1MPXq/0LbtGQvDAhb+8lc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cryOxmxhtxlO1KGB/8E7JN8u0pgaKXd3JfHXEiXiM3jywuj6bBaW4BgKUhlY0vOn5
	 IRXgAVvaQEst61cU10Xf9IbAPGIF63V0ngPxRuWlorWxW/PXrORyW7RMkd+6gnIj4I
	 sNBHuTav0OQ+N1FYkaYGb6y+HMWlbi09hcM/yHFxVfOF1O8AAyvTQl74HE86bBvMe1
	 nAPONnqT8P7FU65MTtfMdc5sgAR86zMi9+zJCrcug0m1cp3GT9Qme9gYiu/dp8nm1Z
	 jvxQ/mOzqfZLn2XIk9nSCZlxNvF77m00LYYlD1MzR/STyzH+FDQA1zPn3MUzFUAuCj
	 YmL0d19DIxg0g==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so5829641e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:10:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEPpByrUMQeHhtsvstru8Ctx+S41T9fjXRU2au1Gh/lFWMG+8YKug2HkU91A7CxxLFiAEAxZmZkRG2PtEYCBBfI@lists.infradead.org
X-Gm-Message-State: APuU4Z/rwZmwmRZw3NFf7kvDWJRVshvsFNpteeIxOXbFUpf+R55JJUmH
	CuFRWb10PNtpjR1w7iod3tCTwNTlbGfGozi/RqDnwKYHulk24Ri2MbQQw6LWzgnUe/MesVngokM
	rHpDPUUF9Ytp3FvjSzrnZ+4GxAh+G5ZE=
X-Received: by 2002:a05:6512:4018:b0:5c1:56f5:da02 with SMTP id
 2adb3069b0e04-5c1b79fc73emr5241671e87.1.1795630258316; Wed, 25 Nov 2026
 10:10:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111114225.3977243-1-ruanjinjie@huawei.com> <20261111114225.3977243-16-ruanjinjie@huawei.com>
In-Reply-To: <20261111114225.3977243-16-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:10:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLkCmejeNE2dZASY0crxe-Q23QJ05fqvEvP69YuJrETYPw@mail.gmail.com>
X-Gm-Features: Aa3M54oIDRMFXP1RpUMFXoUcM7tXj2uiaN-FyRQN7L3lknX3zpF2wKbegX-ttpU
Message-ID: <CAD++jLkCmejeNE2dZASY0crxe-Q23QJ05fqvEvP69YuJrETYPw@mail.gmail.com>
Subject: Re: [PATCH v21 15/15] selftests/arm64: Add ptrace single-step and
 rseq syscall-exit tests
To: Jinjie Ruan <ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, linux-kselftest@vger.kernel.org, will@kernel.org, shuah@kernel.org, peterz@infradead.org, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, broonie@kernel.org, mathieu.desnoyers@efficios.com, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 12:43=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:

> Add tests for the arm64 syscall-exit and single-step behaviour fixed by
> the following commits. Each test fails on a kernel without the fix it
> covers and passes with it.
(...)
> Link: https://lore.kernel.org/all/20200710130702.30658-1-will@kernel.org/
> Link: https://lore.kernel.org/all/20200524043827.GA33001@juliacomputing.c=
om/
> Link: https://lore.kernel.org/all/1eed6d69-d53d-9657-1fc9-c089be07f98c@li=
naro.org/
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

This patch also looks like it should be sent in tandem with the other
fix, patch 1/15.

Yours,
Linus Walleij

