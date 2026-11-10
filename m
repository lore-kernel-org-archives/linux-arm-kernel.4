Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4FF606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NbFfdzaN;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=avF5sNAs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uUsvdS/MCn3r1szB7mIiUrOB1nUvy7lbcFJPAYnC6lk=; b=NbFfdzaNeDJ+BKcntgcKIj1ZiC
	aE/Tml9jlTSzIVcoB+srooF3Rgcxbp0Tjw9rvj7RkfJ9uW5HC0i+Q2iJsJ2jMsO3na+OMMqPvMNsR
	R6yFxvJ+a3efQXBoMpVrIh6J7eZAaMCVW5hdRdwb7DZFwzM91OZIZezemVrpiky6QchrKOeGdYhlY
	QinOv+L4nB4m4N20dfnk5ZzOSZrFnRBn0ecjm8AGlajEDr29d5XwP/Jq2N+Od6yrBsxW6U3ghKfkX
	BKyR/AVs0aJmVBVmvmHCmYtUaWCMeHjN+xp8t7P63YCHxTcEBXxiJNNx70DpcbEGCYFIt+bDdPltz
	0qCJuQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQggk-000000031sw-1cr1;
	Tue, 10 Nov 2026 07:54:42 +0000
Received: from out-128.mta0.migadu.com ([2001:41d0:1004:224b::80] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQggg-000000031rR-19fw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:54:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7+GiAWiV7wSGiwtjJVTDPfGh8sdqdWnHMtmCVSJqVyQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794297274; v=1; x=1794902074;
 b=avF5sNAsTOQ3JB1iQfltCqSkNKVltHm3R2EZaJorsJ5+yqaAraonI7B2cB2M44NC6rEHyMZM
 +/I1FrW+VONOw6BHBkw28vfGLdR16iVvFRGhctS0rSuIbCeeiyBA0LOX1xlEWxmbDuho0YboLFZ
 mAXRwLFnDSns8P7g9dy3tKYs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 945991ed3b6db1fb;
	Tue, 10 Nov 2026 07:54:33 +0000
X-Mizu-Trace-ID: 945991ed3b6db1fb
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso3174e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:54:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcttimOTCbZZZmVjTTbfOI/YJLTp+61tMs4syln2g7pYC2ufNo6YLrKLfxUnlqt0kh0Zi+ciHT+QR1a6gNNYbe@lists.infradead.org
X-Gm-Message-State: APuU4Z+IGJUqyxemCM11q5utScr81T0wKLzlOdI6tDR+nXoKttkhGWTO
	6Oh6Tap5wKEIKEecJ22Cqcg/7K98x6eJLtqrke/rsIGj0fvjYMpwSLoLyPdOozXTp/UPSydTDbj
	hALojfBz24PUxDWwnDDpLVnGbiGARRocwtC3BPA1H
X-Received: by 2002:a05:6512:138d:b0:5bf:f0fb:2c9c with SMTP id
 2adb3069b0e04-5c15704f10cmr100054e87.5.1794297272416; Mon, 09 Nov 2026
 23:54:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109083205.806619-1-fuad.tabba@linux.dev> <avIq9AIE-9igDzsV@kernel.org>
In-Reply-To: <avIq9AIE-9igDzsV@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 10 Nov 2026 07:53:55 +0000
X-Gmail-Original-Message-ID: <CA+EHjTysJ4biucKNDsJS_ocEeGbvV8bJbrMvkEZ23nvV+qeLdg@mail.gmail.com>
X-Gm-Features: AclHuK8yWZn8Qr7IEdMRqVfNRXGcQQCa7v4yX1k-Pc7fDzArB9Aod9u9nR3PGag
Message-ID: <CA+EHjTysJ4biucKNDsJS_ocEeGbvV8bJbrMvkEZ23nvV+qeLdg@mail.gmail.com>
Subject: Re: [PATCH 00/16] KVM: arm64: Support debug, SVE, MOPS, PIE/POE, FPMR
 and more in protected VMs
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_235438_632540_43B6F2B2 
X-CRM114-Status: GOOD (  23.20  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oliver,

On Mon, 9 Nov 2026 at 20:20, Oliver Upton <oupton@kernel.org> wrote:
[...]
> Ok, we really need to slow down the rate of patches here. I had already
> applied the SVE series locally and now we've got a grab-bag of CPU
> features in addition to what I was ready to apply.
>
> The whole point of respinning a series is so we can converge on the
> shape of the feature and get it merged. Adding a whole pile of things
> that wasn't asked for just muddies the context for us dumb humans and
> slows down the rate at which you're going to land things upstream.

I'm sorry. My intent was to make life easier by avoiding conflicts
within these series, but I see how it ended up having the opposite
effect.

The SVE patches in this series are unchanged from the SVE series [1],
so what you applied is still current, and the same goes for the debug
patch [2]. I'll hold off on the rest until you've had a chance to deal
with those two.

>
> Going forward, can you please:
>
>  - Keep an individual series focused on the original intent. Don't
>    unnecessarily expand scope.
>
>  - Only iterate on a couple of series on the list at a time. Sashiko
>    findings are interesting, but you're gonna have to draw a cutline in
>    terms of how many additional patches are going to ride the coattails
>    of any particular series.

Ack.

>    You're obviously a very active contributor and reviewer, so I don't
>    anticipate such a rate limit to actually impede your patch velocity.
>
> Sorry, I really do appreciate the amount of work that you're doing to
> get pKVM in good shape upstream. I just get the sense that Marc and I
> are going to quickly encounter bandwidth limitations.

I appreciate the work you both do. Other than being more careful with
my own patches, let me know if there's anything else I could help to
take work off your plate.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261105130456.1617185-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20261102093950.2922035-1-fuad.tabba@linux.dev/

> Thanks,
> Oliver

